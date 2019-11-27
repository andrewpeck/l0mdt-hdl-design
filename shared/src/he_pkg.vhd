--------------------------------------------------------------------------------
-- 	UMass , Physics Department
-- 	Guillermo Loustau de Linares
--	gloustau@cern.ch
--	
--	Project: ATLAS L0MDT Trigger 
--	Module:
--	Description:
--
--------------------------------------------------------------------------------
--	Revisions:
--	 26/11/2019  0.1  File created
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
--	RECORDS
--------------------------------------------------------------------------------

-- data from lpGBT to pulling multiplexor
	type tr_tdc_data is record 
		chID		: std_logic_vector(4 downto 0);
		edge_mode	: std_logic_vector(1 downto 0);
		lead_edge	: std_logic_vector(16 downto 0);
		pulse_width	: std_logic_vector(7 downto 0);	
	end record;

	--type ta_tdc_data is array (numInputs_mux -1 downto 0) of tr_tdc_data;
	subtype st_tdc_data is std_logic_vector(31 downto 0);
	type sta_tdc_data is array (numInputs_mux -1 downto 0) of st_tdc_data;

-- data from pulling multiplexor to tube address remaping
	type tr_mux2tar_data is record 
		tdc_data 	: tr_tdc_data;
		muxch		: integer;
	end record;

-- data from TAR to hit extraction input fifo
	type tr_tar2fifo_data is record
		multilayer	: integer;
		layer		: integer;
		tube		: integer;
		lead_edge	: std_logic_vector(16 downto 0);
		pulse_width	: std_logic_vector(7 downto 0);	
	end record;

--------------------------------------------------------------------------------
-- FUNCTIONS DECLARATIONS
--------------------------------------------------------------------------------

	function tdc_data2vec(
		data : in tr_tdc_data
	)return std_logic_vector;

	function tdc_vec2data(
		data : in std_logic_vector
	)return tr_tdc_data;

end package he_pkg;

package body he_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATIONS
--------------------------------------------------------------------------------
	function tdc_data2vec(
		data : in tr_tdc_data
	)return std_logic_vector is
		variable vectorOutput : std_logic_vector(31 downto 0);
	begin
		vectorOutput := data.chID & data.edge_mode & data.lead_edge & data.pulse_width;
		return vectorOutput;
	end function;

	function tdc_vec2data(
		data : in std_logic_vector
	)return tr_tdc_data is
		variable recordOutput : tr_tdc_data;
	begin
		recordOutput.chId := data (31 downto 27);
		recordOutput.edge_mode := data(26 downto 25);
		recordOutput.lead_edge := data(24 downto 8);
		recordOutput.pulse_width := data(7 downto 0);
		return recordOutput;
	end function;




end package body he_pkg;
