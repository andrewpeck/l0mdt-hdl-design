--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
--          Preprocesing
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_prepro is
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    glob_en               : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_v          : in slc_rx_rvt;
    -- ctrl out
    o_prepro2ctrl_v       : out ucm_prepro2ctrl_rvt;
    -- data out
    o_prepro_data_v       : out slc_rx_rvt
  );
end entity ucm_prepro;

architecture beh of ucm_prepro is
  
  signal i_slc_data_r     : slc_rx_rt;
  signal o_prepro_data_r  : slc_rx_rt;
  signal i_barrel         : slc_barrel_rt;
  signal o_barrel         : slc_barrel_rt;

  signal o_prepro2ctrl_r  : ucm_prepro2ctrl_rt;

begin
  
  i_slc_data_r <= structify(i_slc_data_v);
  o_prepro_data_v <= vectorify(o_prepro_data_r);

  o_prepro2ctrl_v <= vectorify(o_prepro2ctrl_r);

  o_prepro_data_r.data_valid                <= i_slc_data_r.data_valid;
  o_prepro_data_r.common.header.h_reserved  <= (others => '0');
  o_prepro_data_r.common.header.tcoverflow  <= i_slc_data_r.common.header.tcoverflow ; 
  o_prepro_data_r.common.header.nmtc_sl     <= i_slc_data_r.common.header.nmtc_sl ; 
  o_prepro_data_r.common.header.nmtc_mdt    <= i_slc_data_r.common.header.nmtc_mdt ; 
  o_prepro_data_r.common.header.nslc        <= i_slc_data_r.common.header.nslc ; 
  o_prepro_data_r.common.header.bcid        <= i_slc_data_r.common.header.bcid ;
  o_prepro_data_r.common.slcid              <= i_slc_data_r.common.slcid ; 
  o_prepro_data_r.common.tcsent             <= i_slc_data_r.common.tcsent ; 
  o_prepro_data_r.common.poseta             <= i_slc_data_r.common.poseta ; 
  o_prepro_data_r.common.posphi             <= i_slc_data_r.common.posphi ; 
  o_prepro_data_r.common.sl_pt              <= i_slc_data_r.common.sl_pt ; 
  o_prepro_data_r.common.sl_ptthresh        <= i_slc_data_r.common.sl_ptthresh ; 
  o_prepro_data_r.common.sl_charge          <= i_slc_data_r.common.sl_charge ; 
  o_prepro_data_r.common.cointype           <= i_slc_data_r.common.cointype ; 
  o_prepro_data_r.common.trailer.t_reserved <= (others => '0');
  o_prepro_data_r.common.trailer.crc        <= i_slc_data_r.common.trailer.crc ;
  o_prepro_data_r.common.trailer.fiberid    <= i_slc_data_r.common.trailer.fiberid ;
  o_prepro_data_r.common.trailer.slid       <= i_slc_data_r.common.trailer.slid ;
  o_prepro_data_r.common.trailer.comma      <= i_slc_data_r.common.trailer.comma ;

  B_GEN : if c_ST_nBARREL_ENDCAP = '0' generate

    i_barrel <= structify(i_slc_data_r.specific);
    o_prepro_data_r.specific <= vectorify(o_barrel);

    -- o_barrel.b_reserved <= (others => '0');
    o_barrel.rpc3_posz  <= i_barrel.rpc3_posz;
    o_barrel.rpc2_posz  <= i_barrel.rpc2_posz;
    o_barrel.rpc1_posz  <= i_barrel.rpc1_posz;
    o_barrel.rpc0_posz  <= i_barrel.rpc0_posz;

    o_prepro2ctrl_r.data_valid <= i_slc_data_r.data_valid;

  end generate;

  E_GEN : if c_ST_nBARREL_ENDCAP = '1' generate

    -- i_barrel <= structify(i_slc_data_r.specific);
    -- o_prepro_data_r.specific <= vectorify(o_barrel);

    -- o_barrel.b_reserved <= (others => '0');


    -- o_prepro2ctrl_r.data_valid <= i_slc_data_r.data_valid;

  end generate;

  -- UCM_PRE_PROC : process(rst,clk) begin
  --   if rising_edge(clk) then
  --     if(rst= '1') then
  --       o_prepro_data_r <= nullify(o_prepro_data_r);
  --     else
  --       if i_slc_data_r.data_valid = '1' then
  --         -- o_prepro_data_r.muid        <= i_slc_data_r.muid;
  --         -- o_prepro_data_r.chambers    <= i_slc_data_r.chambers;
  --         -- o_prepro_data_r.common      <= i_slc_data_r.common;
  --         -- o_prepro_data_r.specific    <= i_slc_data_r.slc_specific;
  --         o_prepro_data_r.data_valid  <= i_slc_data_r.data_valid;
  --       else
  --         o_prepro_data_r <= nullify(o_prepro_data_r);
  --       end if;
  --     end if;
  --   end if;
  -- end process;

  -- fala el calculo de phimod 
  -- falta el calculo de sl destino

end beh;