--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Main pipe line cross switch to track fitter
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


library mpl_lib;
use mpl_lib.mpl_pkg.all;


entity mpl_csw is

  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_ucm_av            : in mpl2csw_ptcalc_avt(c_NUM_THREADS -1 downto 0);
    o_tf_av             : out pl2ptcalc_avt(c_NUM_THREADS -1 downto 0)
    -- o_mtc_av          : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity mpl_csw;

architecture beh of mpl_csw is

  signal slc_pl     : mpl2csw_ptcalc_art(c_NUM_THREADS -1 downto 0);
  signal csw2tf_ar  : pl2ptcalc_art(c_NUM_THREADS -1 downto 0);

begin

  V2R: for sl_i in c_NUM_THREADS - 1 downto 0 generate
    slc_pl(sl_i) <= convert(i_ucm_av(sl_i),slc_pl(sl_i));
    o_tf_av(sl_i) <= convert(csw2tf_ar(sl_i),o_tf_av(sl_i));
  end generate V2R;

  MP2TF_CSW: process(clk)
    variable sli_i      : integer := 0;
    variable slo_found  : std_logic := '0';
  begin
    if rising_edge(clk) then
      if rst = '1' then
        for slo_i in c_NUM_THREADS -1 downto 0 loop
          csw2tf_ar(slo_i) <= zero(csw2tf_ar(slo_i));
          -- csw2tf_ar(slo_i).data_valid <= '0';
        end loop;
      else
        if ena = '1' then
          for slo_i in c_NUM_THREADS -1 downto 0 loop
            slo_found := '0';
            for sli_i in c_NUM_THREADS -1 downto 0 loop
              if ((slc_pl(sli_i).busy = '1') and (to_integer(unsigned(slc_pl(sli_i).process_ch)) = slo_i)) then
                csw2tf_ar(slo_i).muid <= slc_pl(sli_i).muid;
                csw2tf_ar(slo_i).phimod <= slc_pl(sli_i).phimod;
                csw2tf_ar(slo_i).sl_charge <= slc_pl(sli_i).sl_charge;
                csw2tf_ar(slo_i).data_valid <= slc_pl(sli_i).data_valid;
                csw2tf_ar(slo_i).nswseg_poseta <= slc_pl(sli_i).nswseg_poseta;
                csw2tf_ar(slo_i).nswseg_posphi <= slc_pl(sli_i).nswseg_posphi;
                csw2tf_ar(slo_i).nswseg_angdtheta <= slc_pl(sli_i).nswseg_angdtheta;
                -- o_tf_av(slo_i) <= i_ucm_av(sli_i);
                -- o_tf_av(slo_i) <= i_ucm_av(sli_i);

                slo_found := '1';
              end if;
            end loop;
            if slo_found = '0' then
              -- csw2tf_ar(slo_i) <= zero(csw2tf_ar(slo_i));
              csw2tf_ar(slo_i).data_valid <= '0';
            end if;
          end loop;
        end if;

      end if;
    end if;
  end process MP2TF_CSW;

  --

end architecture beh;
