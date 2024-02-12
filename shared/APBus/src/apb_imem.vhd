--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: apbus memory interface 
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
-- use shared_lib.common_ieee_pkg.all;
-- use shared_lib.l0mdt_constants_pkg.all;
-- use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.config_pkg.all;
use shared_lib.detector_time_param_pkg.all;

library apbus_lib;
-- use apbus_lib.apb_pkg.all;

library ctrl_lib;
use ctrl_lib.APB_MEM_SIG_CTRL.all;
use ctrl_lib.MEM_INT_10A148D_CTRL.all;
use ctrl_lib.MEM_INT_12A42D_CTRL.all;
-- use ctrl_lib.MEM_INT_10A147D_CTRL.all;
use ctrl_lib.MEM_INT_12A148D_CTRL.all;
use ctrl_lib.MEM_INT_9A19D_CTRL.all;
use ctrl_lib.MEM_INT_10A9D_CTRL.all;
use ctrl_lib.MEM_INT_10A38D_CTRL.all;
use ctrl_lib.MEM_INT_4A17D_CTRL.all;
use ctrl_lib.MEM_INT_8A16D_CTRL.all;


entity apb_imem is
  generic(
    g_XML_NODE_NAME     : string; -- := "MEM_INT_10A148D";
    g_MEMORY_TYPE       : string;
    -- g_INTERNAL_CLK      : std_logic := '1';
    g_ADDR_WIDTH        : integer := 0;
    g_DATA_WIDTH        : integer := 0;
    g_MEM_LATENCY       : integer := 0;    
    -- g_APBUS_CTRL_WIDTH  : integer := 0;
    -- g_APBUS_MON_WIDTH   : integer := 0
    g_PARALLEL_MEM      : integer := 0
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic := '1';
    --
    ctrl_v          : in std_logic_vector;--(g_APBUS_CTRL_WIDTH - 1 downto 0);
    mon_v           : out std_logic_vector;--(g_APBUS_MON_WIDTH - 1 downto 0);
    --
    i_freeze      : in std_logic := '0';--(1 downto 0) := (others => '0');
    o_freeze      : out std_logic; --_vector(1 downto 0);
    o_mem_sel     : out std_logic_vector(3 downto 0);
    -- o_freeze_1    : in std_logic := '0';
    --
    o_rd_addr     : out std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    o_wr_addr     : out std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    o_wr_data        : out std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    o_rd_dv       : out std_logic;
    o_wr_dv       : out std_logic;
    i_rd_data        : in  std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    i_rd_dv          : in  std_logic

  );
end entity apb_imem;

