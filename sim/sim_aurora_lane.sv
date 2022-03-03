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
    //                          Input Data Generation

    always_ff @(posedge(clk_ddr_i), rst2_n_i) begin
        // reset all values (fills SR with all 1s)
        if (~rst2_n_i) begin
            tx_data         <= '1;  // all 1s
            tx_counter      <= 'd1; // all 0s except for lsb = 1
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

endmodule