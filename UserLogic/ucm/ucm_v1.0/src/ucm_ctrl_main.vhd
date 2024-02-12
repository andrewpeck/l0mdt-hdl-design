--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Main control aka algorithm
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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_ctrl_main is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    -- extrnals
    i_data              : in ucm_prepro2ctrl_avt(c_MAX_NUM_SL -1 downto 0);
    o_csw_ctrl          : out ucm_csw_control_art(c_MAX_NUM_SL -1 downto 0);
    o_csw_ctrl_dv       : out std_logic;

    -- internals
    o_num_cand          : out unsigned(3 downto 0);
    o_pam_update        : out std_logic
    -- o_pam_dv            : out std_logic


  );
end entity ucm_ctrl_main;

architecture beh of ucm_ctrl_main is
  type alg_status_t is (
		ALG_IDLE, ALG_RUN, ALG_SET
  );
  signal alg_status   : alg_status_t;

  signal i_data_ar    : ucm_prepro2ctrl_art(c_MAX_NUM_SL -1 downto 0);
  signal data_ar      : ucm_prepro2ctrl_art(c_MAX_NUM_SL -1 downto 0);

  signal input_valids : std_logic_vector(c_MAX_NUM_SL -1 downto 0);

  -- signal o_num_cand     : unsigned(3 downto 0);
  -- signal o_pam_update   : std_logic;

  
begin
  
  pre_op: for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    i_data_ar(sl_i) <= convert(i_data(sl_i),i_data_ar(sl_i));
    input_Valids(sl_i) <= i_data_ar(sl_i).data_valid;
  end generate;

  Ctrl_logic : process(rst,clk) 
    variable sl_i : integer := 0;
    variable pl_o : integer := 0;
    variable num_hits : integer := 0;
    -- variable order : integer(c_MAX_NUM_SL -1 downto 0);
  begin

    if rising_edge(clk) then
      if rst= '1' then
        alg_Status <= ALG_IDLE;
        o_csw_ctrl <= zero(o_csw_ctrl);--((others => '0'), (others => ( others => '0')));
        o_pam_update <= '0';
        o_num_cand <= (others => '0');
        data_ar <= zero(data_ar);
        o_csw_ctrl_dv <= '0';
      else
        case alg_status is
          when ALG_IDLE =>
            o_csw_ctrl_dv <= '0';
            if or_reduce(input_Valids) = '1' then
              -- here goes the algorithm
              data_ar <= i_data_ar;
              o_csw_ctrl <= zero(o_csw_ctrl);-- ((others => '0'), (others => ( others => '0')));
              pl_o := c_MAX_NUM_SL -1;
              num_hits := 0;
              o_pam_update <= '0';
              alg_Status <= ALG_RUN;
            end if;
          when ALG_RUN =>
            for sl_i in c_MAX_NUM_SL -1 downto 0 loop
              if c_ST_nBARREL_ENDCAP = '0'  then --or c_ENDCAP_nSMALL_LARGE = '0'
                if data_ar(sl_i).data_valid = '1' then
                  o_csw_ctrl(sl_i).data_present <= '1';
                  o_csw_ctrl(sl_i).addr_dest <= std_logic_vector(to_unsigned(pl_o,4));
                  pl_o := pl_o - 1;
                  num_hits := num_hits + 1;
                end if;
              else
              end if;
            end loop;
            o_csw_ctrl_dv <= '1';

          -- if c_ST_nBARREL_ENDCAP = '0' or c_ENDCAP_nSMALL_LARGE = '0' then
            --   -- if data_ar(c_MAX_NUM_SL - pl_0).data_valid = '1' then
            --   -- end if;
            -- else
            -- end if;
              
            -- if (c_ST_nBARREL_ENDCAP and c_ENDCAP_nSMALL_LARGE) = '0' then -- 3+1+1
            --   -- barrel or small endcap
            --   if data_ar(c_MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- x1xxx
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).data_present <= '1';
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).addr_dest <= std_logic_vector(to_unsigned(c_MAX_NUM_SL - 2 - pl_o,4));
            --     pl_o := pl_o + 1;
            --   end if;
            --   if data_ar(c_MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- xx1xx
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).data_present <= '1';
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).addr_dest <= std_logic_vector(to_unsigned(c_MAX_NUM_SL - 2 - pl_o,4));
            --     pl_o := pl_o + 1;
            --   end if;
            --   if data_ar(c_MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- xxx1x
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).data_present <= '1';
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).addr_dest<= std_logic_vector(to_unsigned(c_MAX_NUM_SL - 2 - pl_o,4));
            --     pl_o := pl_o + 1;
            --   end if;
            -- else 
            --   -- large endcap
            -- end if;
              
            -- if  c_ENABLE_NEIGHBORS = '1' then -- with neigbors

            --   if data_ar(c_MAX_NUM_SL - 1).data_valid = '1' then -- xxx1x
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).data_present <= '1';
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).addr_dest <= std_logic_vector(to_unsigned(c_MAX_NUM_SL - 1,4));
            --     pl_o := pl_o + 1;
            --   end if;
            --   if data_ar(0).data_valid = '1' then -- xxx1x
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).data_present <= '1';
            --     o_csw_ctrl(c_MAX_NUM_SL - 1 - pl_o).addr_dest <= std_logic_vector(to_unsigned(0,4));
            --     pl_o := pl_o + 1;
            --   end if;

          -- end if;

            o_num_cand <= to_unsigned(num_hits,4);
            -- if num_hits > 0 then 
              o_pam_update <= '1';
            -- end if;
            alg_Status <= ALG_SET;
  
          when ALG_SET =>
          
            -- reset internals
            alg_Status <= ALG_IDLE;
            o_csw_ctrl_dv <= '0';
            o_csw_ctrl <= zero(o_csw_ctrl); -- ((others => '0'), (others => ( others => '0')));
            o_pam_update <= '0';
            o_num_cand <= (others => '0');
            alg_Status <= ALG_IDLE;
  
        end case;
      end if;
    end if;
  end process;
  
end architecture beh;
