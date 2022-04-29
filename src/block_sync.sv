module block_sync (
    input  logic    rst_i, clk_i, // system inputs
    input  logic [192:0] gbox_buffer,
    input  logic [ 5:0] gbox_cnt,

    output logic [7:0] block_offset
);

    localparam c_DATA_HEADER = 2'b01;
    localparam c_CMD_HEADER  = 2'b10;

    logic [64:0] [1:0] headers;
    logic [64:0] [7:0] valid_hdr_cnt, valid_hdr_cnt_reg;    // TODO: fix bit width
    logic [7:0] max_cnt;                                    // TODO: fix bit width

    always_comb begin 
        // sets the headers by reading the 2 bits at a time of every possible header location
        for (int i = 0; i < 65; i++) begin
            headers[i] = gbox_buffer[129 - gbox_cnt - 1 + i -: 2]; // part select to guarantee 2 bits
        end

        // evaluates the number of conseutive valid headers each potential block has had. If invalid set to 0
        for (int j = 0; j < 65; j++) begin
            valid_hdr_cnt[j] = (headers[j] == c_DATA_HEADER || headers[j] == c_CMD_HEADER) ? 
                valid_hdr_cnt_reg[j] + 1'b1 : '0;
        end

        // returns whichever index header has the highest consecutive valid header count at the current moment
        // a little worried about how much resources this will use
        max_cnt = 0;
        block_offset = 0;

        for (int k = 0; k < 65; k++) begin
            if (valid_hdr_cnt[k] > max_cnt) begin
                max_cnt = valid_hdr_cnt[k];
                block_offset = k;
            end
        end
    end

    always_ff @(posedge clk_i) begin

        // on a reset, set all counts to 0
        if (rst_i) begin
            valid_hdr_cnt_reg <= '0;
        end

        // otherwise set 
        else begin
            for (int l = 0; l < 65; l++) begin
                valid_hdr_cnt_reg[l] <= valid_hdr_cnt[l];
            end
        end
    end

endmodule

