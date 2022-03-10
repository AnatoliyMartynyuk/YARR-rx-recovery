module sim_gearbox();
    // system 
    logic clk_i, rst_i;

    // inputs
    logic [31:0] data_32_i;
    logic        data32_valid_i;
    logic        slip_i;

    // output
    logic [65:0] data66_o;
    logic        data66_valid_o

    // additional logic
    integer one_position;

    localparam RX_CLK_PERIOD = 6.4ns;

    // clock generation
    initial begin
        clk_i = '1;
        forever #(RX_CLK_PERIOD/2) clk_i = ~ck_i;
    end

    // reset generation
    initial begin
        rst_i = '1;
        #20ns;
        rst_i = '0;
    end

    // dut
    gearbox32to66 u_gearbox32to66 (
        .rst_i           (rst_i         ),
        .clk_i           (clk_i         ),
        .data32_i        (data32_i      ),
        .data32_valid_i  (data32_valid_i),
        .slip_i          (slip_i        ),
        .data66_o        (data66_o      ),
        .data66_valid_o  (data66_valid_o)
    );

    always_ff @(posedge(clk_i)) begin
        if (reset) begin
            one_position <= 0;
            data32_i
        end


        
    end

endmodule

