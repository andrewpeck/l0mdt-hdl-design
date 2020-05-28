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
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.config_pkg.all;
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
    
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- SLc in
    i_uCM_data_v        : in ucm2hps_rvt;
    -- SLc out
    o_uCM2sf_data_v     : out ucm2hps_rvt;
    o_uCM2hp_data_v     : out hp_heg2hp_slc_rvt;
    o_SLC_Window_v      : out hp_heg2hp_window_avt;
    
    o_control           : out heg_ctrl2hp_rt
  );
end entity heg_control;

architecture beh of heg_control is

  component heg_c_window is
    generic(
      radius      : integer := 0  --station
    );
    port (
      clk                 : in std_logic;
      
      rst            : in std_logic;
      glob_en             : in std_logic;
      -- configuration
      -- SLc in
      i_uCM_data_v        : in ucm2hps_rvt;
      -- SLc out
      o_SLC_Window_v      : out hp_heg2hp_window_avt;
      o_Z_offset          : out unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
      o_Roi_win_valid     : out std_logic
    );
  end component heg_c_window;

  type heg_ctrl_motor_t is ( IDLE, SET_WINDOW, HEG_BUSY );
  signal heg_ctrl_motor     : heg_ctrl_motor_t;

  signal int_uCM_data_r     : ucm2hps_rt;
  signal Roi_win_valid      : std_logic;
  signal o_uCM2hp_data_r    : hp_heg2hp_slc_rt;
  signal busy_count         : std_logic_vector(11 downto 0);
  
begin

  HEG_C_W : component heg_c_window
  generic map(
    radius => radius
  )
  port map(
    clk                 => clk,
    
    rst            => rst,
    glob_en             => glob_en,
    -- configuration
    -- SLc in
    i_uCM_data_v          => i_uCM_data_v,
    -- SLc out
    o_SLC_Window_v        => o_SLC_Window_v,
    o_Roi_win_valid       => Roi_win_valid
  );

  -- o_uCM2sf_data_v <= int_uCM_data;
  -- o_uCM2hp_data_v.barrel.z <= int_uCM_data.barrel.z;

  int_uCM_data_r <= structify(i_uCM_data_v);
  o_uCM2hp_data_v <= vectorify(o_uCM2hp_data_r);


  SLc_reg : process(rst,clk) begin
    if rising_edge(clk) then
      if(rst= '1') then

        o_uCM2sf_data_v <= nullify(o_uCM2sf_data_v);
  
        o_control.enable <= (others => '0');
        o_control.rst<= (others => '1');
        busy_count <= (others => '0');
  
        heg_ctrl_motor <= IDLE;
      else 
        if or_reduce(o_control.enable) = '1' then
          busy_count <= busy_count + '1';
        else
          busy_count <= (others => '0');
        end if;
  
        case heg_ctrl_motor is
          when IDLE =>
            if( int_uCM_data_r.data_valid = '1') then
              o_uCM2sf_data_v <= i_uCM_data_v;
              o_control.enable <= (others => '1');
              o_control.rst<= (others => '0');
              heg_ctrl_motor <= SET_WINDOW;
            end if;
  
          when SET_WINDOW =>
            o_control.enable <= (others => '1');
            o_control.rst<= (others => '1');
            if Roi_win_valid = '1' then
              if ST_nBARREL_ENDCAP = '0' then -- barrel
                -- o_uCM2hp_data_r.specific.z_0 <= int_uCM_data_r.barrel.z;
              else --endcap
  
              end if;
              heg_ctrl_motor <= HEG_BUSY;
            end if;
          -- int_uCM_data_r <= ucm2heg_slc_f_std2rt(i_uCM_data_v);
          -- o_uCM_data <= int_uCM_data;
          -- o_control.loc_enable <= '1';
          -- o_control.enable <= (others => '1');
          -- o_control.rst<= (others => '0');
          when HEG_BUSY =>
            if to_integer(unsigned(busy_count)) < HEG_BUSY_CLOCKS then
              o_control.enable <= (others => '1');
              o_control.rst<= (others => '1');
            else
              o_control.enable <= (others => '0');
              o_control.rst<= (others => '1');
              -- busy_count <= (others => '0');
              heg_ctrl_motor <= IDLE;
            end if;
  
        end case;
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
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
-- use heg_lib.heg_trLUT_s3_pkg.all;

entity heg_c_window is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- SLc in
    i_uCM_data_v        : in ucm2hps_rvt;
    -- SLc out
    o_SLC_Window_v      : out hp_heg2hp_window_avt;
    o_Z_offset          : out unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    o_Roi_win_valid     : out std_logic
  );
end entity heg_c_window;

architecture beh of heg_c_window is

  signal int_uCM_data : ucm2hps_rt;
  signal uCM_barrel   : ucm_csf_barrel_rt;
  signal z_barrel       : unsigned(UCM_Z_ROI_LEN-1 downto 0);
  -- type trLUT_layer_t is array (0 to 7) of trLUT_limits_t;
  -- signal Roi_window_LUT : trLUT_layer_t;
  -- signal Roi_w_index : integer;
  -- signal Roi_window_a : hp_heg2hp_window_at;

  signal wingen_dv_o : std_logic;
begin

  -- ROI_GEN : entity heg_lib.heg_roi_gen
  -- generic map(
  --   radius => radius
  -- )
  -- port map(
  --   clk                 => clk,
  --   rst            => rst,
  --   glob_en             => glob_en,
  --   --
  --   i_specific          => int_uCM_data.specific,
  --   i_data_valid        => int_uCM_data.data_valid,
  --   o_SLC_Window_v      => o_SLC_Window_v,
  --   o_data_valid        => wingen_dv_o
  -- );

  int_uCM_data <= structify(i_uCM_data_v);

  UCM_B_GEN: if ST_nBARREL_ENDCAP = '0' generate

    uCM_barrel <= structify(int_uCM_data.specific);
    z_barrel <= uCM_barrel.z;

    ROI_GEN : entity heg_lib.heg_roi_gen
    generic map(
      radius => radius
    )
    port map(
      clk                 => clk,
      rst            => rst,
      glob_en             => glob_en,
      --
      i_z          => z_barrel,
      i_data_valid        => int_uCM_data.data_valid,
      o_SLC_Window_v      => o_SLC_Window_v,
      o_data_valid        => wingen_dv_o
    );

  end generate;

  -- Roi_wingen : process(rst,clk) begin
  --   if rising_edge(clk) then
  --     if(rst= '1') then
  --       o_Roi_win_valid <= '0';
  --       Roi_window_a <= nullify(Roi_window_a);
  --     else
  --       if( int_uCM_data.data_valid = '1') then
  --         -- TO-DO: convert from SLC.barrel.z to Roi_w_index 
  --         if uCM_barrel.z >= 0 and uCM_barrel.z < 6 then
  --           Roi_w_index <= to_integer(uCM_barrel.z);
  --         else
  
  --         end if;
  
  --         ----------------------
  --           for il in 7 downto 0 loop
  --             for it in 1 downto 0 loop
  --               -- TO-DO: convert from SLC.barrel.z to Roi_w_index 
  
  
  --               ----------------------
  --               -- Roi_window_a(il)(it) <= std_logic_vector(to_unsigned(trLUT_s3_mem(radius)(Roi_w_index)(il)(it),MDT_TUBE_LEN));
  --             end loop;
  --           end loop;
  --           o_Roi_win_valid <= '1';
  --         -- Enables control
  --       end if;
  --     end if;
      
  --   end if;
  -- end process;
  -- o_SLC_Window_v <= vectorify(Roi_window_a);


end beh;