architecture beh of apb_imem is
  -- signal axi_rst      : std_logic;
  -- signal axi_clk      : std_logic;

  -- signal int_rd_addr     : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  -- signal int_wr_addr     : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  -- signal int_wr_data     : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
  -- signal int_wr_dv       : std_logic;
  -- signal int_rd_data     : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
  -- signal int_rd_dv       : std_logic;

  -- signal apb_wr_status : std_logic_vector(3 downto 0);
  -- signal apb_rd_status : std_logic_vector(3 downto 0);
  signal int_wr_status : unsigned(3 downto 0);
  signal int_rd_status : unsigned(3 downto 0);

  -- signal new_apb_wr_req : std_logic;
  -- signal new_apb_rd_req : std_logic;

  constant apb_clk_lat : integer := c_CLK_AXI_MULT;
  signal  apb_clk_cnt : integer;

  ----------------------------

  signal apb_ctrl_r       : APB_MEM_SIG_CTRL_t;
  signal apb_ctrl_v       : std_logic_vector(APB_MEM_SIG_CTRL_t'w -1 downto 0);
  signal apb_mon_r        : APB_MEM_SIG_MON_t;
  signal apb_mon_v        : std_logic_vector(APB_MEM_SIG_MON_t'w -1 downto 0);

  signal apb_rd_addr      : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  signal apb_wr_addr      : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  signal apb_wr_data      : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
  signal apb_rd_data      : std_logic_vector(g_DATA_WIDTH - 1 downto 0);

  signal ctrl_4A17D_r     : MEM_INT_4A17D_CTRL_t;
  signal mon_4A17D_r      : MEM_INT_4A17D_MON_t;
  signal ctrl_9A19D_r     : MEM_INT_9A19D_CTRL_t;
  signal mon_9A19D_r      : MEM_INT_9A19D_MON_t;
  signal ctrl_10A9D_r     : MEM_INT_10A9D_CTRL_t;
  signal mon_10A9D_r      : MEM_INT_10A9D_MON_t;
  signal ctrl_10A38D_r    : MEM_INT_10A38D_CTRL_t;
  signal mon_10A38D_r     : MEM_INT_10A38D_MON_t;
  signal ctrl_12A42D_r    : MEM_INT_12A42D_CTRL_t;
  signal mon_12A42D_r     : MEM_INT_12A42D_MON_t;
  signal ctrl_12A148D_r   : MEM_INT_12A148D_CTRL_t;
  signal mon_12A148D_r    : MEM_INT_12A148D_MON_t;  
  signal ctrl_8A16D_r     : MEM_INT_8A16D_CTRL_t;
  signal mon_8A16D_r      : MEM_INT_8A16D_MON_t;

  signal axi_rep_clk      : std_logic;
  signal axi_cnt_wait     : std_logic;
  signal axi_cnt_reset    : std_logic;


begin

  model_mem: if g_XML_NODE_NAME = "MEM_INT_10A38D" generate
    ctrl_10A38D_r <= convert(ctrl_v,ctrl_10A38D_r);
    apb_ctrl_v    <= convert(ctrl_10A38D_r.SIGNALS,apb_ctrl_v);
    apb_ctrl_r    <= convert(apb_ctrl_v,apb_ctrl_r);
    apb_rd_addr   <= ctrl_10A38D_r.rd_addr;
    apb_wr_addr   <= ctrl_10A38D_r.wr_addr;
    apb_wr_data   <= convert(ctrl_10A38D_r.wr_data,apb_wr_data);
    --
    mon_10A38D_r.rd_data <= convert(apb_rd_data,mon_10A38D_r.rd_data);
    apb_mon_v  <= convert(apb_mon_r,apb_mon_v);
    mon_10A38D_r.SIGNALS <= convert(apb_mon_v,mon_10A38D_r.SIGNALS); 

    mon_v <= convert(mon_10A38D_r,mon_v);
  elsif g_XML_NODE_NAME = "MEM_INT_12A148D" generate
    ctrl_12A148D_r <= convert(ctrl_v,ctrl_12A148D_r);
    apb_ctrl_v    <= convert(ctrl_12A148D_r.SIGNALS,apb_ctrl_v);
    apb_ctrl_r    <= convert(apb_ctrl_v,apb_ctrl_r);
    apb_rd_addr   <= ctrl_12A148D_r.rd_addr;
    apb_wr_addr   <= ctrl_12A148D_r.wr_addr;
    apb_wr_data   <= convert(ctrl_12A148D_r.wr_data,apb_wr_data);
    --
    mon_12A148D_r.rd_data <= convert(apb_rd_data,mon_12A148D_r.rd_data);
    apb_mon_v  <= convert(apb_mon_r,apb_mon_v);
    mon_12A148D_r.SIGNALS <= convert(apb_mon_v,mon_12A148D_r.SIGNALS); 

    mon_v <= convert(mon_12A148D_r,mon_v);
  elsif g_XML_NODE_NAME = "MEM_INT_12A42D" generate
    ctrl_12A42D_r <= convert(ctrl_v,ctrl_12A42D_r);
    apb_ctrl_v    <= convert(ctrl_12A42D_r.SIGNALS,apb_ctrl_v);
    apb_ctrl_r    <= convert(apb_ctrl_v,apb_ctrl_r);
    apb_rd_addr   <= ctrl_12A42D_r.rd_addr;
    apb_wr_addr   <= ctrl_12A42D_r.wr_addr;
    apb_wr_data   <= convert(ctrl_12A42D_r.wr_data,apb_wr_data);
    --
    mon_12A42D_r.rd_data <= convert(apb_rd_data,mon_12A42D_r.rd_data);
    apb_mon_v  <= convert(apb_mon_r,apb_mon_v);
    mon_12A42D_r.SIGNALS <= convert(apb_mon_v,mon_12A42D_r.SIGNALS); 

    mon_v <= convert(mon_12A42D_r,mon_v);
  elsif g_XML_NODE_NAME = "MEM_INT_10A9D" generate
    ctrl_10A9D_r <= convert(ctrl_v,ctrl_10A9D_r);
    apb_ctrl_v    <= convert(ctrl_10A9D_r.SIGNALS,apb_ctrl_v);
    apb_ctrl_r    <= convert(apb_ctrl_v,apb_ctrl_r);
    apb_rd_addr   <= ctrl_10A9D_r.rd_addr;
    apb_wr_addr   <= ctrl_10A9D_r.wr_addr;
    apb_wr_data   <= convert(ctrl_10A9D_r.wr_data,apb_wr_data);
    --
    mon_10A9D_r.rd_data <= convert(apb_rd_data,mon_10A9D_r.rd_data);
    apb_mon_v  <= convert(apb_mon_r,apb_mon_v);
    mon_10A9D_r.SIGNALS <= convert(apb_mon_v,mon_10A9D_r.SIGNALS); 

    mon_v <= convert(mon_10A9D_r,mon_v);
  elsif g_XML_NODE_NAME = "MEM_INT_4A17D" generate
    ctrl_4A17D_r <= convert(ctrl_v,ctrl_4A17D_r);
    apb_ctrl_v    <= convert(ctrl_4A17D_r.SIGNALS,apb_ctrl_v);
    apb_ctrl_r    <= convert(apb_ctrl_v,apb_ctrl_r);
    apb_rd_addr   <= ctrl_4A17D_r.rd_addr;
    apb_wr_addr   <= ctrl_4A17D_r.wr_addr;
    apb_wr_data   <= convert(ctrl_4A17D_r.wr_data,apb_wr_data);
    --
    mon_4A17D_r.rd_data <= convert(apb_rd_data,mon_4A17D_r.rd_data);
    apb_mon_v  <= convert(apb_mon_r,apb_mon_v);
    mon_4A17D_r.SIGNALS <= convert(apb_mon_v,mon_4A17D_r.SIGNALS); 

    mon_v <= convert(mon_4A17D_r,mon_v);
  elsif g_XML_NODE_NAME = "MEM_INT_8A16D" generate
    ctrl_8A16D_r <= convert(ctrl_v,ctrl_8A16D_r);
    apb_ctrl_v    <= convert(ctrl_8A16D_r.SIGNALS,apb_ctrl_v);
    apb_ctrl_r    <= convert(apb_ctrl_v,apb_ctrl_r);
    apb_rd_addr   <= ctrl_8A16D_r.rd_addr;
    apb_wr_addr   <= ctrl_8A16D_r.wr_addr;
    apb_wr_data   <= convert(ctrl_8A16D_r.wr_data,apb_wr_data);
    --
    mon_8A16D_r.rd_data <= convert(apb_rd_data,mon_8A16D_r.rd_data);
    apb_mon_v  <= convert(apb_mon_r,apb_mon_v);
    mon_8A16D_r.SIGNALS <= convert(apb_mon_v,mon_8A16D_r.SIGNALS); 

    mon_v <= convert(mon_8A16D_r,mon_v);
  end generate model_mem;

  MEM_TYPE: if g_MEMORY_TYPE = "distributed" generate
    MEM_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_rd_addr <= (others =>'0');
          o_wr_addr <= (others =>'0');
          o_wr_data <= (others =>'0');
          apb_rd_data <= (others => '0');
          o_rd_dv   <= '0';
          o_rd_dv   <= '0';
          o_freeze  <= '0';
          o_mem_sel <= (others => '0');
          --
          axi_rep_clk <= '0';
          --
          apb_clk_cnt <= 0;
          axi_cnt_wait <= '0';
          axi_cnt_reset <= '0';
          --
          int_wr_status <=  x"0";
          int_rd_status <=  x"0";

          apb_mon_r <= zero(apb_mon_r);
  
        else
          -----------------------------------------------
          if apb_clk_cnt < apb_clk_lat and axi_cnt_reset = '0' then
            apb_clk_cnt <= apb_clk_cnt + 1;
          else
            apb_clk_cnt <= 0;
            axi_rep_clk <= not axi_rep_clk;
          end if;
          -----------------------------------------------
          if i_freeze = '1' or apb_ctrl_r.freeze_req = '1' then
            o_freeze <= '1';
            apb_mon_r.freeze_ena <= '1';
          else
            o_freeze <= '0';
            apb_mon_r.freeze_ena <= '0';
          end if;
          -----------------------------------------------
          if g_PARALLEL_MEM > 0 then
            o_mem_sel <= std_logic_vector(resize(unsigned(apb_ctrl_r.mem_sel),4));
          end if;
          -----------------------------------------------
          case int_wr_status is
            -- when x"0" => -- INIT
            --   if axi_cnt_wait = '0' then
            --     int_wr_status <= x"1";
            --   end if;
            when x"0" =>
              if apb_ctrl_r.wr_req = '1' and axi_cnt_wait = '0' then
                axi_cnt_reset <= '1';
  
                o_wr_addr <= apb_wr_addr;
                o_wr_data    <= apb_wr_data;
                o_wr_dv      <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_wr_data <= (others => '0');
                o_wr_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_wr_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              axi_cnt_reset <= '0';
              o_wr_addr <= (others => '0');
              o_wr_data <= (others => '0');
              o_wr_dv <= '0';
              int_wr_status <= x"0";
              -- if int_wr_status = unsigned(apb_clk_limit) then
              --   int_wr_status <= x"1";
              -- else
              --   int_wr_status <= int_wr_status + 1;
              -- end if;
  
          end case;
  
          case int_rd_status is
            -- when x"0" => -- INIT
            --   if axi_cnt_wait = '0' then
            --     int_wr_status <= x"1";
            --   end if;
            when x"0" =>
              if apb_ctrl_r.rd_ack = '1' then
                apb_mon_r.rd_rdy <= '0';
              end if;
              if apb_ctrl_r.rd_req = '1' and axi_cnt_wait = '0' then
                axi_cnt_reset <= '1';
                
                apb_mon_r.rd_rdy <= '0';
                o_rd_addr <= apb_wr_addr;
                o_rd_dv      <= '1';
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
                o_rd_dv <= '0';
              end if;
  
            when others =>
              if i_rd_dv = '1' then
                apb_rd_data <= i_rd_data;
                int_rd_status <= x"0";
                apb_mon_r.rd_rdy <= '1';
              else

              end if;
  
          end case;
  
          
        end if;
      end if;
    end process MEM_INT;
  elsif g_MEMORY_TYPE = "ultra" generate
    MEM_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_rd_addr <= (others =>'0');
          o_wr_addr <= (others =>'0');
          o_wr_data <= (others =>'0');
          apb_rd_data <= (others => '0');
          o_rd_dv   <= '0';
          o_rd_dv   <= '0';
          o_freeze  <= '0';
          o_mem_sel <= (others => '0');
          --
          axi_rep_clk <= '0';
          --
          apb_clk_cnt <= 0;
          axi_cnt_wait <= '0';
          axi_cnt_reset <= '0';
          --
          int_wr_status <=  x"0";
          int_rd_status <=  x"0";

          apb_mon_r <= zero(apb_mon_r);

  
        else
          -----------------------------------------------
          if apb_clk_cnt < apb_clk_lat and axi_cnt_reset = '0' then
            apb_clk_cnt <= apb_clk_cnt + 1;
          else
            apb_clk_cnt <= 0;
            axi_rep_clk <= not axi_rep_clk;
          end if;
          -----------------------------------------------
          if i_freeze = '1' or apb_ctrl_r.freeze_req = '1' then
            o_freeze <= '1';
            apb_mon_r.freeze_ena <= '1';
          else
            o_freeze <= '0';
            apb_mon_r.freeze_ena <= '0';
          end if;
          -----------------------------------------------

          if g_PARALLEL_MEM > 0 then
            for i_sel in g_PARALLEL_MEM downto 0 loop
              if i_sel = to_integer(unsigned(apb_ctrl_r.mem_sel)) then
                o_mem_sel(i_sel) <= '1';
              else
                o_mem_sel(i_sel) <= '0';
              end if;
            end loop;
          end if;
          -----------------------------------------------
  
          case int_wr_status is
            -- when x"0" => -- INIT
            --   if axi_cnt_wait = '0' then
            --     int_wr_status <= x"1";
            --   end if;
            when x"0" =>
              if apb_ctrl_r.wr_req = '1' and axi_cnt_wait = '0' then
                axi_cnt_reset <= '1';
  
                o_wr_addr <= apb_wr_addr;
                o_wr_data    <= apb_wr_data;
                o_wr_dv      <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_wr_data <= (others => '0');
                o_wr_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_wr_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              axi_cnt_reset <= '0';
              o_wr_addr <= (others => '0');
              o_wr_data <= (others => '0');
              o_wr_dv <= '0';
              int_wr_status <= x"0";
              -- if int_wr_status = unsigned(apb_clk_limit) then
              --   int_wr_status <= x"1";
              -- else
              --   int_wr_status <= int_wr_status + 1;
              -- end if;
  
          end case;
  
          case int_rd_status is
            -- when x"0" => -- INIT
            --   if axi_cnt_wait = '0' then
            --     int_wr_status <= x"1";
            --   end if;
            when x"0" =>
              if apb_ctrl_r.rd_ack = '1' then
                apb_mon_r.rd_rdy <= '0';
              end if;
              if apb_ctrl_r.rd_req = '1' and axi_cnt_wait = '0' then
                axi_cnt_reset <= '1';
  
                o_rd_addr <= apb_wr_addr;
                o_rd_dv      <= '1';
                apb_mon_r.rd_rdy <= '0';
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
                o_rd_dv <= '0';
              end if;
  
            when others =>
              if i_rd_dv = '1' then
                apb_rd_data <= i_rd_data;
                int_rd_status <= x"0";
                apb_mon_r.rd_rdy <= '1';
              else

              end if;
  
          end case;
  
          
        end if;
      end if;
    end process MEM_INT;
  elsif g_MEMORY_TYPE = "bram" generate
  end generate MEM_TYPE;
 


end architecture beh;

