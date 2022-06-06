-- ####################################
-- # Project: Yarr
-- # Author: Anatoliy Martntyk
-- # E-Mail: anatoli2 at uw.edu
-- # Comments: Header Seeker Aligner - 3 Seeker Variant
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

    function slice_expression(A : unsigned) return unsigned is
        begin
            return A;
    end function;

    -- valid headers
    constant c_DATA_HEADER  : std_logic_vector(1 downto 0) := "01";
    constant c_CMD_HEADER   : std_logic_vector(1 downto 0) := "10";

    -- vhdl standards on arrays?
    -- 2 bits monitored by seeker
    type t_seekers is array (0 to 2) of std_logic_vector(1 downto 0);
    signal seekers : t_seekers; 

    type t_seekerPositions is array (0 to 2) of unsigned (6 downto 0);
    signal seeker_pos_idx_n : t_seekerPositions;    -- next seeker positions
    signal seeker_pos_idx_c : t_seekerPositions;    -- current seeker positions

    type t_seekerCounters is array (0 to 2) of unsigned (5 downto 0);
    signal seeker_valid_cnt : t_seekerCounters;    -- number of valid headers seen at seeker's position


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
    seekers(0) <= headers_buffer((1 + to_integer(seeker_pos_idx_c(0)*3)) downto to_integer(seeker_pos_idx_c(0)*3));
    seekers(1) <= headers_buffer((2 + to_integer(seeker_pos_idx_c(1)*3)) downto (1 + to_integer(seeker_pos_idx_c(1)*3)));
    seekers(2) <= headers_buffer((3 + to_integer(seeker_pos_idx_c(2)*3)) downto (2 + to_integer(seeker_pos_idx_c(2)*3)));

    -- assign next header position
    seeker_pos_idx_n(0) <= (others => '0') when (seeker_pos_idx_c(0) >= 21) else seeker_pos_idx_c(0) + 1;
    seeker_pos_idx_n(1) <= (others => '0') when (seeker_pos_idx_c(1) >= 21) else seeker_pos_idx_c(1) + 1;
    seeker_pos_idx_n(2) <= (others => '0') when (seeker_pos_idx_c(2) >= 21) else seeker_pos_idx_c(2) + 1;

    -- lock counters if any one of the positions reached the maximum count value
    -- utilize reduction operator to test for all 1s
    count_lock <= '1' when ((seeker_valid_cnt(0) = 63) OR (seeker_valid_cnt(1) = 63) OR (seeker_valid_cnt(2) = 63)) else '0';


    -- update current header position if the current position shows an invalid header
    update_pos : process (clk_i, rst_i)
    begin
        if (rst_i = '1') then
            seeker_pos_idx_c <= (to_unsigned(0, 7), to_unsigned(0, 7), to_unsigned(0, 7));
            seeker_valid_cnt <= (to_unsigned(0, 6), to_unsigned(0, 6), to_unsigned(0, 6));

        elsif rising_edge(clk_i) then
            -- repeat for each seeker
            for i in 0 to 2 loop
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

    -- determine which of the three seekers to use for the block offset
    determine_seeker : process (seeker_valid_cnt)
    begin
        if (seeker_valid_cnt(0) > seeker_valid_cnt(1) AND seeker_valid_cnt(0) > seeker_valid_cnt(2)) then
            best_offset <= (0 + slice_expression(seeker_pos_idx_c(0)*3)(6 downto 0));

        elsif (seeker_valid_cnt(1) > seeker_valid_cnt(0) AND seeker_valid_cnt(1) > seeker_valid_cnt(2)) then
            best_offset <= (1 + slice_expression(seeker_pos_idx_c(1)*3)(6 downto 0));

        else
            best_offset <= (2 + slice_expression(seeker_pos_idx_c(2)*3)(6 downto 0));

        end if;
    end process determine_seeker;

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