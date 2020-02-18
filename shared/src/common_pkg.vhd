--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--    05/02/2020  0.1  File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package common_pkg is
--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
    constant numTDCs_lpGBT  : integer := 9; 
    constant numlpGBTs_mux  : integer := 2; 
    constant numInputs_mux  : integer := numlpGBTs_mux * numTDCs_lpGBT; 

    constant mdt_layer_max  : integer := 10;
    constant mdt_layer_bits  : integer := integer(log2(real(mdt_layer_max))) + 1;
    constant mdt_tube_max   : integer := 435;
    constant mdt_tube_bits  : integer := integer(log2(real(mdt_tube_max))) + 1;

    -- segment finders
    -- CSF
    constant csf_x_width    : integer := 14;
    constant csf_z_width    : integer := 14;
    constant csf_r_width    : integer := 9;

    -- LE
    constant le_x_width    : integer := 14;
    constant le_y_width    : integer := 14;
    constant le_r_width    : integer := 9;


--------------------------------------------------------------------------------
--  sub types
--------------------------------------------------------------------------------
-- Sector Logic candidates
    subtype SLc_BCID_st is unsigned(11 downto 0);
    subtype SLc_zpos_st is signed(9 downto 0); 
    subtype SLc_phi_st is std_logic_vector(8 downto 0);

-- MDT hits
    subtype mdt_time_le_st is unsigned(16 downto 0);   -- 0.78 ns resolution
    subtype mdt_time_pw_st is unsigned(7 downto 0);      -- 0.78 ns resolution
    -- subtype mdt_time_full is unsigned(21 downto 0);     -- 0.78 ns resolution


--------------------------------------------------------------------------------
--  RECORDS
--------------------------------------------------------------------------------

-- data from muon candidate
-- header 32 bits
    type SLc_header_rt is record
        BCID        : SLc_BCID_st;
        num_TCs     : integer range 0 to 7;
        num_mTCs    : integer range 0 to 7;
        reserved    : std_logic_vector(13 downto 0);
    end record;

-- trailer 32 bits
    type SLc_trailer_rt is record
        Comma        : std_logic_vector(7 downto 0);
        Board_ID     : integer range 0 to ((2**6)-1);
        Fiber_ID     : integer range 0 to ((2**4)-1);
        CRC          : std_logic_vector(7 downto 0);
        reserved     : std_logic_vector(5 downto 0);
    end record;

-- SLc barrel 80 bits
    -- type muCand_esl_data_rt is record
    --    pos_eta         : integer;
    --    pos_phi         : integer;
    --    angle_theta     : integer;
    --    angle_phi       : integer;
    --    pt_threshold    : std_logic_vector(3 downto 0);
    -- end record;

    type SLc_b_data_rt is record
        ID              : std_logic_vector(1 downto 0);
        tc_2_mdttp      : std_logic;
        pos_etha        : unsigned(11 downto 0);
        pos_phi         : unsigned(8 downto 0);
        pt_threshold    : std_logic_vector(3 downto 0);
        charge          : std_logic;
        coin_type       : std_logic_vector(2 downto 0);
        Z_rpc0          : unsigned(9 downto 0);
        Z_rpc1          : unsigned(9 downto 0);
        Z_rpc2          : unsigned(9 downto 0);
        Z_rpc3          : unsigned(9 downto 0);
        reserved        : std_logic_vector(10 downto 0);
    end record;

-- tail 32 bits
    -- type muCand_tail_rt is record
    --     tail : std_logic_vector (31 downto 0);
    -- end record;

-- full packet record
    type SLc_packet_rt is record
        header_r    : SLc_header_rt;
        data_r      : SLc_b_data_rt;
        tail_r      : SLc_trailer_rt;
    end record;

    subtype st_muoncandidate_data is std_logic_vector(191 downto 0);

-- useful muon candidate data
    type muCand_data_rt is record
        data : std_logic_vector(31 downto 0);
    end record;

-- data from TAR to hit extraction input fifo
    type tar2hec_data_rt is record
        multilayer  : integer;
        layer       : integer;
        tube        : integer;
        lead_edge   : std_logic_vector(16 downto 0);
        pulse_width : std_logic_vector(7 downto 0); 
    end record;

-- data types and records for hit processing block
    
    -- muon candidate procesor to tube range LUT
    type tube_range_config_rt is record
        data_valid  : std_logic;
    end record;

    type muon_candidate_info_rt is record
        mc_time : integer;
        mc_origin : std_logic_vector(13 downto 0);
    end record;

    -- tube range LUT to Hit Matching
    type tube_range_cand_rt is record
        tube_hi     : integer;
        tube_lo     : integer;
    end record;

    -- output structures

    type segment_finder_legendre_rt is record
        x : integer;
        y : integer;
        r : integer;
    end record;




--------------------------------------------------------------------------------
-- FUNCTIONS DECLARATION
--------------------------------------------------------------------------------

    -- function tdc_data2vec(
    --     data : in tdc_data_rt
    -- )return std_logic_vector;

    -- function tdc_vec2data(
    --     data : in std_logic_vector
    -- )return tdc_data_rt;

end package common_pkg;

package body common_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATION
--------------------------------------------------------------------------------
    -- function tdc_data2vec(
    --     data : in tdc_data_rt
    -- )return std_logic_vector is
    --     variable vectorOutput : std_logic_vector(31 downto 0);
    -- begin
    --     vectorOutput := data.channel_ID & data.edge_mode & data.lead_edge & data.pulse_width;
    --     return vectorOutput;
    -- end function;

    -- function tdc_vec2data(
    --     data : in std_logic_vector
    -- )return tdc_data_rt is
    --     variable recordOutput : tdc_data_rt;
    -- begin
    --     recordOutput.channel_ID := data (31 downto 27);
    --     recordOutput.edge_mode := data(26 downto 25);
    --     recordOutput.lead_edge := data(24 downto 8);
    --     recordOutput.pulse_width := data(7 downto 0);
    --     return recordOutput;
    -- end function;




end package body common_pkg;
