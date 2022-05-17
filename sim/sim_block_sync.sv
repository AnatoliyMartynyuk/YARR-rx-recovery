module sim_block_sync();
    logic         rst_i, clk_i;
    logic         buffer_dv;
    logic [193:0] gbox_buffer;
    logic [  5:0] gbox_cnt;
    logic [  6:0] block_offset;

    block_sync dut (.*);

    // set up clock
    initial begin
        clk_i = '1;
        forever begin #50 clk_i = ~clk_i; end 
    end

    integer i;
    initial begin
        gbox_cnt = 0; gbox_buffer = '0; buffer_dv = '0; gbox_buffer[129] = 1; 

        rst_i = 1; repeat(2) @(posedge clk_i);
        rst_i <= 0; @(posedge clk_i);

        for (i = 126; i < 194; i++) begin
            gbox_buffer = '0; gbox_buffer[i] <= 1;  buffer_dv <= '1; @(posedge clk_i);
                                                    buffer_dv <= '0; @(posedge clk_i);
            repeat(7) @(posedge clk_i);

            repeat(31) begin 
                buffer_dv <= '1; @(posedge clk_i);
                buffer_dv <= '0;
                repeat(7) @(posedge clk_i); end
        end

        repeat(15) @(posedge clk_i);
        $stop;
    end

endmodule