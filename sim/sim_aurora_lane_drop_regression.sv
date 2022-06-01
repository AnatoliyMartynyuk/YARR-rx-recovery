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
                if (cnt % 64 == '0) tx_data <= {2'b01, cnt, cnt};
                else                tx_data <= {2'b10, cnt, cnt};

                // set the dv and incrememnt cnt 
                tx_data_valid <= '1;
                tx_counter    <= tx_counter + 1'b1;
                cnt           <= cnt + 1'b1; 
            end
            // if all bits are sent set dv low, set the tx_data SR to a new value and reset the counter
            else if (tx_counter == 'd65) begin
                tx_data_valid <= '0;
                tx_data_t     <= tx_data_s;
                tx_counter    <= '0;
            end
        end
    end
    // ----------------------------------------------------------------------

    initial begin
        #50us;
        wait(rx_valid);
        #50us;
        wait(rx_valid);
        
    end


    
    // ----------------------------------------------------------------------
    //                          Testing Sequence

    integer offset, offset_last, sample_cnt, samples_max;
    logic SEE_flag;

    initial begin

        repeat(32) wait(rx_valid);
        samples_max = 25;
        for (offset = 0; offset < 67; offset++) begin
            for (sample_cnt = 0; sample_cnt < samples_max; sample_cnt++) begin
                wait(tx_counter == 0);
                wait(tx_counter == 65);

                @(posedge clk_ddr_i) force tx_counter = offset; SEE_flag <= 1; @(posedge clk_ddr_i); 
                release tx_counter; SEE_flag = 0; #0.1 
                
                repeat(64) begin wait(rx_valid); wait(~rx_valid); end
            end
        end

        $stop;
    end
    // ----------------------------------------------------------------------
    

     // ----------------------------------------------------------------------
    //                          Monitoring

    realtime time_1 = 0;
    realtime time_2 = 0;

    integer serdes_slip_cntr, gbox_slip_cntr, block_cntr;
    logic gbox_slip_d1; 

    logic [31:0] last_rx_cnt, curr_rx_cnt;
    logic        rx_data_word_v;


    // assign rules to verify if a "valid" data word is actually valid
    // 1. First and second half of data has to match (format of input)
    // 2. The cnt embedded in the rx word has to be behind the current tx count (will break at overflow)
    // 3. The rx cnt can't be more than 10 (somewhat arbitrary) behind the tx count
    assign rx_data_word_v = (rx_data_out[31:0] == rx_data_out[63:32]) && (rx_data_out[31:0] < cnt) && (rx_data_out[31:0] + 10 > cnt);
    assign curr_rx_cnt = rx_data_out[31:0];

    always_ff @(posedge clk_rx_i) begin
        if      (~rst_n_i) last_rx_cnt <= '0;
        else if (rx_valid & rx_data_word_v) last_rx_cnt <= curr_rx_cnt;
    end

    // monitors disruptions in lane output data on a per failure level
    
    /*
    initial begin
        $timeformat(-9, 2, "ns");
        $display(" offset     : desync     : resync     : blocks      ");
        forever begin
            wait(rx_valid == 0);
            time_1 = $realtime;
            wait(rx_valid == 1);
            if ((curr_rx_cnt > last_rx_cnt + 1) && rx_data_word_v) begin
                $display("%12d %10t %10t %12d", offset, time_1, $realtime, curr_rx_cnt - last_rx_cnt + 1);

            end
        end
    end
    */
    
    integer total_count;

    // monitors disruptions in lane output data on an average per drop level
    initial begin
        $timeformat(-9, 2);
        $display(" offset     : blocks      ");
        total_count = 0;
        forever begin
            wait(rx_valid == 0);
            wait(rx_valid == 1);
            if (curr_rx_cnt > last_rx_cnt + 1 && rx_data_word_v) begin
                total_count = total_count + curr_rx_cnt - last_rx_cnt + 1;
                end
            if (offset != offset_last) begin
                    total_count = total_count/samples_max;
                    $display("%12d %12d", offset_last,  total_count);
                    total_count = 0;
            end
            offset_last = offset;
        end
    end
    
    // ----------------------------------------------------------------------

    // ----------------------------------------------------------------------






endmodule