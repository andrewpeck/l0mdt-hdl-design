--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

library apbus_lib;
-- use apbus_lib.apb_pkg.all;

library ctrl_lib;
use ctrl_lib.MEM_INT_10A148D_CTRL.all;
use ctrl_lib.MEM_INT_12A42D_CTRL.all;
use ctrl_lib.MEM_INT_12A148D_CTRL.all;
use ctrl_lib.MEM_INT_9A19D_CTRL.all;
use ctrl_lib.MEM_INT_10A38D_CTRL.all;
use ctrl_lib.MEM_INT_4A17D_CTRL.all;


entity apb_mem_int is
  generic(
    g_XML_NODE_NAME     : string; -- := "MEM_INT_10A148D";
    g_MEMORY_TYPE       : string := "ultra" ;
    g_INTERNAL_CLK      : std_logic := '1';
    g_ADDR_WIDTH        : integer := 0;
    g_DATA_WIDTH        : integer := 0;
    g_MEM_LATENCY       : integer := 0;    
    g_APBUS_CTRL_WIDTH  : integer := 0;
    g_APBUS_MON_WIDTH   : integer := 0
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic := '1';
    --
    ctrl          : in std_logic_vector(g_APBUS_CTRL_WIDTH - 1 downto 0);
    mon           : out std_logic_vector(g_APBUS_MON_WIDTH - 1 downto 0);
    --
    -- i_axi_clk     : in std_logic := '0';
    -- i_axi_rst     : in std_logic := '0';
    --
    -- i_freeze      : in std_logic_vector(1 downto 0) := (others => '0');
    o_freeze      : out std_logic; --_vector(1 downto 0);
    -- o_out_sel     : out std_logic_vector(1 downto 0);
    -- o_freeze_1    : in std_logic := '0';
    --
    o_rd_addr     : out std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    o_wr_addr     : out std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    o_data        : out std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    o_dv          : out std_logic;
    i_data        : in  std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    i_dv          : in  std_logic

  );
end entity apb_mem_int;

architecture beh of apb_mem_int is
  signal axi_rst      : std_logic;
  signal axi_clk      : std_logic;

  signal int_rd_addr     : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  signal int_wr_addr     : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  signal int_wr_data     : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
  signal int_wr_dv       : std_logic;
  signal int_rd_data     : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
  signal int_rd_dv       : std_logic;

  -- signal apb_wr_status : std_logic_vector(3 downto 0);
  -- signal apb_rd_status : std_logic_vector(3 downto 0);
  signal int_wr_status : unsigned(3 downto 0);
  signal int_rd_status : unsigned(3 downto 0);

  signal new_apb_wr_req : std_logic;
  signal new_apb_rd_req : std_logic;

  constant apb_clk_limit : std_logic_vector(3 downto 0) := x"5";
       

