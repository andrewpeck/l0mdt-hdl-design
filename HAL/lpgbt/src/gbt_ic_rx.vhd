----------------------------------------------------------------------------------
-- CMS Endcap Timing Layer
-- Module Test Firmware
-- A. Peck
----------------------------------------------------------------------------------
--
-- Description:
--
--   This module has a simple state machine that decodes the (lp)GBT IC data coming
--   from the CERN gbt-sc firmware:
--          https://gitlab.cern.ch/gbtsc-fpga-support/gbt-sc/
--
--   It expects to receive data in the same format that the gbt-sc core delivers
--
--   The GBT-SC core strips off the header and trailer, so what we see from the
--
--   GBTx
--
--     i=0 -- reserved
--     i=1 -- chip adr + rw
--     i=2 -- cmd (0000000 + uplink parity)
--     i=3 -- nwords [7:0]
--     i=4 -- nwords [15:8]
--     i=5 -- reg adr[7:0]
--     i=6 -- reg adr[15:8]
--     i=7 -- data
--     i=8 -- parity
--
--   lpGBT v0
--
--     i=0 -- chip adr + rw
--     i=1 -- reserved
--     i=2 -- cmd (0000000 + uplink parity)
--     i=3 -- nwords [7:0]
--     i=4 -- nwords [15:8]
--     i=5 -- reg adr[7:0]
--     i=6 -- reg adr[15:8]
--     i=7 -- data
--     i=8 -- parity
--
--   lpGBT v1
--
--     i=0 -- chip adr + rw
--     i=1 -- cmd (0000000 + uplink parity)
--     i=2 -- nwords [7:0]
--     i=3 -- nwords [8:8]
--     i=4 -- reg adr[7:0]
--     i=5 -- reg adr[15:8]
--     i=6 -- data
--     i=7 -- parity
--
--  Note that the IC core inherently supports reading many registers at once
--
--  Right now there is a limitation that, for simplicity, only 4 bytes may be
--  read in a given transaction. They are packed into a single 32 bit data word.
--
--  If only single byte transactions are needed, then you only need to pay
--  attention to the least significant 8 bits of the word.
--
-- Notes:
--
--   TODO: Add a (optional) FIFO to allow reading packets longer than 4 bytes
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;

entity gbt_ic_rx is
  port(
    clock_i : in std_logic;             -- 40MHz clock
    reset_i : in std_logic;             -- state machine reset

    frame_i : in std_logic_vector (7 downto 0);  -- 8 bit frame from gbt-sc
    valid_i : in std_logic;             -- set high for valid data frames

    gbt_frame_format_i : in std_logic_vector(1 downto 0);

    -- Control
    chip_adr_o           : out std_logic_vector (6 downto 0) := (others => '0'); -- lpgbt chip address
    data_o               : out std_logic_vector(31 downto 0) := (others => '0'); -- data output, up to 4 bytes
    length_o             : out std_logic_vector(15 downto 0) := (others => '0'); -- # of bytes received.. if it is more than 4 you are in trouble
    reg_adr_o            : out std_logic_vector(15 downto 0) := (others => '0'); -- lpgbt register data received from
    uplink_parity_ok_o   : out std_logic                     := '0';             -- this module says its (uplink) parity check was ok
    downlink_parity_ok_o : out std_logic                     := '0';             -- lpgbt says its (downlink) parity check was ok
    err_o                : out std_logic                     := '0';             -- something went wrong
    valid_o              : out std_logic                     := '0'              -- output data is valid
    );
end gbt_ic_rx;

