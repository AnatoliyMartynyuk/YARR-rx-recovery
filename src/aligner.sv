// determines which 2 consecutive bit of 67 in a 193 bit buffer are most likely the header bits
// abuffer is updated every 8 clock cyles. We can be behind by a word

module aligner (
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

    logic [15:0][5:0] max_cnt_stg1, max_cnt_stg1_reg;
    logic [15:0][6:0] offset_stg1, offset_stg1_reg;

    logic [4:0][5:0] max_cnt_stg2, max_cnt_stg2_reg;
    logic [4:0][6:0] offset_stg2, offset_stg2_reg;

    logic [5:0] max_cnt_stg3;
    logic [6:0] offset_stg3;

    // register the relevant buffer bits when buffer data is valid
    always_ff @(posedge clk_i) begin
        if (buffer_dv) begin
            buffer <= gbox_buffer[193 - gbox_cnt -: 67];
        end
    end

    // -----------------------------------------------------------------------------------
    //                              First Layer
    //  Determine whether or not to clear or incrememnt the count of a header position
    // -----------------------------------------------------------------------------------


    // splits each header into a distinct logic
    // evaluate whether the proposed header is valid or not
    always_comb begin 

        // "give" each pair of bits a name 
        for (int i = 0; i < 66; i++) begin
            headers[i] = buffer[1 + i -: 2]; // part select to guarantee 2 bits
        end

        // determine whether the proposed header is valid. Increment count if so
        for (int j = 0; j < 66; j++) begin
            if (headers[j] == c_DATA_HEADER || headers[j] == c_CMD_HEADER) begin
                valid_hdr_cnt[j] = &valid_hdr_cnt_reg[j] ? valid_hdr_cnt_reg[j] : valid_hdr_cnt_reg[j] + 1'b1;
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
            for (int i = 0; i < 66; i++) begin
                valid_hdr_cnt_reg[i] <= valid_hdr_cnt[i]; 
            end
        end
    end

    // -----------------------------------------------------------------------------------
    //                                Pipeline Tree
    //  Narrow down to find the largest counter value as well as its index
    // -----------------------------------------------------------------------------------

    // ------------------------------------
    // pipeline stage 1
    // ------------------------------------
    always_comb begin
        max_cnt_stg1 = '0;
        offset_stg1  = '0;
        for (int k = 0; k < 16; k++) begin
            for (int l = 0; l < 4; l++) begin
                if (valid_hdr_cnt_reg[k*4+l] > max_cnt_stg1[k]) begin
                    max_cnt_stg1[k] = valid_hdr_cnt_reg[k*4+l];
                    offset_stg1[k] = k*4+l;
                end
            end
        end

        // account for extra 2 values (counters 64 and 65)
        if (valid_hdr_cnt_reg[64] > max_cnt_stg1[14]) begin
            max_cnt_stg1[14] = valid_hdr_cnt_reg[64];
            offset_stg1[14] = 64;
        end

        if (valid_hdr_cnt_reg[65] > max_cnt_stg1[15]) begin
            max_cnt_stg1[15] = valid_hdr_cnt_reg[65];
            offset_stg1[15] = 65;
        end

    end

    always_ff @(posedge clk_i) begin
        offset_stg1_reg  <= offset_stg1;
        max_cnt_stg1_reg <= max_cnt_stg1;
    end

    // ------------------------------------
    // pipeline stage 2
    // ------------------------------------
    always_comb begin
        max_cnt_stg2 = '0;
        offset_stg2  = '0;
        for (int m = 0; m < 4; m++) begin
            for (int n = 0; n < 4; n++) begin
                if (max_cnt_stg1_reg[m*4+n] > max_cnt_stg2[m]) begin
                    max_cnt_stg2[m] = max_cnt_stg1_reg[m*4+n];
                    offset_stg2[m] = offset_stg1_reg[m*4+n];
                end
            end
        end
    end

    always_ff @(posedge clk_i) begin
        offset_stg2_reg  <= offset_stg2;
        max_cnt_stg2_reg <= max_cnt_stg2;
    end

    // ------------------------------------
    // pipeline stage 3
    // ------------------------------------
    always_comb begin
        max_cnt_stg3 = '0;
        offset_stg3  = '0;
        for (int p = 0; p < 4; p++) begin
            if (max_cnt_stg2_reg[p] > max_cnt_stg3) begin
                max_cnt_stg3 = max_cnt_stg2_reg[p];
                offset_stg3 = offset_stg2_reg[p];
            end
        end
    end

    always_ff @(posedge clk_i) begin
        if (buffer_dv) block_offset  <= offset_stg3;
    end

endmodule
