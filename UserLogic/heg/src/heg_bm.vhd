--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: heg_bm.vhd
-- Module: <<moduleName>>
-- File PATH: /heg_bm.vhd
-- -----
-- File Created: Wednesday, 8th June 2022 9:54:44 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Friday, 28th October 2022 10:51:52 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2022-10-28	GLdL	fixing time issues,
--                  New BM controller block
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
-- use shared_lib.detector_param_pkg.all;

library vamc_lib;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
use heg_lib.heg_custom_pkg.all;


entity heg_buffermux is
  generic(
    g_HPS_NUM_MDT_CH    : integer := 6
   );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    i_control           : in heg_ctrl2hp_art(g_HPS_NUM_MDT_CH -1 downto 0);
    -- MDT in
    i_mdt_hits_av       : in heg_hp2bm_avt(g_HPS_NUM_MDT_CH-1 downto 0);
    -- MDT out
    o_mdt_hits_v        : out heg2sfhit_vt
    
  );
end entity heg_buffermux;

architecture beh of heg_buffermux is

  -- TEMP ---------------------------------
  constant gc_HPS_NUM_MDT_CH    : integer := 6;
  ---------------------------------------------

  constant BM_FIFO_DEPTH : integer := 8;
  
  signal i_mdt_hits_ar : heg_hp2bm_art(g_HPS_NUM_MDT_CH-1 downto 0);
  signal i_mdt_hits_data_av : heg_hp2bm_data_avt(g_HPS_NUM_MDT_CH-1 downto 0);

  -- signal d_mdt_hits_r : heg_hp2bm_rt;

  signal fifo_wr    : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_rd    : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  signal o_mdt_hits_r : heg2sfhit_rt; 

  signal ff_o_mdt_hit_av  : heg_hp2bm_data_avt(g_HPS_NUM_MDT_CH-1 downto 0);
  signal ff_o_mdt_hit_dv  : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  signal buff_mdt_hit_v   : hp_hp2sf_data_vt;
  signal buff_mdt_hit_r   : hp_hp2sf_data_rt;
  signal buff_mdt_dv      : std_logic;
  

  signal fifo_used        : fifo_used_ait(g_HPS_NUM_MDT_CH -1 downto 0);
  signal fifo_empty       : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_not_empty       : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_empty_next  : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_not_empty_next  : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_full        : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_full_next   : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  signal safeguard : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  signal next_ff2r : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);


  -- type read_index_a is array (5 downto 0) of integer;
  -- signal next_read : read_index_a := (5,4,3,2,1,0);

  -- signal nexthit  : integer := 0; --std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  -- signal lasthit  : integer := 0;
  -- signal readhit  : std_logic;
  -- signal last_read : integer;

  -- signal aux_data_v : std_logic_vector(len(i_mdt_hits_ar(0).data) - 1 downto 0);
    signal in_dv       : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
    signal in_valid_dv : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

    signal output_used : std_logic;
    signal direct_out_dv : std_logic;
