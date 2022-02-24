library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity sim_gearbox is
--  Port ( );
end sim_gearbox;

architecture Behavioral of sim_gearbox is
    component gearbox32to66
        port (
            -- Sys connect
            rst_i : in std_logic;
            clk_i : in std_logic;
            -- Input
            data32_i : in std_logic_vector(31 downto 0);
            data32_valid_i : in std_logic;
            slip_i : in std_logic;
            -- Outoput
            data66_o : out std_logic_vector(65 downto 0);
            data66_valid_o : out std_logic
        );
    end component gearbox32to66;

    signal rst_i    : std_logic := '0';
    signal clk_i    : std_logic := '0';

    signal data32_i         : std_logic_vector(31 downto 0) := (others => '0');
    signal data32_valid_i   : std_logic := '0';
    signal slip_i           : std_logic := '0';

    signal data66_o         : std_logic_vector(65 downto 0);
    signal data66_valid_o   : std_logic;

    constant RX_CLK_PERIOD  : time := 6.4ns;

    signal cntr_val : std_logic_vector(3 downto 0) := (others => '0');

    signal zero  : std_logic_vector(65 downto 0) := "01" & x"0000000000000000";
    signal one   : std_logic_vector(65 downto 0) := "01" & x"1111111111111111";
    signal two   : std_logic_vector(65 downto 0) := "01" & x"2222222222222222";
    signal three : std_logic_vector(65 downto 0) := "01" & x"3333333333333333";
    signal four  : std_logic_vector(65 downto 0) := "01" & x"4444444444444444";
    signal five  : std_logic_vector(65 downto 0) := "01" & x"5555555555555555";
    signal six   : std_logic_vector(65 downto 0) := "01" & x"6666666666666666";
    signal seven : std_logic_vector(65 downto 0) := "01" & x"7777777777777777";
													  
    signal skip  : std_logic_vector(65 downto 0) := "01" & x"ffffffffffffffff";

    signal blks : std_logic_vector(2177 downto 0) := 
        zero & one & two & three & four & five & six & seven &
        zero & one & two & three & four & five & six & seven &
        zero & one & two & three & four & five & six & seven &
        zero & one & two & three & four & five & six & seven & 
        skip;

    signal blk_shift : std_logic_vector(2177 downto 0) := blks;

begin

    -- generate clock
    clk_proc: process
    begin
        clk_i <= '1';
        wait for RX_CLK_PERIOD/2;
        clk_i <= '0';
        wait for RX_CLK_PERIOD/2;
    end process clk_proc;

    -- generate reset
    rst_proc: process
    begin
            rst_i <= '1';
            wait for 20ns;
            rst_i <= '0';
            wait;
    end process rst_proc;

    -- instantiate DUT
    dut : gearbox32to66 port map (
        rst_i           => rst_i,
        clk_i           => clk_i,
        data32_i        => data32_i,
        data32_valid_i  => data32_valid_i,
        slip_i          => slip_i,
        data66_o        => data66_o,
        data66_valid_o  => data66_valid_o
    );

    -- update input values every 8 cycles
    input_proc: process
    begin
        data32_i <= blk_shift(2177 downto 2146);
        wait until (rising_edge(clk_i));
        data32_valid_i <= '0';
        wait until (rising_edge(clk_i));
        wait until (rising_edge(clk_i));
        wait until (rising_edge(clk_i));
        wait until (rising_edge(clk_i));
        wait until (rising_edge(clk_i));
        wait until (rising_edge(clk_i));
        wait until (rising_edge(clk_i));
        data32_valid_i <= '1';
        blk_shift <= blk_shift(2145 downto 0) & x"cccccccc";
    end process input_proc;

end Behavioral;