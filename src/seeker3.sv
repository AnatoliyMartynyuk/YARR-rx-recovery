// determines which 2 consecutive bit of 67 in a 193 bit buffer are most likely the header bits
// abuffer is updated every 8 clock cyles. We can be behind by a word

module seeker3 (
    input  logic         rst_i, clk_i, // system inputs
    input  logic [193:0] gbox_buffer , // complete buffer
    input  logic [  5:0] gbox_cnt    , // buffer view window index
    input  logic         buffer_dv   , // valid buffer data

    output logic [  6:0] block_offset  // 66b block header offset 
);

    localparam c_DATA_HEADER = 2'b01;
    localparam c_CMD_HEADER  = 2'b10;
    
	localparam logic [0:2][0:21][6:0] seeker_positions = { 7'd1, 7'd4, 7'd7, 7'd10, 7'd13, 7'd16, 7'd19, 7'd22, 7'd25, 7'd28, 7'd31, 7'd34, 7'd37, 7'd40, 7'd43, 7'd46, 7'd49, 7'd52, 7'd55, 7'd58, 7'd61, 7'd64,
                                                           7'd2, 7'd5, 7'd8, 7'd11, 7'd14, 7'd17, 7'd20, 7'd23, 7'd26, 7'd29, 7'd32, 7'd35, 7'd38, 7'd41, 7'd44, 7'd47, 7'd50, 7'd53, 7'd56, 7'd59, 7'd62, 7'd65,   
                                                           7'd3, 7'd6, 7'd9, 7'd12, 7'd15, 7'd18, 7'd21, 7'd24, 7'd27, 7'd30, 7'd33, 7'd36, 7'd39, 7'd42, 7'd45, 7'd48, 7'd51, 7'd54, 7'd57, 7'd60, 7'd63, 7'd66};
                                                                     

    logic [66:0]       buffer;                              // slice of the complete buffer that should contain the header (register)
    logic [ 2:0] [1:0] seeker;                              // individual headers (wires)
    logic [ 2:0] [4:0] seeker_pos_idx_reg;                          


    logic [ 2:0] [5:0] valid_hdr_cnt_reg;    // only needs to count up to 32 (registers/wires)

    logic [5:0] max_cnt_stg1;
    logic [6:0] offset_stg1;

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
        seeker[0] =  buffer[seeker_positions[0][seeker_pos_idx_reg[0]] -: 2];
        seeker[1] =  buffer[seeker_positions[1][seeker_pos_idx_reg[1]] -: 2];
        seeker[2] =  buffer[seeker_positions[2][seeker_pos_idx_reg[2]] -: 2];

    end

    always_comb begin
        count_lock = (&valid_hdr_cnt_reg[0] | &valid_hdr_cnt_reg[1] | &valid_hdr_cnt_reg[2]);
    end

    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            valid_hdr_cnt_reg <= '0;
            seeker_pos_idx_reg <= '0;
        end
        else begin
            for (int i = 0; i < 3; i++) begin
                // if the header is valid increment consecutive count
                if (seeker[i] == c_DATA_HEADER || seeker[i] == c_CMD_HEADER) begin
                    valid_hdr_cnt_reg[i]  <= count_lock ? valid_hdr_cnt_reg[i] : valid_hdr_cnt_reg[i] + 1'b1; // increment by one unless at max value
                    seeker_pos_idx_reg[i] <= seeker_pos_idx_reg[i];                                                          // maintain position
                end
                // otherwise reset consecutive count and search for header elsewhere
                else begin
                    valid_hdr_cnt_reg[i]  <= '0;
                    seeker_pos_idx_reg[i] <= seeker_pos_idx_reg[i] >= 21 ? '0 : seeker_pos_idx_reg[i] + 1'b1;
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

        if (valid_hdr_cnt_reg[0] > valid_hdr_cnt_reg[1] && valid_hdr_cnt_reg[0] > valid_hdr_cnt_reg[2]) begin
            max_cnt_stg1 = valid_hdr_cnt_reg[0];
            offset_stg1  = seeker_positions[0][seeker_pos_idx_reg[0]]-1;
		end else if (valid_hdr_cnt_reg[1] > valid_hdr_cnt_reg[0] && valid_hdr_cnt_reg[1] >  valid_hdr_cnt_reg[2]) begin
			max_cnt_stg1 = valid_hdr_cnt_reg[1];
            offset_stg1  = seeker_positions[1][seeker_pos_idx_reg[1]]-1;
        end else begin
            max_cnt_stg1 = valid_hdr_cnt_reg[2];
            offset_stg1  = seeker_positions[2][seeker_pos_idx_reg[2]]-1;
        end
    end

    always_ff @(posedge clk_i) begin
        if (buffer_dv) begin 
            block_offset <= offset_stg1;
        end
    end

endmodule
