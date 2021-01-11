--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: phimod calculator
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;

 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_ctrl_mon is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;
    ttc_commands            : in l0mdt_ttc_rt;
    -- configuration, control & Monitoring
    ctrl                    : in  UCM_CTRL_t;
    mon                     : out UCM_MON_t;
    --

  );
end entity ucm_ctrl_mon;

architecture beh of ucm_ctrl_mon is
  
begin
  
--   IETA_PL : entity shared_lib.vhdl_ram_memory
--   generic map(
--     g_MEMORY_TYPE       => "auto",
--     g_PIPELINE_LATENCY  => 0,
--     g_RAM_WIDTH         => VEC_MDTID_CHAMBER_IETA_LEN,
--     g_RAM_DEPTH         => VEC_MDTID_CHAMBER_IETA_LEN
--   )
--   port map(
--     clk         => clk,
--     rst         => rst,
--     -- SC ports
--     i_ctrl_wr_req   => ctrl_wr_req,
--     i_ctrl_rd_en    => ctrl_rd_en,
--     i_ctrl_addr     => ctrl_addr,
--     i_ctrl_data_in  => ctrl_data_in,
--     o_ctrl_data_out => ctrl_data_out,
--     -- fw ports
--     i_rd_en         => '1',
--     i_rd_addr       => i_z ,
--     o_rd_data       => ieta_limit
--   );

--   IETA : process(clk)
-- begin
--   if rising_edge(clk) then
--     if rst = '1' then
--       IETA_CALC_RD.RST_NEEDED <= '0';
--     else
--       if IETA_CALC_WR.ADDR = x"00" then
--         i_ctrl_rd_en <= '0';
--         i_ctrl_wr_req <= '0';
--       else
--         i_ctrl_rd_en <= '1';
--         i_ctrl_addr <= IETA_CALC_WR.ADDR;
--         IETA_CALC_RD.VALUE <= ctrl_data_out;
--         if IETA_CALC_WR.WR_EN = '1' then
--           IETA_CALC_RD.RST_NEEDED <= '1';
--           i_ctrl_wr_req <= '1';
--           i_ctrl_data_in <= IETA_CALC_WR.VALUE;
--         end if;
--       end if;
      
--     end if;
--   end if;
-- end process;
  
end architecture beh;