--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: hit extractor group, buffer mux
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

entity heg_buffermux is
  generic(
    g_HPS_NUM_MDT_CH    : integer := 6
   );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    i_control           : in heg_ctrl2hp_bus_at(g_HPS_NUM_MDT_CH -1 downto 0);
    -- MDT in
    i_mdt_hits_av       : in heg_hp2bm_bus_avt(g_HPS_NUM_MDT_CH-1 downto 0);
    -- MDT out
    o_mdt_hits_v        : out heg2sfhit_rvt
    
  );
end entity heg_buffermux;

architecture beh of heg_buffermux is

  -- TEMP ---------------------------------
  constant gc_HPS_NUM_MDT_CH    : integer := 6;
  ---------------------------------------------

  constant BM_FIFO_DEPTH : integer := 8;
  
  signal i_mdt_hits_ar : heg_hp2bm_bus_at(g_HPS_NUM_MDT_CH-1 downto 0);

  signal fifo_wr    : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_rd    : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  signal o_mdt_hits_r : heg2sfhit_rt; 

  signal ff_o_mdt_hit_av  : heg_hp2bm_data_bus_avt(g_HPS_NUM_MDT_CH-1 downto 0);
  signal ff_o_mdt_hit_dv  : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  signal buff_mdt_hit_v   : hp_hp2sf_data_rvt;
  signal buff_mdt_hit_r   : hp_hp2sf_data_rt;
  signal buff_mdt_dv      : std_logic;
  
  type fifo_used_at is array (g_HPS_NUM_MDT_CH -1 downto 0) of integer;--unsigned(integer(log2(real(BM_FIFO_DEPTH))) -1 downto 0);
  signal fifo_used        : fifo_used_at;
  signal fifo_empty       : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_empty_next  : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_full        : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_full_next   : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  type read_index_a is array (5 downto 0) of integer;
  signal next_read : read_index_a := (5,4,3,2,1,0);

  signal nexthit  : integer := 0; --std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal lasthit  : integer := 0;
  signal readhit  : std_logic;
  signal last_read : integer;
