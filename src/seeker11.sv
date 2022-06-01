// determines which 2 consecutive bit of 67 in a 193 bit buffer are most likely the header bits
// abuffer is updated every 8 clock cyles. We can be behind by a word

module seeker11 (
    input  logic         rst_i, clk_i, // system inputs
    input  logic [193:0] gbox_buffer , // complete buffer
    input  logic [  5:0] gbox_cnt    , // buffer view window index
    input  logic         buffer_dv   , // valid buffer data

    output logic [  6:0] block_offset  // 66b block header offset 
);

    localparam c_DATA_HEADER = 2'b01;
    localparam c_CMD_HEADER  = 2'b10;


    logic [66:0]       buffer;                              // slice of the complete buffer that should contain the header (register)
    logic [10:0] [1:0] seeker;                              // individual headers (wires)
    logic [10:0] [2:0] seeker_pos_idx_reg;                          


    logic [10:0] [5:0] valid_hdr_cnt_reg;    // only needs to count up to 32 (registers/wires)

    logic [2:0] [5:0] max_cnt_stg1, max_cnt_stg1_reg;
    logic [2:0] [6:0] offset_stg1, offset_stg1_reg;

    logic [5:0] max_cnt_stg2;
    logic [6:0] offset_stg2;

    logic count_lock;


    // -----------------------------------------------------------------------------------
    //                              First Layer
    //  Determine whether or not to clear or incrememnt the count of a header position
    // -----------------------------------------------------------------------------------

    // register the relevant buffer bits when buffer data is valid
    always_ff @(posedge clk_i) begin
        if (buffer_dv) begin
            buffer <= gbox_buffer[193 - gbox_cnt -: 67];
        end
    end

    
    always_comb begin
        // extract header bits based on current seeker position
        for (integer i = 0; i < 11; i++) begin
            seeker[i] =  buffer[seeker_pos_idx_reg[i]*11 + i + 1 -: 2];
        end
    end

    always_comb begin
        count_lock = 0;
        for (int z = 0; z < 11; z++) begin
            count_lock = count_lock | &valid_hdr_cnt_reg[z];
        end
    end
    
    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            valid_hdr_cnt_reg <='0;
            seeker_pos_idx_reg <= '0;
        end

        else begin
            for (int j = 0; j < 11; j++) begin
                // if the header is valid increment consecutive count
                if (seeker[j] == c_DATA_HEADER || seeker[j] == c_CMD_HEADER) begin
                    valid_hdr_cnt_reg[j]  <= count_lock ? valid_hdr_cnt_reg[j] : valid_hdr_cnt_reg[j] + 1'b1; // increment by one unless at max value
                    seeker_pos_idx_reg[j] <= seeker_pos_idx_reg[j];                                                      // maintain position
                end
                // otherwise reset consecutive count and search for header elsewhere
                else begin
                    valid_hdr_cnt_reg[j]  <= '0;
                    seeker_pos_idx_reg[j] <= seeker_pos_idx_reg[j] >= 5 ? '0 : seeker_pos_idx_reg[j] + 1'b1;
                end
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

        for (int k = 0; k < 11; k++) begin
            if (valid_hdr_cnt_reg[k] > max_cnt_stg1[k/4]) begin
                max_cnt_stg1[k/4] = valid_hdr_cnt_reg[k];
                offset_stg1[k/4] = seeker_pos_idx_reg[k]*11 + k;
            end
        end
    end

    always_ff @(posedge clk_i) begin
        if (buffer_dv) begin
            offset_stg1_reg  <= offset_stg1;
            max_cnt_stg1_reg <= max_cnt_stg1;
        end
    end

    // ------------------------------------
    // pipeline stage 2
    // ------------------------------------

    always_comb begin
        max_cnt_stg2 = '0;
        offset_stg2  = '0;

        if (max_cnt_stg1_reg[0] > max_cnt_stg1_reg[1] && max_cnt_stg1_reg[0] > max_cnt_stg1_reg[2]) begin
            max_cnt_stg2 = max_cnt_stg1_reg[0];
            offset_stg2  = offset_stg1_reg[0];
        end else if (max_cnt_stg1_reg[1] > max_cnt_stg1_reg[0] && max_cnt_stg1_reg[1] > max_cnt_stg1_reg[2])begin
            max_cnt_stg2 = max_cnt_stg1_reg[1];
            offset_stg2  = offset_stg1_reg[1];
        end else begin
            max_cnt_stg2 = max_cnt_stg1_reg[2];
            offset_stg2  = offset_stg1_reg[2];
        end
    end

    always_ff @(posedge clk_i) begin
        if (buffer_dv) block_offset <= offset_stg2;
    end

endmodule
