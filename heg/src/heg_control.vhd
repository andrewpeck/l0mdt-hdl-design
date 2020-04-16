--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

entity heg_control is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- SLc in
    i_uCM_data          : in ucm2heg_slc_stdst;
    -- SLc out
    o_uCM2sf_data       : out ucm2heg_slc_rt;
    o_uCM2hp_data       : out hp_slc_rt;
    o_SLC_Window        : out SLc_window_std;

    o_control           : out heg_int_control_rt
  );
end entity heg_control;

architecture beh of heg_control is

  component heg_c_window is
    generic(
      radius      : integer := 0  --station
    );
    port (
      clk                 : in std_logic;
      
      Reset_b             : in std_logic;
      glob_en             : in std_logic;
      -- configuration
      -- SLc in
      i_uCM_data          : in ucm2heg_slc_stdst;
      -- SLc out
      o_SLC_Window        : out SLc_window_std;
      o_Roi_win_valid     : out std_logic
    );
  end component heg_c_window;

  signal int_uCM_data_r : ucm2heg_slc_rt;
  signal int_uCM_data_v : ucm2heg_slc_stdst;
  signal Roi_win_valid : std_logic;
  
begin

  HEG_C_W : component heg_c_window
  generic map(
    radius => radius
  )
  port map(
    clk                 => clk,
    
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration
    -- SLc in
    i_uCM_data          => i_uCM_data,
    -- SLc out
    o_SLC_Window        => o_SLC_Window,
    o_Roi_win_valid     => Roi_win_valid
  );

  -- o_uCM2sf_data <= int_uCM_data;
  -- o_uCM2hp_data.barrel.z <= int_uCM_data.barrel.z;

  int_uCM_data_r <= ucm2heg_slc_f_std2rt(i_uCM_data);

  SLc_reg : process(Reset_b,clk) begin
    if(not Reset_b) then
      o_uCM2sf_data <= null_ucm2heg_slc_rt;
      o_control <= null_heg_control_rt;
      -- o_uCM2hp_data
    elsif rising_edge(clk) then
      if( int_uCM_data_r.data_valid) then
        o_uCM2sf_data <= int_uCM_data_r;
        o_uCM2hp_data.barrel.z <= int_uCM_data_r.barrel.z;
        -- int_uCM_data_r <= ucm2heg_slc_f_std2rt(i_uCM_data);
        -- o_uCM_data <= int_uCM_data;
        -- o_control.loc_enable <= '1';
        o_control.hp_enables <= (others => '1');
        o_control.hp_resets_b <= (others => '0');
      else
        o_control.hp_resets_b <= (others => '1');
      end if;
    end if;
  end process;

  




end beh;

--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
use heg_lib.heg_trLUT_s3_pkg.all;

entity heg_c_window is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- SLc in
    i_uCM_data          : in ucm2heg_slc_stdst;
    -- SLc out
    o_SLC_Window        : out SLc_window_std;
    o_Roi_win_valid     : out std_logic
  );
end entity heg_c_window;

architecture beh of heg_c_window is

  signal int_uCM_data : ucm2heg_slc_rt;

  type trLUT_layer_t is array (0 to 7) of trLUT_limits_t;
  signal Roi_window_LUT : trLUT_layer_t;
  signal Roi_w_index : integer;
  signal Roi_window_a : SLc_window_at;
begin

  int_uCM_data <= ucm2heg_slc_f_std2rt(i_uCM_data);

  Roi_wingen : process(Reset_b,clk) begin
    if(not Reset_b) then
      o_Roi_win_valid <= '0';
      Roi_window_a <= null_SLc_window_at;
    elsif rising_edge(clk) then
      if( int_uCM_data.data_valid = '1') then
        -- TO-DO: convert from SLC.barrel.z to Roi_w_index 
        if (int_uCM_data.barrel.z >= 0 and int_uCM_data.barrel.z < 6) then
          Roi_w_index <= to_integer(int_uCM_data.barrel.z);
        else

        end if;

        ----------------------
          for il in 7 downto 0 loop
            for it in 1 downto 0 loop
              -- TO-DO: convert from SLC.barrel.z to Roi_w_index 


              ----------------------
              Roi_window_a(il)(it) <= to_unsigned(trLUT_s3_mem(radius)(Roi_w_index)(il)(it),MDT_TUBE_WIDTH);
            end loop;
          end loop;
          o_Roi_win_valid <= '1';
        -- Enables control
      end if;
    end if;
  end process;
  o_SLC_Window <= window_f_a2std(Roi_window_a);


end beh;