-- ####################################
-- # Project: Yarr
-- # Author: Anatoliy Martntyk
-- # E-Mail: anatoli2 at uw.edu
-- # Comments: Header Seeker Aligner - 2 Seeker Variant
-- ####################################

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seeker2 is
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
end seeker2;

architecture rtl of seeker2 is

    -- valid headers
    constant c_DATA_HEADER  : std_logic_vector(1 downto 0) := "01";
    constant c_CMD_HEADER   : std_logic_vector(1 downto 0) := "10";

    -- vhdl standards on arrays?
    -- 2 bits monitored by seeker
    type t_seekers is array (0 to 1) of std_logic_vector(1 downto 0);
    signal seekers : t_seekers; 

    type t_seekerPositions is array (0 to 1) of unsigned (6 downto 0);
    signal seeker_pos_idx_n : t_seekerPositions;    -- next seeker positions
    signal seeker_pos_idx_c : t_seekerPositions;    -- current seeker positions

    signal headers_buffer : std_logic_vector(66 downto 0);
    signal seeker_chosen  : std_logic;

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
    seekers(0) <= headers_buffer((1 + to_integer(seeker_pos_idx_c(0))) downto to_integer(seeker_pos_idx_c(0)));
    seekers(1) <= headers_buffer((66 - to_integer(seeker_pos_idx_c(1))) downto (65 - to_integer(seeker_pos_idx_c(1))));

    -- assign next header position
    seeker_pos_idx_n(0) <= (others => '0') when (seeker_pos_idx_c(0) >= 33) else seeker_pos_idx_c(0) + 1;
    seeker_pos_idx_n(1) <= (others => '0') when (seeker_pos_idx_c(1) >= 33) else seeker_pos_idx_c(1) + 1;

    -- update current header position if the current position shows an invalid header
    update_pos : process (clk_i, rst_i)
    begin
        if (rst_i = '1') then
            seeker_pos_idx_c <= (to_unsigned(0, 7), to_unsigned(0, 7));

        elsif rising_edge(clk_i) then
            if (NOT (seekers(0) = c_DATA_HEADER OR seekers(0) = c_CMD_HEADER)) then seeker_pos_idx_c(0) <= seeker_pos_idx_n(0); end if;
            if (NOT (seekers(1) = c_DATA_HEADER OR seekers(1) = c_CMD_HEADER)) then seeker_pos_idx_c(1) <= seeker_pos_idx_n(1); end if;
        
        end if;
    end process update_pos;

    -- determine which of the two seekers to use for the block offset
    choose_seeker : process (clk_i, rst_i)
    begin
        if (rst_i) then
            seeker_chosen <= '0';
        
        elsif rising_edge(clk_i) then
            if ((NOT (seekers(0) = c_DATA_HEADER OR seekers(0) = c_CMD_HEADER)) AND (seekers(1) = c_DATA_HEADER OR seekers(1) = c_CMD_HEADER)) then
                seeker_chosen <= '1';
            elsif ((NOT (seekers(1) = c_DATA_HEADER OR seekers(1) = c_CMD_HEADER)) AND (seekers(0) = c_DATA_HEADER OR seekers(0) = c_CMD_HEADER)) then
                seeker_chosen <= '0';
            
            end if;
        end if;
    end process choose_seeker;

    -- assign block offset
    set_offset : process (clk_i, rst_i)
    begin
        if (rst_i) then
            block_offset <= (others => '0');

        elsif (rising_edge(clk_i)) then
            if (buffer_dv = '1') then
                block_offset <= (to_unsigned(65, 7) - seeker_pos_idx_c(1)) when (seeker_chosen = '1') else seeker_pos_idx_c(0);
            end if;
        end if;
    end process set_offset;

end rtl;