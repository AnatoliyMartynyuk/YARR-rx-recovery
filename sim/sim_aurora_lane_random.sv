`timescale 1ns/1ps

module sim_aurora_lane();

    // sys connect
    logic rst_n_i;
    logic clk_rx_i, clk_serdes_i;

    // input
    logic rx_data_i_p, rx_data_i_n;
    logic rx_polarity;
    
    // output
    logic [63:0] rx_data_out;
    logic [ 1:0] rx_header_out;
    logic [ 7:0] rx_status;
    logic        rx_valid;


    // peripheral logic
    logic rst2_n_i; 
    logic clk_ddr_i;

    logic [65:0] tx_data, tx_data_s, tx_data_t;
    logic [31:0] tx_counter, cnt;
    logic tx_data_valid;
    logic [65:0] test;

    // ----------------------------------------------------------------------
    //                          CLOCK GENERATION

    // clock parameters
    localparam RX_CLK_PERIOD     = 6.4ns;
    localparam SERDES_CLK_PERIOD = 1.6ns;
    localparam DDR_CLK_PERIOD    = 0.8ns;

    // clocks
    initial begin
        clk_rx_i = '1;
        forever #(RX_CLK_PERIOD/2) clk_rx_i = ~clk_rx_i;
    end

    initial begin
        clk_serdes_i = '1;
        forever #(SERDES_CLK_PERIOD/2) clk_serdes_i = ~clk_serdes_i;
    end

    initial begin
        clk_ddr_i = '1;
        forever #(DDR_CLK_PERIOD/2) clk_ddr_i = ~clk_ddr_i;
    end
    // ----------------------------------------------------------------------


    // ----------------------------------------------------------------------
    //                          RESET PROCESS
    initial begin
        rst_n_i ='0; rst2_n_i = '0;
        #200ns;
        rst2_n_i = '1;
        #350ns;
        rst_n_i = '1;
    end                 
    // ----------------------------------------------------------------------


    // ----------------------------------------------------------------------
    //                          Components
    assign rx_data_i_n = ~rx_data_i_p;
    assign rx_polarity = '0;

    // data scrambler
    scrambler u_scrambler (
        .data_in   (tx_data[63:0]   ),
        .data_out  (tx_data_s[65:0] ),
        .enable    (tx_data_valid   ),
        .sync_info (tx_data[65:64]  ),
        .clk       (clk_ddr_i       ),
        .rst       (~rst2_n_i       )
    ); 


    // dut
    aurora_rx_lane u_aurora_rx_lane (
        .rst_n_i       (rst_n_i      ),
        .clk_rx_i      (clk_rx_i     ),
        .clk_serdes_i  (clk_serdes_i ),
        .rx_data_i_p   (rx_data_i_p  ),
        .rx_data_i_n   (rx_data_i_n  ),
        .rx_polarity_i (rx_polarity  ),
        .rx_data_o     (rx_data_out  ),
        .rx_header_o   (rx_header_out),
        .rx_valid_o    (rx_valid     ),
        .rx_stat_o     (rx_status    ) 
    );


    // ----------------------------------------------------------------------

    // ----------------------------------------------------------------------
    //                         Block and SEE Generation  

    // configuration variables
    // # of blocks out of 1_000_000 we expect will have these issues
    localparam DROP_1_THRESH = 500;
    localparam DROP_2_THRESH = 50;
    localparam DROP_3_THRESH = 5;
    localparam ADDS_1_THRESH = 500;
    localparam ADDS_2_THRESH = 50;
    localparam ADDS_3_THRESH = 5;
    localparam FLIP_1_THRESH = 5000;
    localparam FLIP_2_THRESH = 500;
    localparam FLIP_3_THRESH = 50;

    // represents the length of the buffer (ensures that the size is never too small)
    logic [8:0] length_buffer;
    logic [6:0] length_block;

    // random variables to determine when bit drops/adds/flips occur
    integer r_drop, r_adds, r_flip;

    // random variables to determine were a bit drop/add/flip occurs
    integer r_drop_bit, r_adds_bit, r_flip_bit;

    // helper funciton - add a bit to a block
    function automatic logic [68:0] addBit(input logic [68:0] unmodified, input integer length);
                r_adds_bit = $urandom_range(length_block);
                addBit = unmodified << 1;
                addBit[r_adds_bit] = addBit[r_adds_bit + 1];
                for (int i = 0; i < r_adds_bit; i++) begin
                    addBit[i] = unmodified[i];
                end
    endfunction

    // helper funciton - drop a bit from a block
    function automatic logic [68:0] dropBit(input logic [68:0] unmodified, input integer length);
                r_drop_bit = $urandom_range(length_block);
                dropBit = unmodified >> 1;
                for (int i = 0; i < r_adds_bit; i++) begin
                    dropBit[i] = unmodified[i];
                end
    endfunction

    // helper function - retreive a variable bit slice
    function automatic logic [65:0] slice(input logic [66*3-1:0] stream_buffer, input logic [7:0] length_buffer);
        for (int i = 0; i < 66; i++) begin
            slice[i] = stream_buffer[i + length_buffer - 66];
        end

    endfunction

    // should be able to fit three full words in here
    logic [66*3-1:0] stream_buffer;
    logic [65:0] untampered_block;
    logic [68:0] tampered_block;

    always_ff @(posedge(clk_ddr_i)) begin

        if (~rst_n_i) begin
            stream_buffer <= {2{2'b01, cnt, cnt}};
            length_buffer <= 132;
        end

        // whenever transmition is complete shift out the old word
        else if (tx_counter == 'd64) begin
            length_buffer <= length_buffer - 66;
        end

        // whenever the length falls below 1 reserve words add another
        else if (tx_counter == 'd65) begin
            $timeformat(-6, 2, "us");
            // evaluate random numbers for SEEs
            r_drop = $urandom_range(1_000_000);
            r_adds = $urandom_range(1_000_000);
            r_flip = $urandom_range(1_000_000);

            // come up with an valid data word (TODO: change to random later)
            untampered_block = tx_data_s;
            length_block = 'd66;
            // use seperate logic to evaluate all the changes
            tampered_block = {3'b0, untampered_block};

            // bit flipping
            if (r_flip < FLIP_1_THRESH) begin
                r_flip_bit = $urandom_range(length_block);
                tampered_block[r_flip_bit] = ~tampered_block[r_flip_bit];
                $write("F1 : ");
            end 
            if (r_flip < FLIP_2_THRESH) begin
                r_flip_bit = $urandom_range(length_block);
                tampered_block[r_flip_bit] = ~tampered_block[r_flip_bit];
                $write("F2 : ");
            end
            if (r_flip < FLIP_3_THRESH) begin
                r_flip_bit = $urandom_range(length_block);
                tampered_block[r_flip_bit] = ~tampered_block[r_flip_bit];
                $write("F3 : ");
            end


            // bit dropping
            if (r_drop < DROP_1_THRESH) begin
                tampered_block = dropBit(tampered_block, length_block);
                length_block = length_block - 1;
                $write("D1 : ");
            end

            if (r_drop < DROP_2_THRESH) begin
                tampered_block = dropBit(tampered_block, length_block);
                length_block = length_block - 1;
                $write("D2 : ");
            end

            if (r_drop < DROP_3_THRESH) begin
                tampered_block = dropBit(tampered_block, length_block);
                length_block = length_block - 1;
                $write("D3 : ");
            end



            // bit adding - duplicates the bit next to it to sim double sampling
            if (r_adds < ADDS_1_THRESH) begin
                tampered_block = addBit(tampered_block, length_block);
                length_block = length_block + 1;
                $write("A1 : ");
            end
            if (r_adds < ADDS_2_THRESH) begin
                tampered_block = addBit(tampered_block, length_block);
                length_block = length_block + 1;
                $write("A2 : ");
            end
            if (r_adds < ADDS_3_THRESH) begin
               tampered_block = addBit(tampered_block, length_block);
                length_block = length_block + 1;
                $write("A3 : ");
            end


            if (untampered_block != tampered_block) $write("%17h : %17h : time = %t\n", untampered_block, tampered_block, $realtime);

            // shift tampered_block into stream_buffer
            for (int i = length_buffer+length_block - 1; i >= 0; i--) begin
                stream_buffer[i] <= i < length_block ? tampered_block[i] : stream_buffer[i - length_block];
            end

            length_buffer = length_buffer + length_block;
        end
    end

    // ----------------------------------------------------------------------
    //                          Input Data Feed

    always_ff @(posedge(clk_ddr_i), rst2_n_i) begin
        // reset all values (fills SR with all 1s)
        if (~rst2_n_i) begin
            tx_data         <= '1;  // all 1s
            tx_counter      <= 'd0; // all 0s except for lsb = 1
            cnt             <= '0;  // all 0s
            tx_data_t       <= '0;  // all 0s
            tx_data_valid   <= '0;  // 0
        end

        else begin
            // preset defaults
            rx_data_i_p <= tx_data_t[65];
            tx_data_t   <= {tx_data_t[64:0], 1'b0};
            tx_counter  <= tx_counter + 'b1;

            // once most bits are sent set tx_data to the count twice with info on if it is divisible by 64
            if (tx_counter == 'd64) begin
                
                tx_data <= (cnt % 64 == '0) ? {2'b01, cnt, cnt} : {2'b01, cnt, cnt};
                //tx_data <= slice(stream_buffer, length_buffer);

                // set the dv and incrememnt cnt 
                tx_data_valid <= '1;
                tx_counter    <= tx_counter + 1'b1;
                cnt           <= cnt + 1'b1; 
            end
            // if all bits are sent set dv low, set the tx_data SR to a new value and reset the counter
            else if (tx_counter == 'd65) begin
                tx_data_valid <= '0;
                tx_data_t     <= slice(stream_buffer, length_buffer);
                tx_counter    <= '0;
            end
        end
    end
    // ----------------------------------------------------------------------
    

    // ----------------------------------------------------------------------
    //                          Monitoring

    realtime time_1 = 0;
    realtime time_2 = 0;

    integer serdes_slip_cntr, gbox_slip_cntr, block_cntr;
    logic serdes_slip_d1, gbox_slip_d1; 



    // monitors disruptions in lane output data
    initial begin
        $timeformat(-9, 2, "ns");
        forever begin
            wait(rx_valid == 0);
            time_1 = $realtime;
            wait(rx_valid == 1);
            //if ($realtime - time_1 > 45ns) $display("large rx_valid delay detected at %t. Duration: %t", $realtime, $realtime - time_1); 
            if ($realtime - time_1 > 96ns) begin
                $display("desyc : %5t - resync: %5t - duration: %5t", time_1, $realtime, $realtime - time_1); 
                $display("serdes: %7d - gbox  : %7d - blocks  : %7d", serdes_slip_cntr, gbox_slip_cntr, block_cntr);
            end
        end
    end

    // counts slips for gearbox and serdes
    always_ff @(posedge clk_ddr_i) begin
        if (~rst_n_i | rx_valid) begin
            serdes_slip_cntr <= 0;
            gbox_slip_cntr   <= 0;
            block_cntr       <= 0;
        end

        else begin
            serdes_slip_d1 <= u_aurora_rx_lane.serdes_slip;
            gbox_slip_d1   <= u_aurora_rx_lane.gearbox_slip;

            if (~serdes_slip_d1 & u_aurora_rx_lane.serdes_slip) serdes_slip_cntr <= serdes_slip_cntr + 1;
            if (~gbox_slip_d1 & u_aurora_rx_lane.gearbox_slip) gbox_slip_cntr <= gbox_slip_cntr + 1;
            if (tx_counter == 'd64) block_cntr <= block_cntr + 1;
            if (~gbox_slip_d1 & u_aurora_rx_lane.gearbox_slip && gbox_slip_cntr == 32) $warning("33 GEARBOX SLIPS HAVE BEEN SEEN!!!");
            if (~gbox_slip_d1 & u_aurora_rx_lane.gearbox_slip && gbox_slip_cntr == 65) $error("66 GEARBOX SLIPS HAVE BEEN SEEN!!!");
        end
    end
    
    // ----------------------------------------------------------------------


endmodule