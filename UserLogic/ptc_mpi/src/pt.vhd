--------------------------------------------------------------------------------
-- Title       : pt.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : pt.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Fri May 20 13:35:00 2022
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  pT calculator top module
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file pt.vhd
--! @brief pt
--! @details
--! pT calculator top module
--! @author Davide Cieri
library ieee;
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

library ptc_lib;
use ptc_lib.pt_pkg.all;
use ptc_lib.pt_params_pkg.all;

entity pt is
  generic (
    FLAVOUR : integer := 0; -- Barrel
    SECTOR : integer := 3;
    SIDE : integer := 0 -- 0 positive eta, 1 negative eta
  );
  port (
    clk : in std_logic;
    i_segment_I : in sf2ptcalc_vt;
    i_segment_M : in sf2ptcalc_vt;
    i_segment_O : in sf2ptcalc_vt;
    i_SLC : in pl2ptcalc_vt;
    i_rst : in std_logic;
    o_mtc : out ptcalc2mtc_vt
  );
end pt;

architecture Behavioral of pt is
  -- Online segments in global coordinates
  signal segment_I, segment_M, segment_O : sf2ptcalc_rt;
  signal segment_I_s, segment_M_s, segment_O_s : sf2ptcalc_rt;
  signal segment_eta, segment_I_v, segment_M_v, segment_O_v : sf2ptcalc_vt;
  signal segment_EI, segment_EM, segment_EO : sf2ptcalc_vt;

  -- SLC candidate
  signal slc, slc_s : pl2ptcalc_rt;
  -- Chamber combo id
  signal comboid : unsigned(VEC_MDTID_CHAMBER_IETA_LEN * 3 - 1 downto 0) := (others => '0');

  --signal ram_index : integer := 0;
  -- Sagitta/Dbeta calculator signals
  signal dv_s, dv_combo, dv_combo_s : std_logic := '0';
  signal inv_s, inv_s_s : unsigned(INV_S_LEN - 1 downto 0)
  := (others => '0');

  -- Data Valid signals
  signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11
  : std_logic := '0';
  signal dv_a : std_logic := '0';
  -- Phi/Eta coordinate
  signal nsegments : unsigned(MTC_NSEG_LEN - 1 downto 0) := (others => '0');
  signal dv_eta : std_logic := '0';
  signal phi : signed(UCM_PT_PHIMOD_LEN - 1 downto 0) := (others => '0');
  signal eta : unsigned(PTCALC2MTC_MDT_ETA_LEN - 1 downto 0) := (others => '0');
  signal im : std_logic := '0'; -- 0: Inner, 1: Middle
  signal dv_dbeta_01, dv_dbeta_02, dv_dbeta_12 : std_logic := '0';
  signal dbeta_01, dbeta_02, dbeta_12 : unsigned(DBETA_LEN - 1 downto 0)
  := (others => '0');

  -- Signal for pT calculation
  -- Sagitta/Dbeta-dependent part
  constant PT_S_LEN : integer := INV_S_LEN + A1_LEN + SF2PTCALC_SEGPOS_MULT_LEN - SHIFT_NUM_SAGITTA - TF_AX_1_MULTI_LEN; -- 12

  signal a0, a0_s : std_logic_vector(A0_LEN - 1 downto 0) := (others => '0');
  signal a1 : std_logic_vector(A1_LEN - 1 downto 0) := (others => '0');
  signal a1_invs : unsigned(PT_S_LEN - 1 downto 0)
  := (others => '0');
  signal pt_s : unsigned(PT_S_LEN - 1 downto 0) := (others => '0');
  signal pt_s0 : signed(PT_S_LEN + 1 - 1 downto 0);

  -- Phi-dependent part
  constant P0_LEN : integer := PT_S_LEN + 1 + P0_1_LEN - TF_PX_1_MULTI_LEN; -- 12
  constant P1_LEN : integer := PT_S_LEN + 1 + P1_1_LEN - TF_PX_1_MULTI_LEN; -- 13
  constant P2_LEN : integer := PT_S_LEN + 1 + P2_1_LEN - TF_PX_1_MULTI_LEN; -- 17

  constant P1_PHI_LEN : integer := P1_LEN + UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN; -- 12 
  constant P2_PHI_LEN : integer := P2_LEN + UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN; -- 13
  constant P2_PHI2_LEN : integer := P2_PHI_LEN + UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN; -- 17
  constant PT_SP_LEN : integer := P2_PHI2_LEN;

  signal p0_0 : std_logic_vector(P0_0_LEN - 1 downto 0);
  signal p1_0 : std_logic_vector(P1_0_LEN - 1 downto 0);
  signal p2_0 : std_logic_vector(P2_0_LEN - 1 downto 0);
  signal p0_1 : std_logic_vector(P0_1_LEN - 1 downto 0);
  signal p1_1 : std_logic_vector(P1_1_LEN - 1 downto 0);
  signal p2_1 : std_logic_vector(P2_1_LEN - 1 downto 0);

  signal p0 : signed(P0_LEN - 1 downto 0);
  signal p0_s : signed(P0_LEN - 1 downto 0);
  signal p0_s2 : signed(P0_LEN - 1 downto 0);

  signal p1 : signed(P1_LEN - 1 downto 0);
  signal p2 : signed(P2_LEN - 1 downto 0);

  signal p1_phi : signed(P1_PHI_LEN - 1 downto 0);
  signal p2_phi : signed(P2_PHI_LEN - 1 downto 0);
  signal p2_phi2 : signed(P2_PHI2_LEN - 1 downto 0);

  signal pt_s1 : signed(PT_S_LEN + 1 - 1 downto 0);
  signal pt_s2 : signed(P2_PHI2_LEN - 1 downto 0);
  signal pt_sp : signed(PT_SP_LEN - 1 downto 0);

  -- Eta dependent part
  constant E0_LEN : integer := PT_SP_LEN + E0_1_LEN - TF_EX_1_MULTI_LEN; -- 21
  constant E1_LEN : integer := PT_SP_LEN + E1_1_LEN - TF_EX_1_MULTI_LEN; -- 21
  constant E1_ETA_LEN : integer := E1_LEN + PTCALC2MTC_MDT_ETA_LEN + 1 - ETA_MULTI_LEN; -- 25

  signal e0_0 : std_logic_vector(E0_0_LEN - 1 downto 0);
  signal e1_0 : std_logic_vector(E1_0_LEN - 1 downto 0);
  signal e0_1 : std_logic_vector(E0_1_LEN - 1 downto 0);
  signal e1_1 : std_logic_vector(E1_1_LEN - 1 downto 0);

  signal e0 : signed(E0_LEN - 1 downto 0);
  signal e1 : signed(E1_LEN - 1 downto 0);

  signal e1_eta : signed(E1_ETA_LEN - 1 downto 0);
  signal pt_sp0 : signed(E0_LEN - 1 downto 0);
  signal pt_sp1 : signed(E1_ETA_LEN - 1 downto 0);
  -- Final pt signals
  signal pt_spe : signed(E1_ETA_LEN - 1 downto 0);
  signal pt_valid : std_logic := '0';
  -- Mtc output parameters
  signal pt : unsigned(PTCALC2MTC_MDT_PT_LEN - 1 downto 0);
  signal dv_pt : std_logic;
  signal mtc : ptcalc2mtc_rt;
  signal quality : std_logic_vector(MTC_QUALITY_LEN - 1 downto 0);

  signal combo_index : std_logic_vector(PARAMS_DEPTH_LEN - 1 downto 0);

  ----------------------------------------------------------------------------
  -- COMPONENTS --------------------------------------------------------------
  component rom
    generic (
      MXADRB : integer;
      MXDATB : integer;
      ROM_FILE : string;
      ROM_STYLE : string
    );
    port (
      clka : in std_logic;
      ena : in std_logic;
      addra : in std_logic_vector;
      douta : out std_logic_vector
    );
  end component;
