`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2022 09:29:53 AM
// Design Name: 
// Module Name: vc709_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vc709_top (
    input  logic        clk_p,
    input  logic        clk_n,
    input  logic [7:0]  gpio_switch,
    output logic [7:0]  led
);

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

    assign rst_n_i     = ~gpio_switch[7];
    assign rx_polarity =  gpio_switch[6];

    assign rx_data_i_p =  gpio_switch[0];
    assign rx_data_i_m = ~gpio_switch[0];

    assign led[0] = ^rx_data_out;
    assign led[1] = ^rx_header_out;
    assign led[2] = ^rx_status;
    assign led[3] = rx_valid;
    
    IDELAYCTRL IDELAYCTRL_inst (
        .RDY(led[4]), // 1-bit output: Ready output
        .REFCLK(clk_serdes_i), // 1-bit input: Reference clock input
        .RST(~rst_n_i) // 1-bit input: Active high reset input
    );
        // End of IDELAYCTRL_inst instantiatio

    // clocking
    clk_wiz_0 u_pll (
        // Clock out ports
        .clk_out1(clk_rx_i      ), // output clk_out1
        .clk_out2(clk_serdes_i  ), // output clk_out2
        
        // Status and control signals
        .reset(~rst_n_i         ), // input reset
        .locked(locked          ), // output locked
        
       // Clock in ports
        .clk_in1_p(clk_p        ), // input clk_in1_p
        .clk_in1_n(clk_n        )  // input clk_in1_n
    );    

        
       // original lane system instantiation
       aurora_rx_lane u_lane_original (
            .rst_n_i       (rst_n_i             ),
            .clk_rx_i      (clk_rx_i            ),
            .clk_serdes_i  (clk_serdes_i        ),
            .rx_data_i_p   (rx_data_i_p         ),
            .rx_data_i_n   (rx_data_i_n         ),
            .rx_polarity_i (rx_polarity         ),
            .rx_data_o     (rx_data_unbonded    ),
            .rx_header_o   (rx_header_unbonded  ),
            .rx_valid_o    (rx_data_valid_unbonded),
            .rx_stat_o     (rx_status           )
        );
        
        /*
       // improved lane system instantiation
        aurora_rx_lane_wip u_lane_imporved (
            .rst_n_i       (rst_n_i             ),
            .clk_rx_i      (clk_rx_i            ),
            .clk_serdes_i  (clk_serdes_i        ),
            .rx_data_i_p   (rx_data_i_p         ),
            .rx_data_i_n   (rx_data_i_n         ),
            .rx_polarity_i (rx_polarity         ),
            .rx_data_o     (rx_data_unbonded    ),
            .rx_header_o   (rx_header_unbonded  ),
            .rx_valid_o    (rx_data_valid_unbonded),
            .rx_stat_o     (rx_status           )
        );
        */

endmodule