architecture Behavioral of gbt_ic_rx is

  type rx_state_t is (IDLE, I2C_ADR, RSVD, CMD, LENGTH0, LENGTH1, REG_ADR0, REG_ADR1, DATA, PARITY, OUTPUT, ERR);

  signal rx_state : rx_state_t := IDLE;

  signal rsvrd_int              : std_logic_vector (7 downto 0)  := (others => '0');
  signal chip_adr_int           : std_logic_vector (6 downto 0)  := (others => '0');
  signal downlink_parity_ok_int : std_logic                      := '0';
  signal length_int             : std_logic_vector (15 downto 0) := (others => '0');
  signal reg_adr_int            : std_logic_vector (15 downto 0) := (others => '0');
  signal parity_int             : std_logic_vector (7 downto 0)  := (others => '0');
  signal parity_rx_int          : std_logic_vector (7 downto 0)  := (others => '0');
  signal rw_bit_int             : std_logic                      := '0';
  signal data_int               : std_logic_vector (31 downto 0) := (others => '0');

  -- watchdog counter
  constant watchdog_cnt_max : integer                             := 127;
  signal watchdog_cnt       : integer range 0 to watchdog_cnt_max := 0;
  signal watchdog_reset     : std_logic                           := '0';

  signal data_frame_cnt : integer range 0 to 2**16-1;
  signal cnt            : integer range 0 to 5 := 0;
  signal state_fsm      : std_logic_vector(3 downto 0);
  
--  COMPONENT ila_gbt_ic_rx

--PORT (
--	clk : IN STD_LOGIC;
--	probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
--	probe1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
--	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--	probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--	probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--	probe6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
--	probe7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
--	probe8 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--	probe9 : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
--);
--END COMPONENT  ;

begin

  --------------------------------------------------------------------------------
  --
  -- watchdog to keep the state machine from getting stuck
  --
  -- This just waits a reasonably long time then takes the state machine back to
  -- IDLE
  --------------------------------------------------------------------------------

  watchdog_reset <= '1' when watchdog_cnt = watchdog_cnt_max else '0';

  process (clock_i) is
  begin
    if (rising_edge(clock_i)) then
      if (rx_state = IDLE) then
        watchdog_cnt <= 0;
      else
        if (watchdog_cnt < watchdog_cnt_max) then
          watchdog_cnt <= watchdog_cnt + 1;
        end if;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- state machine
  --------------------------------------------------------------------------------

  process (clock_i)
  begin
    if (rising_edge(clock_i)) then

      valid_o <= '0';

      case rx_state is

        when IDLE =>

          if (valid_i = '1') then
            if (gbt_frame_format_i = "00") then  -- GBTx
              -- first frame is RSVD, then go to I2C_ADR
              rx_state <= I2C_ADR;

            elsif (gbt_frame_format_i = "01") then  -- lpGBT v0
              -- first frame is I2C_ADR, then go to RSVD
              rx_state <= RSVD;

              chip_adr_int <= frame_i(7 downto 1);
              rw_bit_int   <= frame_i(0);
            -- not included in parity check
            else                        -- lpGBT v1 and others
              -- first frame is I2C_ADR, then go to CMD
              state_fsm <= "0000";
              rx_state <= CMD;

              chip_adr_int <= frame_i(7 downto 1);
              rw_bit_int   <= frame_i(0);
              parity_int   <= frame_i;
            end if;
          end if;

        when I2C_ADR =>                 -- GBTx only state

          if (valid_i = '1') then
            rx_state <= CMD;

            chip_adr_int <= frame_i(7 downto 1);
            rw_bit_int   <= frame_i(0);
            state_fsm <= "0001";
          -- not included in parity check
          end if;

        when RSVD =>                    -- lpGBT v0 only state

          if (valid_i = '1') then
            rx_state <= CMD;
            state_fsm <= "0010";
          end if;

        when CMD =>

          if (valid_i = '1') then
--            if cnt = 1 then                 --had to add a delay to sample the data correctly for LpGBT V1
--                cnt <= 0;
                rx_state               <= LENGTH0;
                downlink_parity_ok_int <= frame_i(0);
    
                if (gbt_frame_format_i = "00") or (gbt_frame_format_i = "01") then  -- GBTx and lpGBT v0
                  parity_int <= frame_i;    -- start parity check
                else                        -- lpGBT v1 and others
                  parity_int <= parity_int xor frame_i;  -- continue parity check
                  state_fsm <= "0011";
                end if;
