--------------------------------------------------------------------------------
-- Prototype of functions to convert values to/from text for testbenches
--------------------------------------------------------------------------------
-- original   : Eric Hazen
--      v0.1  : Guillermo   :   added support for TAR

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.std_logic_textio.all;
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


-- library project_lib;
-- use project_lib.ult_tb_sim_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
library project_lib;
use project_lib.ult_tb_sim_pkg.all;
-- use project_lib.ult_textio_rd_slc_pkg.all;
use project_lib.vhdl_tb_utils_pkg.all;
use project_lib.vhdl_textio_csv_pkg.all;

package ult_textio_rd_slc_pkg is

  -- procedure READ(L:inout LINE; VALUE : out input_mdt_rt);

  procedure EXTRACT(VALUE : out input_slc_b_rt);
  -- procedure EXTRACT(csv_file: csv_file_reader_type; VALUE : out input_slc_b_rt);

end ult_textio_rd_slc_pkg;


package body ult_textio_rd_slc_pkg is
  -----------------------------------------------
  -- read SLC 
  -----------------------------------------------  
  -- procedure READ(L:inout LINE; VALUE : out input_slc_b_rt) is
  procedure EXTRACT(VALUE : out input_slc_b_rt) is
    -- variable line_str     : string(100 - 1 downto 0);
    -- variable csv_file: csv_file_reader_type;

    variable BCID         : integer; 
    variable ToA          : integer; 
    variable nTC          : integer; 
    variable TC_sent      : integer; 
    variable TC_id        : integer; 
    variable Eta          : real; 
    variable Phi          : real; 
    variable pT_thr       : integer; 
    variable Charge       : integer; 
    variable Coincidence  : integer; 
    variable z_RPC0       : integer; 
    variable z_RPC1       : integer; 
    variable z_RPC2       : integer; 
    variable z_RPC3       : integer; 

    variable header       : sl_header_rt;
    variable trailer      : sl_trailer_rt;
    variable common       : slc_common_rt;
    variable specific     : slc_barrel_rt;
    
    variable tcoverflow : std_logic;

    variable ol : line;


  begin
    -- report "------- L -----" & string(L);
    -- line_str(8 downto 0) := "kkkkkkkkk";
    -- write(ol,line_str);
    -- writeline(output,ol);
    puts("kakakakakakaka");
    -- READ( L , line_str );
    -- report "------- L -----" & line_str;

    -- READ( L , BCID );
    -- READ( L , ToA );
    -- READ( L , nTC );
    -- READ( L , TC_sent );
    -- READ( L , TC_id );
    -- READ( L , Eta );
    -- READ( L , Phi );
    -- READ( L , pT_thr );
    -- READ( L , Charge );
    -- READ( L , Coincidence );
    -- READ( L , z_RPC0 );
    -- READ( L , z_RPC1 );
    -- READ( L , z_RPC2 );
    -- READ( L , z_RPC3 );

    -- if nTC > 3 then 
    --   tcoverflow := '1';
    -- else
    --   tcoverflow := '0';
    -- end if;

    -- header := (
    --   h_reserved => (others => '1'),
    --   tcoverflow => tcoverflow,
    --   nmtc_sl    => to_unsigned(nTC, SL_HEADER_NSLC_LEN),
    --   nmtc_mdt   => (others => '1'),
    --   nslc       => (others => '1'),
    --   bcid       => to_unsigned(BCID, SL_HEADER_BCID_LEN)
    -- );

    -- trailer :=(
    --   t_reserved => (others => '1'),
    --   crc        => (others => '1'),
    --   fiberid    => (others => '1'),
    --   slid       => (others => '1'),
    --   comma      => (others => '1')
    -- );

    -- common := (
    --   header      => header,
    --   slcid       => to_unsigned(TC_id, SL_HEADER_NSLC_LEN),
    --   tcsent      => std_logic(to_unsigned(TC_sent,1)(0)),
    --   poseta      => to_signed(integer(Eta * SLC_COMMON_POSETA_MULT), SLC_COMMON_POSETA_LEN) ,
    --   posphi      => to_unsigned(integer((Phi * SLC_COMMON_POSPHI_MULT/1000.0)), SLC_COMMON_POSPHI_LEN) , 
    --   sl_pt       => ( others => '0'),
    --   sl_ptthresh => to_unsigned(pT_thr, SLC_COMMON_SL_PTTHRESH_LEN) , 
    --   sl_charge   => std_logic(to_unsigned(Charge,1)(0)), 
    --   cointype    => std_logic_vector(to_unsigned(Coincidence,SLC_COMMON_COINTYPE_LEN)), 
    --   trailer     => trailer
    -- );

    -- specific :=(
    --   -- b_reserved  => (others => '0'),
    --   rpc0_posz   => to_signed(integer(real(z_RPC0) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC0_POSZ_LEN) ,
    --   rpc1_posz   => to_signed(integer(real(z_RPC1) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC1_POSZ_LEN) ,
    --   rpc2_posz   => to_signed(integer(real(z_RPC2) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC2_POSZ_LEN) ,
    --   rpc3_posz   => to_signed(integer(real(z_RPC3) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC3_POSZ_LEN)
    -- );

    -- VALUE := (
    --   ToA => to_unsigned(ToA , 64) , 
    --   slc => (
    --     data_Valid  => '1',
    --     common      => common,
    --     specific    => std_logic_vector(vectorify(specific))
    --   )
    -- );

    -- report "##### SLC : " & integer'image(BCID) &
    -- " - " & integer'image(ToA) &
    -- " - " & integer'image(nTC) &
    -- " - " & integer'image(TC_sent) &
    -- " - " & integer'image(TC_id) &
    -- " - " & real'image(Eta) &
    -- " - " & real'image(Phi) &
    -- " - " & integer'image(pT_thr) &
    -- " - " & integer'image(Charge) &
    -- " - " & integer'image(Coincidence) &
    -- " - " & integer'image(z_RPC0) &
    -- " - " & integer'image(z_RPC1) &
    -- " - " & integer'image(z_RPC2) &
    -- " - " & integer'image(z_RPC3);
  end procedure;
 

end ult_textio_rd_slc_pkg;