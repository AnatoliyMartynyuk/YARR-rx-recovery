-- ####################################
-- # Project: Yarr
-- # Author: Anatoliy Martntyk
-- # E-Mail: anatoli2 at uw.edu
-- # Comments: Header Seeker Aligner - 6 Seeker Variant
-- ####################################

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seeker3 is
    port (
        -- system control and clock
        rst_i : in std_logic;
        clk_i : in std_logic;

        -- input
        gbox_buffer : in std_logic_vector(193 downto 0);
        gbox_cnt    : in unsigned (5 downto 0);
        buffer_dv     : in std_logic;

        -- output
        block_offset : out unsigned(6 downto 0)
    );
end seeker3;

architecture rtl of seeker3 is

    -- allows multiplication without temporary assignment
    function slice_expression(A : unsigned) return unsigned is
        begin
            return A;
    end function;

    -- valid headers
    constant c_DATA_HEADER  : std_logic_vector(1 downto 0) := "01";
    constant c_CMD_HEADER   : std_logic_vector(1 downto 0) := "10";

    -- vhdl standards on arrays?
    -- 2 bits monitored by seeker
    type t_seekers is array (0 to 10) of std_logic_vector(1 downto 0);
    signal seekers : t_seekers; 

    type t_seekerPositions is array (0 to 10) of unsigned (6 downto 0);
    signal seeker_pos_idx_n : t_seekerPositions;    -- next seeker positions
    signal seeker_pos_idx_c : t_seekerPositions;    -- current seeker positions
    signal offset_stg1      : t_seekerPositions;
    signal offset_stg1_reg  : t_seekerPositions;

    type t_seekerCounters is array (0 to 10) of unsigned (5 downto 0);
    signal seeker_valid_cnt : t_seekerCounters;    -- number of valid headers seen at seeker's position
    signal max_cnt_stg1     : t_seekerCounters;
    signal max_cnt_stg1_reg : t_seekerCounters;


    signal headers_buffer : std_logic_vector (66 downto 0);
    signal best_offset    : unsigned (6 downto 0);
    signal count_lock     : std_logic;

