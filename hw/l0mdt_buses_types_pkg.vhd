-- -------------------------------------------------------------------------------------------------
-- Auto-generated from:
-- https://docs.google.com/spreadsheets/d/1oJh-NPv990n6AzXXZ7cBaySrltqBO-eGucrsnOx_r4s
-- -------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mdttp_types_pkg is

  constant DF_HASH : std_logic_vector(31 downto 0) := x"d6275d1b";

  -- -----------------------------------------------------------------
  type SLC_MUID_rt is record
    -- SLc Identification (up to 3)
    slcid : std_logic_vector(1 downto 0);
    -- SL board ID (based on the fiber ID)
    slid : std_logic_vector(5 downto 0);
    -- BCID from SLC
    bcid : std_logic_vector(11 downto 0);
  end record SLC_MUID_rt;

  -- -----------------------------------------------------------------
  type SLC_COMMON_rt is record
    -- SLc Identification (up to 3)
    slcid : std_logic_vector(1 downto 0);
    -- SLc Eta Position
    poseta : std_logic_vector(13 downto 0);
    -- SLc Phi Position
    posphi : std_logic_vector(8 downto 0);
    -- SLc highest pT threshold passed
    ptthresh : std_logic_vector(3 downto 0);
    -- SLc charge
    charge : std_logic;
  end record SLC_COMMON_rt;

  -- -----------------------------------------------------------------
  type SLC_ENDCAP_rt is record
    -- struct SLC_COMMON
    SLC_COMMON : std_logic_vector(29 downto 0);
    -- SLc Segment Angle wrt Eta position
    seg_angdtheta : std_logic_vector(6 downto 0);
    -- SLc Segment Angle wrt Phi position
    seg_angdphi : std_logic_vector(3 downto 0);
    -- NSW segment eta position
    nswseg_poseta : std_logic_vector(13 downto 0);
    -- NSW segment phi position
    nswseg_posphi : std_logic_vector(7 downto 0);
    -- NSW segment angle wrt Eta position
    nswseg_angdtheta : std_logic_vector(4 downto 0);
  end record SLC_ENDCAP_rt;

  -- -----------------------------------------------------------------
  type SLC_BARREL_rt is record
    -- struct SLC_COMMON
    SLC_COMMON : std_logic_vector(29 downto 0);
    -- SLc Hit Z Position in RPC0
    rpc0_posz : std_logic_vector(9 downto 0);
    -- SLc Hit Z Position in RPC1
    rpc1_posz : std_logic_vector(9 downto 0);
    -- SLc Hit Z Position in RPC2
    rpc2_posz : std_logic_vector(9 downto 0);
    -- SLc Hit Z Position in RPC3
    rpc3_posz : std_logic_vector(9 downto 0);
    -- SLc coincidence type
    cointype : std_logic_vector(2 downto 0);
  end record SLC_BARREL_rt;

  -- -----------------------------------------------------------------
  type SLCPROC_PIPELINE_COMMON_rt is record
    -- SLc busy flag
    busy : std_logic;
    -- SLc board destination
    destsl : std_logic_vector(1 downto 0);
    -- SLc phimod
    phimod : std_logic_vector(7 downto 0);
    -- SLc Inner Vector MDT chamber ID
    vec_mdtid : std_logic_vector(5 downto 0);
  end record SLCPROC_PIPELINE_COMMON_rt;

  -- -----------------------------------------------------------------
  type SLCPROC_PIPELINE_ENDCAP_rt is record
    -- struct SLCPROC_PIPELINE_COMMON
    SLCPROC_PIPELINE_COMMON : std_logic_vector(34 downto 0);
    -- struct SLC_ENDCAP
    SLC_ENDCAP : std_logic_vector(67 downto 0);
    -- struct SLC_MUID
    SLC_MUID : std_logic_vector(19 downto 0);
  end record SLCPROC_PIPELINE_ENDCAP_rt;

  -- -----------------------------------------------------------------
  type SLCPROC_PIPELINE_BARREL_rt is record
    -- struct SLCPROC_PIPELINE_COMMON
    SLCPROC_PIPELINE_COMMON : std_logic_vector(34 downto 0);
    -- struct SLC_BARREL
    SLC_BARREL : std_logic_vector(72 downto 0);
    -- struct SLC_MUID
    SLC_MUID : std_logic_vector(19 downto 0);
  end record SLCPROC_PIPELINE_BARREL_rt;

  -- -----------------------------------------------------------------
  type CSM_rt is record
    -- Channel number within TDC
    chanid : std_logic_vector(4 downto 0);
    -- Edge or pair mode
    edgemode : std_logic_vector(1 downto 0);
    -- TDC BCID
    coarsetime : std_logic_vector(11 downto 0);
    -- TDC fine time with BCID
    finetime : std_logic_vector(4 downto 0);
    -- Pulse width
    pulsewidth : std_logic_vector(7 downto 0);
  end record CSM_rt;

  -- -----------------------------------------------------------------
  type TDCFORMAT_rt is record
    -- struct CSM
    CSM : std_logic_vector(31 downto 0);
    -- Fiber ID within board
    fiberid : std_logic_vector(4 downto 0);
    -- Elink ID within fiber
    elinkid : std_logic_vector(3 downto 0);
    -- Valid bit
    datavalid : std_logic;
    -- MDT Station Type (Inner, Middle, Outer, Extra)
    stationid : std_logic_vector(1 downto 0);
  end record TDCFORMAT_rt;

  -- -----------------------------------------------------------------
  type SLCPROC_HESF_rt is record
    -- struct SLC_MUID
    SLC_MUID : std_logic_vector(19 downto 0);
    -- inner MDT segment chip destination
    mdtseg_dest : std_logic_vector(1 downto 0);
    -- SLc Inner Vector MDT chamber ID
    vec_mdtid : std_logic_vector(5 downto 0);
    -- SLc inner vector rho position
    vec_pos : std_logic_vector(9 downto 0);
    -- SLc inner vector theta angle
    vec_ang : std_logic_vector(9 downto 0);
  end record SLCPROC_HESF_rt;

  -- -----------------------------------------------------------------
  type TUBEREMAP_rt is record
    -- Tube layer within one station
    mdt_tube_layer : std_logic_vector(5 downto 0);
    -- Tube number within one station
    mdt_tube_num : std_logic_vector(9 downto 0);
    -- Tube radial position
    mdt_tube_rho : std_logic_vector(17 downto 0);
    -- Tube position along z
    mdt_tube_z : std_logic_vector(18 downto 0);
    -- Tube (uncalibrated) time
    mdt_tube_time : std_logic_vector(20 downto 0);
  end record TUBEREMAP_rt;

  -- -----------------------------------------------------------------
  type HE_LSF_rt is record
    -- Hit Valid bit
    mdt_valid : std_logic;
    -- Data Valid bit
    data_valid : std_logic;
    -- Tube local position along precision coord
    mdt_localx : std_logic_vector(13 downto 0);
    -- Tube local position along second coord
    mdt_localy : std_logic_vector(13 downto 0);
    -- Tube drift radius
    mdt_radius : std_logic_vector(8 downto 0);
  end record HE_LSF_rt;

  -- -----------------------------------------------------------------
  type HE_CSF_rt is record
    -- Hit Valid bit
    mdt_valid : std_logic;
    -- Data Valid bit
    data_valid : std_logic;
    -- Tube local position along precision coord
    mdt_localx : std_logic_vector(14 downto 0);
    -- Tube local position along second coord
    mdt_localy : std_logic_vector(14 downto 0);
    -- Tube drift radius
    mdt_radius : std_logic_vector(8 downto 0);
  end record HE_CSF_rt;

  -- -----------------------------------------------------------------
  type SLCPIPELINE_PTCALC_rt is record
    -- struct SLC_MUID
    SLC_MUID : std_logic_vector(19 downto 0);
    -- (COPY)
    vec_mdtid : std_logic_vector(5 downto 0);
    -- (COPY)
    phimod : std_logic_vector(7 downto 0);
    -- (COPY)
    charge : std_logic;
  end record SLCPIPELINE_PTCALC_rt;

  -- -----------------------------------------------------------------
  type SF_rt is record
    -- struct SLC_MUID
    SLC_MUID : std_logic_vector(19 downto 0);
    -- (COPY)
    vec_mdtid : std_logic_vector(5 downto 0);
    -- SF MDT segment valid bit
    segvalid : std_logic;
    -- SF MDT segment position along the precision coord
    segpos : std_logic_vector(15 downto 0);
    -- SF MDT segment angle along the precision coord
    segangle : std_logic_vector(10 downto 0);
    -- SF MDT segment qualiry
    segquality : std_logic;
  end record SF_rt;

  -- -----------------------------------------------------------------
  type PTCALC_rt is record
    -- struct SLC_MUID
    SLC_MUID : std_logic_vector(19 downto 0);
    -- eta of the innermost MDT station segment position
    mtc_eta : std_logic_vector(13 downto 0);
    -- pT calculated by the pT Calc
    mtc_pt : std_logic_vector(7 downto 0);
    -- pT threshold satisfied by the MDT TC
    mtc_ptthresh : std_logic_vector(3 downto 0);
    -- charge determined from the pT calc
    mtc_charge : std_logic;
    -- # of segments used for calculating the pT
    mtc_nsegments : std_logic_vector(1 downto 0);
    -- quality of the MDT TC (TBC how this is defined)
    mtc_quality : std_logic;
  end record PTCALC_rt;

  -- -----------------------------------------------------------------
  type SLCPIPELINE_MTC_ENDCAP_rt is record
    -- struct SLCPROC_PIPELINE_ENDCAP
    SLCPROC_PIPELINE_ENDCAP : std_logic_vector(19 downto 0);
  end record SLCPIPELINE_MTC_ENDCAP_rt;

  -- -----------------------------------------------------------------
  type SLCPIPELINE_MTC_BARREL_rt is record
    -- struct SLCPROC_PIPELINE_BARREL
    SLCPROC_PIPELINE_BARREL : std_logic_vector(13 downto 0);
  end record SLCPIPELINE_MTC_BARREL_rt;

  -- -----------------------------------------------------------------
  type MTC_rt is record
    -- struct SLC_COMMON
    SLC_COMMON : std_logic_vector(29 downto 0);
    -- (COPY)
    mtc_eta : std_logic_vector(13 downto 0);
    -- (COPY)
    mtc_pt : std_logic_vector(7 downto 0);
    -- (COPY)
    mtc_ptthresh : std_logic_vector(3 downto 0);
    -- (COPY)
    mtc_charge : std_logic;
    -- MDT processing flags
    mtc_procflags : std_logic_vector(3 downto 0);
    -- (COPY)
    mtc_nsegments : std_logic_vector(1 downto 0);
    -- (COPY)
    mtc_quality : std_logic;
  end record MTC_rt;

-- -------------------------------------------------------------------

end package mdttp_types_pkg;
