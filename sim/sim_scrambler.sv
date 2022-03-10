`timescale 1ns/1ps

module sim_scrambler();

    // sys connect
    logic rst_n_i;
    logic clk_ddr_i;


    // peripheral logic
    logic [65:0] tx_data, tx_data_s, tx_data_t;
    logic [31:0] tx_counter, cnt;
    logic tx_data_valid;

    //localparam IDLE = {2'b10, 8'h78, 8'b00, };
    localparam IDLE = {2'b10, 64'h1E00_0000_0000_0000};

    // ----------------------------------------------------------------------
    //                          CLOCK GENERATION

    // clock parameters
    localparam DDR_CLK_PERIOD    = 0.8ns;

    initial begin
        clk_ddr_i = '1;
        forever #(DDR_CLK_PERIOD/2) clk_ddr_i = ~clk_ddr_i;
    end
    // ----------------------------------------------------------------------


    // ----------------------------------------------------------------------
    //                          RESET PROCESS
    initial begin
        rst_n_i = '0;
        #200ns;
        rst_n_i = '1;
    end                 
    // ----------------------------------------------------------------------


    // ----------------------------------------------------------------------
    //                          Components

    // data scrambler
    scrambler u_scrambler (
        .data_in   (tx_data[63:0]   ),
        .data_out  (tx_data_s[65:0] ),
        .enable    (tx_data_valid   ),
        .sync_info (tx_data[65:64]  ),
        .clk       (clk_ddr_i       ),
        .rst       (~rst_n_i        )
    ); 

    // ----------------------------------------------------------------------

    // ----------------------------------------------------------------------
    //                          Input Data Generation

    logic [65:0] unscrambled_data;

    always_ff @(posedge(clk_ddr_i), rst_n_i) begin
        // reset all values (fills SR with all 1s)
        if (~rst_n_i) begin
            tx_data         <= '1;  // all 1s
            tx_counter      <= 'd0; // all 0s except for lsb = 1
            cnt             <= '0;  // all 0s
            tx_data_t       <= '0;  // all 0s
            tx_data_valid   <= '0;  // 0
        end

        else begin
            // preset defaults
            tx_counter  <= tx_counter + 'b1;

            // once most bits are sent set tx_data to the count twice with info on if it is divisible by 64
            if (tx_counter == 'd64) begin
                if (cnt % 64 == '0) tx_data <= {2'b01, $urandom(), $urandom()};
                else                tx_data <= {2'b10, unscrambled_data};
                //tx_data <= test;

                // set the dv and incrememnt cnt 
                tx_data_valid <= '1;
                tx_counter    <= tx_counter + 1'b1;

                $display("unscrambled = %d : scrambled = %d", unscrambled_data, tx_data_s);
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

    integer blocks;

    initial begin
        unscrambled_data = '0;

        blocks = $urandom_range(200);
        $display("\n\nWriting random data for %2d blocks\n\n", blocks);
        repeat(blocks) begin unscrambled_data = {$urandom(), $urandom()}; wait(tx_data_valid); wait(~tx_data_valid); end

        blocks = $urandom_range(200);
        $display("\n\nWriting IDLEs data for %2d blocks\n\n", blocks);
        unscrambled_data = IDLE;
        repeat(blocks) begin wait(tx_data_valid); wait(~tx_data_valid); end



        blocks = $urandom_range(200);
        $display("\n\nWriting random data for %2d blocks\n\n", blocks);
        repeat(blocks) begin unscrambled_data = {$urandom(), $urandom()}; wait(tx_data_valid); wait(~tx_data_valid); end

        blocks = $urandom_range(200);
        $display("\n\nWriting IDLEs data for %2d blocks\n\n", blocks);
        unscrambled_data = IDLE;
        repeat(blocks) begin wait(tx_data_valid); wait(~tx_data_valid); end

        $stop;

    end





endmodule