begin

  INT_CLK_EN: if g_INTERNAL_CLK generate

    PL : entity apbus_lib.apbus_main_sig
    port map(
      clk           => clk,
      rst           => rst,
      ena           => ena,
      --
      o_axi_clk     => axi_clk,
      o_axi_rst     => axi_rst
    );
    
  end generate INT_CLK_EN;

  -- INT_CLK_DIS: if not g_INTERNAL_CLK generate

  --   -- axi_rst <= i_axi_rst;
  --   -- axi_clk <= i_axi_clk;

  -- end generate INT_CLK_DIS;

  MEM_INT_12A148D: if g_XML_NODE_NAME = "MEM_INT_12A148D" generate
    signal ctrl_r   : MEM_INT_12A148D_CTRL_t;
    signal mon_r    : MEM_INT_12A148D_MON_t;
  begin

    ctrl_r <= structify(ctrl,ctrl_r);
    mon <= vectorify(mon_r,mon);

    MEM_CTRL_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_freeze <= '0'; --(others => '0');
          -- o_out_sel <= b"01";
          o_dv <= '0';
          o_data <= (others => '0');
          int_wr_status <= x"0";
          int_rd_status <= x"0";

          o_wr_addr <= (others => '0');

          mon_r <= nullify(mon_r);

        else

          case int_wr_status is
            when x"0" => -- INIT
              int_wr_status <= x"0";
            when x"1" =>
              if ctrl_r.wr_req = '1' then --apb wr 2 mem
                o_wr_addr <= ctrl_r.wr_addr;
                o_data <= vectorify(ctrl_r.wr_data,o_data);
                o_dv <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_data <= (others => '0');
                o_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              o_wr_addr <= (others => '0');
              o_data <= (others => '0');
              o_dv <= '0';
              if int_wr_status = unsigned(apb_clk_limit) then
                int_wr_status <= x"1";
              else
                int_wr_status <= int_wr_status + 1;
              end if;

          end case;

          case int_rd_status is
            when x"0" =>
            int_rd_status <= x"1";
            when x"1" =>
              if ctrl_r.rd_req = '1' then --apb wr 2 mem
                o_rd_addr <= ctrl_r.wr_addr;
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
              end if;
              if int_rd_dv = '1' then
                mon_r.rd_data <= structify(int_rd_data,mon_r.rd_data);
                mon_r.rd_rdy <= '1';
                int_rd_status <= x"2";
              else
                -- mon_r.rd_data <= structify((others => '0'),mon_r.rd_data);
                mon_r.rd_rdy <= '0';
              end if;
            -- when x"2" =>
            when others =>
              if int_rd_status = unsigned(apb_clk_limit) then
                int_rd_status <= x"1";

              else
                int_rd_status <= int_rd_status + 1;
              end if;
          end case;

          if i_dv = '1' then
            int_rd_data <= i_data;
            int_rd_dv <= '1';
          else
            -- int_rd_data <= (others =>);
            -- int_rd_dv <= '0';
          end if;

        end if;
      end if;
    end process MEM_CTRL_INT;
   
  end generate MEM_INT_12A148D;

  MEM_INT_12A42D: if g_XML_NODE_NAME = "MEM_INT_12A42D" generate
    signal ctrl_r   : MEM_INT_12A42D_CTRL_t;
    signal mon_r    : MEM_INT_12A42D_MON_t;
  begin

    ctrl_r <= structify(ctrl,ctrl_r);
    mon <= vectorify(mon_r,mon);

    MEM_CTRL_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_freeze <= '0'; --(others => '0');
          -- o_out_sel <= b"01";
          o_dv <= '0';
          o_data <= (others => '0');
          int_wr_status <= x"0";
          int_rd_status <= x"0";

          o_wr_addr <= (others => '0');

          mon_r <= nullify(mon_r);

        else

          case int_wr_status is
            when x"0" => -- INIT
              int_wr_status <= x"0";
            when x"1" =>
              if ctrl_r.wr_req = '1' then --apb wr 2 mem
                o_wr_addr <= ctrl_r.wr_addr;
                o_data <= vectorify(ctrl_r.wr_data,o_data);
                o_dv <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_data <= (others => '0');
                o_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              o_wr_addr <= (others => '0');
              o_data <= (others => '0');
              o_dv <= '0';
              if int_wr_status = unsigned(apb_clk_limit) then
                int_wr_status <= x"1";
              else
                int_wr_status <= int_wr_status + 1;
              end if;

          end case;

          case int_rd_status is
            when x"0" =>
            int_rd_status <= x"1";
            when x"1" =>
              if ctrl_r.rd_req = '1' then --apb wr 2 mem
                o_rd_addr <= ctrl_r.wr_addr;
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
              end if;
              if int_rd_dv = '1' then
                mon_r.rd_data <= structify(int_rd_data,mon_r.rd_data);
                mon_r.rd_rdy <= '1';
                int_rd_status <= x"2";
              else
                -- mon_r.rd_data <= structify((others => '0'),mon_r.rd_data);
                mon_r.rd_rdy <= '0';
              end if;
            -- when x"2" =>
            when others =>
              if int_rd_status = unsigned(apb_clk_limit) then
                int_rd_status <= x"1";

              else
                int_rd_status <= int_rd_status + 1;
              end if;
          end case;

          if i_dv = '1' then
            int_rd_data <= i_data;
            int_rd_dv <= '1';
          else
            -- int_rd_data <= (others =>);
            -- int_rd_dv <= '0';
          end if;

        end if;
      end if;
    end process MEM_CTRL_INT;
    
  end generate MEM_INT_12A42D;

  MEM_INT_10A148D: if g_XML_NODE_NAME = "MEM_INT_10A148D" generate
    signal ctrl_r   : MEM_INT_10A148D_CTRL_t;
    signal mon_r    : MEM_INT_10A148D_MON_t;
  begin

    ctrl_r <= structify(ctrl,ctrl_r);
    mon <= vectorify(mon_r,mon);

    MEM_CTRL_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_freeze <= '0'; --(others => '0');
          -- o_out_sel <= b"01";
          o_dv <= '0';
          o_data <= (others => '0');
          int_wr_status <= x"0";
          int_rd_status <= x"0";
          o_wr_addr <= (others => '0');
          mon_r <= nullify(mon_r);

        else

          case int_wr_status is
            when x"0" => -- INIT
              int_wr_status <= x"0";
            when x"1" =>
              if ctrl_r.wr_req = '1' then --apb wr 2 mem
                o_wr_addr <= ctrl_r.wr_addr;
                o_data <= vectorify(ctrl_r.wr_data,o_data);
                o_dv <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_data <= (others => '0');
                o_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              o_wr_addr <= (others => '0');
              o_data <= (others => '0');
              o_dv <= '0';
              if int_wr_status = unsigned(apb_clk_limit) then
                int_wr_status <= x"1";
              else
                int_wr_status <= int_wr_status + 1;
              end if;

          end case;

          case int_rd_status is
            when x"0" =>
            int_rd_status <= x"1";
            when x"1" =>
              if ctrl_r.rd_req = '1' then --apb wr 2 mem
                o_rd_addr <= ctrl_r.wr_addr;
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
              end if;
              if int_rd_dv = '1' then
                mon_r.rd_data <= structify(int_rd_data,mon_r.rd_data);
                mon_r.rd_rdy <= '1';
                int_rd_status <= x"2";
              else
                -- mon_r.rd_data <= structify((others => '0'),mon_r.rd_data);
                mon_r.rd_rdy <= '0';
              end if;
            -- when x"2" =>
            when others =>
              if int_rd_status = unsigned(apb_clk_limit) then
                int_rd_status <= x"1";

              else
                int_rd_status <= int_rd_status + 1;
              end if;
          end case;

          if i_dv = '1' then
            int_rd_data <= i_data;
            int_rd_dv <= '1';
          else
            -- int_rd_data <= (others =>);
            -- int_rd_dv <= '0';
          end if;

        end if;
      end if;
    end process MEM_CTRL_INT;
   
  end generate MEM_INT_10A148D;

  MEM_INT_9A19D: if g_XML_NODE_NAME = "MEM_INT_9A19D" generate
    signal ctrl_r   : MEM_INT_9A19D_CTRL_t;
    signal mon_r    : MEM_INT_9A19D_MON_t;
  begin

    ctrl_r <= structify(ctrl,ctrl_r);
    mon <= vectorify(mon_r,mon);

    MEM_CTRL_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_freeze <= '0'; --(others => '0');
          -- o_out_sel <= b"01";
          o_dv <= '0';
          o_data <= (others => '0');
          int_wr_status <= x"0";
          int_rd_status <= x"0";
          o_wr_addr <= (others => '0');
          mon_r <= nullify(mon_r);
        else

          case int_wr_status is
            when x"0" => -- INIT
              int_wr_status <= x"0";
            when x"1" =>
              if ctrl_r.wr_req = '1' then --apb wr 2 mem
                o_wr_addr <= ctrl_r.wr_addr;
                o_data <= vectorify(ctrl_r.wr_data,o_data);
                o_dv <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_data <= (others => '0');
                o_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              o_wr_addr <= (others => '0');
              o_data <= (others => '0');
              o_dv <= '0';
              if int_wr_status = unsigned(apb_clk_limit) then
                int_wr_status <= x"1";
              else
                int_wr_status <= int_wr_status + 1;
              end if;

          end case;

          case int_rd_status is
            when x"0" =>
            int_rd_status <= x"1";
            when x"1" =>
              if ctrl_r.rd_req = '1' then --apb wr 2 mem
                o_rd_addr <= ctrl_r.wr_addr;
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
              end if;
              if int_rd_dv = '1' then
                mon_r.rd_data <= structify(int_rd_data,mon_r.rd_data);
                mon_r.rd_rdy <= '1';
                int_rd_status <= x"2";
              else
                -- mon_r.rd_data <= structify((others => '0'),mon_r.rd_data);
                mon_r.rd_rdy <= '0';
              end if;
            -- when x"2" =>
            when others =>
              if int_rd_status = unsigned(apb_clk_limit) then
                int_rd_status <= x"1";

              else
                int_rd_status <= int_rd_status + 1;
              end if;
          end case;

          if i_dv = '1' then
            int_rd_data <= i_data;
            int_rd_dv <= '1';
          else
            -- int_rd_data <= (others =>);
            -- int_rd_dv <= '0';
          end if;

        end if;
      end if;
    end process MEM_CTRL_INT;
   
  end generate MEM_INT_9A19D;

  MEM_INT_10A38D: if g_XML_NODE_NAME = "MEM_INT_10A38D" generate
    signal ctrl_r   : MEM_INT_10A38D_CTRL_t;
    signal mon_r    : MEM_INT_10A38D_MON_t;

    -- type mem_int_status_type is (SYNC,IDLE,WR_REQ,RD_REQ,RD_WR_REQ);
    -- signal mem_int_status : mem_int_status_type;
  begin

    ctrl_r <= structify(ctrl,ctrl_r);
    mon <= vectorify(mon_r,mon);

    MEM_CTRL_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_freeze <= '0'; --(others => '0');
          -- o_out_sel <= b"01";
          o_dv <= '0';
          o_data <= (others => '0');
          int_wr_status <= x"0";
          int_rd_status <= x"0";
          o_wr_addr <= (others => '0');
          mon_r <= nullify(mon_r);

        else

          case int_wr_status is
            when x"0" => -- INIT
              int_wr_status <= x"0";
            when x"1" =>
              if ctrl_r.wr_req = '1' then --apb wr 2 mem
                o_wr_addr <= ctrl_r.wr_addr;
                o_data <= vectorify(ctrl_r.wr_data,o_data);
                o_dv <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_data <= (others => '0');
                o_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              o_wr_addr <= (others => '0');
              o_data <= (others => '0');
              o_dv <= '0';
              if int_wr_status = unsigned(apb_clk_limit) then
                int_wr_status <= x"1";
              else
                int_wr_status <= int_wr_status + 1;
              end if;

          end case;

          case int_rd_status is
            when x"0" =>
            int_rd_status <= x"1";
            when x"1" =>
              if ctrl_r.rd_req = '1' then --apb wr 2 mem
                o_rd_addr <= ctrl_r.wr_addr;
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
              end if;
              if int_rd_dv = '1' then
                mon_r.rd_data <= structify(int_rd_data,mon_r.rd_data);
                mon_r.rd_rdy <= '1';
                int_rd_status <= x"2";
              else
                -- mon_r.rd_data <= structify((others => '0'),mon_r.rd_data);
                mon_r.rd_rdy <= '0';
              end if;
            -- when x"2" =>
            when others =>
              if int_rd_status = unsigned(apb_clk_limit) then
                int_rd_status <= x"1";

              else
                int_rd_status <= int_rd_status + 1;
              end if;
          end case;

          if i_dv = '1' then
            int_rd_data <= i_data;
            int_rd_dv <= '1';
          else
            -- int_rd_data <= (others =>);
            -- int_rd_dv <= '0';
          end if;

        end if;
      end if;
    end process MEM_CTRL_INT;
   
  end generate MEM_INT_10A38D;

  MEM_INT_4A17D: if g_XML_NODE_NAME = "MEM_INT_4A17D" generate
    signal ctrl_r   : MEM_INT_4A17D_CTRL_t;
    signal mon_r    : MEM_INT_4A17D_MON_t;

    -- type mem_int_status_type is (SYNC,IDLE,WR_REQ,RD_REQ,RD_WR_REQ);
    -- signal mem_int_status : mem_int_status_type;
  begin

    ctrl_r <= structify(ctrl,ctrl_r);
    mon <= vectorify(mon_r,mon);

    MEM_CTRL_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          o_freeze <= '0'; --(others => '0');
          -- o_out_sel <= b"01";
          o_dv <= '0';
          o_data <= (others => '0');
          int_wr_status <= x"0";
          int_rd_status <= x"0";
          o_wr_addr <= (others => '0');
          mon_r <= nullify(mon_r);

        else

          case int_wr_status is
            when x"0" => -- INIT
              int_wr_status <= x"0";
            when x"1" =>
              if ctrl_r.wr_req = '1' then --apb wr 2 mem
                o_wr_addr <= ctrl_r.wr_addr;
                o_data <= vectorify(ctrl_r.wr_data,o_data);
                o_dv <= '1';
                int_wr_status <= x"2";
              else
                o_wr_addr <= (others => '0');
                o_data <= (others => '0');
                o_dv <= '0';
                -- new_apb_wr_req <= '0';
              end if;
            -- when x"2" =>
            --   o_wr_addr <= (others => '0');
            --   o_data <= (others => '0');
            --   o_dv <= '0';
              -- if new_apb_wr_req = '0' then
              --   int_wr_status <= x"1";
              -- end if;
            when others =>
              o_wr_addr <= (others => '0');
              o_data <= (others => '0');
              o_dv <= '0';
              if int_wr_status = unsigned(apb_clk_limit) then
                int_wr_status <= x"1";
              else
                int_wr_status <= int_wr_status + 1;
              end if;

          end case;

          case int_rd_status is
            when x"0" =>
            int_rd_status <= x"1";
            when x"1" =>
              if ctrl_r.rd_req = '1' then --apb wr 2 mem
                o_rd_addr <= ctrl_r.wr_addr;
                int_rd_status <= x"2";
              else
                o_rd_addr <= (others => '0');
              end if;
              if int_rd_dv = '1' then
                mon_r.rd_data <= structify(int_rd_data,mon_r.rd_data);
                mon_r.rd_rdy <= '1';
                int_rd_status <= x"2";
              else
                -- mon_r.rd_data <= structify((others => '0'),mon_r.rd_data);
                mon_r.rd_rdy <= '0';
              end if;
            -- when x"2" =>
            when others =>
              if int_rd_status = unsigned(apb_clk_limit) then
                int_rd_status <= x"1";

              else
                int_rd_status <= int_rd_status + 1;
              end if;
          end case;

          if i_dv = '1' then
            int_rd_data <= i_data;
            int_rd_dv <= '1';
          else
            -- int_rd_data <= (others =>);
            -- int_rd_dv <= '0';
          end if;

        end if;
      end if;
    end process MEM_CTRL_INT;
   
  end generate MEM_INT_4A17D;
  

end architecture beh;