begin

  o_mdt_hits_v <= vectorify(o_mdt_hits_r);
  buff_mdt_hit_r <= structify(buff_mdt_hit_v);

  o_mdt_hits_r.localx <= buff_mdt_hit_r.local_x;
  o_mdt_hits_r.localy <= buff_mdt_hit_r.local_y;
  o_mdt_hits_r.radius <= buff_mdt_hit_r.radius;
  o_mdt_hits_r.mlayer <= buff_mdt_hit_r.mlayer;
  o_mdt_hits_r.data_valid <= buff_mdt_dv;

  FIFOS: for hp_i in g_HPS_NUM_MDT_CH-1 downto 0 generate
    -- input extraction
    
    i_mdt_hits_ar(hp_i) <= structify(i_mdt_hits_av(hp_i));

    fifo_wr(hp_i) <= i_mdt_hits_ar(hp_i).mdt_valid and i_mdt_hits_ar(hp_i).data_valid;

    rb : entity shared_lib.ring_buffer_v2
    generic map (
      g_LOGIC_TYPE    => "fifo",
      g_FIFO_TYPE     => "read_ahead",
      g_MEMORY_TYPE   => "distributed",
      -- PIPELINE_IN_REGS => 1,
      -- PIPELINE_OUT_REGS => 1,
      g_RAM_WIDTH     => HP_HP2SF_DATA_LEN,
      g_RAM_DEPTH     => BM_FIFO_DEPTH
    )
    port map (
      clk           => clk,
      rst           => rst,
      -- delay         => num_delays - 2,
      i_wr          => fifo_wr(hp_i),
      i_wr_data     => vectorify(i_mdt_hits_ar(hp_i).data),
      i_rd          => fifo_rd(hp_i),
      o_rd_dv       => ff_o_mdt_hit_dv(hp_i),
      o_rd_data     => ff_o_mdt_hit_av(hp_i),
      o_empty       => fifo_empty(hp_i),
      o_empty_next  => fifo_empty_next(hp_i),
      o_full        => fifo_full(hp_i),
      o_full_next   => fifo_full_next(hp_i),
      o_used        => fifo_used(hp_i)
    );

  end generate;

  BM_proc : process(rst,clk) 
    variable index_offset_v   : integer := 0;
    variable new_index_v      : integer := 0;
    variable loop_done_v      : integer := 0;
    variable nexthit_v        : integer := 0;
    variable last_read_v      : integer := 0;

    variable done_v           : std_logic := '0';
    variable rd_done_v        : std_logic := '0';
  begin
    
    if rising_edge(clk) then
      if(rst= '1') then
        -- o_mdt_hits <= (others => '0');
        buff_mdt_hit_v <= nullify(buff_mdt_hit_v);
        -- new_index_v := 0;
        nexthit <= 0;
        lasthit <= 0;
        readhit <= '0';

        loop_done_v := 0;

        next_read <= (5,4,3,2,1,0);

        fifo_rd <= (others => '0');

        buff_mdt_dv <= '0';

        nexthit_v := 0;
        last_read_v := 0;

      else

        fifo_rd <= (others => '0');
        -- dynamic 

        done_v := '0';

        for hp_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop

          if done_v = '0' then
            if fifo_empty(next_read(hp_i)) = '0' then
              done_v := '1';
              if lasthit = next_read(hp_i) then
                if fifo_used(next_read(hp_i)) > 1 then
                  fifo_rd(next_read(hp_i)) <= '1';
                  lasthit <= next_read(hp_i);
                  last_read_v := hp_i;
                else
                  fifo_rd(next_read(hp_i)) <= '0';
                end if;
              else
                fifo_rd(next_read(hp_i)) <= '1';
                lasthit <= next_read(hp_i);
                last_read_v := hp_i;
              end if;
            else
              if hp_i = 0 then
                fifo_rd <= (others => '0');
                lasthit <= 10;
                last_read_v := 0;
              end if;
            end if;
          end if;
        end loop;

        last_read <= last_read_v;

        for index_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
          if next_read(index_i) + last_read_v < g_HPS_NUM_MDT_CH then
            next_read(index_i) <= next_read(index_i) + last_read_v;
          else
            next_read(index_i) <= next_read(index_i) + last_read_v - g_HPS_NUM_MDT_CH ;
          end if;
        end loop;

        rd_done_v := '0';
        for hp_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
          if rd_done_v = '0' then
            if fifo_rd(hp_i) = '1' then
              rd_done_v := '1';
              buff_mdt_hit_v <= ff_o_mdt_hit_av(hp_i);
              buff_mdt_dv <= '1';
            else
              if hp_i = 0 then
                buff_mdt_hit_v <= (others => '0');
                buff_mdt_dv <= '0';
              end if;
            end if;
          end if;
        end loop;

        -- static

        -- fifo_rd <= (others => '0');

        -- if fifo_empty(next_read(5)) = '0' then
        --   if lasthit = next_read(5) then
        --     if fifo_used(next_read(5)) > 1 then
        --       fifo_rd(next_read(5)) <= '1';
        --       lasthit <= next_read(5);
        --       last_read_v := 5;
        --     else
        --       fifo_rd(next_read(5)) <= '0';
        --     end if;
        --   else
        --     fifo_rd(next_read(5)) <= '1';
        --     lasthit <= next_read(5);
        --     last_read_v := 5;
        --   end if;

        -- elsif fifo_empty(next_read(4)) = '0' then
        --   if lasthit = next_read(4) then
        --     if fifo_used(next_read(4)) > 1 then
        --       fifo_rd(next_read(4)) <= '1';
        --       lasthit <= next_read(4);
        --       last_read_v := 4;
        --     else
        --       fifo_rd(next_read(4)) <= '0';
        --     end if;
        --   else
        --     fifo_rd(next_read(4)) <= '1';
        --     lasthit <= next_read(4);
        --     last_read_v := 4;
        --   end if;

        -- elsif fifo_empty(next_read(3)) = '0' then
        --   if lasthit = next_read(3) then
        --     if fifo_used(next_read(3)) > 1 then
        --       fifo_rd(next_read(3)) <= '1';
        --       lasthit <= next_read(3);
        --       last_read_v := 3;
        --     else
        --       fifo_rd(next_read(3)) <= '0';
        --     end if;
        --   else
        --     fifo_rd(next_read(3)) <= '1';
        --     lasthit <= next_read(3);
        --     last_read_v := 3;
        --   end if;

        -- elsif fifo_empty(next_read(2)) = '0' then
        --   if lasthit = next_read(2) then
        --     if fifo_used(next_read(2)) > 1 then
        --       fifo_rd(next_read(2)) <= '1';
        --       lasthit <= next_read(2);
        --       last_read_v := 2;
        --     else
        --       fifo_rd(next_read(2)) <= '0';
        --     end if;
        --   else
        --     fifo_rd(next_read(2)) <= '1';
        --     lasthit <= next_read(2);
        --     last_read_v := 2;
        --   end if;

        -- elsif fifo_empty(next_read(1)) = '0' then
        --   if lasthit = next_read(1) then
        --     if fifo_used(next_read(1)) > 1 then
        --       fifo_rd(next_read(1)) <= '1';
        --       lasthit <= next_read(1);
        --       last_read_v := 1;
        --     else
        --       fifo_rd(next_read(1)) <= '0';
        --     end if;
        --   else
        --     fifo_rd(next_read(1)) <= '1';
        --     lasthit <= next_read(1);
        --     last_read_v := 1;
        --   end if;

        -- elsif fifo_empty(next_read(0)) = '0' then

        --   if lasthit = next_read(0) then
        --     if fifo_used(next_read(0)) > 1 then
        --       fifo_rd(next_read(0)) <= '1';
        --       lasthit <= next_read(0);
        --       last_read_v := 0;
        --     else
        --       fifo_rd(next_read(0)) <= '0';
        --       -- last_read_v := 7;
        --     end if;
        --   else
        --     fifo_rd(next_read(0)) <= '1';
        --     lasthit <= next_read(0);
        --     last_read_v := 0;
        --   end if;

        --   -- fifo_rd(next_read(0)) <= '1';
        --   -- lasthit <= next_read(0);
        --   -- last_read_v := 7;
        -- else
        --   fifo_rd <= (others => '0');
        --   lasthit <= 10;
        --   last_read_v := 0;
        -- end if;

        -- last_read <= last_read_v;

        -- for index_i in 5 downto 0 loop
        --   if next_read(index_i) + last_read_v < 6 then
        --     next_read(index_i) <= next_read(index_i) + last_read_v;
        --   else
        --     next_read(index_i) <= next_read(index_i) + last_read_v - 6 ;
        --   end if;
        -- end loop;


        -- if fifo_rd(5) = '1' then
        --   buff_mdt_hit_v <= ff_o_mdt_hit_av(5);
        --   buff_mdt_dv <= '1';
        -- elsif fifo_rd(4) = '1' then
        --   buff_mdt_hit_v <= ff_o_mdt_hit_av(4);
        -- elsif fifo_rd(3) = '1' then
        --   buff_mdt_hit_v <= ff_o_mdt_hit_av(3);
        --   buff_mdt_dv <= '1';
        -- elsif fifo_rd(2) = '1' then
        --   buff_mdt_hit_v <= ff_o_mdt_hit_av(2);
        --   buff_mdt_dv <= '1';
        -- elsif fifo_rd(1) = '1' then
        --   buff_mdt_hit_v <= ff_o_mdt_hit_av(1);
        --   buff_mdt_dv <= '1';
        -- elsif fifo_rd(0) = '1' then
        --   buff_mdt_hit_v <= ff_o_mdt_hit_av(0);
        --   buff_mdt_dv <= '1';
        -- else
        --   buff_mdt_hit_v <= (others => '0');
        --   buff_mdt_dv <= '0';
        -- end if;

      end if;
    end if;
  end process;


end beh;