--            else
--                cnt <= cnt + 1;
--            end if;
          end if;

        when LENGTH0 =>

          if (valid_i = '1') then
            rx_state               <= LENGTH1;
            length_int(7 downto 0) <= frame_i;
            parity_int             <= parity_int xor frame_i;
            state_fsm <= "0100";
          end if;

        when LENGTH1 =>

          if (valid_i = '1') then
            rx_state                <= REG_ADR0;
            length_int(15 downto 8) <= frame_i;
            parity_int              <= parity_int xor frame_i;
            state_fsm <= "0101";
          end if;

        when REG_ADR0 =>

          if (valid_i = '1') then
            rx_state                <= REG_ADR1;
            reg_adr_int(7 downto 0) <= frame_i;
            parity_int              <= parity_int xor frame_i;
            state_fsm <= "0110";
          end if;

        when REG_ADR1 =>

          if (valid_i = '1') then
            reg_adr_int(15 downto 8) <= frame_i;
            parity_int               <= parity_int xor frame_i;
            rx_state                 <= DATA;
            state_fsm <= "0111";
          end if;

        when DATA =>

          if (valid_i = '1') then
            parity_int <= parity_int xor frame_i;
            case data_frame_cnt mod 4 is
              when 0      => data_int (7 downto 0)   <= frame_i;
              when 1      => data_int (15 downto 8)  <= frame_i;
              when 2      => data_int (23 downto 16) <= frame_i;
              when 3      => data_int (31 downto 24) <= frame_i;
              when others => data_int                <= data_int;
            end case;

            if (std_logic_vector(to_unsigned(data_frame_cnt+1, length_int'length)) = length_int) then
              rx_state       <= PARITY;
              data_frame_cnt <= 0;
              state_fsm <= "1000";
            else
              data_frame_cnt <= data_frame_cnt + 1;
              state_fsm <= "1001";
            end if;
          end if;

        when PARITY =>

          if (valid_i = '1') then
            rx_state      <= OUTPUT;
            parity_int    <= parity_int;
            parity_rx_int <= frame_i;
            state_fsm     <= "1010";
          end if;

        when OUTPUT =>

          if (parity_int = parity_rx_int) then
            uplink_parity_ok_o <= '1';
          else
            uplink_parity_ok_o <= '0';
          end if;

          chip_adr_o           <= chip_adr_int;
          downlink_parity_ok_o <= downlink_parity_ok_int;
          length_o             <= length_int;
          reg_adr_o            <= reg_adr_int;
          data_o               <= data_int;
          valid_o              <= '1';
          state_fsm            <= "1011";

          rx_state <= IDLE;

        when ERR =>

          err_o    <= '1';
          rx_state <= IDLE;
          state_fsm            <= "1100";

        when others =>
          rx_state <= IDLE;
          state_fsm            <= "1101";

      end case;

      --------------------------------------------------------------------------------
      -- Reset
      --------------------------------------------------------------------------------

      if (rx_state = IDLE or reset_i = '1' or watchdog_reset = '1') then

        if (reset_i = '1' or watchdog_reset = '1') then

          rx_state             <= IDLE;
          err_o                <= '0';
          data_o               <= (others => '0');
          chip_adr_o           <= (others => '0');
          length_o             <= (others => '0');
          reg_adr_o            <= (others => '0');
          data_o               <= (others => '0');
          data_int             <= (others => '0');
          downlink_parity_ok_o <= '0';
          valid_o              <= '0';

        end if;

        data_frame_cnt <= 0;

      end if;

    end if;
  end process;

--ilagen: if c_ENABLE_ILA = '1' generate

--    ila_gbt_ic_rx_inst : ila_gbt_ic_rx
--    PORT MAP (
--        clk => clock_i,
--        probe0 => frame_i, 
--        probe1 => state_fsm, 
--        probe2(0) => valid_i, 
--        probe3(0) => uplink_parity_ok_o,
--        probe4(0) => reset_i,
--        probe5(0) => valid_o,
--        probe6     => data_o,
--        probe7     => reg_adr_o,
--        probe8     => length_o,
--        probe9     => chip_adr_o
--    );  
--end generate;
  

end Behavioral;
