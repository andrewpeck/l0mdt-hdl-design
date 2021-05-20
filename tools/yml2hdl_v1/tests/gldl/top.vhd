library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.custom_types_gldl_pkg.all;

entity top is
  port(
    slc_muid_vi       : in  slc_muid_vt;
    slc_muid_vo       : out slc_muid_vt;
    slc_common_vi     : in  slc_common_vt;
    slc_common_vo     : out slc_common_vt;
    slc_barrel_vi     : in  slc_barrel_vt;
    slc_barrel_vo     : out slc_barrel_vt;
    slc_endcap_vi     : in  slc_endcap_vt;
    slc_endcap_vo     : out slc_endcap_vt;
    ucm_prepro_vi     : in  ucm_prepro_vt;
    ucm_prepro_vo     : out ucm_prepro_vt;
    ucm_ctrl_vi       : in  ucm_ctrl_vt;
    ucm_ctrl_vo       : out ucm_ctrl_vt;
    ucm_csf_barrel_vi : in  ucm_csf_barrel_vt;
    ucm_csf_barrel_vo : out ucm_csf_barrel_vt
  );
end top;

architecture RTL of top is

  signal slc_muid_rs       : slc_muid_rt      ;
  signal slc_common_rs     : slc_common_rt    ;
  signal slc_barrel_rs     : slc_barrel_rt    ;
  signal slc_endcap_rs     : slc_endcap_rt    ;
  signal ucm_prepro_rs     : ucm_prepro_rt    ;
  signal ucm_ctrl_rs       : ucm_ctrl_rt      ;
  signal ucm_csf_barrel_rs : ucm_csf_barrel_rt;

  constant rst : std_logic := '0';
  
begin

  if_rst_1: if (rst = '1') generate
    slc_muid_rs       <= nullify(slc_muid_rs);
    slc_common_rs     <= nullify(slc_common_rs);
    slc_barrel_rs     <= nullify(slc_barrel_rs);
    slc_endcap_rs     <= nullify(slc_endcap_rs);
    ucm_prepro_rs     <= nullify(ucm_prepro_rs);
    ucm_ctrl_rs       <= nullify(ucm_ctrl_rs);
    ucm_csf_barrel_rs <= nullify(ucm_csf_barrel_rs);
  end generate if_rst_1;

  if_rst_0: if (rst = '0') generate
    slc_muid_rs       <= structify(slc_muid_vi);
    slc_common_rs     <= structify(slc_common_vi);
    slc_barrel_rs     <= structify(slc_barrel_vi);
    slc_endcap_rs     <= structify(slc_endcap_vi);
    ucm_prepro_rs     <= structify(ucm_prepro_vi);
    ucm_ctrl_rs       <= structify(ucm_ctrl_vi);
    ucm_csf_barrel_rs <= structify(ucm_csf_barrel_vi);

    slc_muid_vo       <= vectorify(slc_muid_rs);
    slc_common_vo     <= vectorify(slc_common_rs);
    slc_barrel_vo     <= vectorify(slc_barrel_rs);
    slc_endcap_vo     <= vectorify(slc_endcap_rs);
    ucm_prepro_vo     <= vectorify(ucm_prepro_rs);
    ucm_ctrl_vo       <= vectorify(ucm_ctrl_rs);
    ucm_csf_barrel_vo <= vectorify(ucm_csf_barrel_rs);
  end generate if_rst_0;

end RTL; -- top
