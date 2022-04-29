module sim_block_sync();
    logic    rst_i, clk_i;
    logic [192:0] gbox_buffer;
    logic [ 5:0] gbox_cnt;
    logic [7:0] block_offset;

    block_sync dut (.*);

    // set up clock
    initial begin
        clk_i = '1;
        forever begin #50 clk_i = ~clk_i; end 
    end

    initial begin
        gbox_cnt = 0; gbox_buffer = '0; gbox_buffer[129] = 1; 

        rst_i = 1; repeat(2) @(posedge clk_i);
        rst_i <= 0; @(posedge clk_i);

        repeat(15) @(posedge clk_i);
        $stop;
    end

endmodule