begin

  EtaCalculator : entity ptc_lib.eta_calculator
    port map(
      clk => clk,
      i_seg => segment_eta,
      i_layer => im,
      o_eta => eta,
      o_dv_eta => dv_eta
    );

  SagittaCalculator : entity ptc_lib.sagitta_calculator
    port map(
      clk => clk,
      i_seg0 => segment_I_v,
      i_seg1 => segment_M_v,
      i_seg2 => segment_O_v,
      o_inv_s => inv_s,
      o_dv_s => dv_s
    );

  getA0 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => A0_LEN,
    ROM_FILE => "a0.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => a0
  );

  getA1 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => A1_LEN,
    ROM_FILE => "a1.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => a1
  );

  getP0_0 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => P0_0_LEN,
    ROM_FILE => "p0_0.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => p0_0
  );

  getP1_0 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => P1_0_LEN,
    ROM_FILE => "p1_0.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => p1_0
  );

  getP2_0 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => P2_0_LEN,
    ROM_FILE => "p2_0.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => p2_0
  );
  getP0_1 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => P0_1_LEN,
    ROM_FILE => "p0_1.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => p0_1
  );

  getP1_1 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => P1_1_LEN,
    ROM_FILE => "p1_1.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => p1_1
  );

  getP2_1 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => P2_1_LEN,
    ROM_FILE => "p2_1.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => p2_1
  );

  getE0_0 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => E0_0_LEN,
    ROM_FILE => "e0_0.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => e0_0
  );

  getE1_0 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => E1_0_LEN,
    ROM_FILE => "e1_0.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => e1_0
  );

  getE0_1 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => E0_1_LEN,
    ROM_FILE => "e0_1.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => e0_1
  );

  getE1_1 : rom
  generic map(
    MXADRB => PARAMS_DEPTH_LEN,
    MXDATB => E1_1_LEN,
    ROM_FILE => "e1_1.mem",
    ROM_STYLE => "distributed"
  )
  port map(
    clka => clk,
    ena => dv_combo,
    addra => combo_index,
    douta => e1_1
  );

  segment_I <= convert(i_segment_I, segment_I);
  segment_M <= convert(i_segment_M, segment_M);
  segment_O <= convert(i_segment_O, segment_O);

  combo_index <= comboid_to_index_ram(comboid);

  slc <= convert(i_SLC, slc);
  o_mtc <= convert(mtc, o_mtc);

  pt_top_proc : process (clk)
  begin
    if rising_edge(clk) then
      segment_I_v <= i_segment_I;
      segment_M_v <= i_segment_M;
      segment_O_v <= i_segment_O;

      if segment_I.data_valid = '1' or segment_M.data_valid = '1' or segment_O.data_valid = '1' then
        dv_combo <= '1';
        if segment_I.data_valid = '1' then
          segment_eta <= i_segment_I;
          im <= '0';
        else
          segment_eta <= i_segment_M;
          im <= '1';
        end if;

        comboid <= unsigned(segment_O.mdtid.chamber_ieta) &
          unsigned(segment_M.mdtid.chamber_ieta) &
          unsigned(segment_I.mdtid.chamber_ieta);
        nsegments <= to_unsigned(stdlogic_integer(segment_I.data_valid)
          + stdlogic_integer(segment_M.data_valid)
          + stdlogic_integer(segment_O.data_valid),
          MTC_NSEG_LEN);
        quality <= segment_O.data_valid &
          segment_M.data_valid &
          segment_I.data_valid;
        segment_I_s <= segment_I;
        segment_M_s <= segment_M;
        segment_O_s <= segment_O;
      end if;
      -- save the slc
      if slc.data_valid = '1' then
        slc_s <= SLC;
      end if;

      dv_combo_s <= dv_combo;
      -- <a> parameters are now valid
      dv_a <= dv_combo_s;
      dv0 <= dv_s and dv_a;
      a1_invs <= resize(shift_right(unsigned(a1) * inv_s * integer(SF2PTCALC_SEGPOS_MULT), (TF_AX_1_MULTI_LEN + SHIFT_NUM_SAGITTA)), PT_S_LEN);
      a0_s <= a0;

      dv1 <= dv0;
      pt_s <= unsigned(a0_s) + a1_invs;

      dv2 <= dv1;
      p0 <= resize(signed(p0_0) + shift_right(signed(p0_1) * signed('0' & pt_s), TF_PX_1_MULTI_LEN), P0_LEN);
      p1 <= resize(signed(p1_0) + shift_right(signed(p1_1) * signed('0' & pt_s), TF_PX_1_MULTI_LEN), P1_LEN);
      p2 <= resize(signed(p2_0) + shift_right(signed(p2_1) * signed('0' & pt_s), TF_PX_1_MULTI_LEN), P2_LEN);
      pt_s0 <= signed('0' & pt_s);

      dv3 <= dv2;
      p1_phi <= resize(shift_right(p1 * slc_s.phimod, PHIMOD_MULTI_LEN), P1_PHI_LEN);
      p2_phi <= resize(shift_right(p2 * slc_s.phimod, PHIMOD_MULTI_LEN), P2_PHI_LEN);
      pt_s1 <= pt_s0 - p0;

      dv4 <= dv3;
      pt_s2 <= resize(pt_s1 - p1_phi, P2_PHI2_LEN);
      p2_phi2 <= resize(shift_right(p2_phi * slc_s.phimod, PHIMOD_MULTI_LEN), P2_PHI2_LEN);

      -- <b> parameters now valid
      dv5 <= dv4;
      pt_sp <= pt_s2 - p2_phi2;

      dv6 <= dv5;
      pt_sp0 <= resize(pt_sp, E0_LEN);
      e0 <= resize(signed(e0_0) + shift_right(signed(e0_1) * pt_sp, TF_EX_1_MULTI_LEN), E0_LEN);
      e1 <= resize(signed(e1_0) + shift_right(signed(e1_1) * pt_sp, TF_EX_1_MULTI_LEN), E1_LEN);

      dv7 <= dv6;
      pt_sp1 <= resize(pt_sp0 - e0, E1_ETA_LEN);
      e1_eta <= resize(shift_right(e1 * signed('0' & eta), ETA_MULTI_LEN), E1_ETA_LEN);

      dv8 <= dv7;
      pt_spe <= pt_sp1 - e1_eta;

      dv_pt <= dv8;
      pt <= resize(unsigned(pt_spe), PTCALC2MTC_MDT_PT_LEN);

      -- Assembling the MTC candidate
      mtc.data_valid <= dv_pt;
      mtc.muid <= slc_s.muid;
      if SIDE = 0 then
        mtc.mdt_eta <= signed(eta);
      else
        mtc.mdt_eta <= - signed(eta);
      end if;
      mtc.mdt_pt <= pt;
      mtc.mdt_ptthresh <= pt_threshold(pt);
      mtc.mdt_charge <= slc.sl_charge; -- temporary
      -- Still to add other cases
      mtc.mdt_nsegments <= nsegments;
      mtc.mdt_quality <= quality;
      --reset
      if mtc.data_valid = '1' or i_rst = '1' then
        comboid <= (others => '0');
        dv_combo <= '0';
        dv_combo_s <= '0';
        dv_a <= '0';
        dv0 <= '0';
        dv1 <= '0';
        dv2 <= '0';
        dv3 <= '0';
        dv4 <= '0';
        dv5 <= '0';
        dv6 <= '0';
        dv7 <= '0';
        dv8 <= '0';
        dv_pt <= '0';
        mtc <= zero(mtc);
        slc_s <= zero(slc_s);
        segment_I_s <= zero(segment_I_s);
        segment_M_s <= zero(segment_M_s);
        segment_O_s <= zero(segment_O_s);
        segment_eta <= zero(segment_eta);
        nsegments <= (others => '0');
        quality <= (others => '0');
      end if;
    end if;
  end process; -- identifier

end Behavioral;