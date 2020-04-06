library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library textio;
use textio.all;

library tdc;
library xil_defaultlib;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library framework;
use framework.board_pkg.all;
use framework.board_pkg_common.all;
use framework.constants_pkg.all;
use framework.system_types_pkg.all;
use framework.lpgbt_pkg.all;

library tdc;
use tdc.csm_pkg.all;

entity top_tdc_control is
  port(

    clock40 : in std_logic;
    reset   : in std_logic;
    trg_i   : in std_logic;
    bcr_i   : in std_logic;
    ecr_i   : in std_logic;
    gsr_i   : in std_logic;

    lpgbt_downlink_data : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0)

    );
end top_tdc_control;

architecture behavioral of top_tdc_control is

begin

  tdc_loop : for I in 0 to (c_NUM_LPGBT_DOWNLINKS-1) generate
    signal enc_o            : std_logic;
    signal enc_o_replicated : std_logic_vector (3 downto 0);
  begin

    encoded_control_inst : entity work.encoded_control
      port map (
        clk_i => clock40,
        dav_i => '1',
        rst_i => reset,
        trg_i => trg_i,
        bcr_i => bcr_i,
        ecr_i => ecr_i,
        gsr_i => gsr_i,
        enc_o => enc_o                  -- puts out 1 bit every 25ns, needs 3 bx for a command
        );

    -- 40 mb to 160 mb replication
    enc_o_replicated <= enc_o & enc_o & enc_o & enc_o;

    lpgbt_downlink_data(I).data((CSM_ENC_DOWNLINK_ELINK0+1)*4-1 downto 4*CSM_ENC_DOWNLINK_ELINK0)
      <= enc_o_replicated;

  end generate;

end behavioral;
