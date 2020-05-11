library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library unisim;
use unisim.vcomponents.all;

entity gbt_controller_tb is
end gbt_controller_tb;

architecture Behavioral of gbt_controller_tb is

signal reset    : std_logic := '1';
signal clock_en : std_logic := '1';
signal clock    : std_logic := '1';
signal clock40  : std_logic := '1';
signal clock160 : std_logic := '1';
signal clock80  : std_logic := '1';
signal ic_to_gbt : std_logic_vector (1 downto 0);

signal frame_o : std_logic_vector (7 downto 0);
signal valid_o :std_logic;
signal header_o : std_logic;

signal    chip_adr_o           : std_logic_vector(6 downto 0);
signal    data_o               : std_logic_vector(31 downto 0);
signal    length_o             : std_logic_vector(15 downto 0);
signal    reg_adr_o            : std_logic_vector(15 downto 0);
signal    read_valid           : std_logic;
signal    read_valid_dly       : std_logic := '0';
signal    uplink_parity_ok_o   : std_logic;
signal    downlink_parity_ok_o : std_logic;

        -- Control
signal ic_rw_address_i         :  std_logic_vector(15 downto 0);
signal rand2          :  std_logic_vector(1 downto 0);
signal rand16         :  std_logic_vector(15 downto 0);
signal ic_w_data_i             :  std_logic_vector(31 downto 0);
signal rand32             :  std_logic_vector(31 downto 0);
signal ic_rw_length_i          : std_logic_vector(2 downto 0);
signal ic_write_req_i          : std_logic := '0';
signal ic_write_done_o         :  std_logic;
signal ic_read_req_i           : std_logic;
    signal  data_mask               :  std_logic_vector(31 downto 0);

signal err_vec : std_logic;

begin

--------------------------------------------------------------------------------
-- clocks
--------------------------------------------------------------------------------
clock <= not clock after 1.5625 ns;

process (clock) begin
if (rising_edge(clock)) then
    clock160 <= not clock160;
end if;
end process;

process (clock160) begin
if (rising_edge(clock160)) then
    clock80 <= not clock80;
end if;
end process;

process (clock80) begin
if (rising_edge(clock80)) then
    clock40 <= not clock40;
end if;
end process;

ic_read_req_i <= '0';
-- ic_rw_length_i <= "100";

-- simulate some delay
read_valid_dly <= transport read_valid after 50 ns;


ic_w_data_i <= rand32 and  data_mask;
ic_rw_address_i <= rand16;
process (ic_rw_length_i) begin
        if (ic_rw_length_i="001") then
            data_mask <= x"000000ff";
        elsif (ic_rw_length_i="010") then
            data_mask <= x"0000ffff";
        elsif (ic_rw_length_i="011") then
            data_mask <= x"00ffffff";
        elsif (ic_rw_length_i="100") then
            data_mask <= x"ffffffff";
        else
            data_mask <= x"00000000";
        end if;
end process;

ic_process : process

    variable seed1 :positive := 10;
    variable seed2 :positive := 1;

    variable seed3 :positive := 500;
    variable seed4 :positive := 30;

    variable seed5 :positive := 500;
    variable seed6 :positive := 30;

    variable re2a : real := 0.5;
    variable re2b : real := 0.2;
    variable re2c : real := 0.2;


begin

    wait until reset ='0';

    tag : for I in 0 to (10000) loop


        uniform (seed1,seed2,re2a);
        rand16 <= std_logic_vector(to_unsigned(natural (re2a * real(2**16 -1)),16));
        --ic_rw_address_i <= x"007e";

        uniform (seed3,seed4,re2b);
        rand32 <= std_logic_vector(to_unsigned(natural (re2b * 4294967295.0),32));

        uniform (seed5,seed6,re2c);
        ic_rw_length_i <= std_logic_vector(1+to_unsigned(natural (re2c * 3.0),3));


        ic_write_req_i <= '1';
        wait for 25 ns;
        ic_write_req_i <= '0';

        wait until read_valid_dly = '1';

        assert ic_rw_address_i = reg_adr_o report "address_err";
        assert ic_w_data_i = data_o report "data_err";
        assert downlink_parity_ok_o = '1' report "downlink_parity_err";
        assert uplink_parity_ok_o = '1' report "uplink_parity_err";

        --wait for 25 ns;

    end loop;


end process;

    --------------------------------------------------------------------------------
    -- reset
    --------------------------------------------------------------------------------

    process (clock40)
        variable counter : integer range 0 to 31;
    begin
        if (rising_edge(clock40)) then
            counter := counter + 1;
        end if;

        if (reset='1'  and counter=31) then
            reset <= '0';
        end if;

    end process;

--------------------------------------------------------------------------------
-- clock_en
--------------------------------------------------------------------------------
process (clock)
variable counter : integer range 0 to 8;
begin
    if (rising_edge(clock)) then

        if reset = '1' then
            counter := 0;
            clock_en <= '0';

        else
            counter := counter + 1;

            if counter = 8 then
                counter := 0;
            end if;

            clock_en   <= '0';
            if counter = 0 then
                clock_en   <= '1';
            end if;
        end if;


    end if;
end process;

gbt_ic_controller_inst : entity work.gbtx_ic_controller
port map (
    -- reset
    reset_i => reset,

    -- clocks
    gbt_clk_i => clock40,

    -- GBT I2C address (0==broadcast)
    gbtx_i2c_address  => "0000000",

    -- GBT IC elinks
    gbt_rx_ic_elink_i       => "00",
    gbt_tx_ic_elink_o       => ic_to_gbt,

    -- Control
    ic_rw_address_i   => ic_rw_address_i   ,
    ic_w_data_i       => ic_w_data_i       ,
    ic_rw_length_i    => ic_rw_length_i,
    ic_write_req_i    => ic_write_req_i    ,
    ic_write_done_o   => ic_write_done_o   ,
    ic_read_req_i     => ic_read_req_i
);

gbt_unstuffer_inst : entity work.gbt_unstuffer
port map (
    clock_i => clock,
    clock_en_i => clock_en,
    reset_i => reset,
    ic => ic_to_gbt,
    frame_o => frame_o,
    header_o => header_o,
    valid_o => valid_o
);

gbt_ic_rx_inst : entity work.gbt_ic_rx
generic map (
g_RX_EMULATOR => true
)
port map (
    clock_i              => clock,
    clock_en_i           => clock_en,
    reset_i              => reset,
    frame_i              => frame_o,
    header_i             => header_o,
    valid_i              => valid_o,
    chip_adr_o           => chip_adr_o,
    data_o               => data_o,
    length_o             => length_o,
    reg_adr_o            => reg_adr_o,
    uplink_parity_ok_o   => uplink_parity_ok_o,
    downlink_parity_ok_o => downlink_parity_ok_o,
    valid_o              => read_valid,
    err_o                => open
);

end Behavioral;

