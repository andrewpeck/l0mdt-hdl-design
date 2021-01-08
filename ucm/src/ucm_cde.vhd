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
use shared_lib.detector_param_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;
use ucm_lib.ucm_function_pkg.all;

entity ucm_cde is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_v        : in slc_rx_rvt;
    -- pam out
    o_cde_data_v        : out ucm_cde_rvt
  );
end entity ucm_cde;

architecture beh of ucm_cde is
  
  signal i_slc_data_r     : slc_rx_rt;
  signal o_cde_data_r  : ucm_cde_rt;

  signal barrel_r : slc_barrel_rt;

  -- type chamb_z_org_at is array ( 3 downto 0) of b_chamber_z_origin_unsigned_au;
  -- signal chamber_z_org_a : chamb_z_org_at := (
  --   get_b_chamber_origin_z(c_SECTOR_ID,3),
  --   get_b_chamber_origin_z(c_SECTOR_ID,2),
  --   get_b_chamber_origin_z(c_SECTOR_ID,1),
  --   get_b_chamber_origin_z(c_SECTOR_ID,0)
  -- );

  type rpc_z_at is array (3 downto 0) of unsigned (SLC_Z_RPC_LEN -1 downto 0);
  signal rpc_z_a : rpc_z_at;

begin
  
  i_slc_data_r <= structify(i_slc_data_v);
  o_cde_data_v <= vectorify(o_cde_data_r);

  B_GEN : if c_ST_nBARREL_ENDCAP = '0' generate

    barrel_r <= structify(i_slc_data_r.specific);

    rpc_z_a <= (
      unsigned(barrel_r.rpc3_posz),
      unsigned(barrel_r.rpc2_posz),
      unsigned(barrel_r.rpc1_posz),
      unsigned(barrel_r.rpc0_posz)
    );

    UCM_PRE_PROC : process(rst,clk) 
      variable ch_i : integer;
      variable rpc_i : integer;
    begin
      if rising_edge(clk) then
        if(rst= '1') then
          o_cde_data_r <= nullify(o_cde_data_r);
        else
          if i_slc_data_r.data_valid = '1' then
            o_cde_data_r.muid.slcid   <= i_slc_data_r.common.slcid;
            o_cde_data_r.muid.slid    <= i_slc_data_r.common.trailer.slid;
            o_cde_data_r.muid.bcid    <= i_slc_data_r.common.header.bcid;
            o_cde_data_r.cointype     <= i_slc_data_r.common.cointype;
            o_cde_data_r.specific     <= i_slc_data_r.specific;
            o_cde_data_r.data_valid   <= i_slc_data_r.data_valid;
            o_cde_data_r.posphi       <= i_slc_data_r.common.posphi;


            -- INN
            ch_i := 0;
            rpc_i := 0;
            o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,0,to_integer(rpc_z_a(0)),SLC_Z_RPC_MULT);

            -- MID 1
            ch_i := 1;
            rpc_i := 1;
            o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,1,to_integer(rpc_z_a(1)),SLC_Z_RPC_MULT);

            -- MID 2
            ch_i := 1;
            rpc_i := 2;
            o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,1,to_integer(rpc_z_a(2)),SLC_Z_RPC_MULT);

            -- OUT
            ch_i := 2;
            rpc_i := 3;
            o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,2,to_integer(rpc_z_a(3)),SLC_Z_RPC_MULT);


          else
            o_cde_data_r <= nullify(o_cde_data_r);
          end if;
        end if;
      end if;
    end process;

  end generate;


  -- falta el calculo de sl destino?

end beh;