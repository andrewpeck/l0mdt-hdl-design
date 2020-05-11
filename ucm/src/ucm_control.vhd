--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc Control Sorting algorithm + PAM
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_ctrl is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    i_data              : in ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
    --
    o_csw_ctrl          : out ucm_csw_control_rt;
    o_pam_ctrl          : out ucm_pam_control_rt;
    o_proc_info         : out ucm_proc_info_art(MAX_NUM_HEG -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(MAX_NUM_HEG -1 downto 0)
    -- o_pam2heg           : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0)    
  );
end entity ucm_ctrl;

architecture beh of ucm_ctrl is

  component ucm_ctrl_main is
    port (
      clk                 : in std_logic;
      Reset_b             : in std_logic;
      glob_en             : in std_logic;
      -- extrnals
      i_data              : in ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
      o_csw_ctrl          : out ucm_csw_control_rt;
      -- internals
      o_num_cand          : out unsigned(3 downto 0);
      o_pam_update        : out std_logic
  
    );
  end component;

  component ucm_ctrl_pam is
    port (
      clk                 : in std_logic;
      Reset_b             : in std_logic;
      glob_en             : in std_logic;
      --
      o_pam_ctrl          : out ucm_pam_control_rt;
      o_proc_info         : out ucm_proc_info_art(MAX_NUM_HEG -1 downto 0);
      o_cvp_ctrl          : out std_logic_vector(MAX_NUM_HEG -1 downto 0);
      -- o_pam2heg           : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
      -- internals
      i_num_cand          : in unsigned(3 downto 0);
      i_pam_update        : in std_logic
    );
  end component;

  signal num_cand          : unsigned(3 downto 0);
  signal pam_update        : std_logic;


begin

  MAIN_CTRL : ucm_ctrl_main
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- extrnals
    i_data              => i_data,
    o_csw_ctrl          => o_csw_ctrl,
    -- internals
    o_num_cand          => num_cand,
    o_pam_update        => pam_update
  );

  PAM_CTRL : ucm_ctrl_pam
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    --
    o_pam_ctrl            => o_pam_ctrl,
    o_proc_info           => o_proc_info,
    o_cvp_ctrl            => o_cvp_ctrl,
    -- o_pam2heg             => o_pam2heg,
    -- internals
    i_num_cand            => num_cand,
    i_pam_update          => pam_update
  );

end beh;

-- ---------------------
--  Main control aka algorithm
-- ---------------------

library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_ctrl_main is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- extrnals
    i_data              : in ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
    o_csw_ctrl          : out ucm_csw_control_rt;
    -- internals
    o_num_cand          : out unsigned(3 downto 0);
    o_pam_update        : out std_logic

  );
end entity ucm_ctrl_main;

architecture beh of ucm_ctrl_main is
  type alg_status_t is (
		ALG_IDLE, ALG_RUN, ALG_SET
  );
  signal alg_status   : alg_status_t;

  signal i_data_ar      : ucm_prepro_art(MAX_NUM_SL -1 downto 0);
  signal data_ar      : ucm_prepro_art(MAX_NUM_SL -1 downto 0);

  signal input_valids : std_logic_vector(MAX_NUM_SL -1 downto 0);

  -- signal o_num_cand     : unsigned(3 downto 0);
  -- signal o_pam_update   : std_logic;

  