begin


  o_mdt_hits_v <= convert(o_mdt_hits_r,o_mdt_hits_v);
  buff_mdt_hit_r <= convert(buff_mdt_hit_v,buff_mdt_hit_r);

  o_mdt_hits_r.localx <= buff_mdt_hit_r.local_x;
  o_mdt_hits_r.localy <= buff_mdt_hit_r.local_y;
  o_mdt_hits_r.radius <= buff_mdt_hit_r.radius;
  o_mdt_hits_r.mlayer <= buff_mdt_hit_r.mlayer;
  o_mdt_hits_r.data_valid <= buff_mdt_dv or direct_out_dv;

 

  FIFOS: for hp_i in g_HPS_NUM_MDT_CH-1 downto 0 generate


    i_mdt_hits_ar(hp_i) <= convert(i_mdt_hits_av(hp_i),i_mdt_hits_ar(hp_i));
    i_mdt_hits_data_av(hp_i) <= convert(i_mdt_hits_ar(hp_i).data,i_mdt_hits_data_av(hp_i) ); -- joooooor

    fifo_wr(hp_i) <= i_mdt_hits_ar(hp_i).mdt_valid and i_mdt_hits_ar(hp_i).data_valid;
    in_dv(hp_i)   <= i_mdt_hits_ar(hp_i).mdt_valid and i_mdt_hits_ar(hp_i).data_valid;
    in_valid_dv(hp_i) <= i_mdt_hits_ar(hp_i).mdt_valid;
    -- local_ena <= glob_en and i_control(hp_i).enable;

    rb : entity vamc_lib.vamc_rb
    generic map (

      g_SIMULATION => '1',
      g_LOGIC_TYPE    => "fifo",
      g_FIFO_TYPE     => "read_ahead",
      g_MEMORY_TYPE   => "distributed",
      -- PIPELINE_IN_REGS => 1,
      -- PIPELINE_OUT_REGS => 1,
      g_RAM_WIDTH     => i_mdt_hits_data_av(hp_i)'length,
      g_RAM_DEPTH     => BM_FIFO_DEPTH
    )
    port map (
      clk           => clk,
      rst           => rst or i_control(hp_i).rst,
      ena           => glob_en and i_control(hp_i).enable,
      -- delay         => num_delays - 2,
      i_wr          => fifo_wr(hp_i),
      i_wr_data     => i_mdt_hits_data_av(hp_i),
      i_rd          => fifo_rd(hp_i),
      o_rd_dv       => ff_o_mdt_hit_dv(hp_i),
      o_rd_data     => ff_o_mdt_hit_av(hp_i),
      o_empty       => fifo_empty(hp_i),
      o_empty_next  => fifo_empty_next(hp_i),
      o_full        => fifo_full(hp_i),
      o_full_next   => fifo_full_next(hp_i),
      o_used        => fifo_used(hp_i)
    );

    fifo_not_empty(hp_i) <= not fifo_empty(hp_i);
    fifo_not_empty_next(hp_i) <= not fifo_empty_next(hp_i);

  end generate;
  
  next_ff2r <= fifo_not_empty and not safeguard;

  IF_6HP : if g_HPS_NUM_MDT_CH = 6 generate
    BM_ctrl: process(clk)
      variable found : std_logic := '0';
      variable frst2read : integer;
    begin
      if rising_edge(clk) then
        if rst = '1' then
          fifo_rd <= (others => '0');
          buff_mdt_hit_v <= (others => '0');
          direct_out_dv <= '0';
          buff_mdt_dv <= '0';
          safeguard <= (others => '0');
          -- found := '0';
          -- frst2read := 0;
        else
          safeguard <= (others => '0');
          -------------------------------------------------
          case(to_integer(unsigned(next_ff2r))) is
          
            when 32 to 63 =>
              -- if safeguard(5) = '0' then
                buff_mdt_hit_v <= ff_o_mdt_hit_av(5);
                direct_out_dv <= '1';
                fifo_rd <= "100000";
                if not fifo_not_empty_next(5) then
                  safeguard(5) <= '1';
                end if;
            when 16 to 31 =>
              buff_mdt_hit_v <= ff_o_mdt_hit_av(4);
              direct_out_dv <= '1';
              fifo_rd <= "010000";
              if not fifo_not_empty_next(4) then
                safeguard(4) <= '1';
              end if;
            when 8 to 15 =>
              buff_mdt_hit_v <= ff_o_mdt_hit_av(3);
              direct_out_dv <= '1';
              fifo_rd <= "001000";
              if not fifo_not_empty_next(3) then
                safeguard(3) <= '1';
              end if;
            when 4 to 7 =>
              buff_mdt_hit_v <= ff_o_mdt_hit_av(2);
              direct_out_dv <= '1';
              fifo_rd <= "000100";
              if not fifo_not_empty_next(2) then
                safeguard(2) <= '1';
              end if;
            when 2 to 3 =>
              buff_mdt_hit_v <= ff_o_mdt_hit_av(1);
              direct_out_dv <= '1';
              fifo_rd <= "000010";
              if not fifo_not_empty_next(1) then
                safeguard(1) <= '1';
              end if;
            when 1 =>  
              buff_mdt_hit_v <= ff_o_mdt_hit_av(0);
              direct_out_dv <= '1';
              fifo_rd <= "000001";
              if not fifo_not_empty_next(0) then
                safeguard(0) <= '1';
              end if;
            when others =>
              fifo_rd <= "000000"; 
          end case ;
          -- if and_reduce(fifo_empty) then
          --   if output_used = '0' then
          --     for i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
          --       if in_dv(i) then
          --         buff_mdt_hit_v <= i_mdt_hits_data_av(i);
          --         direct_out_dv <= '1';
          --         for j in g_HPS_NUM_MDT_CH - 1 - i downto 0 loop
          --           fifo_wr(j) <= in_dv(j);
          --         end loop;
          --       end if;
              
          --     end loop;
          --   else
          --     direct_out_dv <= '0';
          --     fifo_wr <= in_dv;
          --   end if;
          -- else
          --   for i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
          --       if ff_o_mdt_hit_dv(i) then
          --         buff_mdt_hit_v <= ff_o_mdt_hit_av(i);
          --         direct_out_dv <= '1';
          --       end if;
              
          --     end loop;
          -- end if;
          -------------------------------------------------
          

        end if;
      end if;
    end process;
  end generate;



    -- bm_ctrl : entity heg_lib.heg_bm_ctrl
    --   generic map(
    --     g_NUM_CH => g_HPS_NUM_MDT_CH
    --   )
    --   port map(
    --     clk                 => clk,
    --     rst                 => rst,
    --     glob_en             => glob_en,

    --     i_fifo_empty => fifo_empty,
    --     i_fifo_used => 


    --   );
    -- 

  -- BM_proc : process(rst,clk) 
  --   variable index_offset_v   : integer := 0;
  --   variable new_index_v      : integer := 0;
  --   variable loop_done_v      : integer := 0;
  --   variable nexthit_v        : integer := 0;
  --   variable last_read_v      : integer := 0;

  --   variable done_v           : std_logic := '0';
  --   variable rd_done_v        : std_logic := '0';
  -- begin
    
  --   if rising_edge(clk) then
  --     if(rst= '1') then
  --       -- o_mdt_hits <= (others => '0');
  --       buff_mdt_hit_v <= zero(buff_mdt_hit_v);
  --       -- new_index_v := 0;
  --       nexthit <= 0;
  --       lasthit <= 0;
  --       readhit <= '0';

  --       loop_done_v := 0;

  --       next_read <= (5,4,3,2,1,0);

  --       fifo_rd <= (others => '0');

  --       buff_mdt_dv <= '0';

  --       nexthit_v := 0;
  --       last_read_v := 0;

  --     else

  --       fifo_rd <= (others => '0');
  --       -- dynamic 

  --       done_v := '0';

  --       for hp_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop

  --         if done_v = '0' then
  --           if fifo_empty(next_read(hp_i)) = '0' then
  --             done_v := '1';
  --             if lasthit = next_read(hp_i) then
  --               if fifo_used(next_read(hp_i)) > 1 then
  --                 fifo_rd(next_read(hp_i)) <= '1';
  --                 lasthit <= next_read(hp_i);
  --                 last_read_v := hp_i;
  --               else
  --                 fifo_rd(next_read(hp_i)) <= '0';
  --               end if;
  --             else
  --               fifo_rd(next_read(hp_i)) <= '1';
  --               lasthit <= next_read(hp_i);
  --               last_read_v := hp_i;
  --             end if;
  --           else
  --             if hp_i = 0 then
  --               fifo_rd <= (others => '0');
  --               lasthit <= 10;
  --               last_read_v := 0;
  --             end if;
  --           end if;
  --         end if;
  --       end loop;

  --       last_read <= last_read_v;

  --       for index_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
  --         if next_read(index_i) + last_read_v < g_HPS_NUM_MDT_CH then
  --           next_read(index_i) <= next_read(index_i) + last_read_v;
  --         else
  --           next_read(index_i) <= next_read(index_i) + last_read_v - g_HPS_NUM_MDT_CH ;
  --         end if;
  --       end loop;

  --       rd_done_v := '0';
  --       for hp_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
  --         if rd_done_v = '0' then
  --           if fifo_rd(hp_i) = '1' then
  --             rd_done_v := '1';
  --             buff_mdt_hit_v <= ff_o_mdt_hit_av(hp_i);
  --             buff_mdt_dv <= '1';
  --           else
  --             if hp_i = 0 then
  --               buff_mdt_hit_v <= (others => '0');
  --               buff_mdt_dv <= '0';
  --             end if;
  --           end if;
  --         end if;
  --       end loop;

  --       -- static

  --       -- fifo_rd <= (others => '0');

  --       -- if fifo_empty(next_read(5)) = '0' then
  --       --   if lasthit = next_read(5) then
  --       --     if fifo_used(next_read(5)) > 1 then
  --       --       fifo_rd(next_read(5)) <= '1';
  --       --       lasthit <= next_read(5);
  --       --       last_read_v := 5;
  --       --     else
  --       --       fifo_rd(next_read(5)) <= '0';
  --       --     end if;
  --       --   else
  --       --     fifo_rd(next_read(5)) <= '1';
  --       --     lasthit <= next_read(5);
  --       --     last_read_v := 5;
  --       --   end if;

  --       -- elsif fifo_empty(next_read(4)) = '0' then
  --       --   if lasthit = next_read(4) then
  --       --     if fifo_used(next_read(4)) > 1 then
  --       --       fifo_rd(next_read(4)) <= '1';
  --       --       lasthit <= next_read(4);
  --       --       last_read_v := 4;
  --       --     else
  --       --       fifo_rd(next_read(4)) <= '0';
  --       --     end if;
  --       --   else
  --       --     fifo_rd(next_read(4)) <= '1';
  --       --     lasthit <= next_read(4);
  --       --     last_read_v := 4;
  --       --   end if;

  --       -- elsif fifo_empty(next_read(3)) = '0' then
  --       --   if lasthit = next_read(3) then
  --       --     if fifo_used(next_read(3)) > 1 then
  --       --       fifo_rd(next_read(3)) <= '1';
  --       --       lasthit <= next_read(3);
  --       --       last_read_v := 3;
  --       --     else
  --       --       fifo_rd(next_read(3)) <= '0';
  --       --     end if;
  --       --   else
  --       --     fifo_rd(next_read(3)) <= '1';
  --       --     lasthit <= next_read(3);
  --       --     last_read_v := 3;
  --       --   end if;

  --       -- elsif fifo_empty(next_read(2)) = '0' then
  --       --   if lasthit = next_read(2) then
  --       --     if fifo_used(next_read(2)) > 1 then
  --       --       fifo_rd(next_read(2)) <= '1';
  --       --       lasthit <= next_read(2);
  --       --       last_read_v := 2;
  --       --     else
  --       --       fifo_rd(next_read(2)) <= '0';
  --       --     end if;
  --       --   else
  --       --     fifo_rd(next_read(2)) <= '1';
  --       --     lasthit <= next_read(2);
  --       --     last_read_v := 2;
  --       --   end if;

  --       -- elsif fifo_empty(next_read(1)) = '0' then
  --       --   if lasthit = next_read(1) then
  --       --     if fifo_used(next_read(1)) > 1 then
  --       --       fifo_rd(next_read(1)) <= '1';
  --       --       lasthit <= next_read(1);
  --       --       last_read_v := 1;
  --       --     else
  --       --       fifo_rd(next_read(1)) <= '0';
  --       --     end if;
  --       --   else
  --       --     fifo_rd(next_read(1)) <= '1';
  --       --     lasthit <= next_read(1);
  --       --     last_read_v := 1;
  --       --   end if;

  --       -- elsif fifo_empty(next_read(0)) = '0' then

  --       --   if lasthit = next_read(0) then
  --       --     if fifo_used(next_read(0)) > 1 then
  --       --       fifo_rd(next_read(0)) <= '1';
  --       --       lasthit <= next_read(0);
  --       --       last_read_v := 0;
  --       --     else
  --       --       fifo_rd(next_read(0)) <= '0';
  --       --       -- last_read_v := 7;
  --       --     end if;
  --       --   else
  --       --     fifo_rd(next_read(0)) <= '1';
  --       --     lasthit <= next_read(0);
  --       --     last_read_v := 0;
  --       --   end if;

  --       --   -- fifo_rd(next_read(0)) <= '1';
  --       --   -- lasthit <= next_read(0);
  --       --   -- last_read_v := 7;
  --       -- else
  --       --   fifo_rd <= (others => '0');
  --       --   lasthit <= 10;
  --       --   last_read_v := 0;
  --       -- end if;

  --       -- last_read <= last_read_v;

  --       -- for index_i in 5 downto 0 loop
  --       --   if next_read(index_i) + last_read_v < 6 then
  --       --     next_read(index_i) <= next_read(index_i) + last_read_v;
  --       --   else
  --       --     next_read(index_i) <= next_read(index_i) + last_read_v - 6 ;
  --       --   end if;
  --       -- end loop;


  --       -- if fifo_rd(5) = '1' then
  --       --   buff_mdt_hit_v <= ff_o_mdt_hit_av(5);
  --       --   buff_mdt_dv <= '1';
  --       -- elsif fifo_rd(4) = '1' then
  --       --   buff_mdt_hit_v <= ff_o_mdt_hit_av(4);
  --       -- elsif fifo_rd(3) = '1' then
  --       --   buff_mdt_hit_v <= ff_o_mdt_hit_av(3);
  --       --   buff_mdt_dv <= '1';
  --       -- elsif fifo_rd(2) = '1' then
  --       --   buff_mdt_hit_v <= ff_o_mdt_hit_av(2);
  --       --   buff_mdt_dv <= '1';
  --       -- elsif fifo_rd(1) = '1' then
  --       --   buff_mdt_hit_v <= ff_o_mdt_hit_av(1);
  --       --   buff_mdt_dv <= '1';
  --       -- elsif fifo_rd(0) = '1' then
  --       --   buff_mdt_hit_v <= ff_o_mdt_hit_av(0);
  --       --   buff_mdt_dv <= '1';
  --       -- else
  --       --   buff_mdt_hit_v <= (others => '0');
  --       --   buff_mdt_dv <= '0';
  --       -- end if;

  --     end if;
  --   end if;
  -- end process;


end beh;



