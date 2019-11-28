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
--   26/11/2019  0.1  File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package he_pkg is
--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
    constant numTDCs_lpGBT : integer := 9; 
    constant numlpGBTs_mux : integer := 2; 
    constant numInputs_mux : integer := numlpGBTs_mux * numTDCs_lpGBT; 


--------------------------------------------------------------------------------
--  RECORDS
--------------------------------------------------------------------------------

-- data from muon candidate
    type muCand_data_rt is record
        header_r    : std_logic_vector(31 downto 0);
    end record;

    subtype st_muoncandidate_data is std_logic_vector(191 downto 0);

-- data from lpGBT to pulling multiplexor
    type tdc_data_rt is record 
        channel_ID  : std_logic_vector(4 downto 0);
        edge_mode   : std_logic_vector(1 downto 0);
        lead_edge   : std_logic_vector(16 downto 0);
        pulse_width : std_logic_vector(7 downto 0); 
    end record;

    --type ta_tdc_data is array (numInputs_mux -1 downto 0) of tdc_data_rt;
    subtype tdc_data_t is std_logic_vector(31 downto 0);
    type tdc_data_ta is array (numInputs_mux -1 downto 0) of tdc_data_t;

-- data from pulling multiplexor to tube address remaping
    type mux2tar_data_rt is record 
        tdc_data_r   : tdc_data_rt;
        mux_ch       : integer;
    end record;

-- data from TAR to hit extraction input fifo
    type tar2hec_data_rt is record
        multilayer  : integer;
        layer       : integer;
        tube        : integer;
        lead_edge   : std_logic_vector(16 downto 0);
        pulse_width : std_logic_vector(7 downto 0); 
    end record;

--------------------------------------------------------------------------------
-- FUNCTIONS DECLARATIONS
--------------------------------------------------------------------------------

    function tdc_data2vec(
        data : in tdc_data_rt
    )return std_logic_vector;

    function tdc_vec2data(
        data : in std_logic_vector
    )return tdc_data_rt;

end package he_pkg;

package body he_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATIONS
--------------------------------------------------------------------------------
    function tdc_data2vec(
        data : in tdc_data_rt
    )return std_logic_vector is
        variable vectorOutput : std_logic_vector(31 downto 0);
    begin
        vectorOutput := data.channel_ID & data.edge_mode & data.lead_edge & data.pulse_width;
        return vectorOutput;
    end function;

    function tdc_vec2data(
        data : in std_logic_vector
    )return tdc_data_rt is
        variable recordOutput : tdc_data_rt;
    begin
        recordOutput.channel_ID := data (31 downto 27);
        recordOutput.edge_mode := data(26 downto 25);
        recordOutput.lead_edge := data(24 downto 8);
        recordOutput.pulse_width := data(7 downto 0);
        return recordOutput;
    end function;




end package body he_pkg;
