module sim_gearbox();
    // system 
    logic clk_i, rst_i;

    // inputs
    logic [31:0] data32_i;
    logic        data32_valid_i;
    logic        slip_i;

    // output
    logic [65:0] data66_o;
    logic        data66_valid_o;

    // additional logic
    integer one_position;

    localparam RX_CLK_PERIOD = 6.4ns;

    // clock generation
    initial begin
        clk_i = '1;
        forever #(RX_CLK_PERIOD/2) clk_i = ~clk_i;
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

    // sends 66 bit words with a single bit set high in the same spot in each word
    initial begin
        one_position = 0;
        slip_i = 0;

        data32_i = '0;
        data32_valid_i = '1;


        while(1) begin

            // initialize data
            data32_valid_i = '1;
            data32_i = '0;

            
            // update the word if it has a one in it
            if (one_position < 0) begin  
                data32_i[-one_position] = '1;
                one_position = one_position + 66;
            end
            
            one_position = one_position - 32;
            

            @(posedge clk_i);
            data32_valid_i = '0;
            repeat(7) @(posedge clk_i);

        end
    end

    initial begin
        repeat(32) begin 
            wait(data66_valid_o);
            @(posedge clk_i);
        end

        slip_i = '1;
        wait(u_gearbox32to66.data66_t == 66'h10000000000000000 && u_gearbox32to66.data66_t_valid);
        slip_i = '0;

        repeat(32) begin 
            wait(data66_valid_o);
            @(posedge clk_i);
        end

        $stop();
    end

endmodule

