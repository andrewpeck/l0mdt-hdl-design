--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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

library vamc_lib;

entity ucm_prepro is
  generic(
    g_DELAY_CYCLES  : integer := 2
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_v          : in slc_rx_vt;
    -- ctrl out
    o_prepro2ctrl_v       : out ucm_prepro2ctrl_vt;
    -- data out
    o_prepro_data_v       : out slc_rx_vt;
    o_prepro_data_dv      : out std_logic
  );
end entity ucm_prepro;

architecture beh of ucm_prepro is
  
  signal i_slc_data_r     : slc_rx_rt;
  signal prepro_data_r    : slc_rx_rt;
  signal i_barrel         : slc_barrel_rt;
  signal o_barrel         : slc_barrel_rt;

  signal prepro_data_v    : slc_rx_vt;
    

  signal o_prepro2ctrl_r  : ucm_prepro2ctrl_rt;

begin
  
  i_slc_data_r <= convert(i_slc_data_v,i_slc_data_r);

  o_prepro2ctrl_v <= convert(o_prepro2ctrl_r,o_prepro2ctrl_v);

  prepro_data_r.data_valid                <= i_slc_data_r.data_valid;
  prepro_data_r.common.header.h_reserved  <= (others => '0');
  prepro_data_r.common.header.tcoverflow  <= i_slc_data_r.common.header.tcoverflow ; 
  prepro_data_r.common.header.nmtc_sl     <= i_slc_data_r.common.header.nmtc_sl ; 
  prepro_data_r.common.header.nmtc_mdt    <= i_slc_data_r.common.header.nmtc_mdt ; 
  prepro_data_r.common.header.nslc        <= i_slc_data_r.common.header.nslc ; 
  prepro_data_r.common.header.bcid        <= i_slc_data_r.common.header.bcid ;
  prepro_data_r.common.slcid              <= i_slc_data_r.common.slcid ; 
  prepro_data_r.common.tcsent             <= i_slc_data_r.common.tcsent ; 
  prepro_data_r.common.poseta             <= i_slc_data_r.common.poseta ; 
  prepro_data_r.common.posphi             <= i_slc_data_r.common.posphi ; 
  prepro_data_r.common.sl_pt              <= i_slc_data_r.common.sl_pt ; 
  prepro_data_r.common.sl_ptthresh        <= i_slc_data_r.common.sl_ptthresh ; 
  prepro_data_r.common.sl_charge          <= i_slc_data_r.common.sl_charge ; 
  prepro_data_r.common.cointype           <= i_slc_data_r.common.cointype ; 
  prepro_data_r.common.trailer.t_reserved <= (others => '0');
  prepro_data_r.common.trailer.crc        <= i_slc_data_r.common.trailer.crc ;
  prepro_data_r.common.trailer.fiberid    <= i_slc_data_r.common.trailer.fiberid ;
  prepro_data_r.common.trailer.slid       <= i_slc_data_r.common.trailer.slid ;
  prepro_data_r.common.trailer.comma      <= i_slc_data_r.common.trailer.comma ;

  B_GEN : if c_ST_nBARREL_ENDCAP = '0' generate

    i_barrel <= convert(i_slc_data_r.specific,i_barrel);

    -- o_barrel.b_reserved <= (others => '0');
    o_barrel.rpc3_posz  <= i_barrel.rpc3_posz;
    o_barrel.rpc2_posz  <= i_barrel.rpc2_posz;
    o_barrel.rpc1_posz  <= i_barrel.rpc1_posz;
    o_barrel.rpc0_posz  <= i_barrel.rpc0_posz;

    o_prepro2ctrl_r.data_valid <= i_slc_data_r.data_valid;

  end generate;
  
  prepro_data_r.specific <= convert(o_barrel,prepro_data_r.specific);
  prepro_data_v <= convert(prepro_data_r,prepro_data_v);


  E_GEN : if c_ST_nBARREL_ENDCAP = '1' generate

    -- i_barrel <= convert(i_slc_data_r.specific);
    -- prepro_data_r.specific <= convert(o_barrel);

    -- o_barrel.b_reserved <= (others => '0');


    -- o_prepro2ctrl_r.data_valid <= i_slc_data_r.data_valid;

  end generate;

  SLC_IN_PL : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => g_DELAY_CYCLES,
      g_PIPELINE_WIDTH    => prepro_data_v'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => prepro_data_v,
      i_dv        => i_slc_data_r.data_valid,
      o_data      => o_prepro_data_v,
      o_dv        => o_prepro_data_dv
    );

  -- UCM_PRE_PROC : process(rst,clk) begin
  --   if rising_edge(clk) then
  --     if(rst= '1') then
  --       prepro_data_r <= zero(prepro_data_r);
  --     else
  --       if i_slc_data_r.data_valid = '1' then
  --         -- prepro_data_r.muid        <= i_slc_data_r.muid;
  --         -- prepro_data_r.chambers    <= i_slc_data_r.chambers;
  --         -- prepro_data_r.common      <= i_slc_data_r.common;
  --         -- prepro_data_r.specific    <= i_slc_data_r.slc_specific;
  --         prepro_data_r.data_valid  <= i_slc_data_r.data_valid;
  --       else
  --         prepro_data_r <= zero(prepro_data_r);
  --       end if;
  --     end if;
  --   end if;
  -- end process;

  -- fala el calculo de phimod 
  -- falta el calculo de sl destino

end beh;