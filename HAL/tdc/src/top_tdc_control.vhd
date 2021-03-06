library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library tdc;
library xil_defaultlib;

library hal;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;

library tdc;
use tdc.csm_pkg.all;

entity top_tdc_control is
  port(

    clock_i : in std_logic;
    valid_i : in std_logic;
    reset   : in std_logic;
    trg_i   : in std_logic;
    bcr_i   : in std_logic;
    ecr_i   : in std_logic;
    gsr_i   : in std_logic;

    lpgbt_downlink_data : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0)

    );
end top_tdc_control;

architecture behavioral of top_tdc_control is
  constant elink : integer := CSM_ENC_DOWNLINK;
begin

  tdc_loop : for I in 0 to (c_NUM_LPGBT_DOWNLINKS-1) generate
    signal enc_o : std_logic;
  begin

    encoded_control_inst : entity work.encoded_control
      port map (
        clk_i => clock_i,
        dav_i => valid_i,
        trg_i => trg_i,
        bcr_i => bcr_i,
        ecr_i => ecr_i,
        gsr_i => gsr_i,
        enc_o => enc_o                  -- puts out 1 bit every 25ns, needs 3 bx for a command
        );

    lpgbt_downlink_data(I).data((elink+1)*2-1 downto 2*elink) <= enc_o & enc_o;  -- 40 mb to 80 mb replication

  end generate;

end behavioral;
