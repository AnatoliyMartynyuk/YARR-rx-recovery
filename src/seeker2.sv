// determines which 2 consecutive bit of 67 in a 193 bit buffer are most likely the header bits
// abuffer is updated every 8 clock cyles. We can be behind by a word

module seeker2 (
    input  logic         rst_i, clk_i, // system inputs
    input  logic [193:0] gbox_buffer , // complete buffer
    input  logic [  5:0] gbox_cnt    , // buffer view window index
    input  logic         buffer_dv   , // valid buffer data

    output logic [  6:0] block_offset  // 66b block header offset 
);

    localparam c_DATA_HEADER = 2'b01;
    localparam c_CMD_HEADER  = 2'b10;


    logic [66:0] buffer;
    logic [ 1:0] [1:0] seeker;
    logic [ 1:0] [6:0] seeker_pos_idx_n, seeker_pos_idx_c;                          
    logic seeker_chosen;
    logic [  6:0] block_offset_i;


    // save the gearbox slice which MUST contain the header bits
    always_ff @(posedge clk_i) begin
        if (buffer_dv) begin
            buffer <= gbox_buffer[193 - gbox_cnt -: 67];
        end
    end

    // assign two seekers seached opposite ends of the buffer
    assign seeker[0] = buffer[ 1 + seeker_pos_idx_c[0] -: 2];
    assign seeker[1] = buffer[66 - seeker_pos_idx_c[1] -: 2];

    // determines the next positions checked by seekers
    always_comb begin
            seeker_pos_idx_n[0] = seeker_pos_idx_c[0] >= 33 ? '0 : seeker_pos_idx_c[0] + 1'b1;
            seeker_pos_idx_n[1] = seeker_pos_idx_c[1] >= 33 ? '0 : seeker_pos_idx_c[1] + 1'b1;
    end

    // updates seeker position if an incorrect header is seen
    
    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            seeker_pos_idx_c <= '0;
        end
        else begin
            if (!(seeker[0] == c_DATA_HEADER || seeker[0] == c_CMD_HEADER)) seeker_pos_idx_c[0] <= seeker_pos_idx_n[0];
            if (!(seeker[1] == c_DATA_HEADER || seeker[1] == c_CMD_HEADER)) seeker_pos_idx_c[1] <= seeker_pos_idx_n[1];
        end
    end

    // determines which of the two seekers to use for the block offset
    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            seeker_chosen <= '0; // start from bit drops (arbitrary)
        end
        else begin
            if ((!(seeker[0] == c_DATA_HEADER || seeker[0] == c_CMD_HEADER)) & (seeker[1] == c_DATA_HEADER || seeker[1] == c_CMD_HEADER) & !seeker_chosen)
                seeker_chosen <= '1;
            else if ((!(seeker[1] == c_DATA_HEADER || seeker[1] == c_CMD_HEADER)) & (seeker[0] == c_DATA_HEADER || seeker[0] == c_CMD_HEADER) & seeker_chosen)
                seeker_chosen <= '0;
        end
    end

    always_ff @(posedge clk_i) begin
        if (buffer_dv) begin
            block_offset   <= seeker_chosen ? 65 - seeker_pos_idx_c[1] : seeker_pos_idx_c[0];
            block_offset_i <= seeker_chosen ? 65 - seeker_pos_idx_c[1] : seeker_pos_idx_c[0];
        end
    end

endmodule
