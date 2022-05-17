// determines which 2 consecutive bit of 67 in a 193 bit buffer are most likely the header bits
// abuffer is updated every 8 clock cyles. We can be behind by a word

module block_sync (
    input  logic         rst_i, clk_i, // system inputs
    input  logic [193:0] gbox_buffer , // complete buffer
    input  logic [  5:0] gbox_cnt    , // buffer view window index
    input  logic         buffer_dv   , // valid buffer data

    output logic [  6:0] block_offset  // 66b block header offset 
);

    localparam c_DATA_HEADER = 2'b01;
    localparam c_CMD_HEADER  = 2'b10;

    logic [66:0]       buffer;                              // slice of the complete buffer that should contain the header (register)
    logic [65:0] [1:0] headers;                             // individual headers (wires)
    logic [65:0] [5:0] valid_hdr_cnt, valid_hdr_cnt_reg;    // only needs to count up to 32 (registers/wires)

    logic [7:0][5:0] max_cnt_stg1, max_cnt_stg1_reg;
    logic [7:0][6:0] offset_stg1, offset_stg1_reg;

    logic [5:0] max_cnt_stg2;
    logic [6:0] offset_stg2;

    // register the relevant buffer bits when buffer data is valid
    always_ff @(posedge clk_i) begin
        if (buffer_dv) begin
            buffer <= gbox_buffer[193 - gbox_cnt -: 67];
        end
    end


    // splits each header into a distinct logic
    // evaluate whether the proposed header is valid or not
    always_comb begin 

        // "give" each pair of bits a name 
        for (int i = 0; i < 67; i++) begin
            headers[i] = buffer[1 + i -: 2]; // part select to guarantee 2 bits
        end

        // determine whether the proposed header is valid. Increment count if so
        for (int j = 0; j < 66; j++) begin
            if (headers[j] == c_DATA_HEADER || headers[j] == c_CMD_HEADER) begin
                valid_hdr_cnt[j] = valid_hdr_cnt_reg[j] + 1'b1;
            end
            else begin
                valid_hdr_cnt[j] = '0;
            end
        end
    end

    // update valid counters once every block
    always_ff @(posedge clk_i) begin
        if      (rst_i)     valid_hdr_cnt_reg <= '0;
        else if (buffer_dv) begin
            for (int i = 0; i < 65; i++) begin
                valid_hdr_cnt_reg[i] <= valid_hdr_cnt[i]; 
            end
        end
    end

    // pipeline stage 1
    always_comb begin
        max_cnt_stg1 = '0;
        offset_stg1  = '0;
        for (int k = 0; k < 8; k++) begin
            for (int l = 0; l < 8; l++) begin
                if (valid_hdr_cnt_reg[k*8+l] > max_cnt_stg1[k]) begin
                    max_cnt_stg1[k] = valid_hdr_cnt_reg[k*8+l];
                    offset_stg1[k] = k*8+l;
                end
            end
        end
    end

    always_ff @(posedge clk_i) begin
        offset_stg1_reg  <= offset_stg1;
        max_cnt_stg1_reg <= max_cnt_stg1;
    end

    // pipeline stage 2
    always_comb begin
        max_cnt_stg2 = '0;
        offset_stg2  = '0;
        for (int m = 0; m < 8; m++) begin
            if (max_cnt_stg1_reg[m] > max_cnt_stg2) begin
                max_cnt_stg2 = max_cnt_stg1_reg[m];
                offset_stg2 = offset_stg1[m];
            end
        end
    end

    always_ff @(posedge clk_i) begin
        block_offset  <= offset_stg2;
    end

endmodule

/*
module block_sync (
    input  logic         rst_i, clk_i, // system inputs
    input  logic [192:0] gbox_buffer,
    input  logic [  5:0] gbox_cnt,
    input  logic         buffer_dv, 

    output logic [6:0] block_offset
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
*/