begin

    -- store the 67 bits of the gearbox buffer that must contain a single header
    hdr_buf : process (clk_i, rst_i)
    begin
        if (rst_i = '1') then
            headers_buffer <= (others => '0');

        elsif (rising_edge(clk_i)) then
            if (buffer_dv) then 
                headers_buffer <= gbox_buffer(193 - to_integer(gbox_cnt) downto 127 - to_integer(gbox_cnt));
            end if;
        
        end if;
    end process hdr_buf;

    -- assign bits to the seekers so that they seach opposite ends of the buffer
    seekers( 0) <= headers_buffer(( 1 + to_integer(seeker_pos_idx_c( 0)*11)) downto ( 0 + to_integer(seeker_pos_idx_c( 0)*11)));
    seekers( 1) <= headers_buffer(( 2 + to_integer(seeker_pos_idx_c( 1)*11)) downto ( 1 + to_integer(seeker_pos_idx_c( 1)*11)));
    seekers( 2) <= headers_buffer(( 3 + to_integer(seeker_pos_idx_c( 2)*11)) downto ( 2 + to_integer(seeker_pos_idx_c( 2)*11)));
    seekers( 3) <= headers_buffer(( 4 + to_integer(seeker_pos_idx_c( 3)*11)) downto ( 3 + to_integer(seeker_pos_idx_c( 3)*11)));
    seekers( 4) <= headers_buffer(( 5 + to_integer(seeker_pos_idx_c( 4)*11)) downto ( 4 + to_integer(seeker_pos_idx_c( 4)*11)));
    seekers( 5) <= headers_buffer(( 6 + to_integer(seeker_pos_idx_c( 5)*11)) downto ( 5 + to_integer(seeker_pos_idx_c( 5)*11)));
    seekers( 6) <= headers_buffer(( 7 + to_integer(seeker_pos_idx_c( 6)*11)) downto ( 6 + to_integer(seeker_pos_idx_c( 6)*11)));
    seekers( 7) <= headers_buffer(( 8 + to_integer(seeker_pos_idx_c( 7)*11)) downto ( 7 + to_integer(seeker_pos_idx_c( 7)*11)));
    seekers( 8) <= headers_buffer(( 9 + to_integer(seeker_pos_idx_c( 8)*11)) downto ( 8 + to_integer(seeker_pos_idx_c( 8)*11)));
    seekers( 9) <= headers_buffer((10 + to_integer(seeker_pos_idx_c( 9)*11)) downto ( 9 + to_integer(seeker_pos_idx_c( 9)*11)));
    seekers(10) <= headers_buffer((11 + to_integer(seeker_pos_idx_c(10)*11)) downto (10 + to_integer(seeker_pos_idx_c(10)*11)));

    -- assign next header position
    seeker_pos_idx_n( 0) <= (others => '0') when (seeker_pos_idx_c( 0) >= 5) else seeker_pos_idx_c( 0) + 1;
    seeker_pos_idx_n( 1) <= (others => '0') when (seeker_pos_idx_c( 1) >= 5) else seeker_pos_idx_c( 1) + 1;
    seeker_pos_idx_n( 2) <= (others => '0') when (seeker_pos_idx_c( 2) >= 5) else seeker_pos_idx_c( 2) + 1;
    seeker_pos_idx_n( 3) <= (others => '0') when (seeker_pos_idx_c( 3) >= 5) else seeker_pos_idx_c( 3) + 1;
    seeker_pos_idx_n( 4) <= (others => '0') when (seeker_pos_idx_c( 4) >= 5) else seeker_pos_idx_c( 4) + 1;
    seeker_pos_idx_n( 5) <= (others => '0') when (seeker_pos_idx_c( 5) >= 5) else seeker_pos_idx_c( 5) + 1;
    seeker_pos_idx_n( 6) <= (others => '0') when (seeker_pos_idx_c( 6) >= 5) else seeker_pos_idx_c( 6) + 1;
    seeker_pos_idx_n( 7) <= (others => '0') when (seeker_pos_idx_c( 7) >= 5) else seeker_pos_idx_c( 7) + 1;
    seeker_pos_idx_n( 8) <= (others => '0') when (seeker_pos_idx_c( 8) >= 5) else seeker_pos_idx_c( 8) + 1;
    seeker_pos_idx_n( 9) <= (others => '0') when (seeker_pos_idx_c( 9) >= 5) else seeker_pos_idx_c( 9) + 1;
    seeker_pos_idx_n(10) <= (others => '0') when (seeker_pos_idx_c(10) >= 5) else seeker_pos_idx_c(10) + 1;

    -- lock counters if any one of the positions reached the maximum count value
    -- utilize reduction operator to test for all 1s
    count_lock <= '1' when ((seeker_valid_cnt(0) = 63) OR (seeker_valid_cnt(1) = 63) OR (seeker_valid_cnt(2) = 63) OR
                            (seeker_valid_cnt(3) = 63) OR (seeker_valid_cnt(4) = 63) OR (seeker_valid_cnt(5) = 63) OR
                            (seeker_valid_cnt(6) = 63) OR (seeker_valid_cnt(7) = 63) OR (seeker_valid_cnt(8) = 63) OR
                            (seeker_valid_cnt(9) = 63) OR (seeker_valid_cnt(10) = 63)) 
             else '0';


    -- update current header position if the current position shows an invalid header
    update_pos : process (clk_i, rst_i)
    begin
        if (rst_i = '1') then
            seeker_pos_idx_c <= (to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7),
                                to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7));
            seeker_valid_cnt <= (to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6),
                                to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6));

        elsif rising_edge(clk_i) then
            -- repeat for each seeker
            for i in 0 to 10 loop
                -- if the header is valid, incr the counter
                if (seekers(i) = c_DATA_HEADER OR seekers(i) = c_CMD_HEADER) then 
                    seeker_pos_idx_c(i) <= seeker_pos_idx_c(i); 
                    seeker_valid_cnt(i) <= seeker_valid_cnt(i) when (count_lock = '1') else seeker_valid_cnt(i) + 1;
                
                -- otherwise move to a new position and reset the counter
                else
                    seeker_pos_idx_c(i) <= seeker_pos_idx_n(i); 
                    seeker_valid_cnt(i) <= to_unsigned(0, 6);

                end if;
            end loop;
        end if;
    end process update_pos;

    -- determine the greatest position and count of the two sets of 4 and set of 3
    determine_seeker_stg1 : process (seeker_valid_cnt)
    begin
        for j in 0 to 2 loop
            if (seeker_valid_cnt(j*4 + 0) > seeker_valid_cnt(j*4 + 3)) then
                max_cnt_stg1(j) <= seeker_valid_cnt(j*4 + 0);
                offset_stg1(j)  <= seeker_pos_idx_c(J*4 + 0);
            end if;

            if (seeker_valid_cnt(j*4 + 1) > seeker_valid_cnt(j*4 + 0)) then
                max_cnt_stg1(j) <= seeker_valid_cnt(j*4 + 1);
                offset_stg1(j)  <= seeker_pos_idx_c(J*4 + 1);
            end if;

            if (seeker_valid_cnt(j*4 + 2) > seeker_valid_cnt(j*4 + 1)) then
                max_cnt_stg1(j) <= seeker_valid_cnt(j*4 + 2);
                offset_stg1(j)  <= seeker_pos_idx_c(J*4 + 2);
            end if;

            -- not all sets have 4 items
            if (j < 2) then
                if (seeker_valid_cnt(j*4 + 3) > seeker_valid_cnt(j*4 + 2)) then
                    max_cnt_stg1(j) <= seeker_valid_cnt(j*4 + 3);
                    offset_stg1(j)  <= seeker_pos_idx_c(J*4 + 3);
                end if;
            end if;

        end loop;
    end process determine_seeker_stg1;

    -- register the greatest postion and count for stg 1
    str_seeker_stg1 : process (clk_i, rst_i)
    begin
        if (rst_i) then
            max_cnt_stg1_reg <= (to_unsigned(0, 7),to_unsigned(0, 7));
            offset_stg1      <= (to_unsigned(0, 6), to_unsigned(0, 6));

        elsif (rising_edge(clk_i)) then
            if (buffer_dv = '1') then
                max_cnt_stg1_reg <= max_cnt_stg1;
                offset_stg1_reg <= offset_stg1;

            end if;
        end if;
    end process str_seeker_stg1;


    -- determine the greatest position of the results from stage 1
    determine_seeker_stg2 : process (max_cnt_stg1)
    begin
        if (max_cnt_stg1_reg(0) > max_cnt_stg1_reg(2)) then
            best_offset <= offset_stg1_reg(0);
        end if;

        if (max_cnt_stg1_reg(1) > max_cnt_stg1_reg(0)) then
            best_offset <= offset_stg1_reg(1);
        end if;

        if (max_cnt_stg1_reg(2) > max_cnt_stg1_reg(1)) then
            best_offset <= offset_stg1_reg(2);
        end if;

    end process determine_seeker_stg2;


    -- assign block offset
    set_offset : process (clk_i, rst_i)
    begin
        if (rst_i) then
            block_offset <= (others => '0');

        elsif (rising_edge(clk_i)) then
            if (buffer_dv = '1') then
                block_offset <= best_offset;
            end if;
        end if;
    end process set_offset;

end rtl;