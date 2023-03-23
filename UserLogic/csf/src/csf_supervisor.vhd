----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 02/08/2019 11:31:09 AM
-- Design Name: Compact Segment Finder
-- Module Name: csf_top - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions: 2018.3
-- Description: Compact Segment Finder top module
--
-- Dependencies: csf_pkg
--
-- Revision:
-- Revision 19.10.18
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.numeric_std_unsigned.all;
  use ieee.std_logic_misc.all;
  use ieee.math_real.all;

library shared_lib;
  use shared_lib.common_ieee_pkg.all;
  use shared_lib.l0mdt_constants_pkg.all;
  use shared_lib.l0mdt_dataformats_pkg.all;
  use shared_lib.common_constants_pkg.all;
  use shared_lib.common_types_pkg.all;
  use shared_lib.config_pkg.all;

library csf_lib;
  use csf_lib.csf_pkg.all;
  use csf_lib.csf_custom_pkg.all;

library ctrl_lib;
  use ctrl_lib.hps_ctrl.all;

entity csf_supervisor is
  generic (
    g_reset_delay : integer := 0
  );
  port (
    clk     : in    std_logic;
    rst     : in    std_logic;
    glob_en : in    std_logic;
    -- AXI to SoC
    i_actions : in    HPS_CSF_CSF_ACTIONS_CTRL_t;
    o_status  : out   HPS_CSF_CSF_STATUS_MON_t;
    --
    o_freeze : out   std_logic;
    --
    o_local_en  : out   std_logic;
    o_local_rst : out   std_logic
  );
end entity csf_supervisor;

architecture beh of csf_supervisor is

  signal local_rst : std_logic;
  signal local_en  : std_logic;
  --
  signal int_en  : std_logic;
  signal int_rst : std_logic := '1';

  signal int_freeze : std_logic;

  constant apb_clk_lat   : integer := c_CLK_AXI_MULT;
  signal   apb_clk_cnt   : integer;
  signal   axi_cnt_reset : std_logic;
  signal   axi_rep_clk   : std_logic;

begin

  o_local_en  <= local_en;
  o_local_rst <= local_rst;

  local_en  <= glob_en and int_en;
  local_rst <= rst or int_rst;

  o_freeze <= int_freeze;

  signaling : process (clk) is
  begin

    if rising_edge(clk) then
      if (rst = '1') then
        int_en      <= '1';
        int_rst     <= rst;
        apb_clk_cnt <= 0;
      else
        --------------------------------------------
        --    AXI CLK CTRL
        --------------------------------------------
        if (apb_clk_cnt < apb_clk_lat and axi_cnt_reset = '0') then
          apb_clk_cnt <= apb_clk_cnt + 1;
        else
          apb_clk_cnt <= 0;
          axi_rep_clk <= not axi_rep_clk;
        end if;
        --------------------------------------------
        --    from apb
        --------------------------------------------
        -- if apb_clk_cnt = 0 then
        if (i_actions.reset = '1') then
          int_rst <= '1';
        else
          int_rst <= '0';
        end if;

        if (i_actions.enable = '1') then
          int_en <= '1';
        elsif (i_actions.disable = '1') then
          int_en <= '0';
        end if;

        if (i_actions.freeze = '1') then
          int_freeze <= '1';
        else
          int_freeze <= '0';
        end if;
        -- else
        -- end if;
        --------------------------------------------
        --    to apb
        --------------------------------------------
        o_status.ENABLED <= local_en;
        o_status.READY   <= not local_rst;
        o_status.ERROR   <= '0';
      end if;
    end if;

  end process signaling;

end architecture beh;