begin
  
  pre_op: for sl_i in MAX_NUM_SL -1 downto 0 generate
    i_data_ar(sl_i) <= recordify(i_data(sl_i));
    input_Valids(sl_i) <= i_data_ar(sl_i).data_valid;
  end generate;

  Ctrl_logic : process(Reset_b,clk) 
    variable sl_i : integer := 0;
    variable pl_o : integer := 0;
    -- variable order : integer(MAX_NUM_SL -1 downto 0);
  begin

    if Reset_b = '0' then
      alg_Status <= ALG_IDLE;
      o_csw_ctrl <= ((others => '0'), (others => ( others => '0')));
      o_pam_update <= '0';
      o_num_cand <= (others => '0');

    elsif rising_edge(clk) then
      
      case alg_status is
        when ALG_IDLE =>
          if or_reduce(input_Valids) = '1' then
            -- here goes the algorithm
            data_ar <= i_data_ar;
            o_csw_ctrl <= ((others => '0'), (others => ( others => '0')));
            pl_o := 0;
            o_pam_update <= '0';
            alg_Status <= ALG_RUN;
          end if;

        when ALG_RUN =>
          if  ENABLE_NEIGHTBORS = '1' then -- with neigbors
            if (ST_nBARREL_ENDCAP and ENDCAP_nSMALL_LARGE) = '0' then -- 3+1+1
              -- barrel or small endcap
              if data_ar(MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- x1xxx
                o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
                o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 2 - pl_o,4));
                pl_o := pl_o + 1;
              end if;
              if data_ar(MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- xx1xx
                o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
                o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 2 - pl_o,4));
                pl_o := pl_o + 1;
              end if;
              if data_ar(MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- xxx1x
                o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
                o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 2 - pl_o,4));
                pl_o := pl_o + 1;
              end if;
            else 
              -- large endcap
            end if;
            -- 
            if data_ar(MAX_NUM_SL - 1).data_valid = '1' then -- xxx1x
              o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
              o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 1,4));
              pl_o := pl_o + 1;
            end if;
            if data_ar(0).data_valid = '1' then -- xxx1x
              o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
              o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(0,4));
              pl_o := pl_o + 1;
            end if;
          else -- without neighbors  
          end if;
          o_num_cand <= to_unsigned(pl_o,4);
          if pl_o > 0 then 
            o_pam_update <= '1';
          end if;
          alg_Status <= ALG_SET;

        when ALG_SET =>
        
          -- reset internals
          alg_Status <= ALG_IDLE;
          o_csw_ctrl <= ((others => '0'), (others => ( others => '0')));
          o_pam_update <= '0';
          o_num_cand <= (others => '0');
          alg_Status <= ALG_IDLE;

      end case;
      
    end if;

  end process;
  
  
end architecture beh;

-- ---------------------
--  PAM control
-- ---------------------

library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_ctrl_pam is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    -- i_data              : in ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
    --
    o_pam_ctrl          : out ucm_pam_control_rt;
    o_proc_info         : out ucm_proc_info_art(MAX_NUM_HEG -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(MAX_NUM_HEG -1 downto 0);
    -- o_pam2heg           : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    -- internals
    i_num_cand          : in unsigned(3 downto 0);
    i_pam_update        : in std_logic
  );
end entity ucm_ctrl_pam;

architecture beh of ucm_ctrl_pam is
  
  signal ch_busy      : std_logic_vector(MAX_NUM_HEG -1 downto 0);
  signal ch_count     : ch_count_avt(MAX_NUM_HEG -1 downto 0);

  signal processing   : integer;

begin

  -- for heg_i in MAX_NUM_HEG -1 downto 0 generate
  --   -- o_pam2heg.data_present(heg_i) <= 
  --   -- o_pam2heg.addr_
  -- end generate;
  
  PAM_logic : process(Reset_b,clk) 
    variable processed : integer := 0;
  begin

    if(Reset_b = '0') then
      o_cvp_ctrl <= (others => '0');
      ch_busy <= (others => '0');
      ch_count <= (others => (others => '0'));
      o_pam_ctrl <= ((others => '0'),(others => (others => '0')));
      -- o_pam2heg <= (others =>( (others => '0') , '0') );
      o_proc_info <= (others =>( (others => '0') , '0') );

    elsif rising_edge(clk) then

      processed := 0;

      for ch_i in MAX_NUM_HEG -1 downto 0 loop
        if ch_busy(ch_i) = '1' then
          o_proc_info(MAX_NUM_HEG -1 - processed).ch <= (others => '0');
          o_proc_info(MAX_NUM_HEG -1 - processed).processed <= '0';
          o_cvp_ctrl(ch_i) <= '0';
          if ch_count(ch_i) < LATENCY_HPS_CH then
            ch_count(ch_i) <= ch_count(ch_i) + '1';
            o_pam_ctrl.data_present(ch_i) <= '0';
            processed := processed + 1;
          else
            ch_busy <= (others => '0');
            ch_count <= (others => (others => '0'));
            -- processed := processed - 1;

          end if;
          
        else
          if i_pam_update = '1' then
            
            if processed < to_integer(i_num_cand) then
              o_cvp_ctrl(ch_i) <= '1';
              o_pam_ctrl.data_present(ch_i) <= '1';
              o_pam_ctrl.addr_orig(ch_i) <= std_logic_vector(to_unsigned(MAX_NUM_HEG -1 - processed,4));
              o_proc_info(MAX_NUM_HEG -1 - processed).ch <= std_logic_vector(to_unsigned(ch_i,4));
              o_proc_info(MAX_NUM_HEG -1 - processed).processed <= '1';
              ch_busy(ch_i) <= '1';
              processed := processed + 1;
            else

            end if;
          else
            o_proc_info(MAX_NUM_HEG -1 - processed).ch <= (others => '0');
            o_proc_info(MAX_NUM_HEG -1 - processed).processed <= '0';
          end if;
        end if;
        
      end loop;

      processing <= processed;

    end if;

  end process;
  
  
end architecture beh;