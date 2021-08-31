--------------------------------------------------------------------------------
-- Prototype of functions to convert values to/from text for testbenches
--------------------------------------------------------------------------------
-- original   : Eric Hazen
--      v0.1  : Guillermo   :   added support for TAR

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library project_lib;
use project_lib.ult_tb_sim_pkg.all;

package ult_textio_rd_tdc_pkg is

  procedure READ(L:inout LINE; VALUE : out input_mdt_rt);

end ult_textio_rd_tdc_pkg;


package body ult_textio_rd_tdc_pkg is

  procedure READ(L:inout LINE; VALUE : out input_mdt_rt) is
    variable mdt_ToA  : integer;
    -- variable tdc_time     : integer;
    -- variable space        : string(8 downto 1);
    -- variable c_Station    : string(1 downto 1);
    variable i_station        : integer;
    variable Chamber_id       : integer;
    variable Chamber_ieta     : integer;
    variable mdt_time_coarse  : integer;
    variable mdt_time_fine    : integer;
    variable tube_global      : integer;
    variable tube_local       : integer;
    variable tube_layer       : integer;
    variable tube_z           : integer;
    variable tube_rho         : integer;
    variable drift_time       : real;
    variable event            : integer;
    variable muonFixedId      : integer;
    variable csm              : integer;
    variable mezz             : integer;
    variable channel          : integer;
    variable t0               : real;
    variable TOF              : real;

    variable dummy_text  : string(1 to 100);
    variable ok : boolean;

    -- variable
  begin
    -- Event
    -- READ(L, event);
    -- ToA
    READ(L, mdt_ToA);
    -- coarse_time
    READ(L, mdt_time_coarse);
    -- fine_time
    READ(L, mdt_time_fine);
    -- Local_Tube_Number
    READ(L, tube_local);
    -- Tube_Number 
    READ(L, tube_global);
    -- Tube_Layer < layer [0,7]
    READ(L, tube_layer);
    -- ChamberId < Chamber ID using L0MDT numbering scheme
    READ(L, Chamber_id);
    -- Chamber_iEta < iEta index of the chamber [0,7]. Based on 1st layer of tube.
    READ(L, Chamber_ieta);
    -- Station_Type < station ID Inner=0, middle, outer, extra
    READ(L, i_station);
    -- tube_z
    READ(L, tube_z);
    -- tube_rho
    READ(L, tube_rho);
    -- drift_time
    READ(L, drift_time);
    -- event
    READ(L, event);
    -- muonFixedId
    READ(L, muonFixedId);
    -- csm  
    READ(L, csm);
    -- mezz  
    READ(L, mezz);
    -- channel  
    READ(L, channel);
    -- t0     
    READ(L, t0);
    -- TOF   
    READ(L, TOF);
    
    READ(L, dummy_text,ok);
    -- 
    -- 
    -- READ(L, tube_radius);
    -- 

    VALUE := (
      ToA => to_unsigned(mdt_ToA,64),
      Station => to_unsigned(i_Station,8),
      Chamber => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
      tar => (  
        tube => to_unsigned(tube_global,MDT_TUBE_LEN),
        layer => to_unsigned(tube_layer,MDT_LAYER_LEN),
        chamber_ieta => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
        time => to_unsigned((mdt_time_coarse * 32) + mdt_time_fine ,TDC_COARSETIME_LEN + 5), -- & to_unsigned(mdt_time_fine,TDC_COARSETIME_LEN),
        data_valid => '1'
      ),
      tdc => (
        data_valid => '1',
        tdc => (
          chanid => to_unsigned(channel,TDC_CHANID_LEN),
          edgemode => (others => '0'),
          coarsetime => to_unsigned(mdt_time_coarse,TDC_COARSETIME_LEN),
          finetime => to_unsigned(mdt_time_fine,TDC_FINETIME_LEN),
          pulsewidth => ( others => '0')
        ),
        csmid => to_unsigned( chamber_ieta, TDCPOLMUX2TAR_CSMID_LEN),
        tdcid => to_unsigned( mezz, TDCPOLMUX2TAR_TDCID_LEN)
      )
    );

    report "##### HIT : " & integer'image(mdt_ToA) &
    " - " & integer'image(mdt_time_coarse) &
    " - " & integer'image(mdt_time_fine) &
    " - " & integer'image(tube_global) &
    " - " & integer'image(tube_local) &
    " - " & integer'image(tube_layer) &
    " - " & integer'image(Chamber_id) &
    " - " & integer'image(Chamber_ieta) &
    " - " & integer'image(i_station);
    -- " - " & c_station &
    -- " - " & integer'image(tube_z) &
    -- " - " & integer'image(tube_rho) &
    -- " - " & integer'image(tube_radius);

  end procedure;


end ult_textio_rd_tdc_pkg;