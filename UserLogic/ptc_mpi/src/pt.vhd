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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;
USE shared_lib.config_pkg.ALL;

LIBRARY ptc_lib;
USE ptc_lib.pt_pkg.ALL;
USE ptc_lib.pt_params_pkg.ALL;

ENTITY pt IS
  GENERIC (
    FLAVOUR : INTEGER := 0; -- Barrel
    SECTOR  : INTEGER := 3;
    SIDE    : INTEGER := 0 -- 0 positive eta, 1 negative eta
  );
  PORT (
    clk         : IN STD_LOGIC;
    i_segment_I : IN sf2ptcalc_vt;
    i_segment_M : IN sf2ptcalc_vt;
    i_segment_O : IN sf2ptcalc_vt;
    i_SLC       : IN pl2ptcalc_vt;
    i_rst       : IN STD_LOGIC;
    o_mtc       : OUT ptcalc2mtc_vt
  );
END pt;

ARCHITECTURE Behavioral OF pt IS
  -- Online segments in global coordinates
  SIGNAL segment_I, segment_M, segment_O                    : sf2ptcalc_rt;
  SIGNAL segment_I_s, segment_M_s, segment_O_s              : sf2ptcalc_rt;
  SIGNAL segment_eta, segment_I_v, segment_M_v, segment_O_v : sf2ptcalc_vt;
  SIGNAL segment_EI, segment_EM, segment_EO                 : sf2ptcalc_vt;

  -- SLC candidate
  SIGNAL slc, slc_s : pl2ptcalc_rt;
  -- Chamber combo id
  SIGNAL comboid : unsigned(VEC_MDTID_CHAMBER_IETA_LEN * 3 - 1 DOWNTO 0) := (OTHERS => '0');

  --signal ram_index : integer := 0;
  -- Sagitta/Dbeta calculator signals
  SIGNAL dv_s, dv_combo, dv_combo_s : STD_LOGIC := '0';
  SIGNAL inv_s, inv_s_s             : unsigned(INV_S_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');

  -- Data Valid signals
  SIGNAL dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11
  : STD_LOGIC             := '0';
  SIGNAL dv_a : STD_LOGIC := '0';
  -- Phi/Eta coordinate
  SIGNAL nsegments                             : unsigned(MTC_NSEG_LEN - 1 DOWNTO 0)           := (OTHERS => '0');
  SIGNAL dv_eta                                : STD_LOGIC                                     := '0';
  SIGNAL phi                                   : signed(UCM_PT_PHIMOD_LEN - 1 DOWNTO 0)        := (OTHERS => '0');
  SIGNAL eta                                   : unsigned(PTCALC2MTC_MDT_ETA_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL im                                    : STD_LOGIC                                     := '0'; -- 0: Inner, 1: Middle
  SIGNAL dv_dbeta_01, dv_dbeta_02, dv_dbeta_12 : STD_LOGIC                                     := '0';
  SIGNAL dbeta_01, dbeta_02, dbeta_12          : unsigned(DBETA_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');

  -- Signal for pT calculation
  -- Sagitta/Dbeta-dependent part
  CONSTANT PT_S_LEN : INTEGER := INV_S_LEN + A1_LEN + SF2PTCALC_SEGPOS_MULT_LEN - SHIFT_NUM_SAGITTA - TF_AX_1_MULTI_LEN; -- 12

  SIGNAL a0, a0_s : STD_LOGIC_VECTOR(A0_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL a1       : STD_LOGIC_VECTOR(A1_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL a1_invs  : unsigned(PT_S_LEN - 1 DOWNTO 0)
  := (OTHERS                                                => '0');
  SIGNAL pt_s  : unsigned(PT_S_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL pt_s0 : signed(PT_S_LEN + 1 - 1 DOWNTO 0);

  -- Phi-dependent part
  CONSTANT P0_LEN : INTEGER := PT_S_LEN + 1 + P0_1_LEN - TF_PX_1_MULTI_LEN; -- 12
  CONSTANT P1_LEN : INTEGER := PT_S_LEN + 1 + P1_1_LEN - TF_PX_1_MULTI_LEN; -- 13
  CONSTANT P2_LEN : INTEGER := PT_S_LEN + 1 + P2_1_LEN - TF_PX_1_MULTI_LEN; -- 17

  CONSTANT P1_PHI_LEN  : INTEGER := P1_LEN + UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN;     -- 12 
  CONSTANT P2_PHI_LEN  : INTEGER := P2_LEN + UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN;     -- 13
  CONSTANT P2_PHI2_LEN : INTEGER := P2_PHI_LEN + UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN; -- 17
  CONSTANT PT_SP_LEN   : INTEGER := P2_PHI2_LEN;

  SIGNAL p0_0 : STD_LOGIC_VECTOR(P0_0_LEN - 1 DOWNTO 0);
  SIGNAL p1_0 : STD_LOGIC_VECTOR(P1_0_LEN - 1 DOWNTO 0);
  SIGNAL p2_0 : STD_LOGIC_VECTOR(P2_0_LEN - 1 DOWNTO 0);
  SIGNAL p0_1 : STD_LOGIC_VECTOR(P0_1_LEN - 1 DOWNTO 0);
  SIGNAL p1_1 : STD_LOGIC_VECTOR(P1_1_LEN - 1 DOWNTO 0);
  SIGNAL p2_1 : STD_LOGIC_VECTOR(P2_1_LEN - 1 DOWNTO 0);

  SIGNAL p0    : signed(P0_LEN - 1 DOWNTO 0);
  SIGNAL p0_s  : signed(P0_LEN - 1 DOWNTO 0);
  SIGNAL p0_s2 : signed(P0_LEN - 1 DOWNTO 0);

  SIGNAL p1 : signed(P1_LEN - 1 DOWNTO 0);
  SIGNAL p2 : signed(P2_LEN - 1 DOWNTO 0);

  SIGNAL p1_phi  : signed(P1_PHI_LEN - 1 DOWNTO 0);
  SIGNAL p2_phi  : signed(P2_PHI_LEN - 1 DOWNTO 0);
  SIGNAL p2_phi2 : signed(P2_PHI2_LEN - 1 DOWNTO 0);

  SIGNAL pt_s1 : signed(PT_S_LEN + 1 - 1 DOWNTO 0);
  SIGNAL pt_s2 : signed(P2_PHI2_LEN - 1 DOWNTO 0);
  SIGNAL pt_sp : signed(PT_SP_LEN - 1 DOWNTO 0);

  -- Eta dependent part
  CONSTANT E0_LEN     : INTEGER := PT_SP_LEN + E0_1_LEN - TF_EX_1_MULTI_LEN;            -- 21
  CONSTANT E1_LEN     : INTEGER := PT_SP_LEN + E1_1_LEN - TF_EX_1_MULTI_LEN;            -- 21
  CONSTANT E1_ETA_LEN : INTEGER := E1_LEN + PTCALC2MTC_MDT_ETA_LEN + 1 - ETA_MULTI_LEN; -- 25

  SIGNAL e0_0 : STD_LOGIC_VECTOR(E0_0_LEN - 1 DOWNTO 0);
  SIGNAL e1_0 : STD_LOGIC_VECTOR(E1_0_LEN - 1 DOWNTO 0);
  SIGNAL e0_1 : STD_LOGIC_VECTOR(E0_1_LEN - 1 DOWNTO 0);
  SIGNAL e1_1 : STD_LOGIC_VECTOR(E1_1_LEN - 1 DOWNTO 0);

  SIGNAL e0 : signed(E0_LEN - 1 DOWNTO 0);
  SIGNAL e1 : signed(E1_LEN - 1 DOWNTO 0);

  SIGNAL e1_eta : signed(E1_ETA_LEN - 1 DOWNTO 0);
  SIGNAL pt_sp0 : signed(E0_LEN - 1 DOWNTO 0);
  SIGNAL pt_sp1 : signed(E1_ETA_LEN - 1 DOWNTO 0);
  -- Final pt signals
  SIGNAL pt_spe   : signed(E1_ETA_LEN - 1 DOWNTO 0);
  SIGNAL pt_valid : STD_LOGIC := '0';
  -- Mtc output parameters
  SIGNAL pt      : unsigned(PTCALC2MTC_MDT_PT_LEN - 1 DOWNTO 0);
  SIGNAL dv_pt   : STD_LOGIC;
  SIGNAL mtc     : ptcalc2mtc_rt;
  SIGNAL quality : STD_LOGIC_VECTOR(MTC_QUALITY_LEN - 1 DOWNTO 0);

  SIGNAL combo_index : STD_LOGIC_VECTOR(PARAMS_DEPTH_LEN - 1 DOWNTO 0);

  ----------------------------------------------------------------------------
  -- COMPONENTS --------------------------------------------------------------
  COMPONENT rom
    GENERIC (
      MXADRB    : INTEGER;
      MXDATB    : INTEGER;
      ROM_FILE  : STRING;
      ROM_STYLE : STRING
    );
    PORT (
      clka  : IN STD_LOGIC;
      ena   : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR;
      douta : OUT STD_LOGIC_VECTOR
    );
  END COMPONENT;
BEGIN

  EtaCalculator : ENTITY ptc_lib.eta_calculator
    PORT MAP(
      clk      => clk,
      i_seg    => segment_eta,
      i_layer  => im,
      o_eta    => eta,
      o_dv_eta => dv_eta
    );

  SagittaCalculator : ENTITY ptc_lib.sagitta_calculator
    PORT MAP(
      clk     => clk,
      i_seg0  => segment_I_v,
      i_seg1  => segment_M_v,
      i_seg2  => segment_O_v,
      o_inv_s => inv_s,
      o_dv_s  => dv_s
    );

  getA0 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => A0_LEN,
    ROM_FILE  => "a0.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => a0
  );

  getA1 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => A1_LEN,
    ROM_FILE  => "a1.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => a1
  );

  getP0_0 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => P0_0_LEN,
    ROM_FILE  => "p0_0.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => p0_0
  );

  getP1_0 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => P1_0_LEN,
    ROM_FILE  => "p1_0.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => p1_0
  );

  getP2_0 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => P2_0_LEN,
    ROM_FILE  => "p2_0.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => p2_0
  );
  getP0_1 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => P0_1_LEN,
    ROM_FILE  => "p0_1.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => p0_1
  );

  getP1_1 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => P1_1_LEN,
    ROM_FILE  => "p1_1.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => p1_1
  );

  getP2_1 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => P2_1_LEN,
    ROM_FILE  => "p2_1.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => p2_1
  );

  getE0_0 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => E0_0_LEN,
    ROM_FILE  => "e0_0.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => e0_0
  );

  getE1_0 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => E1_0_LEN,
    ROM_FILE  => "e1_0.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => e1_0
  );

  getE0_1 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => E0_1_LEN,
    ROM_FILE  => "e0_1.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => e0_1
  );

  getE1_1 : rom
  GENERIC MAP(
    MXADRB    => PARAMS_DEPTH_LEN,
    MXDATB    => E1_1_LEN,
    ROM_FILE  => "e1_1.mem",
    ROM_STYLE => "distributed"
  )
  PORT MAP(
    clka  => clk,
    ena   => dv_combo,
    addra => combo_index,
    douta => e1_1
  );

  segment_I <= convert(i_segment_I, segment_I);
  segment_M <= convert(i_segment_M, segment_M);
  segment_O <= convert(i_segment_O, segment_O);

  combo_index <= comboid_to_index_ram(comboid);

  slc   <= convert(i_SLC, slc);
  o_mtc <= convert(mtc, o_mtc);

  pt_top_proc : PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      segment_I_v <= i_segment_I;
      segment_M_v <= i_segment_M;
      segment_O_v <= i_segment_O;

      IF segment_I.data_valid = '1' OR segment_M.data_valid = '1' OR segment_O.data_valid = '1' THEN
        dv_combo <= '1';
        IF segment_I.data_valid = '1' THEN
          segment_eta <= i_segment_I;
          im          <= '0';
        ELSE
          segment_eta <= i_segment_M;
          im          <= '1';
        END IF;

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
      END IF;
      -- save the slc
      IF slc.data_valid = '1' THEN
        slc_s <= SLC;
      END IF;

      dv_combo_s <= dv_combo;
      -- <a> parameters are now valid
      dv_a    <= dv_combo_s;
      dv0     <= dv_s AND dv_a;
      a1_invs <= resize(shift_right(unsigned(a1) * inv_s * INTEGER(SF2PTCALC_SEGPOS_MULT), (TF_AX_1_MULTI_LEN + SHIFT_NUM_SAGITTA)), PT_S_LEN);
      a0_s    <= a0;

      dv1  <= dv0;
      pt_s <= unsigned(a0_s) + a1_invs;

      dv2   <= dv1;
      p0    <= resize(signed(p0_0) + shift_right(signed(p0_1) * signed('0' & pt_s), TF_PX_1_MULTI_LEN), P0_LEN);
      p1    <= resize(signed(p1_0) + shift_right(signed(p1_1) * signed('0' & pt_s), TF_PX_1_MULTI_LEN), P1_LEN);
      p2    <= resize(signed(p2_0) + shift_right(signed(p2_1) * signed('0' & pt_s), TF_PX_1_MULTI_LEN), P2_LEN);
      pt_s0 <= signed('0' & pt_s);

      dv3    <= dv2;
      p1_phi <= resize(shift_right(p1 * slc_s.phimod, PHIMOD_MULTI_LEN), P1_PHI_LEN);
      p2_phi <= resize(shift_right(p2 * slc_s.phimod, PHIMOD_MULTI_LEN), P2_PHI_LEN);
      pt_s1  <= pt_s0 - p0;

      dv4     <= dv3;
      pt_s2   <= resize(pt_s1 - p1_phi, P2_PHI2_LEN);
      p2_phi2 <= resize(shift_right(p2_phi * slc_s.phimod, PHIMOD_MULTI_LEN), P2_PHI2_LEN);

      -- <b> parameters now valid
      dv5   <= dv4;
      pt_sp <= pt_s2 - p2_phi2;

      dv6    <= dv5;
      pt_sp0 <= resize(pt_sp, E0_LEN);
      e0     <= resize(signed(e0_0) + shift_right(signed(e0_1) * pt_sp, TF_EX_1_MULTI_LEN), E0_LEN);
      e1     <= resize(signed(e1_0) + shift_right(signed(e1_1) * pt_sp, TF_EX_1_MULTI_LEN), E1_LEN);

      dv7    <= dv6;
      pt_sp1 <= resize(pt_sp0 - e0, E1_ETA_LEN);
      e1_eta <= resize(shift_right(e1 * signed('0' & eta), ETA_MULTI_LEN), E1_ETA_LEN);

      dv8    <= dv7;
      pt_spe <= pt_sp1 - e1_eta;

      dv_pt <= dv8;
      pt    <= resize(unsigned(pt_spe), PTCALC2MTC_MDT_PT_LEN);

      -- Assembling the MTC candidate
      mtc.data_valid <= dv_pt;
      mtc.muid       <= slc_s.muid;
      IF SIDE = 0 THEN
        mtc.mdt_eta <= signed(eta);
      ELSE
        mtc.mdt_eta <= - signed(eta);
      END IF;
      mtc.mdt_pt       <= pt;
      mtc.mdt_ptthresh <= pt_threshold(pt);
      mtc.mdt_charge   <= slc.sl_charge; -- temporary
      -- Still to add other cases
      mtc.mdt_nsegments <= nsegments;
      mtc.mdt_quality   <= quality;
      --reset
      IF dv_pt = '1' OR i_rst = '1' THEN
        comboid     <= (OTHERS => '0');
        dv_combo    <= '0';
        dv_combo_s  <= '0';
        dv_a        <= '0';
        dv0         <= '0';
        dv1         <= '0';
        dv2         <= '0';
        dv3         <= '0';
        dv4         <= '0';
        dv5         <= '0';
        dv6         <= '0';
        dv7         <= '0';
        dv8         <= '0';
        dv_pt       <= '0';
        mtc         <= zero(mtc);
        slc_s       <= zero(slc_s);
        segment_I_s <= zero(segment_I_s);
        segment_M_s <= zero(segment_M_s);
        segment_O_s <= zero(segment_O_s);
        segment_eta <= zero(segment_eta);
        nsegments   <= (OTHERS => '0');
        quality     <= (OTHERS => '0');
      END IF;
    END IF;
  END PROCESS; -- identifier

END Behavioral;