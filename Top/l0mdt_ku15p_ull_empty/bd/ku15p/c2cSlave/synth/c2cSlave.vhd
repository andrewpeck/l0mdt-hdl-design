--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Wed Feb 22 10:32:46 2023
--Host        : atlas126a running 64-bit openSUSE Tumbleweed
--Command     : generate_target c2cSlave.bd
--Design      : c2cSlave
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_1GCQ6AD is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_1GCQ6AD;

architecture STRUCTURE of m00_couplers_imp_1GCQ6AD is
  component c2cSlave_auto_cc_11 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_11;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m00_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_cc_WREADY;
  auto_cc_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_11
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m00_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m00_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m00_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m00_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m00_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m00_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m00_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m00_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m00_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m00_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m00_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m00_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m00_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m00_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_1L58D0I is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_1L58D0I;

architecture STRUCTURE of m00_couplers_imp_1L58D0I is
  component c2cSlave_auto_cc_9 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_9;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m00_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_cc_WREADY;
  auto_cc_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_9
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m00_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m00_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m00_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m00_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m00_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m00_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m00_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m00_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m00_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m00_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m00_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m00_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m00_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m00_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_CQM8ER is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_CQM8ER;

architecture STRUCTURE of m00_couplers_imp_CQM8ER is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m00_couplers_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m00_couplers_to_m00_couplers_AWVALID;
  M_AXI_bready <= m00_couplers_to_m00_couplers_BREADY;
  M_AXI_rready <= m00_couplers_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m00_couplers_to_m00_couplers_WVALID;
  S_AXI_arready <= m00_couplers_to_m00_couplers_ARREADY;
  S_AXI_awready <= m00_couplers_to_m00_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_m00_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_m00_couplers_RVALID;
  S_AXI_wready <= m00_couplers_to_m00_couplers_WREADY;
  m00_couplers_to_m00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_m00_couplers_ARREADY <= M_AXI_arready;
  m00_couplers_to_m00_couplers_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_m00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_m00_couplers_AWREADY <= M_AXI_awready;
  m00_couplers_to_m00_couplers_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_m00_couplers_BREADY <= S_AXI_bready;
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID <= M_AXI_bvalid;
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY <= S_AXI_rready;
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID <= M_AXI_rvalid;
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_m00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_m00_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_J8O8LV is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_J8O8LV;

architecture STRUCTURE of m00_couplers_imp_J8O8LV is
  component c2cSlave_auto_cc_7 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_7;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m00_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_cc_WREADY;
  auto_cc_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_7
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m00_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m00_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m00_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m00_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m00_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m00_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m00_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m00_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m00_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m00_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m00_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m00_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m00_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m00_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1B6I3CI is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_1B6I3CI;

architecture STRUCTURE of m01_couplers_imp_1B6I3CI is
  component c2cSlave_auto_cc_8 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_8;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m01_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m01_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m01_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m01_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m01_couplers_WVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m01_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m01_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m01_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m01_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m01_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m01_couplers_to_auto_cc_WREADY;
  auto_cc_to_m01_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m01_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m01_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m01_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m01_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m01_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_8
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m01_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m01_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m01_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m01_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m01_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m01_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m01_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m01_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m01_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m01_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m01_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m01_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m01_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m01_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m01_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m01_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m01_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m01_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m01_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m01_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m01_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m01_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m01_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m01_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m01_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m01_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m01_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m01_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m01_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m01_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m01_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m01_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m01_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m01_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m01_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1I14H6A is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m01_couplers_imp_1I14H6A;

architecture STRUCTURE of m01_couplers_imp_1I14H6A is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m01_couplers_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m01_couplers_to_m01_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m01_couplers_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m01_couplers_to_m01_couplers_AWVALID(0);
  M_AXI_bready(0) <= m01_couplers_to_m01_couplers_BREADY(0);
  M_AXI_rready(0) <= m01_couplers_to_m01_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m01_couplers_to_m01_couplers_WVALID(0);
  S_AXI_arready(0) <= m01_couplers_to_m01_couplers_ARREADY(0);
  S_AXI_awready(0) <= m01_couplers_to_m01_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m01_couplers_to_m01_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m01_couplers_to_m01_couplers_RVALID(0);
  S_AXI_wready(0) <= m01_couplers_to_m01_couplers_WREADY(0);
  m01_couplers_to_m01_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_m01_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_m01_couplers_ARREADY(0) <= M_AXI_arready(0);
  m01_couplers_to_m01_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m01_couplers_to_m01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_m01_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_m01_couplers_AWREADY(0) <= M_AXI_awready(0);
  m01_couplers_to_m01_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m01_couplers_to_m01_couplers_BREADY(0) <= S_AXI_bready(0);
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RREADY(0) <= S_AXI_rready(0);
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WREADY(0) <= M_AXI_wready(0);
  m01_couplers_to_m01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_m01_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_9M3LKZ is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_9M3LKZ;

architecture STRUCTURE of m01_couplers_imp_9M3LKZ is
  component c2cSlave_auto_cc_10 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_10;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m01_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m01_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m01_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m01_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m01_couplers_WVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m01_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m01_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m01_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m01_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m01_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m01_couplers_to_auto_cc_WREADY;
  auto_cc_to_m01_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m01_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m01_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m01_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m01_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m01_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_10
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m01_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m01_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m01_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m01_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m01_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m01_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m01_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m01_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m01_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m01_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m01_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m01_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m01_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m01_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m01_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m01_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m01_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m01_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m01_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m01_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m01_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m01_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m01_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m01_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m01_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m01_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m01_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m01_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m01_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m01_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m01_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m01_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m01_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m01_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m01_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_NAYS38 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_NAYS38;

architecture STRUCTURE of m01_couplers_imp_NAYS38 is
  component c2cSlave_auto_cc_12 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_12;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m01_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m01_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m01_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m01_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m01_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m01_couplers_WVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m01_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m01_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m01_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m01_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m01_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m01_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m01_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m01_couplers_to_auto_cc_WREADY;
  auto_cc_to_m01_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m01_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m01_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m01_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m01_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m01_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_12
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m01_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m01_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m01_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m01_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m01_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m01_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m01_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m01_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m01_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m01_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m01_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m01_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m01_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m01_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m01_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m01_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m01_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m01_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m01_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m01_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m01_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m01_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m01_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m01_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m01_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m01_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m01_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m01_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m01_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m01_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m01_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m01_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m01_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m01_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m01_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_B5YFTC is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m02_couplers_imp_B5YFTC;

architecture STRUCTURE of m02_couplers_imp_B5YFTC is
  signal m02_couplers_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m02_couplers_to_m02_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m02_couplers_to_m02_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m02_couplers_to_m02_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m02_couplers_to_m02_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m02_couplers_to_m02_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m02_couplers_to_m02_couplers_AWVALID(0);
  M_AXI_bready(0) <= m02_couplers_to_m02_couplers_BREADY(0);
  M_AXI_rready(0) <= m02_couplers_to_m02_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m02_couplers_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m02_couplers_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m02_couplers_to_m02_couplers_WVALID(0);
  S_AXI_arready(0) <= m02_couplers_to_m02_couplers_ARREADY(0);
  S_AXI_awready(0) <= m02_couplers_to_m02_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_m02_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m02_couplers_to_m02_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_m02_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_m02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m02_couplers_to_m02_couplers_RVALID(0);
  S_AXI_wready(0) <= m02_couplers_to_m02_couplers_WREADY(0);
  m02_couplers_to_m02_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m02_couplers_to_m02_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_m02_couplers_ARREADY(0) <= M_AXI_arready(0);
  m02_couplers_to_m02_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m02_couplers_to_m02_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m02_couplers_to_m02_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_m02_couplers_AWREADY(0) <= M_AXI_awready(0);
  m02_couplers_to_m02_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m02_couplers_to_m02_couplers_BREADY(0) <= S_AXI_bready(0);
  m02_couplers_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m02_couplers_to_m02_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m02_couplers_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m02_couplers_to_m02_couplers_RREADY(0) <= S_AXI_rready(0);
  m02_couplers_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m02_couplers_to_m02_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m02_couplers_to_m02_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_m02_couplers_WREADY(0) <= M_AXI_wready(0);
  m02_couplers_to_m02_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_m02_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1JC34VL is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_1JC34VL;

architecture STRUCTURE of m03_couplers_imp_1JC34VL is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m03_couplers_to_m03_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m03_couplers_to_m03_couplers_AWVALID;
  M_AXI_bready <= m03_couplers_to_m03_couplers_BREADY;
  M_AXI_rready <= m03_couplers_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m03_couplers_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m03_couplers_to_m03_couplers_WVALID;
  S_AXI_arready <= m03_couplers_to_m03_couplers_ARREADY;
  S_AXI_awready <= m03_couplers_to_m03_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_m03_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_m03_couplers_RVALID;
  S_AXI_wready <= m03_couplers_to_m03_couplers_WREADY;
  m03_couplers_to_m03_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_m03_couplers_ARREADY <= M_AXI_arready;
  m03_couplers_to_m03_couplers_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_m03_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_m03_couplers_AWREADY <= M_AXI_awready;
  m03_couplers_to_m03_couplers_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_m03_couplers_BREADY <= S_AXI_bready;
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID <= M_AXI_bvalid;
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY <= S_AXI_rready;
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID <= M_AXI_rvalid;
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_m03_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_m03_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_AM3X91 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m04_couplers_imp_AM3X91;

architecture STRUCTURE of m04_couplers_imp_AM3X91 is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m04_couplers_to_m04_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m04_couplers_to_m04_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m04_couplers_to_m04_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m04_couplers_to_m04_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m04_couplers_to_m04_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m04_couplers_to_m04_couplers_AWVALID(0);
  M_AXI_bready(0) <= m04_couplers_to_m04_couplers_BREADY(0);
  M_AXI_rready(0) <= m04_couplers_to_m04_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m04_couplers_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m04_couplers_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m04_couplers_to_m04_couplers_WVALID(0);
  S_AXI_arready(0) <= m04_couplers_to_m04_couplers_ARREADY(0);
  S_AXI_awready(0) <= m04_couplers_to_m04_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_m04_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m04_couplers_to_m04_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_m04_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_m04_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m04_couplers_to_m04_couplers_RVALID(0);
  S_AXI_wready(0) <= m04_couplers_to_m04_couplers_WREADY(0);
  m04_couplers_to_m04_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m04_couplers_to_m04_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m04_couplers_to_m04_couplers_ARREADY(0) <= M_AXI_arready(0);
  m04_couplers_to_m04_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m04_couplers_to_m04_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m04_couplers_to_m04_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m04_couplers_to_m04_couplers_AWREADY(0) <= M_AXI_awready(0);
  m04_couplers_to_m04_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m04_couplers_to_m04_couplers_BREADY(0) <= S_AXI_bready(0);
  m04_couplers_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m04_couplers_to_m04_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m04_couplers_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m04_couplers_to_m04_couplers_RREADY(0) <= S_AXI_rready(0);
  m04_couplers_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m04_couplers_to_m04_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m04_couplers_to_m04_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_m04_couplers_WREADY(0) <= M_AXI_wready(0);
  m04_couplers_to_m04_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_m04_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_1JSI4MS is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m05_couplers_imp_1JSI4MS;

architecture STRUCTURE of m05_couplers_imp_1JSI4MS is
  component c2cSlave_auto_cc_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_0;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m05_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m05_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m05_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m05_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m05_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m05_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m05_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m05_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m05_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m05_couplers_WVALID : STD_LOGIC;
  signal m05_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m05_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m05_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m05_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m05_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m05_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m05_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m05_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m05_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m05_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m05_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m05_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m05_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m05_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m05_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m05_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m05_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m05_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m05_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m05_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m05_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m05_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m05_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m05_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m05_couplers_to_auto_cc_WREADY;
  auto_cc_to_m05_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m05_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m05_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m05_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m05_couplers_WREADY <= M_AXI_wready;
  m05_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m05_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m05_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m05_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m05_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m05_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m05_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m05_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m05_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m05_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_0
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m05_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m05_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m05_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m05_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m05_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m05_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m05_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m05_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m05_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m05_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m05_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m05_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m05_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m05_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m05_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m05_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m05_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m05_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m05_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m05_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m05_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m05_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m05_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m05_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m05_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m05_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m05_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m05_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m05_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m05_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m05_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m05_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m05_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m05_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m05_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_9VFMHI is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m06_couplers_imp_9VFMHI;

architecture STRUCTURE of m06_couplers_imp_9VFMHI is
  component c2cSlave_auto_cc_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_1;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m06_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m06_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m06_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m06_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m06_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m06_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m06_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m06_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m06_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m06_couplers_WVALID : STD_LOGIC;
  signal m06_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m06_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m06_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m06_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m06_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m06_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m06_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m06_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m06_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m06_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m06_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m06_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m06_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m06_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m06_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m06_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m06_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m06_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m06_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m06_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m06_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m06_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m06_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m06_couplers_to_auto_cc_WREADY;
  auto_cc_to_m06_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m06_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m06_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m06_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m06_couplers_WREADY <= M_AXI_wready;
  m06_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m06_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m06_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m06_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m06_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m06_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m06_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m06_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m06_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_1
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m06_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m06_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m06_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m06_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m06_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m06_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m06_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m06_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m06_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m06_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m06_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m06_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m06_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m06_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m06_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m06_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m06_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m06_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m06_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m06_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m06_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m06_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m06_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m06_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m06_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m06_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m06_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m06_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m06_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m06_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m06_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m06_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m06_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m06_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m06_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m07_couplers_imp_1KTHV1Z is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m07_couplers_imp_1KTHV1Z;

architecture STRUCTURE of m07_couplers_imp_1KTHV1Z is
  component c2cSlave_auto_cc_2 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_2;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m07_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m07_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m07_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m07_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m07_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m07_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m07_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m07_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m07_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m07_couplers_WVALID : STD_LOGIC;
  signal m07_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m07_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m07_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m07_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m07_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m07_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m07_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m07_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m07_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m07_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m07_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m07_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m07_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m07_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m07_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m07_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m07_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m07_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m07_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m07_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m07_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m07_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m07_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m07_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m07_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m07_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m07_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m07_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m07_couplers_to_auto_cc_WREADY;
  auto_cc_to_m07_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m07_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m07_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m07_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m07_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m07_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m07_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m07_couplers_WREADY <= M_AXI_wready;
  m07_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m07_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m07_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m07_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m07_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m07_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m07_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m07_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m07_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m07_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m07_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_2
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m07_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m07_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m07_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m07_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m07_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m07_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m07_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m07_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m07_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m07_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m07_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m07_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m07_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m07_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m07_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m07_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m07_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m07_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m07_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m07_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m07_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m07_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m07_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m07_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m07_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m07_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m07_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m07_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m07_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m07_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m07_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m07_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m07_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m07_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m07_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m08_couplers_imp_GAJIU7 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m08_couplers_imp_GAJIU7;

architecture STRUCTURE of m08_couplers_imp_GAJIU7 is
  component c2cSlave_auto_cc_3 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_3;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m08_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m08_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m08_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m08_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m08_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m08_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m08_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m08_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m08_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m08_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m08_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m08_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m08_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m08_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m08_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m08_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m08_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m08_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m08_couplers_WVALID : STD_LOGIC;
  signal m08_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m08_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m08_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m08_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m08_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m08_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m08_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m08_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m08_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m08_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m08_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m08_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m08_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m08_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m08_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m08_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m08_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m08_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m08_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m08_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m08_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m08_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m08_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m08_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m08_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m08_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m08_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m08_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m08_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m08_couplers_to_auto_cc_WREADY;
  auto_cc_to_m08_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m08_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m08_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m08_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m08_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m08_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m08_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m08_couplers_WREADY <= M_AXI_wready;
  m08_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m08_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m08_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m08_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m08_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m08_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m08_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m08_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m08_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m08_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m08_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_3
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m08_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m08_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m08_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m08_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m08_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m08_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m08_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m08_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m08_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m08_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m08_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m08_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m08_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m08_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m08_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m08_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m08_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m08_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m08_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m08_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m08_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m08_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m08_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m08_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m08_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m08_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m08_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m08_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m08_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m08_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m08_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m08_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m08_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m08_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m08_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m08_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m08_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m08_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m09_couplers_imp_1NCRAPQ is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m09_couplers_imp_1NCRAPQ;

architecture STRUCTURE of m09_couplers_imp_1NCRAPQ is
  component c2cSlave_auto_cc_4 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_4;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m09_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m09_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m09_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m09_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m09_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m09_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m09_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m09_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m09_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m09_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m09_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m09_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m09_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m09_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m09_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m09_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m09_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m09_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m09_couplers_WVALID : STD_LOGIC;
  signal m09_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m09_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m09_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m09_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m09_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m09_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m09_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m09_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m09_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m09_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m09_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m09_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m09_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m09_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m09_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m09_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m09_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m09_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m09_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m09_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m09_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m09_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m09_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m09_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m09_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m09_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m09_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m09_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m09_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m09_couplers_to_auto_cc_WREADY;
  auto_cc_to_m09_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m09_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m09_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m09_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m09_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m09_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m09_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m09_couplers_WREADY <= M_AXI_wready;
  m09_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m09_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m09_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m09_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m09_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m09_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m09_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m09_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m09_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m09_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m09_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_4
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m09_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m09_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m09_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m09_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m09_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m09_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m09_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m09_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m09_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m09_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m09_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m09_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m09_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m09_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m09_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m09_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m09_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m09_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m09_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m09_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m09_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m09_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m09_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m09_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m09_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m09_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m09_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m09_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m09_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m09_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m09_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m09_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m09_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m09_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m09_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m09_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m09_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m09_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m10_couplers_imp_1XDMGJV is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m10_couplers_imp_1XDMGJV;

architecture STRUCTURE of m10_couplers_imp_1XDMGJV is
  component c2cSlave_auto_cc_5 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_5;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m10_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m10_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m10_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m10_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m10_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m10_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m10_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m10_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m10_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m10_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m10_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m10_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m10_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m10_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m10_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m10_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m10_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m10_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m10_couplers_WVALID : STD_LOGIC;
  signal m10_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m10_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m10_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m10_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m10_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m10_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m10_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m10_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m10_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m10_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m10_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m10_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m10_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m10_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m10_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m10_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m10_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m10_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m10_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m10_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m10_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m10_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m10_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m10_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m10_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m10_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m10_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m10_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m10_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m10_couplers_to_auto_cc_WREADY;
  auto_cc_to_m10_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m10_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m10_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m10_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m10_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m10_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m10_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m10_couplers_WREADY <= M_AXI_wready;
  m10_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m10_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m10_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m10_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m10_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m10_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m10_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m10_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m10_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m10_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m10_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_5
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m10_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m10_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m10_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m10_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m10_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m10_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m10_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m10_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m10_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m10_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m10_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m10_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m10_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m10_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m10_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m10_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m10_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m10_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m10_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m10_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m10_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m10_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m10_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m10_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m10_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m10_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m10_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m10_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m10_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m10_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m10_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m10_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m10_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m10_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m10_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m10_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m10_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m10_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m11_couplers_imp_5X9RJE is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m11_couplers_imp_5X9RJE;

architecture STRUCTURE of m11_couplers_imp_5X9RJE is
  component c2cSlave_auto_cc_6 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_cc_6;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m11_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m11_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m11_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m11_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m11_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m11_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_cc_to_m11_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m11_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m11_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m11_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m11_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m11_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m11_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m11_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m11_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m11_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m11_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m11_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m11_couplers_WVALID : STD_LOGIC;
  signal m11_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m11_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m11_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m11_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m11_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m11_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m11_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m11_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m11_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m11_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m11_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m11_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m11_couplers_to_auto_cc_WVALID : STD_LOGIC;
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= auto_cc_to_m11_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_cc_to_m11_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_cc_to_m11_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_cc_to_m11_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_cc_to_m11_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_cc_to_m11_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m11_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m11_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m11_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m11_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m11_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m11_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m11_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m11_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m11_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m11_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m11_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m11_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m11_couplers_to_auto_cc_WREADY;
  auto_cc_to_m11_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m11_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m11_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m11_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m11_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m11_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m11_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m11_couplers_WREADY <= M_AXI_wready;
  m11_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m11_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m11_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m11_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m11_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m11_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m11_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m11_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m11_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m11_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m11_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component c2cSlave_auto_cc_6
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(31 downto 0) => auto_cc_to_m11_couplers_ARADDR(31 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => auto_cc_to_m11_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_cc_to_m11_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m11_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_cc_to_m11_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_cc_to_m11_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_cc_to_m11_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m11_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m11_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m11_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m11_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m11_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m11_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m11_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m11_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m11_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m11_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m11_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m11_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m11_couplers_to_auto_cc_ARADDR(31 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m11_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m11_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m11_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(31 downto 0) => m11_couplers_to_auto_cc_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => m11_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m11_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m11_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m11_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m11_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m11_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m11_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m11_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m11_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m11_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m11_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m11_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m11_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m11_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m12_couplers_imp_1YZTZUW is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m12_couplers_imp_1YZTZUW;

architecture STRUCTURE of m12_couplers_imp_1YZTZUW is
  signal m12_couplers_to_m12_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_m12_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_m12_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_m12_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_m12_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_m12_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m12_couplers_to_m12_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m12_couplers_to_m12_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m12_couplers_to_m12_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m12_couplers_to_m12_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m12_couplers_to_m12_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m12_couplers_to_m12_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m12_couplers_to_m12_couplers_AWVALID(0);
  M_AXI_bready(0) <= m12_couplers_to_m12_couplers_BREADY(0);
  M_AXI_rready(0) <= m12_couplers_to_m12_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m12_couplers_to_m12_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m12_couplers_to_m12_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m12_couplers_to_m12_couplers_WVALID(0);
  S_AXI_arready(0) <= m12_couplers_to_m12_couplers_ARREADY(0);
  S_AXI_awready(0) <= m12_couplers_to_m12_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m12_couplers_to_m12_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m12_couplers_to_m12_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m12_couplers_to_m12_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m12_couplers_to_m12_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m12_couplers_to_m12_couplers_RVALID(0);
  S_AXI_wready(0) <= m12_couplers_to_m12_couplers_WREADY(0);
  m12_couplers_to_m12_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m12_couplers_to_m12_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m12_couplers_to_m12_couplers_ARREADY(0) <= M_AXI_arready(0);
  m12_couplers_to_m12_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m12_couplers_to_m12_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m12_couplers_to_m12_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m12_couplers_to_m12_couplers_AWREADY(0) <= M_AXI_awready(0);
  m12_couplers_to_m12_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m12_couplers_to_m12_couplers_BREADY(0) <= S_AXI_bready(0);
  m12_couplers_to_m12_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m12_couplers_to_m12_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m12_couplers_to_m12_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m12_couplers_to_m12_couplers_RREADY(0) <= S_AXI_rready(0);
  m12_couplers_to_m12_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m12_couplers_to_m12_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m12_couplers_to_m12_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m12_couplers_to_m12_couplers_WREADY(0) <= M_AXI_wready(0);
  m12_couplers_to_m12_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m12_couplers_to_m12_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m13_couplers_imp_4LCA3T is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m13_couplers_imp_4LCA3T;

architecture STRUCTURE of m13_couplers_imp_4LCA3T is
  signal m13_couplers_to_m13_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m13_couplers_to_m13_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m13_couplers_to_m13_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_m13_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_m13_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_m13_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m13_couplers_to_m13_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m13_couplers_to_m13_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m13_couplers_to_m13_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m13_couplers_to_m13_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m13_couplers_to_m13_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m13_couplers_to_m13_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m13_couplers_to_m13_couplers_AWVALID(0);
  M_AXI_bready(0) <= m13_couplers_to_m13_couplers_BREADY(0);
  M_AXI_rready(0) <= m13_couplers_to_m13_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m13_couplers_to_m13_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m13_couplers_to_m13_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m13_couplers_to_m13_couplers_WVALID(0);
  S_AXI_arready(0) <= m13_couplers_to_m13_couplers_ARREADY(0);
  S_AXI_awready(0) <= m13_couplers_to_m13_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m13_couplers_to_m13_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m13_couplers_to_m13_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m13_couplers_to_m13_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m13_couplers_to_m13_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m13_couplers_to_m13_couplers_RVALID(0);
  S_AXI_wready(0) <= m13_couplers_to_m13_couplers_WREADY(0);
  m13_couplers_to_m13_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m13_couplers_to_m13_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m13_couplers_to_m13_couplers_ARREADY(0) <= M_AXI_arready(0);
  m13_couplers_to_m13_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m13_couplers_to_m13_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m13_couplers_to_m13_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m13_couplers_to_m13_couplers_AWREADY(0) <= M_AXI_awready(0);
  m13_couplers_to_m13_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m13_couplers_to_m13_couplers_BREADY(0) <= S_AXI_bready(0);
  m13_couplers_to_m13_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m13_couplers_to_m13_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m13_couplers_to_m13_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m13_couplers_to_m13_couplers_RREADY(0) <= S_AXI_rready(0);
  m13_couplers_to_m13_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m13_couplers_to_m13_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m13_couplers_to_m13_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m13_couplers_to_m13_couplers_WREADY(0) <= M_AXI_wready(0);
  m13_couplers_to_m13_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m13_couplers_to_m13_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m14_couplers_imp_1V1NUX9 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m14_couplers_imp_1V1NUX9;

architecture STRUCTURE of m14_couplers_imp_1V1NUX9 is
  signal m14_couplers_to_m14_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m14_couplers_to_m14_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m14_couplers_to_m14_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_m14_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_m14_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_m14_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m14_couplers_to_m14_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m14_couplers_to_m14_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m14_couplers_to_m14_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m14_couplers_to_m14_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m14_couplers_to_m14_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m14_couplers_to_m14_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m14_couplers_to_m14_couplers_AWVALID(0);
  M_AXI_bready(0) <= m14_couplers_to_m14_couplers_BREADY(0);
  M_AXI_rready(0) <= m14_couplers_to_m14_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m14_couplers_to_m14_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m14_couplers_to_m14_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m14_couplers_to_m14_couplers_WVALID(0);
  S_AXI_arready(0) <= m14_couplers_to_m14_couplers_ARREADY(0);
  S_AXI_awready(0) <= m14_couplers_to_m14_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m14_couplers_to_m14_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m14_couplers_to_m14_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m14_couplers_to_m14_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m14_couplers_to_m14_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m14_couplers_to_m14_couplers_RVALID(0);
  S_AXI_wready(0) <= m14_couplers_to_m14_couplers_WREADY(0);
  m14_couplers_to_m14_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m14_couplers_to_m14_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m14_couplers_to_m14_couplers_ARREADY(0) <= M_AXI_arready(0);
  m14_couplers_to_m14_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m14_couplers_to_m14_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m14_couplers_to_m14_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m14_couplers_to_m14_couplers_AWREADY(0) <= M_AXI_awready(0);
  m14_couplers_to_m14_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m14_couplers_to_m14_couplers_BREADY(0) <= S_AXI_bready(0);
  m14_couplers_to_m14_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m14_couplers_to_m14_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m14_couplers_to_m14_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m14_couplers_to_m14_couplers_RREADY(0) <= S_AXI_rready(0);
  m14_couplers_to_m14_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m14_couplers_to_m14_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m14_couplers_to_m14_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m14_couplers_to_m14_couplers_WREADY(0) <= M_AXI_wready(0);
  m14_couplers_to_m14_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m14_couplers_to_m14_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1G9VRGX is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s00_couplers_imp_1G9VRGX;

architecture STRUCTURE of s00_couplers_imp_1G9VRGX is
  signal s00_couplers_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= s00_couplers_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= s00_couplers_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= s00_couplers_to_s00_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= s00_couplers_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= s00_couplers_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= s00_couplers_to_s00_couplers_AWVALID(0);
  M_AXI_bready(0) <= s00_couplers_to_s00_couplers_BREADY(0);
  M_AXI_rready(0) <= s00_couplers_to_s00_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= s00_couplers_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= s00_couplers_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= s00_couplers_to_s00_couplers_WVALID(0);
  S_AXI_arready(0) <= s00_couplers_to_s00_couplers_ARREADY(0);
  S_AXI_awready(0) <= s00_couplers_to_s00_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_s00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= s00_couplers_to_s00_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_s00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= s00_couplers_to_s00_couplers_RVALID(0);
  S_AXI_wready(0) <= s00_couplers_to_s00_couplers_WREADY(0);
  s00_couplers_to_s00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_s00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_couplers_ARREADY(0) <= M_AXI_arready(0);
  s00_couplers_to_s00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  s00_couplers_to_s00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_s00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_s00_couplers_AWREADY(0) <= M_AXI_awready(0);
  s00_couplers_to_s00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  s00_couplers_to_s00_couplers_BREADY(0) <= S_AXI_bready(0);
  s00_couplers_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s00_couplers_to_s00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  s00_couplers_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s00_couplers_to_s00_couplers_RREADY(0) <= S_AXI_rready(0);
  s00_couplers_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_couplers_to_s00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  s00_couplers_to_s00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_s00_couplers_WREADY(0) <= M_AXI_wready(0);
  s00_couplers_to_s00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_s00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1N209JL is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1N209JL;

architecture STRUCTURE of s00_couplers_imp_1N209JL is
  component c2cSlave_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component c2cSlave_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => B"0011",
      s_axi_arlen(7 downto 0) => s00_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => B"0011",
      s_axi_awlen(7 downto 0) => s00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_ENBB8G is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s00_couplers_imp_ENBB8G;

architecture STRUCTURE of s00_couplers_imp_ENBB8G is
  signal s00_couplers_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= s00_couplers_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= s00_couplers_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= s00_couplers_to_s00_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= s00_couplers_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= s00_couplers_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= s00_couplers_to_s00_couplers_AWVALID(0);
  M_AXI_bready(0) <= s00_couplers_to_s00_couplers_BREADY(0);
  M_AXI_rready(0) <= s00_couplers_to_s00_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= s00_couplers_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= s00_couplers_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= s00_couplers_to_s00_couplers_WVALID(0);
  S_AXI_arready(0) <= s00_couplers_to_s00_couplers_ARREADY(0);
  S_AXI_awready(0) <= s00_couplers_to_s00_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_s00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= s00_couplers_to_s00_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_s00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= s00_couplers_to_s00_couplers_RVALID(0);
  S_AXI_wready(0) <= s00_couplers_to_s00_couplers_WREADY(0);
  s00_couplers_to_s00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_s00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_couplers_ARREADY(0) <= M_AXI_arready(0);
  s00_couplers_to_s00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  s00_couplers_to_s00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_s00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_s00_couplers_AWREADY(0) <= M_AXI_awready(0);
  s00_couplers_to_s00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  s00_couplers_to_s00_couplers_BREADY(0) <= S_AXI_bready(0);
  s00_couplers_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s00_couplers_to_s00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  s00_couplers_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s00_couplers_to_s00_couplers_RREADY(0) <= S_AXI_rready(0);
  s00_couplers_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_couplers_to_s00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  s00_couplers_to_s00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_s00_couplers_WREADY(0) <= M_AXI_wready(0);
  s00_couplers_to_s00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_s00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_JAWIZB is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s00_couplers_imp_JAWIZB;

architecture STRUCTURE of s00_couplers_imp_JAWIZB is
  signal s00_couplers_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= s00_couplers_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= s00_couplers_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= s00_couplers_to_s00_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= s00_couplers_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= s00_couplers_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= s00_couplers_to_s00_couplers_AWVALID(0);
  M_AXI_bready(0) <= s00_couplers_to_s00_couplers_BREADY(0);
  M_AXI_rready(0) <= s00_couplers_to_s00_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= s00_couplers_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= s00_couplers_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= s00_couplers_to_s00_couplers_WVALID(0);
  S_AXI_arready(0) <= s00_couplers_to_s00_couplers_ARREADY(0);
  S_AXI_awready(0) <= s00_couplers_to_s00_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_s00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= s00_couplers_to_s00_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_s00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= s00_couplers_to_s00_couplers_RVALID(0);
  S_AXI_wready(0) <= s00_couplers_to_s00_couplers_WREADY(0);
  s00_couplers_to_s00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_s00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_couplers_ARREADY(0) <= M_AXI_arready(0);
  s00_couplers_to_s00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  s00_couplers_to_s00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_s00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_s00_couplers_AWREADY(0) <= M_AXI_awready(0);
  s00_couplers_to_s00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  s00_couplers_to_s00_couplers_BREADY(0) <= S_AXI_bready(0);
  s00_couplers_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s00_couplers_to_s00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  s00_couplers_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s00_couplers_to_s00_couplers_RREADY(0) <= S_AXI_rready(0);
  s00_couplers_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_couplers_to_s00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  s00_couplers_to_s00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_s00_couplers_WREADY(0) <= M_AXI_wready(0);
  s00_couplers_to_s00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_s00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s01_couplers_imp_GIJM40 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s01_couplers_imp_GIJM40;

architecture STRUCTURE of s01_couplers_imp_GIJM40 is
  signal s01_couplers_to_s01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_couplers_ARPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_s01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_s01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_s01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_s01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_s01_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= s01_couplers_to_s01_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(1 downto 0) <= s01_couplers_to_s01_couplers_ARPROT(1 downto 0);
  M_AXI_arvalid(0) <= s01_couplers_to_s01_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= s01_couplers_to_s01_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(1 downto 0) <= s01_couplers_to_s01_couplers_AWPROT(1 downto 0);
  M_AXI_awvalid(0) <= s01_couplers_to_s01_couplers_AWVALID(0);
  M_AXI_bready(0) <= s01_couplers_to_s01_couplers_BREADY(0);
  M_AXI_rready(0) <= s01_couplers_to_s01_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= s01_couplers_to_s01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= s01_couplers_to_s01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= s01_couplers_to_s01_couplers_WVALID(0);
  S_AXI_arready(0) <= s01_couplers_to_s01_couplers_ARREADY(0);
  S_AXI_awready(0) <= s01_couplers_to_s01_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= s01_couplers_to_s01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= s01_couplers_to_s01_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= s01_couplers_to_s01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= s01_couplers_to_s01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= s01_couplers_to_s01_couplers_RVALID(0);
  S_AXI_wready(0) <= s01_couplers_to_s01_couplers_WREADY(0);
  s01_couplers_to_s01_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s01_couplers_to_s01_couplers_ARPROT(1 downto 0) <= S_AXI_arprot(1 downto 0);
  s01_couplers_to_s01_couplers_ARREADY(0) <= M_AXI_arready(0);
  s01_couplers_to_s01_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  s01_couplers_to_s01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s01_couplers_to_s01_couplers_AWPROT(1 downto 0) <= S_AXI_awprot(1 downto 0);
  s01_couplers_to_s01_couplers_AWREADY(0) <= M_AXI_awready(0);
  s01_couplers_to_s01_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  s01_couplers_to_s01_couplers_BREADY(0) <= S_AXI_bready(0);
  s01_couplers_to_s01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s01_couplers_to_s01_couplers_BVALID(0) <= M_AXI_bvalid(0);
  s01_couplers_to_s01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s01_couplers_to_s01_couplers_RREADY(0) <= S_AXI_rready(0);
  s01_couplers_to_s01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s01_couplers_to_s01_couplers_RVALID(0) <= M_AXI_rvalid(0);
  s01_couplers_to_s01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s01_couplers_to_s01_couplers_WREADY(0) <= M_AXI_wready(0);
  s01_couplers_to_s01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s01_couplers_to_s01_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s02_couplers_imp_1LZRTN6 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s02_couplers_imp_1LZRTN6;

architecture STRUCTURE of s02_couplers_imp_1LZRTN6 is
  component c2cSlave_auto_pc_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_auto_pc_1;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s02_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s02_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s02_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s02_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s02_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s02_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s02_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s02_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s02_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s02_couplers_WVALID : STD_LOGIC;
  signal s02_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s02_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s02_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s02_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s02_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s02_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s02_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s02_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s02_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s02_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s02_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s02_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s02_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s02_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s02_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s02_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s02_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s02_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s02_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s02_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s02_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s02_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s02_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s02_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s02_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(0) <= s02_couplers_to_auto_pc_BID(0);
  S_AXI_bresp(1 downto 0) <= s02_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s02_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s02_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(0) <= s02_couplers_to_auto_pc_RID(0);
  S_AXI_rlast <= s02_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s02_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s02_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s02_couplers_to_auto_pc_WREADY;
  auto_pc_to_s02_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s02_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s02_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s02_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s02_couplers_WREADY <= M_AXI_wready;
  s02_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s02_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s02_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s02_couplers_to_auto_pc_ARID(0) <= S_AXI_arid(0);
  s02_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s02_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  s02_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s02_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s02_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s02_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s02_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s02_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s02_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s02_couplers_to_auto_pc_AWID(0) <= S_AXI_awid(0);
  s02_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s02_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  s02_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s02_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s02_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s02_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s02_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s02_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s02_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s02_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s02_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s02_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component c2cSlave_auto_pc_1
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_s02_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s02_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s02_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s02_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s02_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s02_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s02_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s02_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s02_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s02_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s02_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s02_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s02_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s02_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s02_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s02_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s02_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s02_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s02_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s02_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s02_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s02_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(0) => s02_couplers_to_auto_pc_ARID(0),
      s_axi_arlen(7 downto 0) => s02_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => s02_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s02_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s02_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s02_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => s02_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s02_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s02_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s02_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s02_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(0) => s02_couplers_to_auto_pc_AWID(0),
      s_axi_awlen(7 downto 0) => s02_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => s02_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => s02_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s02_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s02_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s02_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s02_couplers_to_auto_pc_AWVALID,
      s_axi_bid(0) => s02_couplers_to_auto_pc_BID(0),
      s_axi_bready => s02_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s02_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s02_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s02_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(0) => s02_couplers_to_auto_pc_RID(0),
      s_axi_rlast => s02_couplers_to_auto_pc_RLAST,
      s_axi_rready => s02_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s02_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s02_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s02_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => s02_couplers_to_auto_pc_WLAST,
      s_axi_wready => s02_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s02_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s02_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c2cSlave_INTERCONNECT_INN_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end c2cSlave_INTERCONNECT_INN_0;

architecture STRUCTURE of c2cSlave_INTERCONNECT_INN_0 is
  component c2cSlave_xbar_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component c2cSlave_xbar_1;
  signal INTERCONNECT_INN_ACLK_net : STD_LOGIC;
  signal INTERCONNECT_INN_ARESETN_net : STD_LOGIC;
  signal INTERCONNECT_INN_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_INN_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_INN_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_ARREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_ARVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_AWREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_AWVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_BREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_BVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_RREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_RVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_WREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_INN_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_INTERCONNECT_INN_WVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_ARREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_ARVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_AWREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_AWVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_BREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_BVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_RREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_RVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_WREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_INN_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_INTERCONNECT_INN_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
begin
  INTERCONNECT_INN_ACLK_net <= ACLK;
  INTERCONNECT_INN_ARESETN_net <= ARESETN;
  INTERCONNECT_INN_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  INTERCONNECT_INN_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  INTERCONNECT_INN_to_s00_couplers_ARVALID(0) <= S00_AXI_arvalid(0);
  INTERCONNECT_INN_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  INTERCONNECT_INN_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  INTERCONNECT_INN_to_s00_couplers_AWVALID(0) <= S00_AXI_awvalid(0);
  INTERCONNECT_INN_to_s00_couplers_BREADY(0) <= S00_AXI_bready(0);
  INTERCONNECT_INN_to_s00_couplers_RREADY(0) <= S00_AXI_rready(0);
  INTERCONNECT_INN_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  INTERCONNECT_INN_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  INTERCONNECT_INN_to_s00_couplers_WVALID(0) <= S00_AXI_wvalid(0);
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_INTERCONNECT_INN_ARADDR(31 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_INTERCONNECT_INN_ARPROT(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_INTERCONNECT_INN_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_INTERCONNECT_INN_AWADDR(31 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_INTERCONNECT_INN_AWPROT(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_INTERCONNECT_INN_AWVALID;
  M00_AXI_bready <= m00_couplers_to_INTERCONNECT_INN_BREADY;
  M00_AXI_rready <= m00_couplers_to_INTERCONNECT_INN_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_INTERCONNECT_INN_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_INTERCONNECT_INN_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_INTERCONNECT_INN_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_INTERCONNECT_INN_ARADDR(31 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_INTERCONNECT_INN_ARPROT(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_INTERCONNECT_INN_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_INTERCONNECT_INN_AWADDR(31 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_INTERCONNECT_INN_AWPROT(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_INTERCONNECT_INN_AWVALID;
  M01_AXI_bready <= m01_couplers_to_INTERCONNECT_INN_BREADY;
  M01_AXI_rready <= m01_couplers_to_INTERCONNECT_INN_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_INTERCONNECT_INN_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_INTERCONNECT_INN_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_INTERCONNECT_INN_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready(0) <= INTERCONNECT_INN_to_s00_couplers_ARREADY(0);
  S00_AXI_awready(0) <= INTERCONNECT_INN_to_s00_couplers_AWREADY(0);
  S00_AXI_bresp(1 downto 0) <= INTERCONNECT_INN_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid(0) <= INTERCONNECT_INN_to_s00_couplers_BVALID(0);
  S00_AXI_rdata(31 downto 0) <= INTERCONNECT_INN_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rresp(1 downto 0) <= INTERCONNECT_INN_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid(0) <= INTERCONNECT_INN_to_s00_couplers_RVALID(0);
  S00_AXI_wready(0) <= INTERCONNECT_INN_to_s00_couplers_WREADY(0);
  m00_couplers_to_INTERCONNECT_INN_ARREADY <= M00_AXI_arready;
  m00_couplers_to_INTERCONNECT_INN_AWREADY <= M00_AXI_awready;
  m00_couplers_to_INTERCONNECT_INN_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_INTERCONNECT_INN_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_INTERCONNECT_INN_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_INTERCONNECT_INN_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_INTERCONNECT_INN_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_INTERCONNECT_INN_WREADY <= M00_AXI_wready;
  m01_couplers_to_INTERCONNECT_INN_ARREADY <= M01_AXI_arready;
  m01_couplers_to_INTERCONNECT_INN_AWREADY <= M01_AXI_awready;
  m01_couplers_to_INTERCONNECT_INN_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_INTERCONNECT_INN_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_INTERCONNECT_INN_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_INTERCONNECT_INN_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_INTERCONNECT_INN_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_INTERCONNECT_INN_WREADY <= M01_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_J8O8LV
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_INTERCONNECT_INN_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_INTERCONNECT_INN_ARPROT(2 downto 0),
      M_AXI_arready => m00_couplers_to_INTERCONNECT_INN_ARREADY,
      M_AXI_arvalid => m00_couplers_to_INTERCONNECT_INN_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_INTERCONNECT_INN_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_INTERCONNECT_INN_AWPROT(2 downto 0),
      M_AXI_awready => m00_couplers_to_INTERCONNECT_INN_AWREADY,
      M_AXI_awvalid => m00_couplers_to_INTERCONNECT_INN_AWVALID,
      M_AXI_bready => m00_couplers_to_INTERCONNECT_INN_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_INTERCONNECT_INN_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_INTERCONNECT_INN_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_INTERCONNECT_INN_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_INTERCONNECT_INN_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_INTERCONNECT_INN_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_INTERCONNECT_INN_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_INTERCONNECT_INN_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_INTERCONNECT_INN_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_INTERCONNECT_INN_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_INTERCONNECT_INN_WVALID,
      S_ACLK => INTERCONNECT_INN_ACLK_net,
      S_ARESETN => INTERCONNECT_INN_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1B6I3CI
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_INTERCONNECT_INN_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_INTERCONNECT_INN_ARPROT(2 downto 0),
      M_AXI_arready => m01_couplers_to_INTERCONNECT_INN_ARREADY,
      M_AXI_arvalid => m01_couplers_to_INTERCONNECT_INN_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_INTERCONNECT_INN_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_INTERCONNECT_INN_AWPROT(2 downto 0),
      M_AXI_awready => m01_couplers_to_INTERCONNECT_INN_AWREADY,
      M_AXI_awvalid => m01_couplers_to_INTERCONNECT_INN_AWVALID,
      M_AXI_bready => m01_couplers_to_INTERCONNECT_INN_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_INTERCONNECT_INN_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_INTERCONNECT_INN_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_INTERCONNECT_INN_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_INTERCONNECT_INN_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_INTERCONNECT_INN_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_INTERCONNECT_INN_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_INTERCONNECT_INN_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_INTERCONNECT_INN_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_INTERCONNECT_INN_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_INTERCONNECT_INN_WVALID,
      S_ACLK => INTERCONNECT_INN_ACLK_net,
      S_ARESETN => INTERCONNECT_INN_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
s00_couplers: entity work.s00_couplers_imp_1G9VRGX
     port map (
      M_ACLK => INTERCONNECT_INN_ACLK_net,
      M_ARESETN => INTERCONNECT_INN_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      M_AXI_bready(0) => s00_couplers_to_xbar_BREADY(0),
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready(0) => s00_couplers_to_xbar_RREADY(0),
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready(0) => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => s00_couplers_to_xbar_WVALID(0),
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => INTERCONNECT_INN_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => INTERCONNECT_INN_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arready(0) => INTERCONNECT_INN_to_s00_couplers_ARREADY(0),
      S_AXI_arvalid(0) => INTERCONNECT_INN_to_s00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => INTERCONNECT_INN_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => INTERCONNECT_INN_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awready(0) => INTERCONNECT_INN_to_s00_couplers_AWREADY(0),
      S_AXI_awvalid(0) => INTERCONNECT_INN_to_s00_couplers_AWVALID(0),
      S_AXI_bready(0) => INTERCONNECT_INN_to_s00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => INTERCONNECT_INN_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => INTERCONNECT_INN_to_s00_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => INTERCONNECT_INN_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => INTERCONNECT_INN_to_s00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => INTERCONNECT_INN_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => INTERCONNECT_INN_to_s00_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => INTERCONNECT_INN_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wready(0) => INTERCONNECT_INN_to_s00_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => INTERCONNECT_INN_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => INTERCONNECT_INN_to_s00_couplers_WVALID(0)
    );
xbar: component c2cSlave_xbar_1
     port map (
      aclk => INTERCONNECT_INN_ACLK_net,
      aresetn => INTERCONNECT_INN_ARESETN_net,
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY(0),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY(0),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c2cSlave_INTERCONNECT_MID_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end c2cSlave_INTERCONNECT_MID_0;

architecture STRUCTURE of c2cSlave_INTERCONNECT_MID_0 is
  component c2cSlave_xbar_2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component c2cSlave_xbar_2;
  signal INTERCONNECT_MID_ACLK_net : STD_LOGIC;
  signal INTERCONNECT_MID_ARESETN_net : STD_LOGIC;
  signal INTERCONNECT_MID_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_MID_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_MID_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_ARREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_ARVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_AWREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_AWVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_BREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_BVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_RREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_RVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_WREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_MID_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_INTERCONNECT_MID_WVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_ARREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_ARVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_AWREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_AWVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_BREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_BVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_RREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_RVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_WREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_MID_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_INTERCONNECT_MID_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
begin
  INTERCONNECT_MID_ACLK_net <= ACLK;
  INTERCONNECT_MID_ARESETN_net <= ARESETN;
  INTERCONNECT_MID_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  INTERCONNECT_MID_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  INTERCONNECT_MID_to_s00_couplers_ARVALID(0) <= S00_AXI_arvalid(0);
  INTERCONNECT_MID_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  INTERCONNECT_MID_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  INTERCONNECT_MID_to_s00_couplers_AWVALID(0) <= S00_AXI_awvalid(0);
  INTERCONNECT_MID_to_s00_couplers_BREADY(0) <= S00_AXI_bready(0);
  INTERCONNECT_MID_to_s00_couplers_RREADY(0) <= S00_AXI_rready(0);
  INTERCONNECT_MID_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  INTERCONNECT_MID_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  INTERCONNECT_MID_to_s00_couplers_WVALID(0) <= S00_AXI_wvalid(0);
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_INTERCONNECT_MID_ARADDR(31 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_INTERCONNECT_MID_ARPROT(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_INTERCONNECT_MID_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_INTERCONNECT_MID_AWADDR(31 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_INTERCONNECT_MID_AWPROT(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_INTERCONNECT_MID_AWVALID;
  M00_AXI_bready <= m00_couplers_to_INTERCONNECT_MID_BREADY;
  M00_AXI_rready <= m00_couplers_to_INTERCONNECT_MID_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_INTERCONNECT_MID_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_INTERCONNECT_MID_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_INTERCONNECT_MID_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_INTERCONNECT_MID_ARADDR(31 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_INTERCONNECT_MID_ARPROT(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_INTERCONNECT_MID_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_INTERCONNECT_MID_AWADDR(31 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_INTERCONNECT_MID_AWPROT(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_INTERCONNECT_MID_AWVALID;
  M01_AXI_bready <= m01_couplers_to_INTERCONNECT_MID_BREADY;
  M01_AXI_rready <= m01_couplers_to_INTERCONNECT_MID_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_INTERCONNECT_MID_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_INTERCONNECT_MID_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_INTERCONNECT_MID_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready(0) <= INTERCONNECT_MID_to_s00_couplers_ARREADY(0);
  S00_AXI_awready(0) <= INTERCONNECT_MID_to_s00_couplers_AWREADY(0);
  S00_AXI_bresp(1 downto 0) <= INTERCONNECT_MID_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid(0) <= INTERCONNECT_MID_to_s00_couplers_BVALID(0);
  S00_AXI_rdata(31 downto 0) <= INTERCONNECT_MID_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rresp(1 downto 0) <= INTERCONNECT_MID_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid(0) <= INTERCONNECT_MID_to_s00_couplers_RVALID(0);
  S00_AXI_wready(0) <= INTERCONNECT_MID_to_s00_couplers_WREADY(0);
  m00_couplers_to_INTERCONNECT_MID_ARREADY <= M00_AXI_arready;
  m00_couplers_to_INTERCONNECT_MID_AWREADY <= M00_AXI_awready;
  m00_couplers_to_INTERCONNECT_MID_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_INTERCONNECT_MID_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_INTERCONNECT_MID_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_INTERCONNECT_MID_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_INTERCONNECT_MID_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_INTERCONNECT_MID_WREADY <= M00_AXI_wready;
  m01_couplers_to_INTERCONNECT_MID_ARREADY <= M01_AXI_arready;
  m01_couplers_to_INTERCONNECT_MID_AWREADY <= M01_AXI_awready;
  m01_couplers_to_INTERCONNECT_MID_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_INTERCONNECT_MID_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_INTERCONNECT_MID_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_INTERCONNECT_MID_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_INTERCONNECT_MID_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_INTERCONNECT_MID_WREADY <= M01_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_1L58D0I
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_INTERCONNECT_MID_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_INTERCONNECT_MID_ARPROT(2 downto 0),
      M_AXI_arready => m00_couplers_to_INTERCONNECT_MID_ARREADY,
      M_AXI_arvalid => m00_couplers_to_INTERCONNECT_MID_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_INTERCONNECT_MID_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_INTERCONNECT_MID_AWPROT(2 downto 0),
      M_AXI_awready => m00_couplers_to_INTERCONNECT_MID_AWREADY,
      M_AXI_awvalid => m00_couplers_to_INTERCONNECT_MID_AWVALID,
      M_AXI_bready => m00_couplers_to_INTERCONNECT_MID_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_INTERCONNECT_MID_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_INTERCONNECT_MID_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_INTERCONNECT_MID_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_INTERCONNECT_MID_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_INTERCONNECT_MID_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_INTERCONNECT_MID_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_INTERCONNECT_MID_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_INTERCONNECT_MID_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_INTERCONNECT_MID_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_INTERCONNECT_MID_WVALID,
      S_ACLK => INTERCONNECT_MID_ACLK_net,
      S_ARESETN => INTERCONNECT_MID_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_9M3LKZ
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_INTERCONNECT_MID_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_INTERCONNECT_MID_ARPROT(2 downto 0),
      M_AXI_arready => m01_couplers_to_INTERCONNECT_MID_ARREADY,
      M_AXI_arvalid => m01_couplers_to_INTERCONNECT_MID_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_INTERCONNECT_MID_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_INTERCONNECT_MID_AWPROT(2 downto 0),
      M_AXI_awready => m01_couplers_to_INTERCONNECT_MID_AWREADY,
      M_AXI_awvalid => m01_couplers_to_INTERCONNECT_MID_AWVALID,
      M_AXI_bready => m01_couplers_to_INTERCONNECT_MID_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_INTERCONNECT_MID_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_INTERCONNECT_MID_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_INTERCONNECT_MID_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_INTERCONNECT_MID_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_INTERCONNECT_MID_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_INTERCONNECT_MID_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_INTERCONNECT_MID_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_INTERCONNECT_MID_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_INTERCONNECT_MID_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_INTERCONNECT_MID_WVALID,
      S_ACLK => INTERCONNECT_MID_ACLK_net,
      S_ARESETN => INTERCONNECT_MID_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
s00_couplers: entity work.s00_couplers_imp_ENBB8G
     port map (
      M_ACLK => INTERCONNECT_MID_ACLK_net,
      M_ARESETN => INTERCONNECT_MID_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      M_AXI_bready(0) => s00_couplers_to_xbar_BREADY(0),
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready(0) => s00_couplers_to_xbar_RREADY(0),
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready(0) => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => s00_couplers_to_xbar_WVALID(0),
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => INTERCONNECT_MID_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => INTERCONNECT_MID_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arready(0) => INTERCONNECT_MID_to_s00_couplers_ARREADY(0),
      S_AXI_arvalid(0) => INTERCONNECT_MID_to_s00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => INTERCONNECT_MID_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => INTERCONNECT_MID_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awready(0) => INTERCONNECT_MID_to_s00_couplers_AWREADY(0),
      S_AXI_awvalid(0) => INTERCONNECT_MID_to_s00_couplers_AWVALID(0),
      S_AXI_bready(0) => INTERCONNECT_MID_to_s00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => INTERCONNECT_MID_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => INTERCONNECT_MID_to_s00_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => INTERCONNECT_MID_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => INTERCONNECT_MID_to_s00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => INTERCONNECT_MID_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => INTERCONNECT_MID_to_s00_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => INTERCONNECT_MID_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wready(0) => INTERCONNECT_MID_to_s00_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => INTERCONNECT_MID_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => INTERCONNECT_MID_to_s00_couplers_WVALID(0)
    );
xbar: component c2cSlave_xbar_2
     port map (
      aclk => INTERCONNECT_MID_ACLK_net,
      aresetn => INTERCONNECT_MID_ARESETN_net,
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY(0),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY(0),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c2cSlave_INTERCONNECT_OUT_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end c2cSlave_INTERCONNECT_OUT_0;

architecture STRUCTURE of c2cSlave_INTERCONNECT_OUT_0 is
  component c2cSlave_xbar_3 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component c2cSlave_xbar_3;
  signal INTERCONNECT_OUT_ACLK_net : STD_LOGIC;
  signal INTERCONNECT_OUT_ARESETN_net : STD_LOGIC;
  signal INTERCONNECT_OUT_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_OUT_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_ARREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_ARVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_AWREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_AWVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_BREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_BVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_RREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_RVALID : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_WREADY : STD_LOGIC;
  signal m00_couplers_to_INTERCONNECT_OUT_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_INTERCONNECT_OUT_WVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_ARREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_ARVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_AWREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_AWVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_BREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_BVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_RREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_RVALID : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_WREADY : STD_LOGIC;
  signal m01_couplers_to_INTERCONNECT_OUT_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_INTERCONNECT_OUT_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
begin
  INTERCONNECT_OUT_ACLK_net <= ACLK;
  INTERCONNECT_OUT_ARESETN_net <= ARESETN;
  INTERCONNECT_OUT_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  INTERCONNECT_OUT_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  INTERCONNECT_OUT_to_s00_couplers_ARVALID(0) <= S00_AXI_arvalid(0);
  INTERCONNECT_OUT_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  INTERCONNECT_OUT_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  INTERCONNECT_OUT_to_s00_couplers_AWVALID(0) <= S00_AXI_awvalid(0);
  INTERCONNECT_OUT_to_s00_couplers_BREADY(0) <= S00_AXI_bready(0);
  INTERCONNECT_OUT_to_s00_couplers_RREADY(0) <= S00_AXI_rready(0);
  INTERCONNECT_OUT_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  INTERCONNECT_OUT_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  INTERCONNECT_OUT_to_s00_couplers_WVALID(0) <= S00_AXI_wvalid(0);
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_INTERCONNECT_OUT_ARADDR(31 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_INTERCONNECT_OUT_ARPROT(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_INTERCONNECT_OUT_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_INTERCONNECT_OUT_AWADDR(31 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_INTERCONNECT_OUT_AWPROT(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_INTERCONNECT_OUT_AWVALID;
  M00_AXI_bready <= m00_couplers_to_INTERCONNECT_OUT_BREADY;
  M00_AXI_rready <= m00_couplers_to_INTERCONNECT_OUT_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_INTERCONNECT_OUT_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_INTERCONNECT_OUT_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_INTERCONNECT_OUT_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_INTERCONNECT_OUT_ARADDR(31 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_INTERCONNECT_OUT_ARPROT(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_INTERCONNECT_OUT_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_INTERCONNECT_OUT_AWADDR(31 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_INTERCONNECT_OUT_AWPROT(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_INTERCONNECT_OUT_AWVALID;
  M01_AXI_bready <= m01_couplers_to_INTERCONNECT_OUT_BREADY;
  M01_AXI_rready <= m01_couplers_to_INTERCONNECT_OUT_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_INTERCONNECT_OUT_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_INTERCONNECT_OUT_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_INTERCONNECT_OUT_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready(0) <= INTERCONNECT_OUT_to_s00_couplers_ARREADY(0);
  S00_AXI_awready(0) <= INTERCONNECT_OUT_to_s00_couplers_AWREADY(0);
  S00_AXI_bresp(1 downto 0) <= INTERCONNECT_OUT_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid(0) <= INTERCONNECT_OUT_to_s00_couplers_BVALID(0);
  S00_AXI_rdata(31 downto 0) <= INTERCONNECT_OUT_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rresp(1 downto 0) <= INTERCONNECT_OUT_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid(0) <= INTERCONNECT_OUT_to_s00_couplers_RVALID(0);
  S00_AXI_wready(0) <= INTERCONNECT_OUT_to_s00_couplers_WREADY(0);
  m00_couplers_to_INTERCONNECT_OUT_ARREADY <= M00_AXI_arready;
  m00_couplers_to_INTERCONNECT_OUT_AWREADY <= M00_AXI_awready;
  m00_couplers_to_INTERCONNECT_OUT_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_INTERCONNECT_OUT_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_INTERCONNECT_OUT_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_INTERCONNECT_OUT_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_INTERCONNECT_OUT_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_INTERCONNECT_OUT_WREADY <= M00_AXI_wready;
  m01_couplers_to_INTERCONNECT_OUT_ARREADY <= M01_AXI_arready;
  m01_couplers_to_INTERCONNECT_OUT_AWREADY <= M01_AXI_awready;
  m01_couplers_to_INTERCONNECT_OUT_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_INTERCONNECT_OUT_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_INTERCONNECT_OUT_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_INTERCONNECT_OUT_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_INTERCONNECT_OUT_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_INTERCONNECT_OUT_WREADY <= M01_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_1GCQ6AD
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_INTERCONNECT_OUT_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_INTERCONNECT_OUT_ARPROT(2 downto 0),
      M_AXI_arready => m00_couplers_to_INTERCONNECT_OUT_ARREADY,
      M_AXI_arvalid => m00_couplers_to_INTERCONNECT_OUT_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_INTERCONNECT_OUT_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_INTERCONNECT_OUT_AWPROT(2 downto 0),
      M_AXI_awready => m00_couplers_to_INTERCONNECT_OUT_AWREADY,
      M_AXI_awvalid => m00_couplers_to_INTERCONNECT_OUT_AWVALID,
      M_AXI_bready => m00_couplers_to_INTERCONNECT_OUT_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_INTERCONNECT_OUT_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_INTERCONNECT_OUT_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_INTERCONNECT_OUT_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_INTERCONNECT_OUT_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_INTERCONNECT_OUT_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_INTERCONNECT_OUT_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_INTERCONNECT_OUT_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_INTERCONNECT_OUT_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_INTERCONNECT_OUT_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_INTERCONNECT_OUT_WVALID,
      S_ACLK => INTERCONNECT_OUT_ACLK_net,
      S_ARESETN => INTERCONNECT_OUT_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_NAYS38
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_INTERCONNECT_OUT_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_INTERCONNECT_OUT_ARPROT(2 downto 0),
      M_AXI_arready => m01_couplers_to_INTERCONNECT_OUT_ARREADY,
      M_AXI_arvalid => m01_couplers_to_INTERCONNECT_OUT_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_INTERCONNECT_OUT_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_INTERCONNECT_OUT_AWPROT(2 downto 0),
      M_AXI_awready => m01_couplers_to_INTERCONNECT_OUT_AWREADY,
      M_AXI_awvalid => m01_couplers_to_INTERCONNECT_OUT_AWVALID,
      M_AXI_bready => m01_couplers_to_INTERCONNECT_OUT_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_INTERCONNECT_OUT_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_INTERCONNECT_OUT_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_INTERCONNECT_OUT_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_INTERCONNECT_OUT_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_INTERCONNECT_OUT_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_INTERCONNECT_OUT_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_INTERCONNECT_OUT_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_INTERCONNECT_OUT_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_INTERCONNECT_OUT_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_INTERCONNECT_OUT_WVALID,
      S_ACLK => INTERCONNECT_OUT_ACLK_net,
      S_ARESETN => INTERCONNECT_OUT_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
s00_couplers: entity work.s00_couplers_imp_JAWIZB
     port map (
      M_ACLK => INTERCONNECT_OUT_ACLK_net,
      M_ARESETN => INTERCONNECT_OUT_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      M_AXI_bready(0) => s00_couplers_to_xbar_BREADY(0),
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready(0) => s00_couplers_to_xbar_RREADY(0),
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready(0) => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => s00_couplers_to_xbar_WVALID(0),
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => INTERCONNECT_OUT_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => INTERCONNECT_OUT_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arready(0) => INTERCONNECT_OUT_to_s00_couplers_ARREADY(0),
      S_AXI_arvalid(0) => INTERCONNECT_OUT_to_s00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => INTERCONNECT_OUT_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => INTERCONNECT_OUT_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awready(0) => INTERCONNECT_OUT_to_s00_couplers_AWREADY(0),
      S_AXI_awvalid(0) => INTERCONNECT_OUT_to_s00_couplers_AWVALID(0),
      S_AXI_bready(0) => INTERCONNECT_OUT_to_s00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => INTERCONNECT_OUT_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => INTERCONNECT_OUT_to_s00_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => INTERCONNECT_OUT_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => INTERCONNECT_OUT_to_s00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => INTERCONNECT_OUT_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => INTERCONNECT_OUT_to_s00_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => INTERCONNECT_OUT_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wready(0) => INTERCONNECT_OUT_to_s00_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => INTERCONNECT_OUT_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => INTERCONNECT_OUT_to_s00_couplers_WVALID(0)
    );
xbar: component c2cSlave_xbar_3
     port map (
      aclk => INTERCONNECT_OUT_ACLK_net,
      aresetn => INTERCONNECT_OUT_ARESETN_net,
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY(0),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY(0),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c2cSlave_slave_interconnect_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC;
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_arready : in STD_LOGIC;
    M06_AXI_arvalid : out STD_LOGIC;
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_awready : in STD_LOGIC;
    M06_AXI_awvalid : out STD_LOGIC;
    M06_AXI_bready : out STD_LOGIC;
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC;
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC;
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC;
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC;
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC;
    M07_ACLK : in STD_LOGIC;
    M07_ARESETN : in STD_LOGIC;
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_arready : in STD_LOGIC;
    M07_AXI_arvalid : out STD_LOGIC;
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_awready : in STD_LOGIC;
    M07_AXI_awvalid : out STD_LOGIC;
    M07_AXI_bready : out STD_LOGIC;
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC;
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC;
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC;
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC;
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC;
    M08_ACLK : in STD_LOGIC;
    M08_ARESETN : in STD_LOGIC;
    M08_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M08_AXI_arready : in STD_LOGIC;
    M08_AXI_arvalid : out STD_LOGIC;
    M08_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M08_AXI_awready : in STD_LOGIC;
    M08_AXI_awvalid : out STD_LOGIC;
    M08_AXI_bready : out STD_LOGIC;
    M08_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M08_AXI_bvalid : in STD_LOGIC;
    M08_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_rready : out STD_LOGIC;
    M08_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M08_AXI_rvalid : in STD_LOGIC;
    M08_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_wready : in STD_LOGIC;
    M08_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M08_AXI_wvalid : out STD_LOGIC;
    M09_ACLK : in STD_LOGIC;
    M09_ARESETN : in STD_LOGIC;
    M09_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M09_AXI_arready : in STD_LOGIC;
    M09_AXI_arvalid : out STD_LOGIC;
    M09_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M09_AXI_awready : in STD_LOGIC;
    M09_AXI_awvalid : out STD_LOGIC;
    M09_AXI_bready : out STD_LOGIC;
    M09_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M09_AXI_bvalid : in STD_LOGIC;
    M09_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_rready : out STD_LOGIC;
    M09_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M09_AXI_rvalid : in STD_LOGIC;
    M09_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_wready : in STD_LOGIC;
    M09_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M09_AXI_wvalid : out STD_LOGIC;
    M10_ACLK : in STD_LOGIC;
    M10_ARESETN : in STD_LOGIC;
    M10_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M10_AXI_arready : in STD_LOGIC;
    M10_AXI_arvalid : out STD_LOGIC;
    M10_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M10_AXI_awready : in STD_LOGIC;
    M10_AXI_awvalid : out STD_LOGIC;
    M10_AXI_bready : out STD_LOGIC;
    M10_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M10_AXI_bvalid : in STD_LOGIC;
    M10_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_rready : out STD_LOGIC;
    M10_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M10_AXI_rvalid : in STD_LOGIC;
    M10_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_wready : in STD_LOGIC;
    M10_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M10_AXI_wvalid : out STD_LOGIC;
    M11_ACLK : in STD_LOGIC;
    M11_ARESETN : in STD_LOGIC;
    M11_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M11_AXI_arready : in STD_LOGIC;
    M11_AXI_arvalid : out STD_LOGIC;
    M11_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M11_AXI_awready : in STD_LOGIC;
    M11_AXI_awvalid : out STD_LOGIC;
    M11_AXI_bready : out STD_LOGIC;
    M11_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M11_AXI_bvalid : in STD_LOGIC;
    M11_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_rready : out STD_LOGIC;
    M11_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M11_AXI_rvalid : in STD_LOGIC;
    M11_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_wready : in STD_LOGIC;
    M11_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M11_AXI_wvalid : out STD_LOGIC;
    M12_ACLK : in STD_LOGIC;
    M12_ARESETN : in STD_LOGIC;
    M12_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M12_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M12_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M12_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M12_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M12_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M13_ACLK : in STD_LOGIC;
    M13_ARESETN : in STD_LOGIC;
    M13_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M13_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M13_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M13_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M13_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M13_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M14_ACLK : in STD_LOGIC;
    M14_ARESETN : in STD_LOGIC;
    M14_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M14_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M14_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M14_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M14_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M14_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC;
    S01_ACLK : in STD_LOGIC;
    S01_ARESETN : in STD_LOGIC;
    S01_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_arprot : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_ACLK : in STD_LOGIC;
    S02_ARESETN : in STD_LOGIC;
    S02_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_arready : out STD_LOGIC;
    S02_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arvalid : in STD_LOGIC;
    S02_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awready : out STD_LOGIC;
    S02_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awvalid : in STD_LOGIC;
    S02_AXI_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_bready : in STD_LOGIC;
    S02_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_bvalid : out STD_LOGIC;
    S02_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_rlast : out STD_LOGIC;
    S02_AXI_rready : in STD_LOGIC;
    S02_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_rvalid : out STD_LOGIC;
    S02_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_wlast : in STD_LOGIC;
    S02_AXI_wready : out STD_LOGIC;
    S02_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_wvalid : in STD_LOGIC
  );
end c2cSlave_slave_interconnect_0;

architecture STRUCTURE of c2cSlave_slave_interconnect_0 is
  component c2cSlave_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 95 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 95 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 95 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 95 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 44 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 59 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 29 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 44 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 29 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 14 downto 0 )
  );
  end component c2cSlave_xbar_0;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC;
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC;
  signal M04_ACLK_1 : STD_LOGIC;
  signal M04_ARESETN_1 : STD_LOGIC;
  signal M05_ACLK_1 : STD_LOGIC;
  signal M05_ARESETN_1 : STD_LOGIC;
  signal M06_ACLK_1 : STD_LOGIC;
  signal M06_ARESETN_1 : STD_LOGIC;
  signal M07_ACLK_1 : STD_LOGIC;
  signal M07_ARESETN_1 : STD_LOGIC;
  signal M08_ACLK_1 : STD_LOGIC;
  signal M08_ARESETN_1 : STD_LOGIC;
  signal M09_ACLK_1 : STD_LOGIC;
  signal M09_ARESETN_1 : STD_LOGIC;
  signal M10_ACLK_1 : STD_LOGIC;
  signal M10_ARESETN_1 : STD_LOGIC;
  signal M11_ACLK_1 : STD_LOGIC;
  signal M11_ARESETN_1 : STD_LOGIC;
  signal M12_ACLK_1 : STD_LOGIC;
  signal M12_ARESETN_1 : STD_LOGIC;
  signal M13_ACLK_1 : STD_LOGIC;
  signal M13_ARESETN_1 : STD_LOGIC;
  signal M14_ACLK_1 : STD_LOGIC;
  signal M14_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal S01_ACLK_1 : STD_LOGIC;
  signal S01_ARESETN_1 : STD_LOGIC;
  signal S02_ACLK_1 : STD_LOGIC;
  signal S02_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m00_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m01_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m03_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m06_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m07_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m08_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m08_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m09_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m09_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m10_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m10_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m11_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m11_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m11_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m11_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m12_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m12_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m12_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m13_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m13_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m13_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m13_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m14_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m14_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m14_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m14_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal s01_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal s01_couplers_to_xbar_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal s01_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s02_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s02_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s02_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s02_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s02_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal s02_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal s02_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s02_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal s02_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s02_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal s02_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s02_couplers_to_xbar_WVALID : STD_LOGIC;
  signal slave_interconnect_ACLK_net : STD_LOGIC;
  signal slave_interconnect_ARESETN_net : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal slave_interconnect_to_s00_couplers_ARREADY : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_to_s00_couplers_ARVALID : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal slave_interconnect_to_s00_couplers_AWREADY : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_to_s00_couplers_AWVALID : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_BREADY : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s00_couplers_BVALID : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s00_couplers_RLAST : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_RREADY : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s00_couplers_RVALID : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s00_couplers_WLAST : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_WREADY : STD_LOGIC;
  signal slave_interconnect_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_to_s00_couplers_WVALID : STD_LOGIC;
  signal slave_interconnect_to_s01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s01_couplers_ARPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s01_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_to_s01_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s02_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s02_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_to_s02_couplers_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s02_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal slave_interconnect_to_s02_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_to_s02_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_to_s02_couplers_ARREADY : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_to_s02_couplers_ARVALID : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s02_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s02_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_to_s02_couplers_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s02_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal slave_interconnect_to_s02_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_to_s02_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_to_s02_couplers_AWREADY : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_to_s02_couplers_AWVALID : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s02_couplers_BREADY : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s02_couplers_BVALID : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s02_couplers_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_to_s02_couplers_RLAST : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_RREADY : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_to_s02_couplers_RVALID : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_to_s02_couplers_WLAST : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_WREADY : STD_LOGIC;
  signal slave_interconnect_to_s02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_to_s02_couplers_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 28 );
  signal xbar_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m08_couplers_ARADDR : STD_LOGIC_VECTOR ( 287 downto 256 );
  signal xbar_to_m08_couplers_ARPROT : STD_LOGIC_VECTOR ( 26 downto 24 );
  signal xbar_to_m08_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_ARVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_AWADDR : STD_LOGIC_VECTOR ( 287 downto 256 );
  signal xbar_to_m08_couplers_AWPROT : STD_LOGIC_VECTOR ( 26 downto 24 );
  signal xbar_to_m08_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_AWVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_BREADY : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m08_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m08_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m08_couplers_RREADY : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m08_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m08_couplers_WDATA : STD_LOGIC_VECTOR ( 287 downto 256 );
  signal xbar_to_m08_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_WSTRB : STD_LOGIC_VECTOR ( 35 downto 32 );
  signal xbar_to_m08_couplers_WVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m09_couplers_ARADDR : STD_LOGIC_VECTOR ( 319 downto 288 );
  signal xbar_to_m09_couplers_ARPROT : STD_LOGIC_VECTOR ( 29 downto 27 );
  signal xbar_to_m09_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m09_couplers_ARVALID : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_AWADDR : STD_LOGIC_VECTOR ( 319 downto 288 );
  signal xbar_to_m09_couplers_AWPROT : STD_LOGIC_VECTOR ( 29 downto 27 );
  signal xbar_to_m09_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m09_couplers_AWVALID : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_BREADY : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m09_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m09_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m09_couplers_RREADY : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m09_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m09_couplers_WDATA : STD_LOGIC_VECTOR ( 319 downto 288 );
  signal xbar_to_m09_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m09_couplers_WSTRB : STD_LOGIC_VECTOR ( 39 downto 36 );
  signal xbar_to_m09_couplers_WVALID : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m10_couplers_ARADDR : STD_LOGIC_VECTOR ( 351 downto 320 );
  signal xbar_to_m10_couplers_ARPROT : STD_LOGIC_VECTOR ( 32 downto 30 );
  signal xbar_to_m10_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m10_couplers_ARVALID : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_AWADDR : STD_LOGIC_VECTOR ( 351 downto 320 );
  signal xbar_to_m10_couplers_AWPROT : STD_LOGIC_VECTOR ( 32 downto 30 );
  signal xbar_to_m10_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m10_couplers_AWVALID : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_BREADY : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m10_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m10_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m10_couplers_RREADY : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m10_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m10_couplers_WDATA : STD_LOGIC_VECTOR ( 351 downto 320 );
  signal xbar_to_m10_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m10_couplers_WSTRB : STD_LOGIC_VECTOR ( 43 downto 40 );
  signal xbar_to_m10_couplers_WVALID : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m11_couplers_ARADDR : STD_LOGIC_VECTOR ( 383 downto 352 );
  signal xbar_to_m11_couplers_ARPROT : STD_LOGIC_VECTOR ( 35 downto 33 );
  signal xbar_to_m11_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m11_couplers_ARVALID : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_AWADDR : STD_LOGIC_VECTOR ( 383 downto 352 );
  signal xbar_to_m11_couplers_AWPROT : STD_LOGIC_VECTOR ( 35 downto 33 );
  signal xbar_to_m11_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m11_couplers_AWVALID : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_BREADY : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m11_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m11_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m11_couplers_RREADY : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m11_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m11_couplers_WDATA : STD_LOGIC_VECTOR ( 383 downto 352 );
  signal xbar_to_m11_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m11_couplers_WSTRB : STD_LOGIC_VECTOR ( 47 downto 44 );
  signal xbar_to_m11_couplers_WVALID : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m12_couplers_ARADDR : STD_LOGIC_VECTOR ( 415 downto 384 );
  signal xbar_to_m12_couplers_ARPROT : STD_LOGIC_VECTOR ( 38 downto 36 );
  signal xbar_to_m12_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m12_couplers_ARVALID : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_AWADDR : STD_LOGIC_VECTOR ( 415 downto 384 );
  signal xbar_to_m12_couplers_AWPROT : STD_LOGIC_VECTOR ( 38 downto 36 );
  signal xbar_to_m12_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m12_couplers_AWVALID : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_BREADY : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m12_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m12_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m12_couplers_RREADY : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m12_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m12_couplers_WDATA : STD_LOGIC_VECTOR ( 415 downto 384 );
  signal xbar_to_m12_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m12_couplers_WSTRB : STD_LOGIC_VECTOR ( 51 downto 48 );
  signal xbar_to_m12_couplers_WVALID : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m13_couplers_ARADDR : STD_LOGIC_VECTOR ( 447 downto 416 );
  signal xbar_to_m13_couplers_ARPROT : STD_LOGIC_VECTOR ( 41 downto 39 );
  signal xbar_to_m13_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m13_couplers_ARVALID : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_AWADDR : STD_LOGIC_VECTOR ( 447 downto 416 );
  signal xbar_to_m13_couplers_AWPROT : STD_LOGIC_VECTOR ( 41 downto 39 );
  signal xbar_to_m13_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m13_couplers_AWVALID : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_BREADY : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m13_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m13_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m13_couplers_RREADY : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m13_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m13_couplers_WDATA : STD_LOGIC_VECTOR ( 447 downto 416 );
  signal xbar_to_m13_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m13_couplers_WSTRB : STD_LOGIC_VECTOR ( 55 downto 52 );
  signal xbar_to_m13_couplers_WVALID : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m14_couplers_ARADDR : STD_LOGIC_VECTOR ( 479 downto 448 );
  signal xbar_to_m14_couplers_ARPROT : STD_LOGIC_VECTOR ( 44 downto 42 );
  signal xbar_to_m14_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m14_couplers_ARVALID : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_AWADDR : STD_LOGIC_VECTOR ( 479 downto 448 );
  signal xbar_to_m14_couplers_AWPROT : STD_LOGIC_VECTOR ( 44 downto 42 );
  signal xbar_to_m14_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m14_couplers_AWVALID : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_BREADY : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m14_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m14_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m14_couplers_RREADY : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m14_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m14_couplers_WDATA : STD_LOGIC_VECTOR ( 479 downto 448 );
  signal xbar_to_m14_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m14_couplers_WSTRB : STD_LOGIC_VECTOR ( 59 downto 56 );
  signal xbar_to_m14_couplers_WVALID : STD_LOGIC_VECTOR ( 14 to 14 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_slave_interconnect_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_slave_interconnect_AWVALID;
  M00_AXI_bready <= m00_couplers_to_slave_interconnect_BREADY;
  M00_AXI_rready <= m00_couplers_to_slave_interconnect_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_slave_interconnect_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M01_AXI_arvalid(0) <= m01_couplers_to_slave_interconnect_ARVALID(0);
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M01_AXI_awvalid(0) <= m01_couplers_to_slave_interconnect_AWVALID(0);
  M01_AXI_bready(0) <= m01_couplers_to_slave_interconnect_BREADY(0);
  M01_AXI_rready(0) <= m01_couplers_to_slave_interconnect_RREADY(0);
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M01_AXI_wvalid(0) <= m01_couplers_to_slave_interconnect_WVALID(0);
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1 <= M02_ARESETN;
  M02_AXI_araddr(31 downto 0) <= m02_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M02_AXI_arprot(2 downto 0) <= m02_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M02_AXI_arvalid(0) <= m02_couplers_to_slave_interconnect_ARVALID(0);
  M02_AXI_awaddr(31 downto 0) <= m02_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M02_AXI_awprot(2 downto 0) <= m02_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M02_AXI_awvalid(0) <= m02_couplers_to_slave_interconnect_AWVALID(0);
  M02_AXI_bready(0) <= m02_couplers_to_slave_interconnect_BREADY(0);
  M02_AXI_rready(0) <= m02_couplers_to_slave_interconnect_RREADY(0);
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M02_AXI_wvalid(0) <= m02_couplers_to_slave_interconnect_WVALID(0);
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1 <= M03_ARESETN;
  M03_AXI_araddr(31 downto 0) <= m03_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_slave_interconnect_ARVALID;
  M03_AXI_awaddr(31 downto 0) <= m03_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_slave_interconnect_AWVALID;
  M03_AXI_bready <= m03_couplers_to_slave_interconnect_BREADY;
  M03_AXI_rready <= m03_couplers_to_slave_interconnect_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_slave_interconnect_WVALID;
  M04_ACLK_1 <= M04_ACLK;
  M04_ARESETN_1 <= M04_ARESETN;
  M04_AXI_araddr(31 downto 0) <= m04_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M04_AXI_arprot(2 downto 0) <= m04_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M04_AXI_arvalid(0) <= m04_couplers_to_slave_interconnect_ARVALID(0);
  M04_AXI_awaddr(31 downto 0) <= m04_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M04_AXI_awprot(2 downto 0) <= m04_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M04_AXI_awvalid(0) <= m04_couplers_to_slave_interconnect_AWVALID(0);
  M04_AXI_bready(0) <= m04_couplers_to_slave_interconnect_BREADY(0);
  M04_AXI_rready(0) <= m04_couplers_to_slave_interconnect_RREADY(0);
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M04_AXI_wvalid(0) <= m04_couplers_to_slave_interconnect_WVALID(0);
  M05_ACLK_1 <= M05_ACLK;
  M05_ARESETN_1 <= M05_ARESETN;
  M05_AXI_araddr(31 downto 0) <= m05_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M05_AXI_arprot(2 downto 0) <= m05_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M05_AXI_arvalid <= m05_couplers_to_slave_interconnect_ARVALID;
  M05_AXI_awaddr(31 downto 0) <= m05_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M05_AXI_awprot(2 downto 0) <= m05_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M05_AXI_awvalid <= m05_couplers_to_slave_interconnect_AWVALID;
  M05_AXI_bready <= m05_couplers_to_slave_interconnect_BREADY;
  M05_AXI_rready <= m05_couplers_to_slave_interconnect_RREADY;
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= m05_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M05_AXI_wvalid <= m05_couplers_to_slave_interconnect_WVALID;
  M06_ACLK_1 <= M06_ACLK;
  M06_ARESETN_1 <= M06_ARESETN;
  M06_AXI_araddr(31 downto 0) <= m06_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M06_AXI_arprot(2 downto 0) <= m06_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M06_AXI_arvalid <= m06_couplers_to_slave_interconnect_ARVALID;
  M06_AXI_awaddr(31 downto 0) <= m06_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M06_AXI_awprot(2 downto 0) <= m06_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M06_AXI_awvalid <= m06_couplers_to_slave_interconnect_AWVALID;
  M06_AXI_bready <= m06_couplers_to_slave_interconnect_BREADY;
  M06_AXI_rready <= m06_couplers_to_slave_interconnect_RREADY;
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M06_AXI_wvalid <= m06_couplers_to_slave_interconnect_WVALID;
  M07_ACLK_1 <= M07_ACLK;
  M07_ARESETN_1 <= M07_ARESETN;
  M07_AXI_araddr(31 downto 0) <= m07_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M07_AXI_arprot(2 downto 0) <= m07_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M07_AXI_arvalid <= m07_couplers_to_slave_interconnect_ARVALID;
  M07_AXI_awaddr(31 downto 0) <= m07_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M07_AXI_awprot(2 downto 0) <= m07_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M07_AXI_awvalid <= m07_couplers_to_slave_interconnect_AWVALID;
  M07_AXI_bready <= m07_couplers_to_slave_interconnect_BREADY;
  M07_AXI_rready <= m07_couplers_to_slave_interconnect_RREADY;
  M07_AXI_wdata(31 downto 0) <= m07_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= m07_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M07_AXI_wvalid <= m07_couplers_to_slave_interconnect_WVALID;
  M08_ACLK_1 <= M08_ACLK;
  M08_ARESETN_1 <= M08_ARESETN;
  M08_AXI_araddr(31 downto 0) <= m08_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M08_AXI_arprot(2 downto 0) <= m08_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M08_AXI_arvalid <= m08_couplers_to_slave_interconnect_ARVALID;
  M08_AXI_awaddr(31 downto 0) <= m08_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M08_AXI_awprot(2 downto 0) <= m08_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M08_AXI_awvalid <= m08_couplers_to_slave_interconnect_AWVALID;
  M08_AXI_bready <= m08_couplers_to_slave_interconnect_BREADY;
  M08_AXI_rready <= m08_couplers_to_slave_interconnect_RREADY;
  M08_AXI_wdata(31 downto 0) <= m08_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M08_AXI_wstrb(3 downto 0) <= m08_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M08_AXI_wvalid <= m08_couplers_to_slave_interconnect_WVALID;
  M09_ACLK_1 <= M09_ACLK;
  M09_ARESETN_1 <= M09_ARESETN;
  M09_AXI_araddr(31 downto 0) <= m09_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M09_AXI_arprot(2 downto 0) <= m09_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M09_AXI_arvalid <= m09_couplers_to_slave_interconnect_ARVALID;
  M09_AXI_awaddr(31 downto 0) <= m09_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M09_AXI_awprot(2 downto 0) <= m09_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M09_AXI_awvalid <= m09_couplers_to_slave_interconnect_AWVALID;
  M09_AXI_bready <= m09_couplers_to_slave_interconnect_BREADY;
  M09_AXI_rready <= m09_couplers_to_slave_interconnect_RREADY;
  M09_AXI_wdata(31 downto 0) <= m09_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M09_AXI_wstrb(3 downto 0) <= m09_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M09_AXI_wvalid <= m09_couplers_to_slave_interconnect_WVALID;
  M10_ACLK_1 <= M10_ACLK;
  M10_ARESETN_1 <= M10_ARESETN;
  M10_AXI_araddr(31 downto 0) <= m10_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M10_AXI_arprot(2 downto 0) <= m10_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M10_AXI_arvalid <= m10_couplers_to_slave_interconnect_ARVALID;
  M10_AXI_awaddr(31 downto 0) <= m10_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M10_AXI_awprot(2 downto 0) <= m10_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M10_AXI_awvalid <= m10_couplers_to_slave_interconnect_AWVALID;
  M10_AXI_bready <= m10_couplers_to_slave_interconnect_BREADY;
  M10_AXI_rready <= m10_couplers_to_slave_interconnect_RREADY;
  M10_AXI_wdata(31 downto 0) <= m10_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M10_AXI_wstrb(3 downto 0) <= m10_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M10_AXI_wvalid <= m10_couplers_to_slave_interconnect_WVALID;
  M11_ACLK_1 <= M11_ACLK;
  M11_ARESETN_1 <= M11_ARESETN;
  M11_AXI_araddr(31 downto 0) <= m11_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M11_AXI_arprot(2 downto 0) <= m11_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M11_AXI_arvalid <= m11_couplers_to_slave_interconnect_ARVALID;
  M11_AXI_awaddr(31 downto 0) <= m11_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M11_AXI_awprot(2 downto 0) <= m11_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M11_AXI_awvalid <= m11_couplers_to_slave_interconnect_AWVALID;
  M11_AXI_bready <= m11_couplers_to_slave_interconnect_BREADY;
  M11_AXI_rready <= m11_couplers_to_slave_interconnect_RREADY;
  M11_AXI_wdata(31 downto 0) <= m11_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M11_AXI_wstrb(3 downto 0) <= m11_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M11_AXI_wvalid <= m11_couplers_to_slave_interconnect_WVALID;
  M12_ACLK_1 <= M12_ACLK;
  M12_ARESETN_1 <= M12_ARESETN;
  M12_AXI_araddr(31 downto 0) <= m12_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M12_AXI_arprot(2 downto 0) <= m12_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M12_AXI_arvalid(0) <= m12_couplers_to_slave_interconnect_ARVALID(0);
  M12_AXI_awaddr(31 downto 0) <= m12_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M12_AXI_awprot(2 downto 0) <= m12_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M12_AXI_awvalid(0) <= m12_couplers_to_slave_interconnect_AWVALID(0);
  M12_AXI_bready(0) <= m12_couplers_to_slave_interconnect_BREADY(0);
  M12_AXI_rready(0) <= m12_couplers_to_slave_interconnect_RREADY(0);
  M12_AXI_wdata(31 downto 0) <= m12_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M12_AXI_wstrb(3 downto 0) <= m12_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M12_AXI_wvalid(0) <= m12_couplers_to_slave_interconnect_WVALID(0);
  M13_ACLK_1 <= M13_ACLK;
  M13_ARESETN_1 <= M13_ARESETN;
  M13_AXI_araddr(31 downto 0) <= m13_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M13_AXI_arprot(2 downto 0) <= m13_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M13_AXI_arvalid(0) <= m13_couplers_to_slave_interconnect_ARVALID(0);
  M13_AXI_awaddr(31 downto 0) <= m13_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M13_AXI_awprot(2 downto 0) <= m13_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M13_AXI_awvalid(0) <= m13_couplers_to_slave_interconnect_AWVALID(0);
  M13_AXI_bready(0) <= m13_couplers_to_slave_interconnect_BREADY(0);
  M13_AXI_rready(0) <= m13_couplers_to_slave_interconnect_RREADY(0);
  M13_AXI_wdata(31 downto 0) <= m13_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M13_AXI_wstrb(3 downto 0) <= m13_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M13_AXI_wvalid(0) <= m13_couplers_to_slave_interconnect_WVALID(0);
  M14_ACLK_1 <= M14_ACLK;
  M14_ARESETN_1 <= M14_ARESETN;
  M14_AXI_araddr(31 downto 0) <= m14_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M14_AXI_arprot(2 downto 0) <= m14_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M14_AXI_arvalid(0) <= m14_couplers_to_slave_interconnect_ARVALID(0);
  M14_AXI_awaddr(31 downto 0) <= m14_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M14_AXI_awprot(2 downto 0) <= m14_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M14_AXI_awvalid(0) <= m14_couplers_to_slave_interconnect_AWVALID(0);
  M14_AXI_bready(0) <= m14_couplers_to_slave_interconnect_BREADY(0);
  M14_AXI_rready(0) <= m14_couplers_to_slave_interconnect_RREADY(0);
  M14_AXI_wdata(31 downto 0) <= m14_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M14_AXI_wstrb(3 downto 0) <= m14_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M14_AXI_wvalid(0) <= m14_couplers_to_slave_interconnect_WVALID(0);
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= slave_interconnect_to_s00_couplers_ARREADY;
  S00_AXI_awready <= slave_interconnect_to_s00_couplers_AWREADY;
  S00_AXI_bresp(1 downto 0) <= slave_interconnect_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= slave_interconnect_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= slave_interconnect_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rlast <= slave_interconnect_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= slave_interconnect_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= slave_interconnect_to_s00_couplers_RVALID;
  S00_AXI_wready <= slave_interconnect_to_s00_couplers_WREADY;
  S01_ACLK_1 <= S01_ACLK;
  S01_ARESETN_1 <= S01_ARESETN;
  S01_AXI_arready(0) <= slave_interconnect_to_s01_couplers_ARREADY(0);
  S01_AXI_awready(0) <= slave_interconnect_to_s01_couplers_AWREADY(0);
  S01_AXI_bresp(1 downto 0) <= slave_interconnect_to_s01_couplers_BRESP(1 downto 0);
  S01_AXI_bvalid(0) <= slave_interconnect_to_s01_couplers_BVALID(0);
  S01_AXI_rdata(31 downto 0) <= slave_interconnect_to_s01_couplers_RDATA(31 downto 0);
  S01_AXI_rresp(1 downto 0) <= slave_interconnect_to_s01_couplers_RRESP(1 downto 0);
  S01_AXI_rvalid(0) <= slave_interconnect_to_s01_couplers_RVALID(0);
  S01_AXI_wready(0) <= slave_interconnect_to_s01_couplers_WREADY(0);
  S02_ACLK_1 <= S02_ACLK;
  S02_ARESETN_1 <= S02_ARESETN;
  S02_AXI_arready <= slave_interconnect_to_s02_couplers_ARREADY;
  S02_AXI_awready <= slave_interconnect_to_s02_couplers_AWREADY;
  S02_AXI_bid(0) <= slave_interconnect_to_s02_couplers_BID(0);
  S02_AXI_bresp(1 downto 0) <= slave_interconnect_to_s02_couplers_BRESP(1 downto 0);
  S02_AXI_bvalid <= slave_interconnect_to_s02_couplers_BVALID;
  S02_AXI_rdata(31 downto 0) <= slave_interconnect_to_s02_couplers_RDATA(31 downto 0);
  S02_AXI_rid(0) <= slave_interconnect_to_s02_couplers_RID(0);
  S02_AXI_rlast <= slave_interconnect_to_s02_couplers_RLAST;
  S02_AXI_rresp(1 downto 0) <= slave_interconnect_to_s02_couplers_RRESP(1 downto 0);
  S02_AXI_rvalid <= slave_interconnect_to_s02_couplers_RVALID;
  S02_AXI_wready <= slave_interconnect_to_s02_couplers_WREADY;
  m00_couplers_to_slave_interconnect_ARREADY <= M00_AXI_arready;
  m00_couplers_to_slave_interconnect_AWREADY <= M00_AXI_awready;
  m00_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_slave_interconnect_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_slave_interconnect_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_slave_interconnect_WREADY <= M00_AXI_wready;
  m01_couplers_to_slave_interconnect_ARREADY(0) <= M01_AXI_arready(0);
  m01_couplers_to_slave_interconnect_AWREADY(0) <= M01_AXI_awready(0);
  m01_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_slave_interconnect_BVALID(0) <= M01_AXI_bvalid(0);
  m01_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_slave_interconnect_RVALID(0) <= M01_AXI_rvalid(0);
  m01_couplers_to_slave_interconnect_WREADY(0) <= M01_AXI_wready(0);
  m02_couplers_to_slave_interconnect_ARREADY(0) <= M02_AXI_arready(0);
  m02_couplers_to_slave_interconnect_AWREADY(0) <= M02_AXI_awready(0);
  m02_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_slave_interconnect_BVALID(0) <= M02_AXI_bvalid(0);
  m02_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_slave_interconnect_RVALID(0) <= M02_AXI_rvalid(0);
  m02_couplers_to_slave_interconnect_WREADY(0) <= M02_AXI_wready(0);
  m03_couplers_to_slave_interconnect_ARREADY <= M03_AXI_arready;
  m03_couplers_to_slave_interconnect_AWREADY <= M03_AXI_awready;
  m03_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_slave_interconnect_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_slave_interconnect_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_slave_interconnect_WREADY <= M03_AXI_wready;
  m04_couplers_to_slave_interconnect_ARREADY(0) <= M04_AXI_arready(0);
  m04_couplers_to_slave_interconnect_AWREADY(0) <= M04_AXI_awready(0);
  m04_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_slave_interconnect_BVALID(0) <= M04_AXI_bvalid(0);
  m04_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_slave_interconnect_RVALID(0) <= M04_AXI_rvalid(0);
  m04_couplers_to_slave_interconnect_WREADY(0) <= M04_AXI_wready(0);
  m05_couplers_to_slave_interconnect_ARREADY <= M05_AXI_arready;
  m05_couplers_to_slave_interconnect_AWREADY <= M05_AXI_awready;
  m05_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_slave_interconnect_BVALID <= M05_AXI_bvalid;
  m05_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_slave_interconnect_RVALID <= M05_AXI_rvalid;
  m05_couplers_to_slave_interconnect_WREADY <= M05_AXI_wready;
  m06_couplers_to_slave_interconnect_ARREADY <= M06_AXI_arready;
  m06_couplers_to_slave_interconnect_AWREADY <= M06_AXI_awready;
  m06_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_slave_interconnect_BVALID <= M06_AXI_bvalid;
  m06_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_slave_interconnect_RVALID <= M06_AXI_rvalid;
  m06_couplers_to_slave_interconnect_WREADY <= M06_AXI_wready;
  m07_couplers_to_slave_interconnect_ARREADY <= M07_AXI_arready;
  m07_couplers_to_slave_interconnect_AWREADY <= M07_AXI_awready;
  m07_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  m07_couplers_to_slave_interconnect_BVALID <= M07_AXI_bvalid;
  m07_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  m07_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  m07_couplers_to_slave_interconnect_RVALID <= M07_AXI_rvalid;
  m07_couplers_to_slave_interconnect_WREADY <= M07_AXI_wready;
  m08_couplers_to_slave_interconnect_ARREADY <= M08_AXI_arready;
  m08_couplers_to_slave_interconnect_AWREADY <= M08_AXI_awready;
  m08_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M08_AXI_bresp(1 downto 0);
  m08_couplers_to_slave_interconnect_BVALID <= M08_AXI_bvalid;
  m08_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M08_AXI_rdata(31 downto 0);
  m08_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M08_AXI_rresp(1 downto 0);
  m08_couplers_to_slave_interconnect_RVALID <= M08_AXI_rvalid;
  m08_couplers_to_slave_interconnect_WREADY <= M08_AXI_wready;
  m09_couplers_to_slave_interconnect_ARREADY <= M09_AXI_arready;
  m09_couplers_to_slave_interconnect_AWREADY <= M09_AXI_awready;
  m09_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M09_AXI_bresp(1 downto 0);
  m09_couplers_to_slave_interconnect_BVALID <= M09_AXI_bvalid;
  m09_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M09_AXI_rdata(31 downto 0);
  m09_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M09_AXI_rresp(1 downto 0);
  m09_couplers_to_slave_interconnect_RVALID <= M09_AXI_rvalid;
  m09_couplers_to_slave_interconnect_WREADY <= M09_AXI_wready;
  m10_couplers_to_slave_interconnect_ARREADY <= M10_AXI_arready;
  m10_couplers_to_slave_interconnect_AWREADY <= M10_AXI_awready;
  m10_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M10_AXI_bresp(1 downto 0);
  m10_couplers_to_slave_interconnect_BVALID <= M10_AXI_bvalid;
  m10_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M10_AXI_rdata(31 downto 0);
  m10_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M10_AXI_rresp(1 downto 0);
  m10_couplers_to_slave_interconnect_RVALID <= M10_AXI_rvalid;
  m10_couplers_to_slave_interconnect_WREADY <= M10_AXI_wready;
  m11_couplers_to_slave_interconnect_ARREADY <= M11_AXI_arready;
  m11_couplers_to_slave_interconnect_AWREADY <= M11_AXI_awready;
  m11_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M11_AXI_bresp(1 downto 0);
  m11_couplers_to_slave_interconnect_BVALID <= M11_AXI_bvalid;
  m11_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M11_AXI_rdata(31 downto 0);
  m11_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M11_AXI_rresp(1 downto 0);
  m11_couplers_to_slave_interconnect_RVALID <= M11_AXI_rvalid;
  m11_couplers_to_slave_interconnect_WREADY <= M11_AXI_wready;
  m12_couplers_to_slave_interconnect_ARREADY(0) <= M12_AXI_arready(0);
  m12_couplers_to_slave_interconnect_AWREADY(0) <= M12_AXI_awready(0);
  m12_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M12_AXI_bresp(1 downto 0);
  m12_couplers_to_slave_interconnect_BVALID(0) <= M12_AXI_bvalid(0);
  m12_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M12_AXI_rdata(31 downto 0);
  m12_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M12_AXI_rresp(1 downto 0);
  m12_couplers_to_slave_interconnect_RVALID(0) <= M12_AXI_rvalid(0);
  m12_couplers_to_slave_interconnect_WREADY(0) <= M12_AXI_wready(0);
  m13_couplers_to_slave_interconnect_ARREADY(0) <= M13_AXI_arready(0);
  m13_couplers_to_slave_interconnect_AWREADY(0) <= M13_AXI_awready(0);
  m13_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M13_AXI_bresp(1 downto 0);
  m13_couplers_to_slave_interconnect_BVALID(0) <= M13_AXI_bvalid(0);
  m13_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M13_AXI_rdata(31 downto 0);
  m13_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M13_AXI_rresp(1 downto 0);
  m13_couplers_to_slave_interconnect_RVALID(0) <= M13_AXI_rvalid(0);
  m13_couplers_to_slave_interconnect_WREADY(0) <= M13_AXI_wready(0);
  m14_couplers_to_slave_interconnect_ARREADY(0) <= M14_AXI_arready(0);
  m14_couplers_to_slave_interconnect_AWREADY(0) <= M14_AXI_awready(0);
  m14_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M14_AXI_bresp(1 downto 0);
  m14_couplers_to_slave_interconnect_BVALID(0) <= M14_AXI_bvalid(0);
  m14_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M14_AXI_rdata(31 downto 0);
  m14_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M14_AXI_rresp(1 downto 0);
  m14_couplers_to_slave_interconnect_RVALID(0) <= M14_AXI_rvalid(0);
  m14_couplers_to_slave_interconnect_WREADY(0) <= M14_AXI_wready(0);
  slave_interconnect_ACLK_net <= ACLK;
  slave_interconnect_ARESETN_net <= ARESETN;
  slave_interconnect_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  slave_interconnect_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  slave_interconnect_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  slave_interconnect_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  slave_interconnect_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  slave_interconnect_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  slave_interconnect_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  slave_interconnect_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  slave_interconnect_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  slave_interconnect_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  slave_interconnect_to_s00_couplers_BREADY <= S00_AXI_bready;
  slave_interconnect_to_s00_couplers_RREADY <= S00_AXI_rready;
  slave_interconnect_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  slave_interconnect_to_s00_couplers_WLAST <= S00_AXI_wlast;
  slave_interconnect_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  slave_interconnect_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  slave_interconnect_to_s01_couplers_ARADDR(31 downto 0) <= S01_AXI_araddr(31 downto 0);
  slave_interconnect_to_s01_couplers_ARPROT(1 downto 0) <= S01_AXI_arprot(1 downto 0);
  slave_interconnect_to_s01_couplers_ARVALID(0) <= S01_AXI_arvalid(0);
  slave_interconnect_to_s01_couplers_AWADDR(31 downto 0) <= S01_AXI_awaddr(31 downto 0);
  slave_interconnect_to_s01_couplers_AWPROT(1 downto 0) <= S01_AXI_awprot(1 downto 0);
  slave_interconnect_to_s01_couplers_AWVALID(0) <= S01_AXI_awvalid(0);
  slave_interconnect_to_s01_couplers_BREADY(0) <= S01_AXI_bready(0);
  slave_interconnect_to_s01_couplers_RREADY(0) <= S01_AXI_rready(0);
  slave_interconnect_to_s01_couplers_WDATA(31 downto 0) <= S01_AXI_wdata(31 downto 0);
  slave_interconnect_to_s01_couplers_WSTRB(3 downto 0) <= S01_AXI_wstrb(3 downto 0);
  slave_interconnect_to_s01_couplers_WVALID(0) <= S01_AXI_wvalid(0);
  slave_interconnect_to_s02_couplers_ARADDR(31 downto 0) <= S02_AXI_araddr(31 downto 0);
  slave_interconnect_to_s02_couplers_ARBURST(1 downto 0) <= S02_AXI_arburst(1 downto 0);
  slave_interconnect_to_s02_couplers_ARCACHE(3 downto 0) <= S02_AXI_arcache(3 downto 0);
  slave_interconnect_to_s02_couplers_ARID(0) <= S02_AXI_arid(0);
  slave_interconnect_to_s02_couplers_ARLEN(7 downto 0) <= S02_AXI_arlen(7 downto 0);
  slave_interconnect_to_s02_couplers_ARLOCK(0) <= S02_AXI_arlock(0);
  slave_interconnect_to_s02_couplers_ARPROT(2 downto 0) <= S02_AXI_arprot(2 downto 0);
  slave_interconnect_to_s02_couplers_ARQOS(3 downto 0) <= S02_AXI_arqos(3 downto 0);
  slave_interconnect_to_s02_couplers_ARSIZE(2 downto 0) <= S02_AXI_arsize(2 downto 0);
  slave_interconnect_to_s02_couplers_ARVALID <= S02_AXI_arvalid;
  slave_interconnect_to_s02_couplers_AWADDR(31 downto 0) <= S02_AXI_awaddr(31 downto 0);
  slave_interconnect_to_s02_couplers_AWBURST(1 downto 0) <= S02_AXI_awburst(1 downto 0);
  slave_interconnect_to_s02_couplers_AWCACHE(3 downto 0) <= S02_AXI_awcache(3 downto 0);
  slave_interconnect_to_s02_couplers_AWID(0) <= S02_AXI_awid(0);
  slave_interconnect_to_s02_couplers_AWLEN(7 downto 0) <= S02_AXI_awlen(7 downto 0);
  slave_interconnect_to_s02_couplers_AWLOCK(0) <= S02_AXI_awlock(0);
  slave_interconnect_to_s02_couplers_AWPROT(2 downto 0) <= S02_AXI_awprot(2 downto 0);
  slave_interconnect_to_s02_couplers_AWQOS(3 downto 0) <= S02_AXI_awqos(3 downto 0);
  slave_interconnect_to_s02_couplers_AWSIZE(2 downto 0) <= S02_AXI_awsize(2 downto 0);
  slave_interconnect_to_s02_couplers_AWVALID <= S02_AXI_awvalid;
  slave_interconnect_to_s02_couplers_BREADY <= S02_AXI_bready;
  slave_interconnect_to_s02_couplers_RREADY <= S02_AXI_rready;
  slave_interconnect_to_s02_couplers_WDATA(31 downto 0) <= S02_AXI_wdata(31 downto 0);
  slave_interconnect_to_s02_couplers_WLAST <= S02_AXI_wlast;
  slave_interconnect_to_s02_couplers_WSTRB(3 downto 0) <= S02_AXI_wstrb(3 downto 0);
  slave_interconnect_to_s02_couplers_WVALID <= S02_AXI_wvalid;
m00_couplers: entity work.m00_couplers_imp_CQM8ER
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arready => m00_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m00_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awready => m00_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m00_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m00_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1I14H6A
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m01_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m01_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m01_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m01_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m01_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m01_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m01_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m01_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m01_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m01_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m01_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m01_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m01_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m01_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arready(0) => xbar_to_m01_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awready(0) => xbar_to_m01_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready(0) => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m01_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m01_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready(0) => xbar_to_m01_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid(0) => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_B5YFTC
     port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN => M02_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m02_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m02_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m02_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m02_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m02_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m02_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m02_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m02_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m02_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m02_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m02_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m02_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m02_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m02_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m02_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m02_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m02_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m02_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arready(0) => xbar_to_m02_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(31 downto 0) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awready(0) => xbar_to_m02_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready(0) => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m02_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m02_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready(0) => xbar_to_m02_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid(0) => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1JC34VL
     port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN => M03_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m03_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arready => m03_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m03_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m03_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awready => m03_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m03_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m03_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m03_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_AM3X91
     port map (
      M_ACLK => M04_ACLK_1,
      M_ARESETN => M04_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m04_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m04_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m04_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m04_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m04_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m04_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m04_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m04_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m04_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m04_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m04_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m04_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m04_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m04_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m04_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m04_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m04_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m04_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      S_AXI_arprot(2 downto 0) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      S_AXI_arready(0) => xbar_to_m04_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(31 downto 0) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      S_AXI_awprot(2 downto 0) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      S_AXI_awready(0) => xbar_to_m04_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready(0) => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m04_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m04_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wready(0) => xbar_to_m04_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid(0) => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_1JSI4MS
     port map (
      M_ACLK => M05_ACLK_1,
      M_ARESETN => M05_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m05_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m05_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m05_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m05_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m05_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m05_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m05_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m05_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m05_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m05_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m05_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m05_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m05_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m05_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m05_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m05_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m05_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m05_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m05_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      S_AXI_arprot(2 downto 0) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      S_AXI_arready => xbar_to_m05_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(31 downto 0) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      S_AXI_awprot(2 downto 0) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      S_AXI_awready => xbar_to_m05_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m05_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m05_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready => xbar_to_m05_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      S_AXI_wvalid => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_9VFMHI
     port map (
      M_ACLK => M06_ACLK_1,
      M_ARESETN => M06_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m06_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m06_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m06_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m06_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m06_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m06_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m06_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m06_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m06_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m06_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m06_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m06_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m06_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m06_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m06_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m06_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m06_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m06_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      S_AXI_arprot(2 downto 0) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      S_AXI_arready => xbar_to_m06_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(31 downto 0) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      S_AXI_awprot(2 downto 0) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      S_AXI_awready => xbar_to_m06_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m06_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m06_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready => xbar_to_m06_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid => xbar_to_m06_couplers_WVALID(6)
    );
m07_couplers: entity work.m07_couplers_imp_1KTHV1Z
     port map (
      M_ACLK => M07_ACLK_1,
      M_ARESETN => M07_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m07_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m07_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m07_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m07_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m07_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m07_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m07_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m07_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m07_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m07_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m07_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m07_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m07_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m07_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m07_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m07_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m07_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m07_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m07_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      S_AXI_arprot(2 downto 0) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      S_AXI_arready => xbar_to_m07_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m07_couplers_ARVALID(7),
      S_AXI_awaddr(31 downto 0) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      S_AXI_awprot(2 downto 0) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      S_AXI_awready => xbar_to_m07_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m07_couplers_AWVALID(7),
      S_AXI_bready => xbar_to_m07_couplers_BREADY(7),
      S_AXI_bresp(1 downto 0) => xbar_to_m07_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m07_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m07_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m07_couplers_RREADY(7),
      S_AXI_rresp(1 downto 0) => xbar_to_m07_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m07_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m07_couplers_WDATA(255 downto 224),
      S_AXI_wready => xbar_to_m07_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      S_AXI_wvalid => xbar_to_m07_couplers_WVALID(7)
    );
m08_couplers: entity work.m08_couplers_imp_GAJIU7
     port map (
      M_ACLK => M08_ACLK_1,
      M_ARESETN => M08_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m08_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m08_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m08_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m08_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m08_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m08_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m08_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m08_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m08_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m08_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m08_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m08_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m08_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m08_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m08_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m08_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m08_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m08_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m08_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m08_couplers_ARADDR(287 downto 256),
      S_AXI_arprot(2 downto 0) => xbar_to_m08_couplers_ARPROT(26 downto 24),
      S_AXI_arready => xbar_to_m08_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m08_couplers_ARVALID(8),
      S_AXI_awaddr(31 downto 0) => xbar_to_m08_couplers_AWADDR(287 downto 256),
      S_AXI_awprot(2 downto 0) => xbar_to_m08_couplers_AWPROT(26 downto 24),
      S_AXI_awready => xbar_to_m08_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m08_couplers_AWVALID(8),
      S_AXI_bready => xbar_to_m08_couplers_BREADY(8),
      S_AXI_bresp(1 downto 0) => xbar_to_m08_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m08_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m08_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m08_couplers_RREADY(8),
      S_AXI_rresp(1 downto 0) => xbar_to_m08_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m08_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m08_couplers_WDATA(287 downto 256),
      S_AXI_wready => xbar_to_m08_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m08_couplers_WSTRB(35 downto 32),
      S_AXI_wvalid => xbar_to_m08_couplers_WVALID(8)
    );
m09_couplers: entity work.m09_couplers_imp_1NCRAPQ
     port map (
      M_ACLK => M09_ACLK_1,
      M_ARESETN => M09_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m09_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m09_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m09_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m09_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m09_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m09_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m09_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m09_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m09_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m09_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m09_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m09_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m09_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m09_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m09_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m09_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m09_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m09_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m09_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m09_couplers_ARADDR(319 downto 288),
      S_AXI_arprot(2 downto 0) => xbar_to_m09_couplers_ARPROT(29 downto 27),
      S_AXI_arready => xbar_to_m09_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m09_couplers_ARVALID(9),
      S_AXI_awaddr(31 downto 0) => xbar_to_m09_couplers_AWADDR(319 downto 288),
      S_AXI_awprot(2 downto 0) => xbar_to_m09_couplers_AWPROT(29 downto 27),
      S_AXI_awready => xbar_to_m09_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m09_couplers_AWVALID(9),
      S_AXI_bready => xbar_to_m09_couplers_BREADY(9),
      S_AXI_bresp(1 downto 0) => xbar_to_m09_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m09_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m09_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m09_couplers_RREADY(9),
      S_AXI_rresp(1 downto 0) => xbar_to_m09_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m09_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m09_couplers_WDATA(319 downto 288),
      S_AXI_wready => xbar_to_m09_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m09_couplers_WSTRB(39 downto 36),
      S_AXI_wvalid => xbar_to_m09_couplers_WVALID(9)
    );
m10_couplers: entity work.m10_couplers_imp_1XDMGJV
     port map (
      M_ACLK => M10_ACLK_1,
      M_ARESETN => M10_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m10_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m10_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m10_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m10_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m10_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m10_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m10_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m10_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m10_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m10_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m10_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m10_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m10_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m10_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m10_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m10_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m10_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m10_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m10_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m10_couplers_ARADDR(351 downto 320),
      S_AXI_arprot(2 downto 0) => xbar_to_m10_couplers_ARPROT(32 downto 30),
      S_AXI_arready => xbar_to_m10_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m10_couplers_ARVALID(10),
      S_AXI_awaddr(31 downto 0) => xbar_to_m10_couplers_AWADDR(351 downto 320),
      S_AXI_awprot(2 downto 0) => xbar_to_m10_couplers_AWPROT(32 downto 30),
      S_AXI_awready => xbar_to_m10_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m10_couplers_AWVALID(10),
      S_AXI_bready => xbar_to_m10_couplers_BREADY(10),
      S_AXI_bresp(1 downto 0) => xbar_to_m10_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m10_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m10_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m10_couplers_RREADY(10),
      S_AXI_rresp(1 downto 0) => xbar_to_m10_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m10_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m10_couplers_WDATA(351 downto 320),
      S_AXI_wready => xbar_to_m10_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m10_couplers_WSTRB(43 downto 40),
      S_AXI_wvalid => xbar_to_m10_couplers_WVALID(10)
    );
m11_couplers: entity work.m11_couplers_imp_5X9RJE
     port map (
      M_ACLK => M11_ACLK_1,
      M_ARESETN => M11_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m11_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m11_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready => m11_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m11_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m11_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m11_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready => m11_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m11_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m11_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m11_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m11_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m11_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m11_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m11_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m11_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m11_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m11_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m11_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m11_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m11_couplers_ARADDR(383 downto 352),
      S_AXI_arprot(2 downto 0) => xbar_to_m11_couplers_ARPROT(35 downto 33),
      S_AXI_arready => xbar_to_m11_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m11_couplers_ARVALID(11),
      S_AXI_awaddr(31 downto 0) => xbar_to_m11_couplers_AWADDR(383 downto 352),
      S_AXI_awprot(2 downto 0) => xbar_to_m11_couplers_AWPROT(35 downto 33),
      S_AXI_awready => xbar_to_m11_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m11_couplers_AWVALID(11),
      S_AXI_bready => xbar_to_m11_couplers_BREADY(11),
      S_AXI_bresp(1 downto 0) => xbar_to_m11_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m11_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m11_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m11_couplers_RREADY(11),
      S_AXI_rresp(1 downto 0) => xbar_to_m11_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m11_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m11_couplers_WDATA(383 downto 352),
      S_AXI_wready => xbar_to_m11_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m11_couplers_WSTRB(47 downto 44),
      S_AXI_wvalid => xbar_to_m11_couplers_WVALID(11)
    );
m12_couplers: entity work.m12_couplers_imp_1YZTZUW
     port map (
      M_ACLK => M12_ACLK_1,
      M_ARESETN => M12_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m12_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m12_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m12_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m12_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m12_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m12_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m12_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m12_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m12_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m12_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m12_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m12_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m12_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m12_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m12_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m12_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m12_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m12_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m12_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m12_couplers_ARADDR(415 downto 384),
      S_AXI_arprot(2 downto 0) => xbar_to_m12_couplers_ARPROT(38 downto 36),
      S_AXI_arready(0) => xbar_to_m12_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m12_couplers_ARVALID(12),
      S_AXI_awaddr(31 downto 0) => xbar_to_m12_couplers_AWADDR(415 downto 384),
      S_AXI_awprot(2 downto 0) => xbar_to_m12_couplers_AWPROT(38 downto 36),
      S_AXI_awready(0) => xbar_to_m12_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m12_couplers_AWVALID(12),
      S_AXI_bready(0) => xbar_to_m12_couplers_BREADY(12),
      S_AXI_bresp(1 downto 0) => xbar_to_m12_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m12_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m12_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m12_couplers_RREADY(12),
      S_AXI_rresp(1 downto 0) => xbar_to_m12_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m12_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m12_couplers_WDATA(415 downto 384),
      S_AXI_wready(0) => xbar_to_m12_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m12_couplers_WSTRB(51 downto 48),
      S_AXI_wvalid(0) => xbar_to_m12_couplers_WVALID(12)
    );
m13_couplers: entity work.m13_couplers_imp_4LCA3T
     port map (
      M_ACLK => M13_ACLK_1,
      M_ARESETN => M13_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m13_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m13_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m13_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m13_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m13_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m13_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m13_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m13_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m13_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m13_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m13_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m13_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m13_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m13_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m13_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m13_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m13_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m13_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m13_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m13_couplers_ARADDR(447 downto 416),
      S_AXI_arprot(2 downto 0) => xbar_to_m13_couplers_ARPROT(41 downto 39),
      S_AXI_arready(0) => xbar_to_m13_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m13_couplers_ARVALID(13),
      S_AXI_awaddr(31 downto 0) => xbar_to_m13_couplers_AWADDR(447 downto 416),
      S_AXI_awprot(2 downto 0) => xbar_to_m13_couplers_AWPROT(41 downto 39),
      S_AXI_awready(0) => xbar_to_m13_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m13_couplers_AWVALID(13),
      S_AXI_bready(0) => xbar_to_m13_couplers_BREADY(13),
      S_AXI_bresp(1 downto 0) => xbar_to_m13_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m13_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m13_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m13_couplers_RREADY(13),
      S_AXI_rresp(1 downto 0) => xbar_to_m13_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m13_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m13_couplers_WDATA(447 downto 416),
      S_AXI_wready(0) => xbar_to_m13_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m13_couplers_WSTRB(55 downto 52),
      S_AXI_wvalid(0) => xbar_to_m13_couplers_WVALID(13)
    );
m14_couplers: entity work.m14_couplers_imp_1V1NUX9
     port map (
      M_ACLK => M14_ACLK_1,
      M_ARESETN => M14_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m14_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m14_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m14_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m14_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m14_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m14_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m14_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m14_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m14_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m14_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m14_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m14_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m14_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m14_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m14_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m14_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m14_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m14_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m14_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m14_couplers_ARADDR(479 downto 448),
      S_AXI_arprot(2 downto 0) => xbar_to_m14_couplers_ARPROT(44 downto 42),
      S_AXI_arready(0) => xbar_to_m14_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m14_couplers_ARVALID(14),
      S_AXI_awaddr(31 downto 0) => xbar_to_m14_couplers_AWADDR(479 downto 448),
      S_AXI_awprot(2 downto 0) => xbar_to_m14_couplers_AWPROT(44 downto 42),
      S_AXI_awready(0) => xbar_to_m14_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m14_couplers_AWVALID(14),
      S_AXI_bready(0) => xbar_to_m14_couplers_BREADY(14),
      S_AXI_bresp(1 downto 0) => xbar_to_m14_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m14_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m14_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m14_couplers_RREADY(14),
      S_AXI_rresp(1 downto 0) => xbar_to_m14_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m14_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m14_couplers_WDATA(479 downto 448),
      S_AXI_wready(0) => xbar_to_m14_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m14_couplers_WSTRB(59 downto 56),
      S_AXI_wvalid(0) => xbar_to_m14_couplers_WVALID(14)
    );
s00_couplers: entity work.s00_couplers_imp_1N209JL
     port map (
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => slave_interconnect_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => slave_interconnect_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arlen(7 downto 0) => slave_interconnect_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arready => slave_interconnect_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => slave_interconnect_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => slave_interconnect_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => slave_interconnect_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => slave_interconnect_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awlen(7 downto 0) => slave_interconnect_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awready => slave_interconnect_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => slave_interconnect_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => slave_interconnect_to_s00_couplers_AWVALID,
      S_AXI_bready => slave_interconnect_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => slave_interconnect_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => slave_interconnect_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => slave_interconnect_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rlast => slave_interconnect_to_s00_couplers_RLAST,
      S_AXI_rready => slave_interconnect_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => slave_interconnect_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => slave_interconnect_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => slave_interconnect_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wlast => slave_interconnect_to_s00_couplers_WLAST,
      S_AXI_wready => slave_interconnect_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => slave_interconnect_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => slave_interconnect_to_s00_couplers_WVALID
    );
s01_couplers: entity work.s01_couplers_imp_GIJM40
     port map (
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s01_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(1 downto 0) => s01_couplers_to_xbar_ARPROT(1 downto 0),
      M_AXI_arready(0) => s01_couplers_to_xbar_ARREADY(1),
      M_AXI_arvalid(0) => s01_couplers_to_xbar_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(1 downto 0) => s01_couplers_to_xbar_AWPROT(1 downto 0),
      M_AXI_awready(0) => s01_couplers_to_xbar_AWREADY(1),
      M_AXI_awvalid(0) => s01_couplers_to_xbar_AWVALID(0),
      M_AXI_bready(0) => s01_couplers_to_xbar_BREADY(0),
      M_AXI_bresp(1 downto 0) => s01_couplers_to_xbar_BRESP(3 downto 2),
      M_AXI_bvalid(0) => s01_couplers_to_xbar_BVALID(1),
      M_AXI_rdata(31 downto 0) => s01_couplers_to_xbar_RDATA(63 downto 32),
      M_AXI_rready(0) => s01_couplers_to_xbar_RREADY(0),
      M_AXI_rresp(1 downto 0) => s01_couplers_to_xbar_RRESP(3 downto 2),
      M_AXI_rvalid(0) => s01_couplers_to_xbar_RVALID(1),
      M_AXI_wdata(31 downto 0) => s01_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready(0) => s01_couplers_to_xbar_WREADY(1),
      M_AXI_wstrb(3 downto 0) => s01_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => s01_couplers_to_xbar_WVALID(0),
      S_ACLK => S01_ACLK_1,
      S_ARESETN => S01_ARESETN_1,
      S_AXI_araddr(31 downto 0) => slave_interconnect_to_s01_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(1 downto 0) => slave_interconnect_to_s01_couplers_ARPROT(1 downto 0),
      S_AXI_arready(0) => slave_interconnect_to_s01_couplers_ARREADY(0),
      S_AXI_arvalid(0) => slave_interconnect_to_s01_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => slave_interconnect_to_s01_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(1 downto 0) => slave_interconnect_to_s01_couplers_AWPROT(1 downto 0),
      S_AXI_awready(0) => slave_interconnect_to_s01_couplers_AWREADY(0),
      S_AXI_awvalid(0) => slave_interconnect_to_s01_couplers_AWVALID(0),
      S_AXI_bready(0) => slave_interconnect_to_s01_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => slave_interconnect_to_s01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => slave_interconnect_to_s01_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => slave_interconnect_to_s01_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => slave_interconnect_to_s01_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => slave_interconnect_to_s01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => slave_interconnect_to_s01_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => slave_interconnect_to_s01_couplers_WDATA(31 downto 0),
      S_AXI_wready(0) => slave_interconnect_to_s01_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => slave_interconnect_to_s01_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => slave_interconnect_to_s01_couplers_WVALID(0)
    );
s02_couplers: entity work.s02_couplers_imp_1LZRTN6
     port map (
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s02_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s02_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s02_couplers_to_xbar_ARREADY(2),
      M_AXI_arvalid => s02_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s02_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s02_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s02_couplers_to_xbar_AWREADY(2),
      M_AXI_awvalid => s02_couplers_to_xbar_AWVALID,
      M_AXI_bready => s02_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s02_couplers_to_xbar_BRESP(5 downto 4),
      M_AXI_bvalid => s02_couplers_to_xbar_BVALID(2),
      M_AXI_rdata(31 downto 0) => s02_couplers_to_xbar_RDATA(95 downto 64),
      M_AXI_rready => s02_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s02_couplers_to_xbar_RRESP(5 downto 4),
      M_AXI_rvalid => s02_couplers_to_xbar_RVALID(2),
      M_AXI_wdata(31 downto 0) => s02_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s02_couplers_to_xbar_WREADY(2),
      M_AXI_wstrb(3 downto 0) => s02_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s02_couplers_to_xbar_WVALID,
      S_ACLK => S02_ACLK_1,
      S_ARESETN => S02_ARESETN_1,
      S_AXI_araddr(31 downto 0) => slave_interconnect_to_s02_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => slave_interconnect_to_s02_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => slave_interconnect_to_s02_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(0) => slave_interconnect_to_s02_couplers_ARID(0),
      S_AXI_arlen(7 downto 0) => slave_interconnect_to_s02_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => slave_interconnect_to_s02_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => slave_interconnect_to_s02_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => slave_interconnect_to_s02_couplers_ARQOS(3 downto 0),
      S_AXI_arready => slave_interconnect_to_s02_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => slave_interconnect_to_s02_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => slave_interconnect_to_s02_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => slave_interconnect_to_s02_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => slave_interconnect_to_s02_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => slave_interconnect_to_s02_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(0) => slave_interconnect_to_s02_couplers_AWID(0),
      S_AXI_awlen(7 downto 0) => slave_interconnect_to_s02_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => slave_interconnect_to_s02_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => slave_interconnect_to_s02_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => slave_interconnect_to_s02_couplers_AWQOS(3 downto 0),
      S_AXI_awready => slave_interconnect_to_s02_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => slave_interconnect_to_s02_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => slave_interconnect_to_s02_couplers_AWVALID,
      S_AXI_bid(0) => slave_interconnect_to_s02_couplers_BID(0),
      S_AXI_bready => slave_interconnect_to_s02_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => slave_interconnect_to_s02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => slave_interconnect_to_s02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => slave_interconnect_to_s02_couplers_RDATA(31 downto 0),
      S_AXI_rid(0) => slave_interconnect_to_s02_couplers_RID(0),
      S_AXI_rlast => slave_interconnect_to_s02_couplers_RLAST,
      S_AXI_rready => slave_interconnect_to_s02_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => slave_interconnect_to_s02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => slave_interconnect_to_s02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => slave_interconnect_to_s02_couplers_WDATA(31 downto 0),
      S_AXI_wlast => slave_interconnect_to_s02_couplers_WLAST,
      S_AXI_wready => slave_interconnect_to_s02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => slave_interconnect_to_s02_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => slave_interconnect_to_s02_couplers_WVALID
    );
xbar: component c2cSlave_xbar_0
     port map (
      aclk => slave_interconnect_ACLK_net,
      aresetn => slave_interconnect_ARESETN_net,
      m_axi_araddr(479 downto 448) => xbar_to_m14_couplers_ARADDR(479 downto 448),
      m_axi_araddr(447 downto 416) => xbar_to_m13_couplers_ARADDR(447 downto 416),
      m_axi_araddr(415 downto 384) => xbar_to_m12_couplers_ARADDR(415 downto 384),
      m_axi_araddr(383 downto 352) => xbar_to_m11_couplers_ARADDR(383 downto 352),
      m_axi_araddr(351 downto 320) => xbar_to_m10_couplers_ARADDR(351 downto 320),
      m_axi_araddr(319 downto 288) => xbar_to_m09_couplers_ARADDR(319 downto 288),
      m_axi_araddr(287 downto 256) => xbar_to_m08_couplers_ARADDR(287 downto 256),
      m_axi_araddr(255 downto 224) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      m_axi_araddr(223 downto 192) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(44 downto 42) => xbar_to_m14_couplers_ARPROT(44 downto 42),
      m_axi_arprot(41 downto 39) => xbar_to_m13_couplers_ARPROT(41 downto 39),
      m_axi_arprot(38 downto 36) => xbar_to_m12_couplers_ARPROT(38 downto 36),
      m_axi_arprot(35 downto 33) => xbar_to_m11_couplers_ARPROT(35 downto 33),
      m_axi_arprot(32 downto 30) => xbar_to_m10_couplers_ARPROT(32 downto 30),
      m_axi_arprot(29 downto 27) => xbar_to_m09_couplers_ARPROT(29 downto 27),
      m_axi_arprot(26 downto 24) => xbar_to_m08_couplers_ARPROT(26 downto 24),
      m_axi_arprot(23 downto 21) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      m_axi_arprot(20 downto 18) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      m_axi_arprot(17 downto 15) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      m_axi_arprot(14 downto 12) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      m_axi_arprot(11 downto 9) => NLW_xbar_m_axi_arprot_UNCONNECTED(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => NLW_xbar_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready(14) => xbar_to_m14_couplers_ARREADY(0),
      m_axi_arready(13) => xbar_to_m13_couplers_ARREADY(0),
      m_axi_arready(12) => xbar_to_m12_couplers_ARREADY(0),
      m_axi_arready(11) => xbar_to_m11_couplers_ARREADY,
      m_axi_arready(10) => xbar_to_m10_couplers_ARREADY,
      m_axi_arready(9) => xbar_to_m09_couplers_ARREADY,
      m_axi_arready(8) => xbar_to_m08_couplers_ARREADY,
      m_axi_arready(7) => xbar_to_m07_couplers_ARREADY,
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY,
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY,
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY(0),
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY(0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY(0),
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(14) => xbar_to_m14_couplers_ARVALID(14),
      m_axi_arvalid(13) => xbar_to_m13_couplers_ARVALID(13),
      m_axi_arvalid(12) => xbar_to_m12_couplers_ARVALID(12),
      m_axi_arvalid(11) => xbar_to_m11_couplers_ARVALID(11),
      m_axi_arvalid(10) => xbar_to_m10_couplers_ARVALID(10),
      m_axi_arvalid(9) => xbar_to_m09_couplers_ARVALID(9),
      m_axi_arvalid(8) => xbar_to_m08_couplers_ARVALID(8),
      m_axi_arvalid(7) => xbar_to_m07_couplers_ARVALID(7),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(479 downto 448) => xbar_to_m14_couplers_AWADDR(479 downto 448),
      m_axi_awaddr(447 downto 416) => xbar_to_m13_couplers_AWADDR(447 downto 416),
      m_axi_awaddr(415 downto 384) => xbar_to_m12_couplers_AWADDR(415 downto 384),
      m_axi_awaddr(383 downto 352) => xbar_to_m11_couplers_AWADDR(383 downto 352),
      m_axi_awaddr(351 downto 320) => xbar_to_m10_couplers_AWADDR(351 downto 320),
      m_axi_awaddr(319 downto 288) => xbar_to_m09_couplers_AWADDR(319 downto 288),
      m_axi_awaddr(287 downto 256) => xbar_to_m08_couplers_AWADDR(287 downto 256),
      m_axi_awaddr(255 downto 224) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      m_axi_awaddr(223 downto 192) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(44 downto 42) => xbar_to_m14_couplers_AWPROT(44 downto 42),
      m_axi_awprot(41 downto 39) => xbar_to_m13_couplers_AWPROT(41 downto 39),
      m_axi_awprot(38 downto 36) => xbar_to_m12_couplers_AWPROT(38 downto 36),
      m_axi_awprot(35 downto 33) => xbar_to_m11_couplers_AWPROT(35 downto 33),
      m_axi_awprot(32 downto 30) => xbar_to_m10_couplers_AWPROT(32 downto 30),
      m_axi_awprot(29 downto 27) => xbar_to_m09_couplers_AWPROT(29 downto 27),
      m_axi_awprot(26 downto 24) => xbar_to_m08_couplers_AWPROT(26 downto 24),
      m_axi_awprot(23 downto 21) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      m_axi_awprot(20 downto 18) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      m_axi_awprot(17 downto 15) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      m_axi_awprot(14 downto 12) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      m_axi_awprot(11 downto 9) => NLW_xbar_m_axi_awprot_UNCONNECTED(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => NLW_xbar_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready(14) => xbar_to_m14_couplers_AWREADY(0),
      m_axi_awready(13) => xbar_to_m13_couplers_AWREADY(0),
      m_axi_awready(12) => xbar_to_m12_couplers_AWREADY(0),
      m_axi_awready(11) => xbar_to_m11_couplers_AWREADY,
      m_axi_awready(10) => xbar_to_m10_couplers_AWREADY,
      m_axi_awready(9) => xbar_to_m09_couplers_AWREADY,
      m_axi_awready(8) => xbar_to_m08_couplers_AWREADY,
      m_axi_awready(7) => xbar_to_m07_couplers_AWREADY,
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY,
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY,
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY(0),
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY(0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY(0),
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(14) => xbar_to_m14_couplers_AWVALID(14),
      m_axi_awvalid(13) => xbar_to_m13_couplers_AWVALID(13),
      m_axi_awvalid(12) => xbar_to_m12_couplers_AWVALID(12),
      m_axi_awvalid(11) => xbar_to_m11_couplers_AWVALID(11),
      m_axi_awvalid(10) => xbar_to_m10_couplers_AWVALID(10),
      m_axi_awvalid(9) => xbar_to_m09_couplers_AWVALID(9),
      m_axi_awvalid(8) => xbar_to_m08_couplers_AWVALID(8),
      m_axi_awvalid(7) => xbar_to_m07_couplers_AWVALID(7),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(14) => xbar_to_m14_couplers_BREADY(14),
      m_axi_bready(13) => xbar_to_m13_couplers_BREADY(13),
      m_axi_bready(12) => xbar_to_m12_couplers_BREADY(12),
      m_axi_bready(11) => xbar_to_m11_couplers_BREADY(11),
      m_axi_bready(10) => xbar_to_m10_couplers_BREADY(10),
      m_axi_bready(9) => xbar_to_m09_couplers_BREADY(9),
      m_axi_bready(8) => xbar_to_m08_couplers_BREADY(8),
      m_axi_bready(7) => xbar_to_m07_couplers_BREADY(7),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(29 downto 28) => xbar_to_m14_couplers_BRESP(1 downto 0),
      m_axi_bresp(27 downto 26) => xbar_to_m13_couplers_BRESP(1 downto 0),
      m_axi_bresp(25 downto 24) => xbar_to_m12_couplers_BRESP(1 downto 0),
      m_axi_bresp(23 downto 22) => xbar_to_m11_couplers_BRESP(1 downto 0),
      m_axi_bresp(21 downto 20) => xbar_to_m10_couplers_BRESP(1 downto 0),
      m_axi_bresp(19 downto 18) => xbar_to_m09_couplers_BRESP(1 downto 0),
      m_axi_bresp(17 downto 16) => xbar_to_m08_couplers_BRESP(1 downto 0),
      m_axi_bresp(15 downto 14) => xbar_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(14) => xbar_to_m14_couplers_BVALID(0),
      m_axi_bvalid(13) => xbar_to_m13_couplers_BVALID(0),
      m_axi_bvalid(12) => xbar_to_m12_couplers_BVALID(0),
      m_axi_bvalid(11) => xbar_to_m11_couplers_BVALID,
      m_axi_bvalid(10) => xbar_to_m10_couplers_BVALID,
      m_axi_bvalid(9) => xbar_to_m09_couplers_BVALID,
      m_axi_bvalid(8) => xbar_to_m08_couplers_BVALID,
      m_axi_bvalid(7) => xbar_to_m07_couplers_BVALID,
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID,
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID,
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID(0),
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID(0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID(0),
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(479 downto 448) => xbar_to_m14_couplers_RDATA(31 downto 0),
      m_axi_rdata(447 downto 416) => xbar_to_m13_couplers_RDATA(31 downto 0),
      m_axi_rdata(415 downto 384) => xbar_to_m12_couplers_RDATA(31 downto 0),
      m_axi_rdata(383 downto 352) => xbar_to_m11_couplers_RDATA(31 downto 0),
      m_axi_rdata(351 downto 320) => xbar_to_m10_couplers_RDATA(31 downto 0),
      m_axi_rdata(319 downto 288) => xbar_to_m09_couplers_RDATA(31 downto 0),
      m_axi_rdata(287 downto 256) => xbar_to_m08_couplers_RDATA(31 downto 0),
      m_axi_rdata(255 downto 224) => xbar_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(14) => xbar_to_m14_couplers_RREADY(14),
      m_axi_rready(13) => xbar_to_m13_couplers_RREADY(13),
      m_axi_rready(12) => xbar_to_m12_couplers_RREADY(12),
      m_axi_rready(11) => xbar_to_m11_couplers_RREADY(11),
      m_axi_rready(10) => xbar_to_m10_couplers_RREADY(10),
      m_axi_rready(9) => xbar_to_m09_couplers_RREADY(9),
      m_axi_rready(8) => xbar_to_m08_couplers_RREADY(8),
      m_axi_rready(7) => xbar_to_m07_couplers_RREADY(7),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(29 downto 28) => xbar_to_m14_couplers_RRESP(1 downto 0),
      m_axi_rresp(27 downto 26) => xbar_to_m13_couplers_RRESP(1 downto 0),
      m_axi_rresp(25 downto 24) => xbar_to_m12_couplers_RRESP(1 downto 0),
      m_axi_rresp(23 downto 22) => xbar_to_m11_couplers_RRESP(1 downto 0),
      m_axi_rresp(21 downto 20) => xbar_to_m10_couplers_RRESP(1 downto 0),
      m_axi_rresp(19 downto 18) => xbar_to_m09_couplers_RRESP(1 downto 0),
      m_axi_rresp(17 downto 16) => xbar_to_m08_couplers_RRESP(1 downto 0),
      m_axi_rresp(15 downto 14) => xbar_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(14) => xbar_to_m14_couplers_RVALID(0),
      m_axi_rvalid(13) => xbar_to_m13_couplers_RVALID(0),
      m_axi_rvalid(12) => xbar_to_m12_couplers_RVALID(0),
      m_axi_rvalid(11) => xbar_to_m11_couplers_RVALID,
      m_axi_rvalid(10) => xbar_to_m10_couplers_RVALID,
      m_axi_rvalid(9) => xbar_to_m09_couplers_RVALID,
      m_axi_rvalid(8) => xbar_to_m08_couplers_RVALID,
      m_axi_rvalid(7) => xbar_to_m07_couplers_RVALID,
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID,
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID,
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID(0),
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID(0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID(0),
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(479 downto 448) => xbar_to_m14_couplers_WDATA(479 downto 448),
      m_axi_wdata(447 downto 416) => xbar_to_m13_couplers_WDATA(447 downto 416),
      m_axi_wdata(415 downto 384) => xbar_to_m12_couplers_WDATA(415 downto 384),
      m_axi_wdata(383 downto 352) => xbar_to_m11_couplers_WDATA(383 downto 352),
      m_axi_wdata(351 downto 320) => xbar_to_m10_couplers_WDATA(351 downto 320),
      m_axi_wdata(319 downto 288) => xbar_to_m09_couplers_WDATA(319 downto 288),
      m_axi_wdata(287 downto 256) => xbar_to_m08_couplers_WDATA(287 downto 256),
      m_axi_wdata(255 downto 224) => xbar_to_m07_couplers_WDATA(255 downto 224),
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(14) => xbar_to_m14_couplers_WREADY(0),
      m_axi_wready(13) => xbar_to_m13_couplers_WREADY(0),
      m_axi_wready(12) => xbar_to_m12_couplers_WREADY(0),
      m_axi_wready(11) => xbar_to_m11_couplers_WREADY,
      m_axi_wready(10) => xbar_to_m10_couplers_WREADY,
      m_axi_wready(9) => xbar_to_m09_couplers_WREADY,
      m_axi_wready(8) => xbar_to_m08_couplers_WREADY,
      m_axi_wready(7) => xbar_to_m07_couplers_WREADY,
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY,
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY,
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY(0),
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY(0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY(0),
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(59 downto 56) => xbar_to_m14_couplers_WSTRB(59 downto 56),
      m_axi_wstrb(55 downto 52) => xbar_to_m13_couplers_WSTRB(55 downto 52),
      m_axi_wstrb(51 downto 48) => xbar_to_m12_couplers_WSTRB(51 downto 48),
      m_axi_wstrb(47 downto 44) => xbar_to_m11_couplers_WSTRB(47 downto 44),
      m_axi_wstrb(43 downto 40) => xbar_to_m10_couplers_WSTRB(43 downto 40),
      m_axi_wstrb(39 downto 36) => xbar_to_m09_couplers_WSTRB(39 downto 36),
      m_axi_wstrb(35 downto 32) => xbar_to_m08_couplers_WSTRB(35 downto 32),
      m_axi_wstrb(31 downto 28) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(14) => xbar_to_m14_couplers_WVALID(14),
      m_axi_wvalid(13) => xbar_to_m13_couplers_WVALID(13),
      m_axi_wvalid(12) => xbar_to_m12_couplers_WVALID(12),
      m_axi_wvalid(11) => xbar_to_m11_couplers_WVALID(11),
      m_axi_wvalid(10) => xbar_to_m10_couplers_WVALID(10),
      m_axi_wvalid(9) => xbar_to_m09_couplers_WVALID(9),
      m_axi_wvalid(8) => xbar_to_m08_couplers_WVALID(8),
      m_axi_wvalid(7) => xbar_to_m07_couplers_WVALID(7),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(95 downto 64) => s02_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_araddr(63 downto 32) => s01_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(8 downto 6) => s02_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arprot(5) => '0',
      s_axi_arprot(4 downto 3) => s01_couplers_to_xbar_ARPROT(1 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(2) => s02_couplers_to_xbar_ARREADY(2),
      s_axi_arready(1) => s01_couplers_to_xbar_ARREADY(1),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(2) => s02_couplers_to_xbar_ARVALID,
      s_axi_arvalid(1) => s01_couplers_to_xbar_ARVALID(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(95 downto 64) => s02_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(63 downto 32) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(8 downto 6) => s02_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awprot(5) => '0',
      s_axi_awprot(4 downto 3) => s01_couplers_to_xbar_AWPROT(1 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(2) => s02_couplers_to_xbar_AWREADY(2),
      s_axi_awready(1) => s01_couplers_to_xbar_AWREADY(1),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(2) => s02_couplers_to_xbar_AWVALID,
      s_axi_awvalid(1) => s01_couplers_to_xbar_AWVALID(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(2) => s02_couplers_to_xbar_BREADY,
      s_axi_bready(1) => s01_couplers_to_xbar_BREADY(0),
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(5 downto 4) => s02_couplers_to_xbar_BRESP(5 downto 4),
      s_axi_bresp(3 downto 2) => s01_couplers_to_xbar_BRESP(3 downto 2),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(2) => s02_couplers_to_xbar_BVALID(2),
      s_axi_bvalid(1) => s01_couplers_to_xbar_BVALID(1),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(95 downto 64) => s02_couplers_to_xbar_RDATA(95 downto 64),
      s_axi_rdata(63 downto 32) => s01_couplers_to_xbar_RDATA(63 downto 32),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(2) => s02_couplers_to_xbar_RREADY,
      s_axi_rready(1) => s01_couplers_to_xbar_RREADY(0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(5 downto 4) => s02_couplers_to_xbar_RRESP(5 downto 4),
      s_axi_rresp(3 downto 2) => s01_couplers_to_xbar_RRESP(3 downto 2),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(2) => s02_couplers_to_xbar_RVALID(2),
      s_axi_rvalid(1) => s01_couplers_to_xbar_RVALID(1),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(95 downto 64) => s02_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wdata(63 downto 32) => s01_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(2) => s02_couplers_to_xbar_WREADY(2),
      s_axi_wready(1) => s01_couplers_to_xbar_WREADY(1),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(11 downto 8) => s02_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wstrb(7 downto 4) => s01_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(2) => s02_couplers_to_xbar_WVALID,
      s_axi_wvalid(1) => s01_couplers_to_xbar_WVALID(0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c2cSlave is
  port (
    AXI_CLK : in STD_LOGIC;
    AXI_RST_N : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    C2C_INTFS_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    CM1_PB_UART_rxd : in STD_LOGIC;
    CM1_PB_UART_txd : out STD_LOGIC;
    DAQ_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DAQ_arready : in STD_LOGIC;
    DAQ_arvalid : out STD_LOGIC;
    DAQ_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DAQ_awready : in STD_LOGIC;
    DAQ_awvalid : out STD_LOGIC;
    DAQ_bready : out STD_LOGIC;
    DAQ_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DAQ_bvalid : in STD_LOGIC;
    DAQ_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_rready : out STD_LOGIC;
    DAQ_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DAQ_rvalid : in STD_LOGIC;
    DAQ_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_wready : in STD_LOGIC;
    DAQ_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DAQ_wvalid : out STD_LOGIC;
    FM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_arready : in STD_LOGIC;
    FM_arvalid : out STD_LOGIC;
    FM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_awready : in STD_LOGIC;
    FM_awvalid : out STD_LOGIC;
    FM_bready : out STD_LOGIC;
    FM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_bvalid : in STD_LOGIC;
    FM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_rready : out STD_LOGIC;
    FM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_rvalid : in STD_LOGIC;
    FM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_wready : in STD_LOGIC;
    FM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FM_wvalid : out STD_LOGIC;
    FW_INFO_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FW_INFO_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_arready : in STD_LOGIC;
    HAL_arvalid : out STD_LOGIC;
    HAL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_awready : in STD_LOGIC;
    HAL_awvalid : out STD_LOGIC;
    HAL_bready : out STD_LOGIC;
    HAL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_bvalid : in STD_LOGIC;
    HAL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_rready : out STD_LOGIC;
    HAL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_rvalid : in STD_LOGIC;
    HAL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_wready : in STD_LOGIC;
    HAL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_wvalid : out STD_LOGIC;
    HOG_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HOG_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HPS_INN_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_INN_arready : in STD_LOGIC;
    HPS_INN_arvalid : out STD_LOGIC;
    HPS_INN_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_INN_awready : in STD_LOGIC;
    HPS_INN_awvalid : out STD_LOGIC;
    HPS_INN_bready : out STD_LOGIC;
    HPS_INN_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_INN_bvalid : in STD_LOGIC;
    HPS_INN_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_rready : out STD_LOGIC;
    HPS_INN_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_INN_rvalid : in STD_LOGIC;
    HPS_INN_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_wready : in STD_LOGIC;
    HPS_INN_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_INN_wvalid : out STD_LOGIC;
    HPS_MID_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_MID_arready : in STD_LOGIC;
    HPS_MID_arvalid : out STD_LOGIC;
    HPS_MID_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_MID_awready : in STD_LOGIC;
    HPS_MID_awvalid : out STD_LOGIC;
    HPS_MID_bready : out STD_LOGIC;
    HPS_MID_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_MID_bvalid : in STD_LOGIC;
    HPS_MID_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_rready : out STD_LOGIC;
    HPS_MID_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_MID_rvalid : in STD_LOGIC;
    HPS_MID_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_wready : in STD_LOGIC;
    HPS_MID_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_MID_wvalid : out STD_LOGIC;
    HPS_OUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_OUT_arready : in STD_LOGIC;
    HPS_OUT_arvalid : out STD_LOGIC;
    HPS_OUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_OUT_awready : in STD_LOGIC;
    HPS_OUT_awvalid : out STD_LOGIC;
    HPS_OUT_bready : out STD_LOGIC;
    HPS_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_OUT_bvalid : in STD_LOGIC;
    HPS_OUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_rready : out STD_LOGIC;
    HPS_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_OUT_rvalid : in STD_LOGIC;
    HPS_OUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_wready : in STD_LOGIC;
    HPS_OUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_OUT_wvalid : out STD_LOGIC;
    KINTEX_SYS_MGMT_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_overtemp_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccaux_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccint_alarm : out STD_LOGIC;
    K_C2CB_PHY_DEBUG_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2CB_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2CB_PHY_DRP_den : in STD_LOGIC;
    K_C2CB_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_drdy : out STD_LOGIC;
    K_C2CB_PHY_DRP_dwe : in STD_LOGIC;
    K_C2CB_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_channel_up : out STD_LOGIC;
    K_C2CB_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2CB_PHY_hard_err : out STD_LOGIC;
    K_C2CB_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_link_reset_out : out STD_LOGIC;
    K_C2CB_PHY_power_down : in STD_LOGIC;
    K_C2CB_PHY_soft_err : out STD_LOGIC;
    K_C2CB_aurora_do_cc : out STD_LOGIC;
    K_C2CB_aurora_pma_init_in : in STD_LOGIC;
    K_C2CB_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2CB_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2CB_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    K_C2C_PHY_CLK : out STD_LOGIC;
    K_C2C_PHY_DEBUG_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2C_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2C_PHY_DRP_den : in STD_LOGIC;
    K_C2C_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_drdy : out STD_LOGIC;
    K_C2C_PHY_DRP_dwe : in STD_LOGIC;
    K_C2C_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_channel_up : out STD_LOGIC;
    K_C2C_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2C_PHY_gt_refclk1_out : out STD_LOGIC;
    K_C2C_PHY_hard_err : out STD_LOGIC;
    K_C2C_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_link_reset_out : out STD_LOGIC;
    K_C2C_PHY_mmcm_not_locked_out : out STD_LOGIC;
    K_C2C_PHY_power_down : in STD_LOGIC;
    K_C2C_PHY_refclk_clk_n : in STD_LOGIC;
    K_C2C_PHY_refclk_clk_p : in STD_LOGIC;
    K_C2C_PHY_soft_err : out STD_LOGIC;
    K_C2C_aurora_do_cc : out STD_LOGIC;
    K_C2C_aurora_pma_init_in : in STD_LOGIC;
    K_C2C_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2C_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2C_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    MPL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MPL_arready : in STD_LOGIC;
    MPL_arvalid : out STD_LOGIC;
    MPL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MPL_awready : in STD_LOGIC;
    MPL_awvalid : out STD_LOGIC;
    MPL_bready : out STD_LOGIC;
    MPL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MPL_bvalid : in STD_LOGIC;
    MPL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_rready : out STD_LOGIC;
    MPL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MPL_rvalid : in STD_LOGIC;
    MPL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_wready : in STD_LOGIC;
    MPL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    MPL_wvalid : out STD_LOGIC;
    MTC_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MTC_arready : in STD_LOGIC;
    MTC_arvalid : out STD_LOGIC;
    MTC_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MTC_awready : in STD_LOGIC;
    MTC_awvalid : out STD_LOGIC;
    MTC_bready : out STD_LOGIC;
    MTC_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MTC_bvalid : in STD_LOGIC;
    MTC_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_rready : out STD_LOGIC;
    MTC_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MTC_rvalid : in STD_LOGIC;
    MTC_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_wready : in STD_LOGIC;
    MTC_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    MTC_wvalid : out STD_LOGIC;
    TAR_INN_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_INN_arready : in STD_LOGIC;
    TAR_INN_arvalid : out STD_LOGIC;
    TAR_INN_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_INN_awready : in STD_LOGIC;
    TAR_INN_awvalid : out STD_LOGIC;
    TAR_INN_bready : out STD_LOGIC;
    TAR_INN_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_INN_bvalid : in STD_LOGIC;
    TAR_INN_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_rready : out STD_LOGIC;
    TAR_INN_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_INN_rvalid : in STD_LOGIC;
    TAR_INN_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_wready : in STD_LOGIC;
    TAR_INN_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_INN_wvalid : out STD_LOGIC;
    TAR_MID_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_MID_arready : in STD_LOGIC;
    TAR_MID_arvalid : out STD_LOGIC;
    TAR_MID_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_MID_awready : in STD_LOGIC;
    TAR_MID_awvalid : out STD_LOGIC;
    TAR_MID_bready : out STD_LOGIC;
    TAR_MID_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_MID_bvalid : in STD_LOGIC;
    TAR_MID_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_rready : out STD_LOGIC;
    TAR_MID_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_MID_rvalid : in STD_LOGIC;
    TAR_MID_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_wready : in STD_LOGIC;
    TAR_MID_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_MID_wvalid : out STD_LOGIC;
    TAR_OUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_OUT_arready : in STD_LOGIC;
    TAR_OUT_arvalid : out STD_LOGIC;
    TAR_OUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_OUT_awready : in STD_LOGIC;
    TAR_OUT_awvalid : out STD_LOGIC;
    TAR_OUT_bready : out STD_LOGIC;
    TAR_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_OUT_bvalid : in STD_LOGIC;
    TAR_OUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_rready : out STD_LOGIC;
    TAR_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_OUT_rvalid : in STD_LOGIC;
    TAR_OUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_wready : in STD_LOGIC;
    TAR_OUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_OUT_wvalid : out STD_LOGIC;
    TF_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TF_arready : in STD_LOGIC;
    TF_arvalid : out STD_LOGIC;
    TF_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TF_awready : in STD_LOGIC;
    TF_awvalid : out STD_LOGIC;
    TF_bready : out STD_LOGIC;
    TF_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TF_bvalid : in STD_LOGIC;
    TF_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_rready : out STD_LOGIC;
    TF_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TF_rvalid : in STD_LOGIC;
    TF_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_wready : in STD_LOGIC;
    TF_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TF_wvalid : out STD_LOGIC;
    UCM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    UCM_arready : in STD_LOGIC;
    UCM_arvalid : out STD_LOGIC;
    UCM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    UCM_awready : in STD_LOGIC;
    UCM_awvalid : out STD_LOGIC;
    UCM_bready : out STD_LOGIC;
    UCM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    UCM_bvalid : in STD_LOGIC;
    UCM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_rready : out STD_LOGIC;
    UCM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    UCM_rvalid : in STD_LOGIC;
    UCM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_wready : in STD_LOGIC;
    UCM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    UCM_wvalid : out STD_LOGIC;
    clk40 : in STD_LOGIC;
    clk50Mhz : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of c2cSlave : entity is "c2cSlave,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=c2cSlave,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=58,numReposBlks=27,numNonXlnxBlks=0,numHierBlks=31,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of c2cSlave : entity is "c2cSlave.hwdef";
end c2cSlave;

architecture STRUCTURE of c2cSlave is
  component c2cSlave_sys_reseter_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component c2cSlave_sys_reseter_0;
  component c2cSlave_K_C2C_0 is
  port (
    m_aclk : in STD_LOGIC;
    m_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    axi_c2c_s2m_intr_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_c2c_m2s_intr_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_c2c_phy_clk : in STD_LOGIC;
    axi_c2c_aurora_channel_up : in STD_LOGIC;
    axi_c2c_aurora_tx_tready : in STD_LOGIC;
    axi_c2c_aurora_tx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    axi_c2c_aurora_tx_tvalid : out STD_LOGIC;
    axi_c2c_aurora_rx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    axi_c2c_aurora_rx_tvalid : in STD_LOGIC;
    aurora_do_cc : out STD_LOGIC;
    aurora_pma_init_in : in STD_LOGIC;
    aurora_init_clk : in STD_LOGIC;
    aurora_pma_init_out : out STD_LOGIC;
    aurora_mmcm_not_locked : in STD_LOGIC;
    aurora_reset_pb : out STD_LOGIC;
    axi_c2c_config_error_out : out STD_LOGIC;
    axi_c2c_link_status_out : out STD_LOGIC;
    axi_c2c_multi_bit_error_out : out STD_LOGIC;
    m_axi_lite_aclk : in STD_LOGIC;
    m_axi_lite_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_awprot : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_awvalid : out STD_LOGIC;
    m_axi_lite_awready : in STD_LOGIC;
    m_axi_lite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_lite_wvalid : out STD_LOGIC;
    m_axi_lite_wready : in STD_LOGIC;
    m_axi_lite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_bvalid : in STD_LOGIC;
    m_axi_lite_bready : out STD_LOGIC;
    m_axi_lite_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_arprot : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_arvalid : out STD_LOGIC;
    m_axi_lite_arready : in STD_LOGIC;
    m_axi_lite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_rvalid : in STD_LOGIC;
    m_axi_lite_rready : out STD_LOGIC
  );
  end component c2cSlave_K_C2C_0;
  component c2cSlave_K_C2C_PHY_0 is
  port (
    rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset_pb : in STD_LOGIC;
    power_down : in STD_LOGIC;
    pma_init : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_out_clk : out STD_LOGIC;
    gt_pll_lock : out STD_LOGIC;
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 63 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 63 );
    m_axi_rx_tvalid : out STD_LOGIC;
    mmcm_not_locked_out : out STD_LOGIC;
    gt0_drpaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    gt0_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drprdy : out STD_LOGIC;
    gt0_drpwe : in STD_LOGIC;
    gt0_drpen : in STD_LOGIC;
    gt0_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    init_clk : in STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    gt_refclk1_p : in STD_LOGIC;
    gt_refclk1_n : in STD_LOGIC;
    user_clk_out : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    gt_rxcdrovrden_in : in STD_LOGIC;
    gt_rxusrclk_out : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    gt_refclk1_out : out STD_LOGIC;
    gt_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt_powergood : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component c2cSlave_K_C2C_PHY_0;
  component c2cSlave_K_C2CB_0 is
  port (
    m_aclk : in STD_LOGIC;
    m_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    axi_c2c_s2m_intr_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_c2c_m2s_intr_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_c2c_phy_clk : in STD_LOGIC;
    axi_c2c_aurora_channel_up : in STD_LOGIC;
    axi_c2c_aurora_tx_tready : in STD_LOGIC;
    axi_c2c_aurora_tx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    axi_c2c_aurora_tx_tvalid : out STD_LOGIC;
    axi_c2c_aurora_rx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    axi_c2c_aurora_rx_tvalid : in STD_LOGIC;
    aurora_do_cc : out STD_LOGIC;
    aurora_pma_init_in : in STD_LOGIC;
    aurora_init_clk : in STD_LOGIC;
    aurora_pma_init_out : out STD_LOGIC;
    aurora_mmcm_not_locked : in STD_LOGIC;
    aurora_reset_pb : out STD_LOGIC;
    axi_c2c_config_error_out : out STD_LOGIC;
    axi_c2c_link_status_out : out STD_LOGIC;
    axi_c2c_multi_bit_error_out : out STD_LOGIC;
    m_axi_lite_aclk : in STD_LOGIC;
    m_axi_lite_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_awprot : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_awvalid : out STD_LOGIC;
    m_axi_lite_awready : in STD_LOGIC;
    m_axi_lite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_lite_wvalid : out STD_LOGIC;
    m_axi_lite_wready : in STD_LOGIC;
    m_axi_lite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_bvalid : in STD_LOGIC;
    m_axi_lite_bready : out STD_LOGIC;
    m_axi_lite_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_arprot : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_arvalid : out STD_LOGIC;
    m_axi_lite_arready : in STD_LOGIC;
    m_axi_lite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_rvalid : in STD_LOGIC;
    m_axi_lite_rready : out STD_LOGIC
  );
  end component c2cSlave_K_C2CB_0;
  component c2cSlave_K_C2CB_PHY_0 is
  port (
    rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    refclk1_in : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    sync_clk : in STD_LOGIC;
    reset_pb : in STD_LOGIC;
    power_down : in STD_LOGIC;
    pma_init : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_out_clk : out STD_LOGIC;
    bufg_gt_clr_out : out STD_LOGIC;
    gt_pll_lock : out STD_LOGIC;
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 63 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 63 );
    m_axi_rx_tvalid : out STD_LOGIC;
    mmcm_not_locked : in STD_LOGIC;
    gt0_drpaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    gt0_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drprdy : out STD_LOGIC;
    gt0_drpwe : in STD_LOGIC;
    gt0_drpen : in STD_LOGIC;
    gt0_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    init_clk : in STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    gt_rxcdrovrden_in : in STD_LOGIC;
    gt_rxusrclk_out : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    gt_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt_powergood : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component c2cSlave_K_C2CB_PHY_0;
  component c2cSlave_JTAG_AXI_Master_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC;
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC;
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component c2cSlave_JTAG_AXI_Master_0;
  component c2cSlave_KINTEX_SYS_MGMT_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    vp : in STD_LOGIC;
    vn : in STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    eoc_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    busy_out : out STD_LOGIC
  );
  end component c2cSlave_KINTEX_SYS_MGMT_0;
  component c2cSlave_CM1_PB_UART_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  end component c2cSlave_CM1_PB_UART_0;
  signal AXI_CLK_1 : STD_LOGIC;
  signal CM1_PB_UART_UART_RxD : STD_LOGIC;
  signal CM1_PB_UART_UART_TxD : STD_LOGIC;
  signal CM1_PB_UART_interrupt : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_ARREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_ARVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_AWREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_AWVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_BREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_BVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_RREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_RVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_WREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_INN_M00_AXI_WVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_ARREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_ARVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_AWREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_AWVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_BREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_BVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_RREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_RVALID : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_WREADY : STD_LOGIC;
  signal INTERCONNECT_INN_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_INN_M01_AXI_WVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_ARREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_ARVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_AWREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_AWVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_BREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_BVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_RREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_RVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_WREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_MID_M00_AXI_WVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_ARREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_ARVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_AWREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_AWVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_BREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_BVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_RREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_RVALID : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_WREADY : STD_LOGIC;
  signal INTERCONNECT_MID_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_MID_M01_AXI_WVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_ARREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_ARVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_AWREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_AWVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_BREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_BVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_RREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_RVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_WREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_OUT_M00_AXI_WVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_ARREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_ARVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_AWREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_AWVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_BREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_BVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_RREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_RVALID : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_WREADY : STD_LOGIC;
  signal INTERCONNECT_OUT_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal INTERCONNECT_OUT_M01_AXI_WVALID : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal JTAG_AXI_Master_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal JTAG_AXI_Master_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal JTAG_AXI_Master_M_AXI_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal JTAG_AXI_Master_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal JTAG_AXI_Master_M_AXI_ARLOCK : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal JTAG_AXI_Master_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal JTAG_AXI_Master_M_AXI_ARREADY : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal JTAG_AXI_Master_M_AXI_ARVALID : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal JTAG_AXI_Master_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal JTAG_AXI_Master_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal JTAG_AXI_Master_M_AXI_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal JTAG_AXI_Master_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal JTAG_AXI_Master_M_AXI_AWLOCK : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal JTAG_AXI_Master_M_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal JTAG_AXI_Master_M_AXI_AWREADY : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal JTAG_AXI_Master_M_AXI_AWVALID : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal JTAG_AXI_Master_M_AXI_BREADY : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal JTAG_AXI_Master_M_AXI_BVALID : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal JTAG_AXI_Master_M_AXI_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal JTAG_AXI_Master_M_AXI_RLAST : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_RREADY : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal JTAG_AXI_Master_M_AXI_RVALID : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal JTAG_AXI_Master_M_AXI_WLAST : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_WREADY : STD_LOGIC;
  signal JTAG_AXI_Master_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal JTAG_AXI_Master_M_AXI_WVALID : STD_LOGIC;
  signal KINTEX_SYS_MGMT_alarm_out : STD_LOGIC;
  signal KINTEX_SYS_MGMT_ot_out : STD_LOGIC;
  signal KINTEX_SYS_MGMT_vccaux_alarm_out : STD_LOGIC;
  signal KINTEX_SYS_MGMT_vccint_alarm_out : STD_LOGIC;
  signal K_C2CB_AXIS_TX_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal K_C2CB_AXIS_TX_TREADY : STD_LOGIC;
  signal K_C2CB_AXIS_TX_TVALID : STD_LOGIC;
  signal K_C2CB_PHY_DRP_1_DADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal K_C2CB_PHY_DRP_1_DEN : STD_LOGIC;
  signal K_C2CB_PHY_DRP_1_DI : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2CB_PHY_DRP_1_DO : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2CB_PHY_DRP_1_DRDY : STD_LOGIC;
  signal K_C2CB_PHY_DRP_1_DWE : STD_LOGIC;
  signal K_C2CB_PHY_GT_SERIAL_TX_TXN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_GT_SERIAL_TX_TXP : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_Rx_1_RXN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_Rx_1_RXP : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_cplllock : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_dmonitorout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescandataerror : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescanreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescantrigger : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_pcsrsvdin : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_qplllock : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxbufreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxbufstatus : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxcdrhold : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxdfelpmreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxlpmen : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpcsreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpmareset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpmaresetdone : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbscntreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbserr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbssel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxrate : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_rxresetdone : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txbufstatus : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txdiffctrl : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txinhibit : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txpcsreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txpmareset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txpolarity : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txpostcursor : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txprbsforceerr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txprbssel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txprecursor : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal K_C2CB_PHY_TRANSCEIVER_DEBUG_txresetdone : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA : STD_LOGIC_VECTOR ( 0 to 63 );
  signal K_C2CB_PHY_USER_DATA_M_AXIS_RX_TVALID : STD_LOGIC;
  signal K_C2CB_PHY_channel_up1 : STD_LOGIC;
  signal K_C2CB_PHY_gt_pll_lock1 : STD_LOGIC;
  signal K_C2CB_PHY_hard_err1 : STD_LOGIC;
  signal K_C2CB_PHY_lane_up1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_PHY_link_reset_out1 : STD_LOGIC;
  signal K_C2CB_PHY_power_down_1 : STD_LOGIC;
  signal K_C2CB_PHY_soft_err1 : STD_LOGIC;
  signal K_C2CB_aurora_do_cc1 : STD_LOGIC;
  signal K_C2CB_aurora_pma_init_in_1 : STD_LOGIC;
  signal K_C2CB_aurora_pma_init_out : STD_LOGIC;
  signal K_C2CB_aurora_reset_pb : STD_LOGIC;
  signal K_C2CB_axi_c2c_config_error_out1 : STD_LOGIC;
  signal K_C2CB_axi_c2c_link_status_out1 : STD_LOGIC;
  signal K_C2CB_axi_c2c_multi_bit_error_out1 : STD_LOGIC;
  signal K_C2CB_m_axi_lite_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2CB_m_axi_lite_ARPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2CB_m_axi_lite_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_m_axi_lite_ARVALID : STD_LOGIC;
  signal K_C2CB_m_axi_lite_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2CB_m_axi_lite_AWPROT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2CB_m_axi_lite_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_m_axi_lite_AWVALID : STD_LOGIC;
  signal K_C2CB_m_axi_lite_BREADY : STD_LOGIC;
  signal K_C2CB_m_axi_lite_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2CB_m_axi_lite_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_m_axi_lite_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2CB_m_axi_lite_RREADY : STD_LOGIC;
  signal K_C2CB_m_axi_lite_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2CB_m_axi_lite_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_m_axi_lite_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2CB_m_axi_lite_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2CB_m_axi_lite_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal K_C2CB_m_axi_lite_WVALID : STD_LOGIC;
  signal K_C2C_AXIS_TX_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal K_C2C_AXIS_TX_TREADY : STD_LOGIC;
  signal K_C2C_AXIS_TX_TVALID : STD_LOGIC;
  signal K_C2C_PHY_DRP_1_DADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal K_C2C_PHY_DRP_1_DEN : STD_LOGIC;
  signal K_C2C_PHY_DRP_1_DI : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2C_PHY_DRP_1_DO : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2C_PHY_DRP_1_DRDY : STD_LOGIC;
  signal K_C2C_PHY_DRP_1_DWE : STD_LOGIC;
  signal K_C2C_PHY_GT_SERIAL_TX_TXN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_GT_SERIAL_TX_TXP : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_Rx_1_RXN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_Rx_1_RXP : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_cplllock : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_dmonitorout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_eyescandataerror : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_eyescanreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_eyescantrigger : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_pcsrsvdin : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_qplllock : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxbufreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxbufstatus : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxcdrhold : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxdfelpmreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxlpmen : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxpcsreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxpmareset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxpmaresetdone : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbscntreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbserr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbssel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxrate : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_rxresetdone : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txbufstatus : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txdiffctrl : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txinhibit : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txpcsreset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txpmareset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txpolarity : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txpostcursor : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txprbsforceerr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txprbssel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txprecursor : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal K_C2C_PHY_TRANSCEIVER_DEBUG_txresetdone : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA : STD_LOGIC_VECTOR ( 0 to 63 );
  signal K_C2C_PHY_USER_DATA_M_AXIS_RX_TVALID : STD_LOGIC;
  signal K_C2C_PHY_channel_up1 : STD_LOGIC;
  signal K_C2C_PHY_gt_pll_lock1 : STD_LOGIC;
  signal K_C2C_PHY_gt_refclk1_out1 : STD_LOGIC;
  signal K_C2C_PHY_hard_err1 : STD_LOGIC;
  signal K_C2C_PHY_lane_up1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal K_C2C_PHY_link_reset_out1 : STD_LOGIC;
  signal K_C2C_PHY_mmcm_not_locked_out1 : STD_LOGIC;
  signal K_C2C_PHY_power_down_1 : STD_LOGIC;
  signal K_C2C_PHY_refclk_1_CLK_N : STD_LOGIC;
  signal K_C2C_PHY_refclk_1_CLK_P : STD_LOGIC;
  signal K_C2C_PHY_soft_err1 : STD_LOGIC;
  signal K_C2C_PHY_sync_clk_out : STD_LOGIC;
  signal K_C2C_PHY_user_clk_out : STD_LOGIC;
  signal K_C2C_aurora_do_cc1 : STD_LOGIC;
  signal K_C2C_aurora_pma_init_in_1 : STD_LOGIC;
  signal K_C2C_aurora_pma_init_out : STD_LOGIC;
  signal K_C2C_aurora_reset_pb : STD_LOGIC;
  signal K_C2C_axi_c2c_config_error_out1 : STD_LOGIC;
  signal K_C2C_axi_c2c_link_status_out1 : STD_LOGIC;
  signal K_C2C_axi_c2c_multi_bit_error_out1 : STD_LOGIC;
  signal K_C2C_m_axi_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2C_m_axi_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2C_m_axi_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal K_C2C_m_axi_ARREADY : STD_LOGIC;
  signal K_C2C_m_axi_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal K_C2C_m_axi_ARVALID : STD_LOGIC;
  signal K_C2C_m_axi_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2C_m_axi_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2C_m_axi_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal K_C2C_m_axi_AWREADY : STD_LOGIC;
  signal K_C2C_m_axi_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal K_C2C_m_axi_AWVALID : STD_LOGIC;
  signal K_C2C_m_axi_BREADY : STD_LOGIC;
  signal K_C2C_m_axi_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2C_m_axi_BVALID : STD_LOGIC;
  signal K_C2C_m_axi_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2C_m_axi_RLAST : STD_LOGIC;
  signal K_C2C_m_axi_RREADY : STD_LOGIC;
  signal K_C2C_m_axi_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal K_C2C_m_axi_RVALID : STD_LOGIC;
  signal K_C2C_m_axi_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal K_C2C_m_axi_WLAST : STD_LOGIC;
  signal K_C2C_m_axi_WREADY : STD_LOGIC;
  signal K_C2C_m_axi_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal K_C2C_m_axi_WVALID : STD_LOGIC;
  signal clk40_1 : STD_LOGIC;
  signal clk50Mhz_1 : STD_LOGIC;
  signal reset_n_1 : STD_LOGIC;
  signal slave_interconnect_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M00_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M00_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M00_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M00_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M00_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M00_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M00_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M00_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M00_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M00_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M01_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M01_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M01_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M01_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M01_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M01_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M01_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M02_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M02_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M02_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M02_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M02_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M02_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M02_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M02_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M02_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M03_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M03_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M03_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M03_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M03_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M03_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M03_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M03_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M03_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M03_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M04_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M04_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M04_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M04_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M04_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M05_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M05_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M05_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M05_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M05_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M05_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M05_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M05_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M05_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M06_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M06_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M06_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M06_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M06_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M06_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M06_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M06_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M07_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M07_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M07_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M07_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M07_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M07_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M07_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M07_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M08_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M08_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M08_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M08_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M08_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M08_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M08_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M08_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M08_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M08_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M08_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M08_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M08_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M08_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M08_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M08_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M08_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M08_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M08_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M09_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M09_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M09_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M09_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M09_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M09_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M09_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M09_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M09_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M09_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M09_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M09_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M09_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M09_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M09_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M09_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M09_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M09_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M09_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M10_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M10_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M10_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M10_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M10_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M10_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M10_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M10_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M10_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M10_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M10_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M10_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M10_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M10_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M10_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M10_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M10_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M10_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M10_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M11_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M11_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M11_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M11_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M11_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M11_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M11_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M11_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M11_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M11_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M11_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M11_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M11_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M11_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M11_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M11_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M11_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M11_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M11_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M12_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M12_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M12_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M12_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M12_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M12_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M12_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M12_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M12_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M12_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M12_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M13_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M13_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M13_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M13_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M13_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M13_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M13_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M13_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M13_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M13_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M14_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M14_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M14_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M14_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M14_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M14_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M14_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M14_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M14_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M14_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sys_reseter_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_KINTEX_SYS_MGMT_busy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_KINTEX_SYS_MGMT_eoc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_KINTEX_SYS_MGMT_eos_out_UNCONNECTED : STD_LOGIC;
  signal NLW_KINTEX_SYS_MGMT_ip2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_KINTEX_SYS_MGMT_channel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_K_C2C_m_axi_lite_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_m_axi_lite_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_m_axi_lite_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_m_axi_lite_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_m_axi_lite_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_axi_c2c_m2s_intr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_K_C2C_m_axi_lite_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_K_C2C_m_axi_lite_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_K_C2C_m_axi_lite_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_K_C2C_m_axi_lite_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_K_C2C_m_axi_lite_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_K_C2C_m_axi_lite_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_K_C2CB_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_axi_c2c_m2s_intr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_K_C2CB_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_K_C2CB_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_K_C2CB_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_K_C2CB_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_K_C2CB_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_K_C2CB_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_K_C2CB_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_K_C2CB_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_K_C2CB_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_K_C2CB_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_K_C2CB_PHY_bufg_gt_clr_out_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_PHY_gt_rxusrclk_out_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_PHY_sys_reset_out_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_PHY_tx_out_clk_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2CB_PHY_gt_powergood_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_K_C2C_PHY_gt_reset_out_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_PHY_gt_rxusrclk_out_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_PHY_sys_reset_out_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_PHY_tx_out_clk_UNCONNECTED : STD_LOGIC;
  signal NLW_K_C2C_PHY_gt_powergood_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_sys_reseter_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_sys_reseter_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_sys_reseter_peripheral_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_sys_reseter_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of AXI_CLK : signal is "xilinx.com:signal:clock:1.0 CLK.AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of AXI_CLK : signal is "XIL_INTERFACENAME CLK.AXI_CLK, ASSOCIATED_BUSIF HOG:FW_INFO:C2C_INTFS, CLK_DOMAIN c2cSlave_AXI_CLK, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of CM1_PB_UART_rxd : signal is "xilinx.com:interface:uart:1.0 CM1_PB_UART RxD";
  attribute X_INTERFACE_INFO of CM1_PB_UART_txd : signal is "xilinx.com:interface:uart:1.0 CM1_PB_UART TxD";
  attribute X_INTERFACE_INFO of DAQ_arready : signal is "xilinx.com:interface:aximm:1.0 DAQ ARREADY";
  attribute X_INTERFACE_INFO of DAQ_arvalid : signal is "xilinx.com:interface:aximm:1.0 DAQ ARVALID";
  attribute X_INTERFACE_INFO of DAQ_awready : signal is "xilinx.com:interface:aximm:1.0 DAQ AWREADY";
  attribute X_INTERFACE_INFO of DAQ_awvalid : signal is "xilinx.com:interface:aximm:1.0 DAQ AWVALID";
  attribute X_INTERFACE_INFO of DAQ_bready : signal is "xilinx.com:interface:aximm:1.0 DAQ BREADY";
  attribute X_INTERFACE_INFO of DAQ_bvalid : signal is "xilinx.com:interface:aximm:1.0 DAQ BVALID";
  attribute X_INTERFACE_INFO of DAQ_rready : signal is "xilinx.com:interface:aximm:1.0 DAQ RREADY";
  attribute X_INTERFACE_INFO of DAQ_rvalid : signal is "xilinx.com:interface:aximm:1.0 DAQ RVALID";
  attribute X_INTERFACE_INFO of DAQ_wready : signal is "xilinx.com:interface:aximm:1.0 DAQ WREADY";
  attribute X_INTERFACE_INFO of DAQ_wvalid : signal is "xilinx.com:interface:aximm:1.0 DAQ WVALID";
  attribute X_INTERFACE_INFO of FM_arready : signal is "xilinx.com:interface:aximm:1.0 FM ARREADY";
  attribute X_INTERFACE_INFO of FM_arvalid : signal is "xilinx.com:interface:aximm:1.0 FM ARVALID";
  attribute X_INTERFACE_INFO of FM_awready : signal is "xilinx.com:interface:aximm:1.0 FM AWREADY";
  attribute X_INTERFACE_INFO of FM_awvalid : signal is "xilinx.com:interface:aximm:1.0 FM AWVALID";
  attribute X_INTERFACE_INFO of FM_bready : signal is "xilinx.com:interface:aximm:1.0 FM BREADY";
  attribute X_INTERFACE_INFO of FM_bvalid : signal is "xilinx.com:interface:aximm:1.0 FM BVALID";
  attribute X_INTERFACE_INFO of FM_rready : signal is "xilinx.com:interface:aximm:1.0 FM RREADY";
  attribute X_INTERFACE_INFO of FM_rvalid : signal is "xilinx.com:interface:aximm:1.0 FM RVALID";
  attribute X_INTERFACE_INFO of FM_wready : signal is "xilinx.com:interface:aximm:1.0 FM WREADY";
  attribute X_INTERFACE_INFO of FM_wvalid : signal is "xilinx.com:interface:aximm:1.0 FM WVALID";
  attribute X_INTERFACE_INFO of HAL_arready : signal is "xilinx.com:interface:aximm:1.0 HAL ARREADY";
  attribute X_INTERFACE_INFO of HAL_arvalid : signal is "xilinx.com:interface:aximm:1.0 HAL ARVALID";
  attribute X_INTERFACE_INFO of HAL_awready : signal is "xilinx.com:interface:aximm:1.0 HAL AWREADY";
  attribute X_INTERFACE_INFO of HAL_awvalid : signal is "xilinx.com:interface:aximm:1.0 HAL AWVALID";
  attribute X_INTERFACE_INFO of HAL_bready : signal is "xilinx.com:interface:aximm:1.0 HAL BREADY";
  attribute X_INTERFACE_INFO of HAL_bvalid : signal is "xilinx.com:interface:aximm:1.0 HAL BVALID";
  attribute X_INTERFACE_INFO of HAL_rready : signal is "xilinx.com:interface:aximm:1.0 HAL RREADY";
  attribute X_INTERFACE_INFO of HAL_rvalid : signal is "xilinx.com:interface:aximm:1.0 HAL RVALID";
  attribute X_INTERFACE_INFO of HAL_wready : signal is "xilinx.com:interface:aximm:1.0 HAL WREADY";
  attribute X_INTERFACE_INFO of HAL_wvalid : signal is "xilinx.com:interface:aximm:1.0 HAL WVALID";
  attribute X_INTERFACE_INFO of HPS_INN_arready : signal is "xilinx.com:interface:aximm:1.0 HPS_INN ARREADY";
  attribute X_INTERFACE_INFO of HPS_INN_arvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_INN ARVALID";
  attribute X_INTERFACE_INFO of HPS_INN_awready : signal is "xilinx.com:interface:aximm:1.0 HPS_INN AWREADY";
  attribute X_INTERFACE_INFO of HPS_INN_awvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_INN AWVALID";
  attribute X_INTERFACE_INFO of HPS_INN_bready : signal is "xilinx.com:interface:aximm:1.0 HPS_INN BREADY";
  attribute X_INTERFACE_INFO of HPS_INN_bvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_INN BVALID";
  attribute X_INTERFACE_INFO of HPS_INN_rready : signal is "xilinx.com:interface:aximm:1.0 HPS_INN RREADY";
  attribute X_INTERFACE_INFO of HPS_INN_rvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_INN RVALID";
  attribute X_INTERFACE_INFO of HPS_INN_wready : signal is "xilinx.com:interface:aximm:1.0 HPS_INN WREADY";
  attribute X_INTERFACE_INFO of HPS_INN_wvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_INN WVALID";
  attribute X_INTERFACE_INFO of HPS_MID_arready : signal is "xilinx.com:interface:aximm:1.0 HPS_MID ARREADY";
  attribute X_INTERFACE_INFO of HPS_MID_arvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_MID ARVALID";
  attribute X_INTERFACE_INFO of HPS_MID_awready : signal is "xilinx.com:interface:aximm:1.0 HPS_MID AWREADY";
  attribute X_INTERFACE_INFO of HPS_MID_awvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_MID AWVALID";
  attribute X_INTERFACE_INFO of HPS_MID_bready : signal is "xilinx.com:interface:aximm:1.0 HPS_MID BREADY";
  attribute X_INTERFACE_INFO of HPS_MID_bvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_MID BVALID";
  attribute X_INTERFACE_INFO of HPS_MID_rready : signal is "xilinx.com:interface:aximm:1.0 HPS_MID RREADY";
  attribute X_INTERFACE_INFO of HPS_MID_rvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_MID RVALID";
  attribute X_INTERFACE_INFO of HPS_MID_wready : signal is "xilinx.com:interface:aximm:1.0 HPS_MID WREADY";
  attribute X_INTERFACE_INFO of HPS_MID_wvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_MID WVALID";
  attribute X_INTERFACE_INFO of HPS_OUT_arready : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT ARREADY";
  attribute X_INTERFACE_INFO of HPS_OUT_arvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT ARVALID";
  attribute X_INTERFACE_INFO of HPS_OUT_awready : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT AWREADY";
  attribute X_INTERFACE_INFO of HPS_OUT_awvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT AWVALID";
  attribute X_INTERFACE_INFO of HPS_OUT_bready : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT BREADY";
  attribute X_INTERFACE_INFO of HPS_OUT_bvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT BVALID";
  attribute X_INTERFACE_INFO of HPS_OUT_rready : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT RREADY";
  attribute X_INTERFACE_INFO of HPS_OUT_rvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT RVALID";
  attribute X_INTERFACE_INFO of HPS_OUT_wready : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT WREADY";
  attribute X_INTERFACE_INFO of HPS_OUT_wvalid : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT WVALID";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DRP_den : signal is "xilinx.com:interface:drp:1.0 K_C2CB_PHY_DRP DEN";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DRP_drdy : signal is "xilinx.com:interface:drp:1.0 K_C2CB_PHY_DRP DRDY";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DRP_dwe : signal is "xilinx.com:interface:drp:1.0 K_C2CB_PHY_DRP DWE";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_link_reset_out : signal is "xilinx.com:signal:reset:1.0 RST.K_C2CB_PHY_LINK_RESET_OUT RST";
  attribute X_INTERFACE_PARAMETER of K_C2CB_PHY_link_reset_out : signal is "XIL_INTERFACENAME RST.K_C2CB_PHY_LINK_RESET_OUT, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_power_down : signal is "xilinx.com:signal:reset:1.0 RST.K_C2CB_PHY_POWER_DOWN RST";
  attribute X_INTERFACE_PARAMETER of K_C2CB_PHY_power_down : signal is "XIL_INTERFACENAME RST.K_C2CB_PHY_POWER_DOWN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of K_C2CB_aurora_pma_init_in : signal is "xilinx.com:signal:reset:1.0 RST.K_C2CB_AURORA_PMA_INIT_IN RST";
  attribute X_INTERFACE_PARAMETER of K_C2CB_aurora_pma_init_in : signal is "XIL_INTERFACENAME RST.K_C2CB_AURORA_PMA_INIT_IN, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of K_C2C_PHY_CLK : signal is "xilinx.com:signal:clock:1.0 CLK.K_C2C_PHY_CLK CLK";
  attribute X_INTERFACE_PARAMETER of K_C2C_PHY_CLK : signal is "XIL_INTERFACENAME CLK.K_C2C_PHY_CLK, CLK_DOMAIN c2cSlave_K_C2C_PHY_0_user_clk_out, FREQ_HZ 78125000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DRP_den : signal is "xilinx.com:interface:drp:1.0 K_C2C_PHY_DRP DEN";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DRP_drdy : signal is "xilinx.com:interface:drp:1.0 K_C2C_PHY_DRP DRDY";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DRP_dwe : signal is "xilinx.com:interface:drp:1.0 K_C2C_PHY_DRP DWE";
  attribute X_INTERFACE_INFO of K_C2C_PHY_gt_refclk1_out : signal is "xilinx.com:signal:clock:1.0 CLK.K_C2C_PHY_GT_REFCLK1_OUT CLK";
  attribute X_INTERFACE_PARAMETER of K_C2C_PHY_gt_refclk1_out : signal is "XIL_INTERFACENAME CLK.K_C2C_PHY_GT_REFCLK1_OUT, CLK_DOMAIN c2cSlave_K_C2C_PHY_0_gt_refclk1_out, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0";
  attribute X_INTERFACE_INFO of K_C2C_PHY_link_reset_out : signal is "xilinx.com:signal:reset:1.0 RST.K_C2C_PHY_LINK_RESET_OUT RST";
  attribute X_INTERFACE_PARAMETER of K_C2C_PHY_link_reset_out : signal is "XIL_INTERFACENAME RST.K_C2C_PHY_LINK_RESET_OUT, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of K_C2C_PHY_power_down : signal is "xilinx.com:signal:reset:1.0 RST.K_C2C_PHY_POWER_DOWN RST";
  attribute X_INTERFACE_PARAMETER of K_C2C_PHY_power_down : signal is "XIL_INTERFACENAME RST.K_C2C_PHY_POWER_DOWN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of K_C2C_PHY_refclk_clk_n : signal is "xilinx.com:interface:diff_clock:1.0 K_C2C_PHY_refclk CLK_N";
  attribute X_INTERFACE_PARAMETER of K_C2C_PHY_refclk_clk_n : signal is "XIL_INTERFACENAME K_C2C_PHY_refclk, CAN_DEBUG false, FREQ_HZ 200000000";
  attribute X_INTERFACE_INFO of K_C2C_PHY_refclk_clk_p : signal is "xilinx.com:interface:diff_clock:1.0 K_C2C_PHY_refclk CLK_P";
  attribute X_INTERFACE_INFO of K_C2C_aurora_pma_init_in : signal is "xilinx.com:signal:reset:1.0 RST.K_C2C_AURORA_PMA_INIT_IN RST";
  attribute X_INTERFACE_PARAMETER of K_C2C_aurora_pma_init_in : signal is "XIL_INTERFACENAME RST.K_C2C_AURORA_PMA_INIT_IN, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of MPL_arready : signal is "xilinx.com:interface:aximm:1.0 MPL ARREADY";
  attribute X_INTERFACE_INFO of MPL_arvalid : signal is "xilinx.com:interface:aximm:1.0 MPL ARVALID";
  attribute X_INTERFACE_INFO of MPL_awready : signal is "xilinx.com:interface:aximm:1.0 MPL AWREADY";
  attribute X_INTERFACE_INFO of MPL_awvalid : signal is "xilinx.com:interface:aximm:1.0 MPL AWVALID";
  attribute X_INTERFACE_INFO of MPL_bready : signal is "xilinx.com:interface:aximm:1.0 MPL BREADY";
  attribute X_INTERFACE_INFO of MPL_bvalid : signal is "xilinx.com:interface:aximm:1.0 MPL BVALID";
  attribute X_INTERFACE_INFO of MPL_rready : signal is "xilinx.com:interface:aximm:1.0 MPL RREADY";
  attribute X_INTERFACE_INFO of MPL_rvalid : signal is "xilinx.com:interface:aximm:1.0 MPL RVALID";
  attribute X_INTERFACE_INFO of MPL_wready : signal is "xilinx.com:interface:aximm:1.0 MPL WREADY";
  attribute X_INTERFACE_INFO of MPL_wvalid : signal is "xilinx.com:interface:aximm:1.0 MPL WVALID";
  attribute X_INTERFACE_INFO of MTC_arready : signal is "xilinx.com:interface:aximm:1.0 MTC ARREADY";
  attribute X_INTERFACE_INFO of MTC_arvalid : signal is "xilinx.com:interface:aximm:1.0 MTC ARVALID";
  attribute X_INTERFACE_INFO of MTC_awready : signal is "xilinx.com:interface:aximm:1.0 MTC AWREADY";
  attribute X_INTERFACE_INFO of MTC_awvalid : signal is "xilinx.com:interface:aximm:1.0 MTC AWVALID";
  attribute X_INTERFACE_INFO of MTC_bready : signal is "xilinx.com:interface:aximm:1.0 MTC BREADY";
  attribute X_INTERFACE_INFO of MTC_bvalid : signal is "xilinx.com:interface:aximm:1.0 MTC BVALID";
  attribute X_INTERFACE_INFO of MTC_rready : signal is "xilinx.com:interface:aximm:1.0 MTC RREADY";
  attribute X_INTERFACE_INFO of MTC_rvalid : signal is "xilinx.com:interface:aximm:1.0 MTC RVALID";
  attribute X_INTERFACE_INFO of MTC_wready : signal is "xilinx.com:interface:aximm:1.0 MTC WREADY";
  attribute X_INTERFACE_INFO of MTC_wvalid : signal is "xilinx.com:interface:aximm:1.0 MTC WVALID";
  attribute X_INTERFACE_INFO of TAR_INN_arready : signal is "xilinx.com:interface:aximm:1.0 TAR_INN ARREADY";
  attribute X_INTERFACE_INFO of TAR_INN_arvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_INN ARVALID";
  attribute X_INTERFACE_INFO of TAR_INN_awready : signal is "xilinx.com:interface:aximm:1.0 TAR_INN AWREADY";
  attribute X_INTERFACE_INFO of TAR_INN_awvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_INN AWVALID";
  attribute X_INTERFACE_INFO of TAR_INN_bready : signal is "xilinx.com:interface:aximm:1.0 TAR_INN BREADY";
  attribute X_INTERFACE_INFO of TAR_INN_bvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_INN BVALID";
  attribute X_INTERFACE_INFO of TAR_INN_rready : signal is "xilinx.com:interface:aximm:1.0 TAR_INN RREADY";
  attribute X_INTERFACE_INFO of TAR_INN_rvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_INN RVALID";
  attribute X_INTERFACE_INFO of TAR_INN_wready : signal is "xilinx.com:interface:aximm:1.0 TAR_INN WREADY";
  attribute X_INTERFACE_INFO of TAR_INN_wvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_INN WVALID";
  attribute X_INTERFACE_INFO of TAR_MID_arready : signal is "xilinx.com:interface:aximm:1.0 TAR_MID ARREADY";
  attribute X_INTERFACE_INFO of TAR_MID_arvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_MID ARVALID";
  attribute X_INTERFACE_INFO of TAR_MID_awready : signal is "xilinx.com:interface:aximm:1.0 TAR_MID AWREADY";
  attribute X_INTERFACE_INFO of TAR_MID_awvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_MID AWVALID";
  attribute X_INTERFACE_INFO of TAR_MID_bready : signal is "xilinx.com:interface:aximm:1.0 TAR_MID BREADY";
  attribute X_INTERFACE_INFO of TAR_MID_bvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_MID BVALID";
  attribute X_INTERFACE_INFO of TAR_MID_rready : signal is "xilinx.com:interface:aximm:1.0 TAR_MID RREADY";
  attribute X_INTERFACE_INFO of TAR_MID_rvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_MID RVALID";
  attribute X_INTERFACE_INFO of TAR_MID_wready : signal is "xilinx.com:interface:aximm:1.0 TAR_MID WREADY";
  attribute X_INTERFACE_INFO of TAR_MID_wvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_MID WVALID";
  attribute X_INTERFACE_INFO of TAR_OUT_arready : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT ARREADY";
  attribute X_INTERFACE_INFO of TAR_OUT_arvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT ARVALID";
  attribute X_INTERFACE_INFO of TAR_OUT_awready : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT AWREADY";
  attribute X_INTERFACE_INFO of TAR_OUT_awvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT AWVALID";
  attribute X_INTERFACE_INFO of TAR_OUT_bready : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT BREADY";
  attribute X_INTERFACE_INFO of TAR_OUT_bvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT BVALID";
  attribute X_INTERFACE_INFO of TAR_OUT_rready : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT RREADY";
  attribute X_INTERFACE_INFO of TAR_OUT_rvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT RVALID";
  attribute X_INTERFACE_INFO of TAR_OUT_wready : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT WREADY";
  attribute X_INTERFACE_INFO of TAR_OUT_wvalid : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT WVALID";
  attribute X_INTERFACE_INFO of TF_arready : signal is "xilinx.com:interface:aximm:1.0 TF ARREADY";
  attribute X_INTERFACE_INFO of TF_arvalid : signal is "xilinx.com:interface:aximm:1.0 TF ARVALID";
  attribute X_INTERFACE_INFO of TF_awready : signal is "xilinx.com:interface:aximm:1.0 TF AWREADY";
  attribute X_INTERFACE_INFO of TF_awvalid : signal is "xilinx.com:interface:aximm:1.0 TF AWVALID";
  attribute X_INTERFACE_INFO of TF_bready : signal is "xilinx.com:interface:aximm:1.0 TF BREADY";
  attribute X_INTERFACE_INFO of TF_bvalid : signal is "xilinx.com:interface:aximm:1.0 TF BVALID";
  attribute X_INTERFACE_INFO of TF_rready : signal is "xilinx.com:interface:aximm:1.0 TF RREADY";
  attribute X_INTERFACE_INFO of TF_rvalid : signal is "xilinx.com:interface:aximm:1.0 TF RVALID";
  attribute X_INTERFACE_INFO of TF_wready : signal is "xilinx.com:interface:aximm:1.0 TF WREADY";
  attribute X_INTERFACE_INFO of TF_wvalid : signal is "xilinx.com:interface:aximm:1.0 TF WVALID";
  attribute X_INTERFACE_INFO of UCM_arready : signal is "xilinx.com:interface:aximm:1.0 UCM ARREADY";
  attribute X_INTERFACE_INFO of UCM_arvalid : signal is "xilinx.com:interface:aximm:1.0 UCM ARVALID";
  attribute X_INTERFACE_INFO of UCM_awready : signal is "xilinx.com:interface:aximm:1.0 UCM AWREADY";
  attribute X_INTERFACE_INFO of UCM_awvalid : signal is "xilinx.com:interface:aximm:1.0 UCM AWVALID";
  attribute X_INTERFACE_INFO of UCM_bready : signal is "xilinx.com:interface:aximm:1.0 UCM BREADY";
  attribute X_INTERFACE_INFO of UCM_bvalid : signal is "xilinx.com:interface:aximm:1.0 UCM BVALID";
  attribute X_INTERFACE_INFO of UCM_rready : signal is "xilinx.com:interface:aximm:1.0 UCM RREADY";
  attribute X_INTERFACE_INFO of UCM_rvalid : signal is "xilinx.com:interface:aximm:1.0 UCM RVALID";
  attribute X_INTERFACE_INFO of UCM_wready : signal is "xilinx.com:interface:aximm:1.0 UCM WREADY";
  attribute X_INTERFACE_INFO of UCM_wvalid : signal is "xilinx.com:interface:aximm:1.0 UCM WVALID";
  attribute X_INTERFACE_INFO of clk40 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK40 CLK";
  attribute X_INTERFACE_PARAMETER of clk40 : signal is "XIL_INTERFACENAME CLK.CLK40, ASSOCIATED_BUSIF TAR_OUT:HAL:MTC:TF:UCM:DAQ:MPL:FM:HPS_INN:TAR_INN:HPS_MID:TAR_MID:HPS_OUT, CLK_DOMAIN c2cSlave_clk40, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of clk50Mhz : signal is "xilinx.com:signal:clock:1.0 CLK.CLK50MHZ CLK";
  attribute X_INTERFACE_PARAMETER of clk50Mhz : signal is "XIL_INTERFACENAME CLK.CLK50MHZ, CLK_DOMAIN c2cSlave_clk50Mhz, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset_n : signal is "xilinx.com:signal:reset:1.0 RST.RESET_N RST";
  attribute X_INTERFACE_PARAMETER of reset_n : signal is "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of AXI_RST_N : signal is "xilinx.com:signal:reset:1.0 RST.AXI_RST_N RST";
  attribute X_INTERFACE_PARAMETER of AXI_RST_N : signal is "XIL_INTERFACENAME RST.AXI_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of C2C_INTFS_araddr : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS ARADDR";
  attribute X_INTERFACE_PARAMETER of C2C_INTFS_araddr : signal is "XIL_INTERFACENAME C2C_INTFS, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_AXI_CLK, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of C2C_INTFS_arprot : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS ARPROT";
  attribute X_INTERFACE_INFO of C2C_INTFS_arready : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS ARREADY";
  attribute X_INTERFACE_INFO of C2C_INTFS_arvalid : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS ARVALID";
  attribute X_INTERFACE_INFO of C2C_INTFS_awaddr : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS AWADDR";
  attribute X_INTERFACE_INFO of C2C_INTFS_awprot : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS AWPROT";
  attribute X_INTERFACE_INFO of C2C_INTFS_awready : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS AWREADY";
  attribute X_INTERFACE_INFO of C2C_INTFS_awvalid : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS AWVALID";
  attribute X_INTERFACE_INFO of C2C_INTFS_bready : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS BREADY";
  attribute X_INTERFACE_INFO of C2C_INTFS_bresp : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS BRESP";
  attribute X_INTERFACE_INFO of C2C_INTFS_bvalid : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS BVALID";
  attribute X_INTERFACE_INFO of C2C_INTFS_rdata : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS RDATA";
  attribute X_INTERFACE_INFO of C2C_INTFS_rready : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS RREADY";
  attribute X_INTERFACE_INFO of C2C_INTFS_rresp : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS RRESP";
  attribute X_INTERFACE_INFO of C2C_INTFS_rvalid : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS RVALID";
  attribute X_INTERFACE_INFO of C2C_INTFS_wdata : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS WDATA";
  attribute X_INTERFACE_INFO of C2C_INTFS_wready : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS WREADY";
  attribute X_INTERFACE_INFO of C2C_INTFS_wstrb : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS WSTRB";
  attribute X_INTERFACE_INFO of C2C_INTFS_wvalid : signal is "xilinx.com:interface:aximm:1.0 C2C_INTFS WVALID";
  attribute X_INTERFACE_INFO of DAQ_araddr : signal is "xilinx.com:interface:aximm:1.0 DAQ ARADDR";
  attribute X_INTERFACE_PARAMETER of DAQ_araddr : signal is "XIL_INTERFACENAME DAQ, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of DAQ_arprot : signal is "xilinx.com:interface:aximm:1.0 DAQ ARPROT";
  attribute X_INTERFACE_INFO of DAQ_awaddr : signal is "xilinx.com:interface:aximm:1.0 DAQ AWADDR";
  attribute X_INTERFACE_INFO of DAQ_awprot : signal is "xilinx.com:interface:aximm:1.0 DAQ AWPROT";
  attribute X_INTERFACE_INFO of DAQ_bresp : signal is "xilinx.com:interface:aximm:1.0 DAQ BRESP";
  attribute X_INTERFACE_INFO of DAQ_rdata : signal is "xilinx.com:interface:aximm:1.0 DAQ RDATA";
  attribute X_INTERFACE_INFO of DAQ_rresp : signal is "xilinx.com:interface:aximm:1.0 DAQ RRESP";
  attribute X_INTERFACE_INFO of DAQ_wdata : signal is "xilinx.com:interface:aximm:1.0 DAQ WDATA";
  attribute X_INTERFACE_INFO of DAQ_wstrb : signal is "xilinx.com:interface:aximm:1.0 DAQ WSTRB";
  attribute X_INTERFACE_INFO of FM_araddr : signal is "xilinx.com:interface:aximm:1.0 FM ARADDR";
  attribute X_INTERFACE_PARAMETER of FM_araddr : signal is "XIL_INTERFACENAME FM, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of FM_arprot : signal is "xilinx.com:interface:aximm:1.0 FM ARPROT";
  attribute X_INTERFACE_INFO of FM_awaddr : signal is "xilinx.com:interface:aximm:1.0 FM AWADDR";
  attribute X_INTERFACE_INFO of FM_awprot : signal is "xilinx.com:interface:aximm:1.0 FM AWPROT";
  attribute X_INTERFACE_INFO of FM_bresp : signal is "xilinx.com:interface:aximm:1.0 FM BRESP";
  attribute X_INTERFACE_INFO of FM_rdata : signal is "xilinx.com:interface:aximm:1.0 FM RDATA";
  attribute X_INTERFACE_INFO of FM_rresp : signal is "xilinx.com:interface:aximm:1.0 FM RRESP";
  attribute X_INTERFACE_INFO of FM_wdata : signal is "xilinx.com:interface:aximm:1.0 FM WDATA";
  attribute X_INTERFACE_INFO of FM_wstrb : signal is "xilinx.com:interface:aximm:1.0 FM WSTRB";
  attribute X_INTERFACE_INFO of FW_INFO_araddr : signal is "xilinx.com:interface:aximm:1.0 FW_INFO ARADDR";
  attribute X_INTERFACE_PARAMETER of FW_INFO_araddr : signal is "XIL_INTERFACENAME FW_INFO, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_AXI_CLK, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of FW_INFO_arprot : signal is "xilinx.com:interface:aximm:1.0 FW_INFO ARPROT";
  attribute X_INTERFACE_INFO of FW_INFO_arready : signal is "xilinx.com:interface:aximm:1.0 FW_INFO ARREADY";
  attribute X_INTERFACE_INFO of FW_INFO_arvalid : signal is "xilinx.com:interface:aximm:1.0 FW_INFO ARVALID";
  attribute X_INTERFACE_INFO of FW_INFO_awaddr : signal is "xilinx.com:interface:aximm:1.0 FW_INFO AWADDR";
  attribute X_INTERFACE_INFO of FW_INFO_awprot : signal is "xilinx.com:interface:aximm:1.0 FW_INFO AWPROT";
  attribute X_INTERFACE_INFO of FW_INFO_awready : signal is "xilinx.com:interface:aximm:1.0 FW_INFO AWREADY";
  attribute X_INTERFACE_INFO of FW_INFO_awvalid : signal is "xilinx.com:interface:aximm:1.0 FW_INFO AWVALID";
  attribute X_INTERFACE_INFO of FW_INFO_bready : signal is "xilinx.com:interface:aximm:1.0 FW_INFO BREADY";
  attribute X_INTERFACE_INFO of FW_INFO_bresp : signal is "xilinx.com:interface:aximm:1.0 FW_INFO BRESP";
  attribute X_INTERFACE_INFO of FW_INFO_bvalid : signal is "xilinx.com:interface:aximm:1.0 FW_INFO BVALID";
  attribute X_INTERFACE_INFO of FW_INFO_rdata : signal is "xilinx.com:interface:aximm:1.0 FW_INFO RDATA";
  attribute X_INTERFACE_INFO of FW_INFO_rready : signal is "xilinx.com:interface:aximm:1.0 FW_INFO RREADY";
  attribute X_INTERFACE_INFO of FW_INFO_rresp : signal is "xilinx.com:interface:aximm:1.0 FW_INFO RRESP";
  attribute X_INTERFACE_INFO of FW_INFO_rvalid : signal is "xilinx.com:interface:aximm:1.0 FW_INFO RVALID";
  attribute X_INTERFACE_INFO of FW_INFO_wdata : signal is "xilinx.com:interface:aximm:1.0 FW_INFO WDATA";
  attribute X_INTERFACE_INFO of FW_INFO_wready : signal is "xilinx.com:interface:aximm:1.0 FW_INFO WREADY";
  attribute X_INTERFACE_INFO of FW_INFO_wstrb : signal is "xilinx.com:interface:aximm:1.0 FW_INFO WSTRB";
  attribute X_INTERFACE_INFO of FW_INFO_wvalid : signal is "xilinx.com:interface:aximm:1.0 FW_INFO WVALID";
  attribute X_INTERFACE_INFO of HAL_araddr : signal is "xilinx.com:interface:aximm:1.0 HAL ARADDR";
  attribute X_INTERFACE_PARAMETER of HAL_araddr : signal is "XIL_INTERFACENAME HAL, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of HAL_arprot : signal is "xilinx.com:interface:aximm:1.0 HAL ARPROT";
  attribute X_INTERFACE_INFO of HAL_awaddr : signal is "xilinx.com:interface:aximm:1.0 HAL AWADDR";
  attribute X_INTERFACE_INFO of HAL_awprot : signal is "xilinx.com:interface:aximm:1.0 HAL AWPROT";
  attribute X_INTERFACE_INFO of HAL_bresp : signal is "xilinx.com:interface:aximm:1.0 HAL BRESP";
  attribute X_INTERFACE_INFO of HAL_rdata : signal is "xilinx.com:interface:aximm:1.0 HAL RDATA";
  attribute X_INTERFACE_INFO of HAL_rresp : signal is "xilinx.com:interface:aximm:1.0 HAL RRESP";
  attribute X_INTERFACE_INFO of HAL_wdata : signal is "xilinx.com:interface:aximm:1.0 HAL WDATA";
  attribute X_INTERFACE_INFO of HAL_wstrb : signal is "xilinx.com:interface:aximm:1.0 HAL WSTRB";
  attribute X_INTERFACE_INFO of HOG_araddr : signal is "xilinx.com:interface:aximm:1.0 HOG ARADDR";
  attribute X_INTERFACE_PARAMETER of HOG_araddr : signal is "XIL_INTERFACENAME HOG, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_AXI_CLK, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of HOG_arprot : signal is "xilinx.com:interface:aximm:1.0 HOG ARPROT";
  attribute X_INTERFACE_INFO of HOG_arready : signal is "xilinx.com:interface:aximm:1.0 HOG ARREADY";
  attribute X_INTERFACE_INFO of HOG_arvalid : signal is "xilinx.com:interface:aximm:1.0 HOG ARVALID";
  attribute X_INTERFACE_INFO of HOG_awaddr : signal is "xilinx.com:interface:aximm:1.0 HOG AWADDR";
  attribute X_INTERFACE_INFO of HOG_awprot : signal is "xilinx.com:interface:aximm:1.0 HOG AWPROT";
  attribute X_INTERFACE_INFO of HOG_awready : signal is "xilinx.com:interface:aximm:1.0 HOG AWREADY";
  attribute X_INTERFACE_INFO of HOG_awvalid : signal is "xilinx.com:interface:aximm:1.0 HOG AWVALID";
  attribute X_INTERFACE_INFO of HOG_bready : signal is "xilinx.com:interface:aximm:1.0 HOG BREADY";
  attribute X_INTERFACE_INFO of HOG_bresp : signal is "xilinx.com:interface:aximm:1.0 HOG BRESP";
  attribute X_INTERFACE_INFO of HOG_bvalid : signal is "xilinx.com:interface:aximm:1.0 HOG BVALID";
  attribute X_INTERFACE_INFO of HOG_rdata : signal is "xilinx.com:interface:aximm:1.0 HOG RDATA";
  attribute X_INTERFACE_INFO of HOG_rready : signal is "xilinx.com:interface:aximm:1.0 HOG RREADY";
  attribute X_INTERFACE_INFO of HOG_rresp : signal is "xilinx.com:interface:aximm:1.0 HOG RRESP";
  attribute X_INTERFACE_INFO of HOG_rvalid : signal is "xilinx.com:interface:aximm:1.0 HOG RVALID";
  attribute X_INTERFACE_INFO of HOG_wdata : signal is "xilinx.com:interface:aximm:1.0 HOG WDATA";
  attribute X_INTERFACE_INFO of HOG_wready : signal is "xilinx.com:interface:aximm:1.0 HOG WREADY";
  attribute X_INTERFACE_INFO of HOG_wstrb : signal is "xilinx.com:interface:aximm:1.0 HOG WSTRB";
  attribute X_INTERFACE_INFO of HOG_wvalid : signal is "xilinx.com:interface:aximm:1.0 HOG WVALID";
  attribute X_INTERFACE_INFO of HPS_INN_araddr : signal is "xilinx.com:interface:aximm:1.0 HPS_INN ARADDR";
  attribute X_INTERFACE_PARAMETER of HPS_INN_araddr : signal is "XIL_INTERFACENAME HPS_INN, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of HPS_INN_arprot : signal is "xilinx.com:interface:aximm:1.0 HPS_INN ARPROT";
  attribute X_INTERFACE_INFO of HPS_INN_awaddr : signal is "xilinx.com:interface:aximm:1.0 HPS_INN AWADDR";
  attribute X_INTERFACE_INFO of HPS_INN_awprot : signal is "xilinx.com:interface:aximm:1.0 HPS_INN AWPROT";
  attribute X_INTERFACE_INFO of HPS_INN_bresp : signal is "xilinx.com:interface:aximm:1.0 HPS_INN BRESP";
  attribute X_INTERFACE_INFO of HPS_INN_rdata : signal is "xilinx.com:interface:aximm:1.0 HPS_INN RDATA";
  attribute X_INTERFACE_INFO of HPS_INN_rresp : signal is "xilinx.com:interface:aximm:1.0 HPS_INN RRESP";
  attribute X_INTERFACE_INFO of HPS_INN_wdata : signal is "xilinx.com:interface:aximm:1.0 HPS_INN WDATA";
  attribute X_INTERFACE_INFO of HPS_INN_wstrb : signal is "xilinx.com:interface:aximm:1.0 HPS_INN WSTRB";
  attribute X_INTERFACE_INFO of HPS_MID_araddr : signal is "xilinx.com:interface:aximm:1.0 HPS_MID ARADDR";
  attribute X_INTERFACE_PARAMETER of HPS_MID_araddr : signal is "XIL_INTERFACENAME HPS_MID, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of HPS_MID_arprot : signal is "xilinx.com:interface:aximm:1.0 HPS_MID ARPROT";
  attribute X_INTERFACE_INFO of HPS_MID_awaddr : signal is "xilinx.com:interface:aximm:1.0 HPS_MID AWADDR";
  attribute X_INTERFACE_INFO of HPS_MID_awprot : signal is "xilinx.com:interface:aximm:1.0 HPS_MID AWPROT";
  attribute X_INTERFACE_INFO of HPS_MID_bresp : signal is "xilinx.com:interface:aximm:1.0 HPS_MID BRESP";
  attribute X_INTERFACE_INFO of HPS_MID_rdata : signal is "xilinx.com:interface:aximm:1.0 HPS_MID RDATA";
  attribute X_INTERFACE_INFO of HPS_MID_rresp : signal is "xilinx.com:interface:aximm:1.0 HPS_MID RRESP";
  attribute X_INTERFACE_INFO of HPS_MID_wdata : signal is "xilinx.com:interface:aximm:1.0 HPS_MID WDATA";
  attribute X_INTERFACE_INFO of HPS_MID_wstrb : signal is "xilinx.com:interface:aximm:1.0 HPS_MID WSTRB";
  attribute X_INTERFACE_INFO of HPS_OUT_araddr : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT ARADDR";
  attribute X_INTERFACE_PARAMETER of HPS_OUT_araddr : signal is "XIL_INTERFACENAME HPS_OUT, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of HPS_OUT_arprot : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT ARPROT";
  attribute X_INTERFACE_INFO of HPS_OUT_awaddr : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT AWADDR";
  attribute X_INTERFACE_INFO of HPS_OUT_awprot : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT AWPROT";
  attribute X_INTERFACE_INFO of HPS_OUT_bresp : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT BRESP";
  attribute X_INTERFACE_INFO of HPS_OUT_rdata : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT RDATA";
  attribute X_INTERFACE_INFO of HPS_OUT_rresp : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT RRESP";
  attribute X_INTERFACE_INFO of HPS_OUT_wdata : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT WDATA";
  attribute X_INTERFACE_INFO of HPS_OUT_wstrb : signal is "xilinx.com:interface:aximm:1.0 HPS_OUT WSTRB";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_cplllock : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG cplllock";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_dmonitorout : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG dmonitorout";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_eyescandataerror : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG eyescandataerror";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_eyescanreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG eyescanreset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_eyescantrigger : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG eyescantrigger";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_pcsrsvdin : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG pcsrsvdin";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_qplllock : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG qplllock";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxbufreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxbufreset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxbufstatus : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxbufstatus";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxcdrhold : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxcdrhold";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxdfelpmreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxdfelpmreset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxlpmen : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxlpmen";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxpcsreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxpcsreset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxpmareset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxpmareset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxpmaresetdone : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxpmaresetdone";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxprbscntreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxprbscntreset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxprbserr : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxprbserr";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxprbssel : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxprbssel";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxrate : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxrate";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_rxresetdone : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG rxresetdone";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txbufstatus : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txbufstatus";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txdiffctrl : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txdiffctrl";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txinhibit : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txinhibit";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txpcsreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txpcsreset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txpmareset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txpmareset";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txpolarity : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txpolarity";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txpostcursor : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txpostcursor";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txprbsforceerr : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txprbsforceerr";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txprbssel : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txprbssel";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txprecursor : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txprecursor";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DEBUG_txresetdone : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2CB_PHY_DEBUG txresetdone";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DRP_daddr : signal is "xilinx.com:interface:drp:1.0 K_C2CB_PHY_DRP DADDR";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DRP_di : signal is "xilinx.com:interface:drp:1.0 K_C2CB_PHY_DRP DI";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_DRP_do : signal is "xilinx.com:interface:drp:1.0 K_C2CB_PHY_DRP DO";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_Rx_rxn : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX:1.0 K_C2CB_PHY_Rx RXN";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_Rx_rxp : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX:1.0 K_C2CB_PHY_Rx RXP";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_Tx_txn : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX:1.0 K_C2CB_PHY_Tx TXN";
  attribute X_INTERFACE_INFO of K_C2CB_PHY_Tx_txp : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX:1.0 K_C2CB_PHY_Tx TXP";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_cplllock : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG cplllock";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_dmonitorout : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG dmonitorout";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_eyescandataerror : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG eyescandataerror";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_eyescanreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG eyescanreset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_eyescantrigger : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG eyescantrigger";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_pcsrsvdin : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG pcsrsvdin";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_qplllock : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG qplllock";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxbufreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxbufreset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxbufstatus : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxbufstatus";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxcdrhold : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxcdrhold";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxdfelpmreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxdfelpmreset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxlpmen : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxlpmen";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxpcsreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxpcsreset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxpmareset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxpmareset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxpmaresetdone : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxpmaresetdone";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxprbscntreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxprbscntreset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxprbserr : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxprbserr";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxprbssel : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxprbssel";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxrate : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxrate";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_rxresetdone : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG rxresetdone";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txbufstatus : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txbufstatus";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txdiffctrl : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txdiffctrl";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txinhibit : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txinhibit";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txpcsreset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txpcsreset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txpmareset : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txpmareset";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txpolarity : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txpolarity";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txpostcursor : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txpostcursor";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txprbsforceerr : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txprbsforceerr";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txprbssel : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txprbssel";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txprecursor : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txprecursor";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DEBUG_txresetdone : signal is "xilinx.com:display_aurora:transceiver_debug:1.0 K_C2C_PHY_DEBUG txresetdone";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DRP_daddr : signal is "xilinx.com:interface:drp:1.0 K_C2C_PHY_DRP DADDR";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DRP_di : signal is "xilinx.com:interface:drp:1.0 K_C2C_PHY_DRP DI";
  attribute X_INTERFACE_INFO of K_C2C_PHY_DRP_do : signal is "xilinx.com:interface:drp:1.0 K_C2C_PHY_DRP DO";
  attribute X_INTERFACE_INFO of K_C2C_PHY_Rx_rxn : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX:1.0 K_C2C_PHY_Rx RXN";
  attribute X_INTERFACE_INFO of K_C2C_PHY_Rx_rxp : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX:1.0 K_C2C_PHY_Rx RXP";
  attribute X_INTERFACE_INFO of K_C2C_PHY_Tx_txn : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX:1.0 K_C2C_PHY_Tx TXN";
  attribute X_INTERFACE_INFO of K_C2C_PHY_Tx_txp : signal is "xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX:1.0 K_C2C_PHY_Tx TXP";
  attribute X_INTERFACE_INFO of MPL_araddr : signal is "xilinx.com:interface:aximm:1.0 MPL ARADDR";
  attribute X_INTERFACE_PARAMETER of MPL_araddr : signal is "XIL_INTERFACENAME MPL, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of MPL_arprot : signal is "xilinx.com:interface:aximm:1.0 MPL ARPROT";
  attribute X_INTERFACE_INFO of MPL_awaddr : signal is "xilinx.com:interface:aximm:1.0 MPL AWADDR";
  attribute X_INTERFACE_INFO of MPL_awprot : signal is "xilinx.com:interface:aximm:1.0 MPL AWPROT";
  attribute X_INTERFACE_INFO of MPL_bresp : signal is "xilinx.com:interface:aximm:1.0 MPL BRESP";
  attribute X_INTERFACE_INFO of MPL_rdata : signal is "xilinx.com:interface:aximm:1.0 MPL RDATA";
  attribute X_INTERFACE_INFO of MPL_rresp : signal is "xilinx.com:interface:aximm:1.0 MPL RRESP";
  attribute X_INTERFACE_INFO of MPL_wdata : signal is "xilinx.com:interface:aximm:1.0 MPL WDATA";
  attribute X_INTERFACE_INFO of MPL_wstrb : signal is "xilinx.com:interface:aximm:1.0 MPL WSTRB";
  attribute X_INTERFACE_INFO of MTC_araddr : signal is "xilinx.com:interface:aximm:1.0 MTC ARADDR";
  attribute X_INTERFACE_PARAMETER of MTC_araddr : signal is "XIL_INTERFACENAME MTC, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of MTC_arprot : signal is "xilinx.com:interface:aximm:1.0 MTC ARPROT";
  attribute X_INTERFACE_INFO of MTC_awaddr : signal is "xilinx.com:interface:aximm:1.0 MTC AWADDR";
  attribute X_INTERFACE_INFO of MTC_awprot : signal is "xilinx.com:interface:aximm:1.0 MTC AWPROT";
  attribute X_INTERFACE_INFO of MTC_bresp : signal is "xilinx.com:interface:aximm:1.0 MTC BRESP";
  attribute X_INTERFACE_INFO of MTC_rdata : signal is "xilinx.com:interface:aximm:1.0 MTC RDATA";
  attribute X_INTERFACE_INFO of MTC_rresp : signal is "xilinx.com:interface:aximm:1.0 MTC RRESP";
  attribute X_INTERFACE_INFO of MTC_wdata : signal is "xilinx.com:interface:aximm:1.0 MTC WDATA";
  attribute X_INTERFACE_INFO of MTC_wstrb : signal is "xilinx.com:interface:aximm:1.0 MTC WSTRB";
  attribute X_INTERFACE_INFO of TAR_INN_araddr : signal is "xilinx.com:interface:aximm:1.0 TAR_INN ARADDR";
  attribute X_INTERFACE_PARAMETER of TAR_INN_araddr : signal is "XIL_INTERFACENAME TAR_INN, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of TAR_INN_arprot : signal is "xilinx.com:interface:aximm:1.0 TAR_INN ARPROT";
  attribute X_INTERFACE_INFO of TAR_INN_awaddr : signal is "xilinx.com:interface:aximm:1.0 TAR_INN AWADDR";
  attribute X_INTERFACE_INFO of TAR_INN_awprot : signal is "xilinx.com:interface:aximm:1.0 TAR_INN AWPROT";
  attribute X_INTERFACE_INFO of TAR_INN_bresp : signal is "xilinx.com:interface:aximm:1.0 TAR_INN BRESP";
  attribute X_INTERFACE_INFO of TAR_INN_rdata : signal is "xilinx.com:interface:aximm:1.0 TAR_INN RDATA";
  attribute X_INTERFACE_INFO of TAR_INN_rresp : signal is "xilinx.com:interface:aximm:1.0 TAR_INN RRESP";
  attribute X_INTERFACE_INFO of TAR_INN_wdata : signal is "xilinx.com:interface:aximm:1.0 TAR_INN WDATA";
  attribute X_INTERFACE_INFO of TAR_INN_wstrb : signal is "xilinx.com:interface:aximm:1.0 TAR_INN WSTRB";
  attribute X_INTERFACE_INFO of TAR_MID_araddr : signal is "xilinx.com:interface:aximm:1.0 TAR_MID ARADDR";
  attribute X_INTERFACE_PARAMETER of TAR_MID_araddr : signal is "XIL_INTERFACENAME TAR_MID, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of TAR_MID_arprot : signal is "xilinx.com:interface:aximm:1.0 TAR_MID ARPROT";
  attribute X_INTERFACE_INFO of TAR_MID_awaddr : signal is "xilinx.com:interface:aximm:1.0 TAR_MID AWADDR";
  attribute X_INTERFACE_INFO of TAR_MID_awprot : signal is "xilinx.com:interface:aximm:1.0 TAR_MID AWPROT";
  attribute X_INTERFACE_INFO of TAR_MID_bresp : signal is "xilinx.com:interface:aximm:1.0 TAR_MID BRESP";
  attribute X_INTERFACE_INFO of TAR_MID_rdata : signal is "xilinx.com:interface:aximm:1.0 TAR_MID RDATA";
  attribute X_INTERFACE_INFO of TAR_MID_rresp : signal is "xilinx.com:interface:aximm:1.0 TAR_MID RRESP";
  attribute X_INTERFACE_INFO of TAR_MID_wdata : signal is "xilinx.com:interface:aximm:1.0 TAR_MID WDATA";
  attribute X_INTERFACE_INFO of TAR_MID_wstrb : signal is "xilinx.com:interface:aximm:1.0 TAR_MID WSTRB";
  attribute X_INTERFACE_INFO of TAR_OUT_araddr : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT ARADDR";
  attribute X_INTERFACE_PARAMETER of TAR_OUT_araddr : signal is "XIL_INTERFACENAME TAR_OUT, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of TAR_OUT_arprot : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT ARPROT";
  attribute X_INTERFACE_INFO of TAR_OUT_awaddr : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT AWADDR";
  attribute X_INTERFACE_INFO of TAR_OUT_awprot : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT AWPROT";
  attribute X_INTERFACE_INFO of TAR_OUT_bresp : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT BRESP";
  attribute X_INTERFACE_INFO of TAR_OUT_rdata : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT RDATA";
  attribute X_INTERFACE_INFO of TAR_OUT_rresp : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT RRESP";
  attribute X_INTERFACE_INFO of TAR_OUT_wdata : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT WDATA";
  attribute X_INTERFACE_INFO of TAR_OUT_wstrb : signal is "xilinx.com:interface:aximm:1.0 TAR_OUT WSTRB";
  attribute X_INTERFACE_INFO of TF_araddr : signal is "xilinx.com:interface:aximm:1.0 TF ARADDR";
  attribute X_INTERFACE_PARAMETER of TF_araddr : signal is "XIL_INTERFACENAME TF, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of TF_arprot : signal is "xilinx.com:interface:aximm:1.0 TF ARPROT";
  attribute X_INTERFACE_INFO of TF_awaddr : signal is "xilinx.com:interface:aximm:1.0 TF AWADDR";
  attribute X_INTERFACE_INFO of TF_awprot : signal is "xilinx.com:interface:aximm:1.0 TF AWPROT";
  attribute X_INTERFACE_INFO of TF_bresp : signal is "xilinx.com:interface:aximm:1.0 TF BRESP";
  attribute X_INTERFACE_INFO of TF_rdata : signal is "xilinx.com:interface:aximm:1.0 TF RDATA";
  attribute X_INTERFACE_INFO of TF_rresp : signal is "xilinx.com:interface:aximm:1.0 TF RRESP";
  attribute X_INTERFACE_INFO of TF_wdata : signal is "xilinx.com:interface:aximm:1.0 TF WDATA";
  attribute X_INTERFACE_INFO of TF_wstrb : signal is "xilinx.com:interface:aximm:1.0 TF WSTRB";
  attribute X_INTERFACE_INFO of UCM_araddr : signal is "xilinx.com:interface:aximm:1.0 UCM ARADDR";
  attribute X_INTERFACE_PARAMETER of UCM_araddr : signal is "XIL_INTERFACENAME UCM, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_clk40, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of UCM_arprot : signal is "xilinx.com:interface:aximm:1.0 UCM ARPROT";
  attribute X_INTERFACE_INFO of UCM_awaddr : signal is "xilinx.com:interface:aximm:1.0 UCM AWADDR";
  attribute X_INTERFACE_INFO of UCM_awprot : signal is "xilinx.com:interface:aximm:1.0 UCM AWPROT";
  attribute X_INTERFACE_INFO of UCM_bresp : signal is "xilinx.com:interface:aximm:1.0 UCM BRESP";
  attribute X_INTERFACE_INFO of UCM_rdata : signal is "xilinx.com:interface:aximm:1.0 UCM RDATA";
  attribute X_INTERFACE_INFO of UCM_rresp : signal is "xilinx.com:interface:aximm:1.0 UCM RRESP";
  attribute X_INTERFACE_INFO of UCM_wdata : signal is "xilinx.com:interface:aximm:1.0 UCM WDATA";
  attribute X_INTERFACE_INFO of UCM_wstrb : signal is "xilinx.com:interface:aximm:1.0 UCM WSTRB";
begin
  AXI_CLK_1 <= AXI_CLK;
  AXI_RST_N(0) <= sys_reseter_interconnect_aresetn(0);
  C2C_INTFS_araddr(31 downto 0) <= slave_interconnect_M02_AXI_ARADDR(31 downto 0);
  C2C_INTFS_arprot(2 downto 0) <= slave_interconnect_M02_AXI_ARPROT(2 downto 0);
  C2C_INTFS_arvalid(0) <= slave_interconnect_M02_AXI_ARVALID(0);
  C2C_INTFS_awaddr(31 downto 0) <= slave_interconnect_M02_AXI_AWADDR(31 downto 0);
  C2C_INTFS_awprot(2 downto 0) <= slave_interconnect_M02_AXI_AWPROT(2 downto 0);
  C2C_INTFS_awvalid(0) <= slave_interconnect_M02_AXI_AWVALID(0);
  C2C_INTFS_bready(0) <= slave_interconnect_M02_AXI_BREADY(0);
  C2C_INTFS_rready(0) <= slave_interconnect_M02_AXI_RREADY(0);
  C2C_INTFS_wdata(31 downto 0) <= slave_interconnect_M02_AXI_WDATA(31 downto 0);
  C2C_INTFS_wstrb(3 downto 0) <= slave_interconnect_M02_AXI_WSTRB(3 downto 0);
  C2C_INTFS_wvalid(0) <= slave_interconnect_M02_AXI_WVALID(0);
  CM1_PB_UART_UART_RxD <= CM1_PB_UART_rxd;
  CM1_PB_UART_txd <= CM1_PB_UART_UART_TxD;
  DAQ_araddr(31 downto 0) <= slave_interconnect_M09_AXI_ARADDR(31 downto 0);
  DAQ_arprot(2 downto 0) <= slave_interconnect_M09_AXI_ARPROT(2 downto 0);
  DAQ_arvalid <= slave_interconnect_M09_AXI_ARVALID;
  DAQ_awaddr(31 downto 0) <= slave_interconnect_M09_AXI_AWADDR(31 downto 0);
  DAQ_awprot(2 downto 0) <= slave_interconnect_M09_AXI_AWPROT(2 downto 0);
  DAQ_awvalid <= slave_interconnect_M09_AXI_AWVALID;
  DAQ_bready <= slave_interconnect_M09_AXI_BREADY;
  DAQ_rready <= slave_interconnect_M09_AXI_RREADY;
  DAQ_wdata(31 downto 0) <= slave_interconnect_M09_AXI_WDATA(31 downto 0);
  DAQ_wstrb(3 downto 0) <= slave_interconnect_M09_AXI_WSTRB(3 downto 0);
  DAQ_wvalid <= slave_interconnect_M09_AXI_WVALID;
  FM_araddr(31 downto 0) <= slave_interconnect_M11_AXI_ARADDR(31 downto 0);
  FM_arprot(2 downto 0) <= slave_interconnect_M11_AXI_ARPROT(2 downto 0);
  FM_arvalid <= slave_interconnect_M11_AXI_ARVALID;
  FM_awaddr(31 downto 0) <= slave_interconnect_M11_AXI_AWADDR(31 downto 0);
  FM_awprot(2 downto 0) <= slave_interconnect_M11_AXI_AWPROT(2 downto 0);
  FM_awvalid <= slave_interconnect_M11_AXI_AWVALID;
  FM_bready <= slave_interconnect_M11_AXI_BREADY;
  FM_rready <= slave_interconnect_M11_AXI_RREADY;
  FM_wdata(31 downto 0) <= slave_interconnect_M11_AXI_WDATA(31 downto 0);
  FM_wstrb(3 downto 0) <= slave_interconnect_M11_AXI_WSTRB(3 downto 0);
  FM_wvalid <= slave_interconnect_M11_AXI_WVALID;
  FW_INFO_araddr(31 downto 0) <= slave_interconnect_M01_AXI_ARADDR(31 downto 0);
  FW_INFO_arprot(2 downto 0) <= slave_interconnect_M01_AXI_ARPROT(2 downto 0);
  FW_INFO_arvalid(0) <= slave_interconnect_M01_AXI_ARVALID(0);
  FW_INFO_awaddr(31 downto 0) <= slave_interconnect_M01_AXI_AWADDR(31 downto 0);
  FW_INFO_awprot(2 downto 0) <= slave_interconnect_M01_AXI_AWPROT(2 downto 0);
  FW_INFO_awvalid(0) <= slave_interconnect_M01_AXI_AWVALID(0);
  FW_INFO_bready(0) <= slave_interconnect_M01_AXI_BREADY(0);
  FW_INFO_rready(0) <= slave_interconnect_M01_AXI_RREADY(0);
  FW_INFO_wdata(31 downto 0) <= slave_interconnect_M01_AXI_WDATA(31 downto 0);
  FW_INFO_wstrb(3 downto 0) <= slave_interconnect_M01_AXI_WSTRB(3 downto 0);
  FW_INFO_wvalid(0) <= slave_interconnect_M01_AXI_WVALID(0);
  HAL_araddr(31 downto 0) <= slave_interconnect_M05_AXI_ARADDR(31 downto 0);
  HAL_arprot(2 downto 0) <= slave_interconnect_M05_AXI_ARPROT(2 downto 0);
  HAL_arvalid <= slave_interconnect_M05_AXI_ARVALID;
  HAL_awaddr(31 downto 0) <= slave_interconnect_M05_AXI_AWADDR(31 downto 0);
  HAL_awprot(2 downto 0) <= slave_interconnect_M05_AXI_AWPROT(2 downto 0);
  HAL_awvalid <= slave_interconnect_M05_AXI_AWVALID;
  HAL_bready <= slave_interconnect_M05_AXI_BREADY;
  HAL_rready <= slave_interconnect_M05_AXI_RREADY;
  HAL_wdata(31 downto 0) <= slave_interconnect_M05_AXI_WDATA(31 downto 0);
  HAL_wstrb(3 downto 0) <= slave_interconnect_M05_AXI_WSTRB(3 downto 0);
  HAL_wvalid <= slave_interconnect_M05_AXI_WVALID;
  HOG_araddr(31 downto 0) <= slave_interconnect_M04_AXI_ARADDR(31 downto 0);
  HOG_arprot(2 downto 0) <= slave_interconnect_M04_AXI_ARPROT(2 downto 0);
  HOG_arvalid(0) <= slave_interconnect_M04_AXI_ARVALID(0);
  HOG_awaddr(31 downto 0) <= slave_interconnect_M04_AXI_AWADDR(31 downto 0);
  HOG_awprot(2 downto 0) <= slave_interconnect_M04_AXI_AWPROT(2 downto 0);
  HOG_awvalid(0) <= slave_interconnect_M04_AXI_AWVALID(0);
  HOG_bready(0) <= slave_interconnect_M04_AXI_BREADY(0);
  HOG_rready(0) <= slave_interconnect_M04_AXI_RREADY(0);
  HOG_wdata(31 downto 0) <= slave_interconnect_M04_AXI_WDATA(31 downto 0);
  HOG_wstrb(3 downto 0) <= slave_interconnect_M04_AXI_WSTRB(3 downto 0);
  HOG_wvalid(0) <= slave_interconnect_M04_AXI_WVALID(0);
  HPS_INN_araddr(31 downto 0) <= INTERCONNECT_INN_M00_AXI_ARADDR(31 downto 0);
  HPS_INN_arprot(2 downto 0) <= INTERCONNECT_INN_M00_AXI_ARPROT(2 downto 0);
  HPS_INN_arvalid <= INTERCONNECT_INN_M00_AXI_ARVALID;
  HPS_INN_awaddr(31 downto 0) <= INTERCONNECT_INN_M00_AXI_AWADDR(31 downto 0);
  HPS_INN_awprot(2 downto 0) <= INTERCONNECT_INN_M00_AXI_AWPROT(2 downto 0);
  HPS_INN_awvalid <= INTERCONNECT_INN_M00_AXI_AWVALID;
  HPS_INN_bready <= INTERCONNECT_INN_M00_AXI_BREADY;
  HPS_INN_rready <= INTERCONNECT_INN_M00_AXI_RREADY;
  HPS_INN_wdata(31 downto 0) <= INTERCONNECT_INN_M00_AXI_WDATA(31 downto 0);
  HPS_INN_wstrb(3 downto 0) <= INTERCONNECT_INN_M00_AXI_WSTRB(3 downto 0);
  HPS_INN_wvalid <= INTERCONNECT_INN_M00_AXI_WVALID;
  HPS_MID_araddr(31 downto 0) <= INTERCONNECT_MID_M00_AXI_ARADDR(31 downto 0);
  HPS_MID_arprot(2 downto 0) <= INTERCONNECT_MID_M00_AXI_ARPROT(2 downto 0);
  HPS_MID_arvalid <= INTERCONNECT_MID_M00_AXI_ARVALID;
  HPS_MID_awaddr(31 downto 0) <= INTERCONNECT_MID_M00_AXI_AWADDR(31 downto 0);
  HPS_MID_awprot(2 downto 0) <= INTERCONNECT_MID_M00_AXI_AWPROT(2 downto 0);
  HPS_MID_awvalid <= INTERCONNECT_MID_M00_AXI_AWVALID;
  HPS_MID_bready <= INTERCONNECT_MID_M00_AXI_BREADY;
  HPS_MID_rready <= INTERCONNECT_MID_M00_AXI_RREADY;
  HPS_MID_wdata(31 downto 0) <= INTERCONNECT_MID_M00_AXI_WDATA(31 downto 0);
  HPS_MID_wstrb(3 downto 0) <= INTERCONNECT_MID_M00_AXI_WSTRB(3 downto 0);
  HPS_MID_wvalid <= INTERCONNECT_MID_M00_AXI_WVALID;
  HPS_OUT_araddr(31 downto 0) <= INTERCONNECT_OUT_M00_AXI_ARADDR(31 downto 0);
  HPS_OUT_arprot(2 downto 0) <= INTERCONNECT_OUT_M00_AXI_ARPROT(2 downto 0);
  HPS_OUT_arvalid <= INTERCONNECT_OUT_M00_AXI_ARVALID;
  HPS_OUT_awaddr(31 downto 0) <= INTERCONNECT_OUT_M00_AXI_AWADDR(31 downto 0);
  HPS_OUT_awprot(2 downto 0) <= INTERCONNECT_OUT_M00_AXI_AWPROT(2 downto 0);
  HPS_OUT_awvalid <= INTERCONNECT_OUT_M00_AXI_AWVALID;
  HPS_OUT_bready <= INTERCONNECT_OUT_M00_AXI_BREADY;
  HPS_OUT_rready <= INTERCONNECT_OUT_M00_AXI_RREADY;
  HPS_OUT_wdata(31 downto 0) <= INTERCONNECT_OUT_M00_AXI_WDATA(31 downto 0);
  HPS_OUT_wstrb(3 downto 0) <= INTERCONNECT_OUT_M00_AXI_WSTRB(3 downto 0);
  HPS_OUT_wvalid <= INTERCONNECT_OUT_M00_AXI_WVALID;
  INTERCONNECT_INN_M00_AXI_ARREADY <= HPS_INN_arready;
  INTERCONNECT_INN_M00_AXI_AWREADY <= HPS_INN_awready;
  INTERCONNECT_INN_M00_AXI_BRESP(1 downto 0) <= HPS_INN_bresp(1 downto 0);
  INTERCONNECT_INN_M00_AXI_BVALID <= HPS_INN_bvalid;
  INTERCONNECT_INN_M00_AXI_RDATA(31 downto 0) <= HPS_INN_rdata(31 downto 0);
  INTERCONNECT_INN_M00_AXI_RRESP(1 downto 0) <= HPS_INN_rresp(1 downto 0);
  INTERCONNECT_INN_M00_AXI_RVALID <= HPS_INN_rvalid;
  INTERCONNECT_INN_M00_AXI_WREADY <= HPS_INN_wready;
  INTERCONNECT_INN_M01_AXI_ARREADY <= TAR_INN_arready;
  INTERCONNECT_INN_M01_AXI_AWREADY <= TAR_INN_awready;
  INTERCONNECT_INN_M01_AXI_BRESP(1 downto 0) <= TAR_INN_bresp(1 downto 0);
  INTERCONNECT_INN_M01_AXI_BVALID <= TAR_INN_bvalid;
  INTERCONNECT_INN_M01_AXI_RDATA(31 downto 0) <= TAR_INN_rdata(31 downto 0);
  INTERCONNECT_INN_M01_AXI_RRESP(1 downto 0) <= TAR_INN_rresp(1 downto 0);
  INTERCONNECT_INN_M01_AXI_RVALID <= TAR_INN_rvalid;
  INTERCONNECT_INN_M01_AXI_WREADY <= TAR_INN_wready;
  INTERCONNECT_MID_M00_AXI_ARREADY <= HPS_MID_arready;
  INTERCONNECT_MID_M00_AXI_AWREADY <= HPS_MID_awready;
  INTERCONNECT_MID_M00_AXI_BRESP(1 downto 0) <= HPS_MID_bresp(1 downto 0);
  INTERCONNECT_MID_M00_AXI_BVALID <= HPS_MID_bvalid;
  INTERCONNECT_MID_M00_AXI_RDATA(31 downto 0) <= HPS_MID_rdata(31 downto 0);
  INTERCONNECT_MID_M00_AXI_RRESP(1 downto 0) <= HPS_MID_rresp(1 downto 0);
  INTERCONNECT_MID_M00_AXI_RVALID <= HPS_MID_rvalid;
  INTERCONNECT_MID_M00_AXI_WREADY <= HPS_MID_wready;
  INTERCONNECT_MID_M01_AXI_ARREADY <= TAR_MID_arready;
  INTERCONNECT_MID_M01_AXI_AWREADY <= TAR_MID_awready;
  INTERCONNECT_MID_M01_AXI_BRESP(1 downto 0) <= TAR_MID_bresp(1 downto 0);
  INTERCONNECT_MID_M01_AXI_BVALID <= TAR_MID_bvalid;
  INTERCONNECT_MID_M01_AXI_RDATA(31 downto 0) <= TAR_MID_rdata(31 downto 0);
  INTERCONNECT_MID_M01_AXI_RRESP(1 downto 0) <= TAR_MID_rresp(1 downto 0);
  INTERCONNECT_MID_M01_AXI_RVALID <= TAR_MID_rvalid;
  INTERCONNECT_MID_M01_AXI_WREADY <= TAR_MID_wready;
  INTERCONNECT_OUT_M00_AXI_ARREADY <= HPS_OUT_arready;
  INTERCONNECT_OUT_M00_AXI_AWREADY <= HPS_OUT_awready;
  INTERCONNECT_OUT_M00_AXI_BRESP(1 downto 0) <= HPS_OUT_bresp(1 downto 0);
  INTERCONNECT_OUT_M00_AXI_BVALID <= HPS_OUT_bvalid;
  INTERCONNECT_OUT_M00_AXI_RDATA(31 downto 0) <= HPS_OUT_rdata(31 downto 0);
  INTERCONNECT_OUT_M00_AXI_RRESP(1 downto 0) <= HPS_OUT_rresp(1 downto 0);
  INTERCONNECT_OUT_M00_AXI_RVALID <= HPS_OUT_rvalid;
  INTERCONNECT_OUT_M00_AXI_WREADY <= HPS_OUT_wready;
  INTERCONNECT_OUT_M01_AXI_ARREADY <= TAR_OUT_arready;
  INTERCONNECT_OUT_M01_AXI_AWREADY <= TAR_OUT_awready;
  INTERCONNECT_OUT_M01_AXI_BRESP(1 downto 0) <= TAR_OUT_bresp(1 downto 0);
  INTERCONNECT_OUT_M01_AXI_BVALID <= TAR_OUT_bvalid;
  INTERCONNECT_OUT_M01_AXI_RDATA(31 downto 0) <= TAR_OUT_rdata(31 downto 0);
  INTERCONNECT_OUT_M01_AXI_RRESP(1 downto 0) <= TAR_OUT_rresp(1 downto 0);
  INTERCONNECT_OUT_M01_AXI_RVALID <= TAR_OUT_rvalid;
  INTERCONNECT_OUT_M01_AXI_WREADY <= TAR_OUT_wready;
  KINTEX_SYS_MGMT_alarm <= KINTEX_SYS_MGMT_alarm_out;
  KINTEX_SYS_MGMT_overtemp_alarm <= KINTEX_SYS_MGMT_ot_out;
  KINTEX_SYS_MGMT_vccaux_alarm <= KINTEX_SYS_MGMT_vccaux_alarm_out;
  KINTEX_SYS_MGMT_vccint_alarm <= KINTEX_SYS_MGMT_vccint_alarm_out;
  K_C2CB_PHY_DEBUG_cplllock(0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_cplllock(0);
  K_C2CB_PHY_DEBUG_dmonitorout(15 downto 0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_dmonitorout(15 downto 0);
  K_C2CB_PHY_DEBUG_eyescandataerror(0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescandataerror(0);
  K_C2CB_PHY_DEBUG_qplllock(0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_qplllock(0);
  K_C2CB_PHY_DEBUG_rxbufstatus(2 downto 0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_rxbufstatus(2 downto 0);
  K_C2CB_PHY_DEBUG_rxpmaresetdone(0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpmaresetdone(0);
  K_C2CB_PHY_DEBUG_rxprbserr(0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbserr(0);
  K_C2CB_PHY_DEBUG_rxresetdone(0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_rxresetdone(0);
  K_C2CB_PHY_DEBUG_txbufstatus(1 downto 0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_txbufstatus(1 downto 0);
  K_C2CB_PHY_DEBUG_txresetdone(0) <= K_C2CB_PHY_TRANSCEIVER_DEBUG_txresetdone(0);
  K_C2CB_PHY_DRP_1_DADDR(9 downto 0) <= K_C2CB_PHY_DRP_daddr(9 downto 0);
  K_C2CB_PHY_DRP_1_DEN <= K_C2CB_PHY_DRP_den;
  K_C2CB_PHY_DRP_1_DI(15 downto 0) <= K_C2CB_PHY_DRP_di(15 downto 0);
  K_C2CB_PHY_DRP_1_DWE <= K_C2CB_PHY_DRP_dwe;
  K_C2CB_PHY_DRP_do(15 downto 0) <= K_C2CB_PHY_DRP_1_DO(15 downto 0);
  K_C2CB_PHY_DRP_drdy <= K_C2CB_PHY_DRP_1_DRDY;
  K_C2CB_PHY_Rx_1_RXN(0) <= K_C2CB_PHY_Rx_rxn(0);
  K_C2CB_PHY_Rx_1_RXP(0) <= K_C2CB_PHY_Rx_rxp(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescanreset(0) <= K_C2CB_PHY_DEBUG_eyescanreset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescantrigger(0) <= K_C2CB_PHY_DEBUG_eyescantrigger(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_pcsrsvdin(15 downto 0) <= K_C2CB_PHY_DEBUG_pcsrsvdin(15 downto 0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxbufreset(0) <= K_C2CB_PHY_DEBUG_rxbufreset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxcdrhold(0) <= K_C2CB_PHY_DEBUG_rxcdrhold(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxdfelpmreset(0) <= K_C2CB_PHY_DEBUG_rxdfelpmreset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxlpmen(0) <= K_C2CB_PHY_DEBUG_rxlpmen(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpcsreset(0) <= K_C2CB_PHY_DEBUG_rxpcsreset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpmareset(0) <= K_C2CB_PHY_DEBUG_rxpmareset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbscntreset(0) <= K_C2CB_PHY_DEBUG_rxprbscntreset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbssel(3 downto 0) <= K_C2CB_PHY_DEBUG_rxprbssel(3 downto 0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_rxrate(2 downto 0) <= K_C2CB_PHY_DEBUG_rxrate(2 downto 0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txdiffctrl(4 downto 0) <= K_C2CB_PHY_DEBUG_txdiffctrl(4 downto 0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txinhibit(0) <= K_C2CB_PHY_DEBUG_txinhibit(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txpcsreset(0) <= K_C2CB_PHY_DEBUG_txpcsreset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txpmareset(0) <= K_C2CB_PHY_DEBUG_txpmareset(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txpolarity(0) <= K_C2CB_PHY_DEBUG_txpolarity(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txpostcursor(4 downto 0) <= K_C2CB_PHY_DEBUG_txpostcursor(4 downto 0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txprbsforceerr(0) <= K_C2CB_PHY_DEBUG_txprbsforceerr(0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txprbssel(3 downto 0) <= K_C2CB_PHY_DEBUG_txprbssel(3 downto 0);
  K_C2CB_PHY_TRANSCEIVER_DEBUG_txprecursor(4 downto 0) <= K_C2CB_PHY_DEBUG_txprecursor(4 downto 0);
  K_C2CB_PHY_Tx_txn(0) <= K_C2CB_PHY_GT_SERIAL_TX_TXN(0);
  K_C2CB_PHY_Tx_txp(0) <= K_C2CB_PHY_GT_SERIAL_TX_TXP(0);
  K_C2CB_PHY_channel_up <= K_C2CB_PHY_channel_up1;
  K_C2CB_PHY_gt_pll_lock <= K_C2CB_PHY_gt_pll_lock1;
  K_C2CB_PHY_hard_err <= K_C2CB_PHY_hard_err1;
  K_C2CB_PHY_lane_up(0) <= K_C2CB_PHY_lane_up1(0);
  K_C2CB_PHY_link_reset_out <= K_C2CB_PHY_link_reset_out1;
  K_C2CB_PHY_power_down_1 <= K_C2CB_PHY_power_down;
  K_C2CB_PHY_soft_err <= K_C2CB_PHY_soft_err1;
  K_C2CB_aurora_do_cc <= K_C2CB_aurora_do_cc1;
  K_C2CB_aurora_pma_init_in_1 <= K_C2CB_aurora_pma_init_in;
  K_C2CB_axi_c2c_config_error_out <= K_C2CB_axi_c2c_config_error_out1;
  K_C2CB_axi_c2c_link_status_out <= K_C2CB_axi_c2c_link_status_out1;
  K_C2CB_axi_c2c_multi_bit_error_out <= K_C2CB_axi_c2c_multi_bit_error_out1;
  K_C2C_PHY_CLK <= K_C2C_PHY_user_clk_out;
  K_C2C_PHY_DEBUG_cplllock(0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_cplllock(0);
  K_C2C_PHY_DEBUG_dmonitorout(15 downto 0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_dmonitorout(15 downto 0);
  K_C2C_PHY_DEBUG_eyescandataerror(0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_eyescandataerror(0);
  K_C2C_PHY_DEBUG_qplllock(0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_qplllock(0);
  K_C2C_PHY_DEBUG_rxbufstatus(2 downto 0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_rxbufstatus(2 downto 0);
  K_C2C_PHY_DEBUG_rxpmaresetdone(0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_rxpmaresetdone(0);
  K_C2C_PHY_DEBUG_rxprbserr(0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbserr(0);
  K_C2C_PHY_DEBUG_rxresetdone(0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_rxresetdone(0);
  K_C2C_PHY_DEBUG_txbufstatus(1 downto 0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_txbufstatus(1 downto 0);
  K_C2C_PHY_DEBUG_txresetdone(0) <= K_C2C_PHY_TRANSCEIVER_DEBUG_txresetdone(0);
  K_C2C_PHY_DRP_1_DADDR(9 downto 0) <= K_C2C_PHY_DRP_daddr(9 downto 0);
  K_C2C_PHY_DRP_1_DEN <= K_C2C_PHY_DRP_den;
  K_C2C_PHY_DRP_1_DI(15 downto 0) <= K_C2C_PHY_DRP_di(15 downto 0);
  K_C2C_PHY_DRP_1_DWE <= K_C2C_PHY_DRP_dwe;
  K_C2C_PHY_DRP_do(15 downto 0) <= K_C2C_PHY_DRP_1_DO(15 downto 0);
  K_C2C_PHY_DRP_drdy <= K_C2C_PHY_DRP_1_DRDY;
  K_C2C_PHY_Rx_1_RXN(0) <= K_C2C_PHY_Rx_rxn(0);
  K_C2C_PHY_Rx_1_RXP(0) <= K_C2C_PHY_Rx_rxp(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_eyescanreset(0) <= K_C2C_PHY_DEBUG_eyescanreset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_eyescantrigger(0) <= K_C2C_PHY_DEBUG_eyescantrigger(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_pcsrsvdin(15 downto 0) <= K_C2C_PHY_DEBUG_pcsrsvdin(15 downto 0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxbufreset(0) <= K_C2C_PHY_DEBUG_rxbufreset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxcdrhold(0) <= K_C2C_PHY_DEBUG_rxcdrhold(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxdfelpmreset(0) <= K_C2C_PHY_DEBUG_rxdfelpmreset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxlpmen(0) <= K_C2C_PHY_DEBUG_rxlpmen(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxpcsreset(0) <= K_C2C_PHY_DEBUG_rxpcsreset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxpmareset(0) <= K_C2C_PHY_DEBUG_rxpmareset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbscntreset(0) <= K_C2C_PHY_DEBUG_rxprbscntreset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbssel(3 downto 0) <= K_C2C_PHY_DEBUG_rxprbssel(3 downto 0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_rxrate(2 downto 0) <= K_C2C_PHY_DEBUG_rxrate(2 downto 0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txdiffctrl(4 downto 0) <= K_C2C_PHY_DEBUG_txdiffctrl(4 downto 0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txinhibit(0) <= K_C2C_PHY_DEBUG_txinhibit(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txpcsreset(0) <= K_C2C_PHY_DEBUG_txpcsreset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txpmareset(0) <= K_C2C_PHY_DEBUG_txpmareset(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txpolarity(0) <= K_C2C_PHY_DEBUG_txpolarity(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txpostcursor(4 downto 0) <= K_C2C_PHY_DEBUG_txpostcursor(4 downto 0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txprbsforceerr(0) <= K_C2C_PHY_DEBUG_txprbsforceerr(0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txprbssel(3 downto 0) <= K_C2C_PHY_DEBUG_txprbssel(3 downto 0);
  K_C2C_PHY_TRANSCEIVER_DEBUG_txprecursor(4 downto 0) <= K_C2C_PHY_DEBUG_txprecursor(4 downto 0);
  K_C2C_PHY_Tx_txn(0) <= K_C2C_PHY_GT_SERIAL_TX_TXN(0);
  K_C2C_PHY_Tx_txp(0) <= K_C2C_PHY_GT_SERIAL_TX_TXP(0);
  K_C2C_PHY_channel_up <= K_C2C_PHY_channel_up1;
  K_C2C_PHY_gt_pll_lock <= K_C2C_PHY_gt_pll_lock1;
  K_C2C_PHY_gt_refclk1_out <= K_C2C_PHY_gt_refclk1_out1;
  K_C2C_PHY_hard_err <= K_C2C_PHY_hard_err1;
  K_C2C_PHY_lane_up(0) <= K_C2C_PHY_lane_up1(0);
  K_C2C_PHY_link_reset_out <= K_C2C_PHY_link_reset_out1;
  K_C2C_PHY_mmcm_not_locked_out <= K_C2C_PHY_mmcm_not_locked_out1;
  K_C2C_PHY_power_down_1 <= K_C2C_PHY_power_down;
  K_C2C_PHY_refclk_1_CLK_N <= K_C2C_PHY_refclk_clk_n;
  K_C2C_PHY_refclk_1_CLK_P <= K_C2C_PHY_refclk_clk_p;
  K_C2C_PHY_soft_err <= K_C2C_PHY_soft_err1;
  K_C2C_aurora_do_cc <= K_C2C_aurora_do_cc1;
  K_C2C_aurora_pma_init_in_1 <= K_C2C_aurora_pma_init_in;
  K_C2C_axi_c2c_config_error_out <= K_C2C_axi_c2c_config_error_out1;
  K_C2C_axi_c2c_link_status_out <= K_C2C_axi_c2c_link_status_out1;
  K_C2C_axi_c2c_multi_bit_error_out <= K_C2C_axi_c2c_multi_bit_error_out1;
  MPL_araddr(31 downto 0) <= slave_interconnect_M10_AXI_ARADDR(31 downto 0);
  MPL_arprot(2 downto 0) <= slave_interconnect_M10_AXI_ARPROT(2 downto 0);
  MPL_arvalid <= slave_interconnect_M10_AXI_ARVALID;
  MPL_awaddr(31 downto 0) <= slave_interconnect_M10_AXI_AWADDR(31 downto 0);
  MPL_awprot(2 downto 0) <= slave_interconnect_M10_AXI_AWPROT(2 downto 0);
  MPL_awvalid <= slave_interconnect_M10_AXI_AWVALID;
  MPL_bready <= slave_interconnect_M10_AXI_BREADY;
  MPL_rready <= slave_interconnect_M10_AXI_RREADY;
  MPL_wdata(31 downto 0) <= slave_interconnect_M10_AXI_WDATA(31 downto 0);
  MPL_wstrb(3 downto 0) <= slave_interconnect_M10_AXI_WSTRB(3 downto 0);
  MPL_wvalid <= slave_interconnect_M10_AXI_WVALID;
  MTC_araddr(31 downto 0) <= slave_interconnect_M06_AXI_ARADDR(31 downto 0);
  MTC_arprot(2 downto 0) <= slave_interconnect_M06_AXI_ARPROT(2 downto 0);
  MTC_arvalid <= slave_interconnect_M06_AXI_ARVALID;
  MTC_awaddr(31 downto 0) <= slave_interconnect_M06_AXI_AWADDR(31 downto 0);
  MTC_awprot(2 downto 0) <= slave_interconnect_M06_AXI_AWPROT(2 downto 0);
  MTC_awvalid <= slave_interconnect_M06_AXI_AWVALID;
  MTC_bready <= slave_interconnect_M06_AXI_BREADY;
  MTC_rready <= slave_interconnect_M06_AXI_RREADY;
  MTC_wdata(31 downto 0) <= slave_interconnect_M06_AXI_WDATA(31 downto 0);
  MTC_wstrb(3 downto 0) <= slave_interconnect_M06_AXI_WSTRB(3 downto 0);
  MTC_wvalid <= slave_interconnect_M06_AXI_WVALID;
  TAR_INN_araddr(31 downto 0) <= INTERCONNECT_INN_M01_AXI_ARADDR(31 downto 0);
  TAR_INN_arprot(2 downto 0) <= INTERCONNECT_INN_M01_AXI_ARPROT(2 downto 0);
  TAR_INN_arvalid <= INTERCONNECT_INN_M01_AXI_ARVALID;
  TAR_INN_awaddr(31 downto 0) <= INTERCONNECT_INN_M01_AXI_AWADDR(31 downto 0);
  TAR_INN_awprot(2 downto 0) <= INTERCONNECT_INN_M01_AXI_AWPROT(2 downto 0);
  TAR_INN_awvalid <= INTERCONNECT_INN_M01_AXI_AWVALID;
  TAR_INN_bready <= INTERCONNECT_INN_M01_AXI_BREADY;
  TAR_INN_rready <= INTERCONNECT_INN_M01_AXI_RREADY;
  TAR_INN_wdata(31 downto 0) <= INTERCONNECT_INN_M01_AXI_WDATA(31 downto 0);
  TAR_INN_wstrb(3 downto 0) <= INTERCONNECT_INN_M01_AXI_WSTRB(3 downto 0);
  TAR_INN_wvalid <= INTERCONNECT_INN_M01_AXI_WVALID;
  TAR_MID_araddr(31 downto 0) <= INTERCONNECT_MID_M01_AXI_ARADDR(31 downto 0);
  TAR_MID_arprot(2 downto 0) <= INTERCONNECT_MID_M01_AXI_ARPROT(2 downto 0);
  TAR_MID_arvalid <= INTERCONNECT_MID_M01_AXI_ARVALID;
  TAR_MID_awaddr(31 downto 0) <= INTERCONNECT_MID_M01_AXI_AWADDR(31 downto 0);
  TAR_MID_awprot(2 downto 0) <= INTERCONNECT_MID_M01_AXI_AWPROT(2 downto 0);
  TAR_MID_awvalid <= INTERCONNECT_MID_M01_AXI_AWVALID;
  TAR_MID_bready <= INTERCONNECT_MID_M01_AXI_BREADY;
  TAR_MID_rready <= INTERCONNECT_MID_M01_AXI_RREADY;
  TAR_MID_wdata(31 downto 0) <= INTERCONNECT_MID_M01_AXI_WDATA(31 downto 0);
  TAR_MID_wstrb(3 downto 0) <= INTERCONNECT_MID_M01_AXI_WSTRB(3 downto 0);
  TAR_MID_wvalid <= INTERCONNECT_MID_M01_AXI_WVALID;
  TAR_OUT_araddr(31 downto 0) <= INTERCONNECT_OUT_M01_AXI_ARADDR(31 downto 0);
  TAR_OUT_arprot(2 downto 0) <= INTERCONNECT_OUT_M01_AXI_ARPROT(2 downto 0);
  TAR_OUT_arvalid <= INTERCONNECT_OUT_M01_AXI_ARVALID;
  TAR_OUT_awaddr(31 downto 0) <= INTERCONNECT_OUT_M01_AXI_AWADDR(31 downto 0);
  TAR_OUT_awprot(2 downto 0) <= INTERCONNECT_OUT_M01_AXI_AWPROT(2 downto 0);
  TAR_OUT_awvalid <= INTERCONNECT_OUT_M01_AXI_AWVALID;
  TAR_OUT_bready <= INTERCONNECT_OUT_M01_AXI_BREADY;
  TAR_OUT_rready <= INTERCONNECT_OUT_M01_AXI_RREADY;
  TAR_OUT_wdata(31 downto 0) <= INTERCONNECT_OUT_M01_AXI_WDATA(31 downto 0);
  TAR_OUT_wstrb(3 downto 0) <= INTERCONNECT_OUT_M01_AXI_WSTRB(3 downto 0);
  TAR_OUT_wvalid <= INTERCONNECT_OUT_M01_AXI_WVALID;
  TF_araddr(31 downto 0) <= slave_interconnect_M07_AXI_ARADDR(31 downto 0);
  TF_arprot(2 downto 0) <= slave_interconnect_M07_AXI_ARPROT(2 downto 0);
  TF_arvalid <= slave_interconnect_M07_AXI_ARVALID;
  TF_awaddr(31 downto 0) <= slave_interconnect_M07_AXI_AWADDR(31 downto 0);
  TF_awprot(2 downto 0) <= slave_interconnect_M07_AXI_AWPROT(2 downto 0);
  TF_awvalid <= slave_interconnect_M07_AXI_AWVALID;
  TF_bready <= slave_interconnect_M07_AXI_BREADY;
  TF_rready <= slave_interconnect_M07_AXI_RREADY;
  TF_wdata(31 downto 0) <= slave_interconnect_M07_AXI_WDATA(31 downto 0);
  TF_wstrb(3 downto 0) <= slave_interconnect_M07_AXI_WSTRB(3 downto 0);
  TF_wvalid <= slave_interconnect_M07_AXI_WVALID;
  UCM_araddr(31 downto 0) <= slave_interconnect_M08_AXI_ARADDR(31 downto 0);
  UCM_arprot(2 downto 0) <= slave_interconnect_M08_AXI_ARPROT(2 downto 0);
  UCM_arvalid <= slave_interconnect_M08_AXI_ARVALID;
  UCM_awaddr(31 downto 0) <= slave_interconnect_M08_AXI_AWADDR(31 downto 0);
  UCM_awprot(2 downto 0) <= slave_interconnect_M08_AXI_AWPROT(2 downto 0);
  UCM_awvalid <= slave_interconnect_M08_AXI_AWVALID;
  UCM_bready <= slave_interconnect_M08_AXI_BREADY;
  UCM_rready <= slave_interconnect_M08_AXI_RREADY;
  UCM_wdata(31 downto 0) <= slave_interconnect_M08_AXI_WDATA(31 downto 0);
  UCM_wstrb(3 downto 0) <= slave_interconnect_M08_AXI_WSTRB(3 downto 0);
  UCM_wvalid <= slave_interconnect_M08_AXI_WVALID;
  clk40_1 <= clk40;
  clk50Mhz_1 <= clk50Mhz;
  reset_n_1 <= reset_n;
  slave_interconnect_M01_AXI_ARREADY(0) <= FW_INFO_arready(0);
  slave_interconnect_M01_AXI_AWREADY(0) <= FW_INFO_awready(0);
  slave_interconnect_M01_AXI_BRESP(1 downto 0) <= FW_INFO_bresp(1 downto 0);
  slave_interconnect_M01_AXI_BVALID(0) <= FW_INFO_bvalid(0);
  slave_interconnect_M01_AXI_RDATA(31 downto 0) <= FW_INFO_rdata(31 downto 0);
  slave_interconnect_M01_AXI_RRESP(1 downto 0) <= FW_INFO_rresp(1 downto 0);
  slave_interconnect_M01_AXI_RVALID(0) <= FW_INFO_rvalid(0);
  slave_interconnect_M01_AXI_WREADY(0) <= FW_INFO_wready(0);
  slave_interconnect_M02_AXI_ARREADY(0) <= C2C_INTFS_arready(0);
  slave_interconnect_M02_AXI_AWREADY(0) <= C2C_INTFS_awready(0);
  slave_interconnect_M02_AXI_BRESP(1 downto 0) <= C2C_INTFS_bresp(1 downto 0);
  slave_interconnect_M02_AXI_BVALID(0) <= C2C_INTFS_bvalid(0);
  slave_interconnect_M02_AXI_RDATA(31 downto 0) <= C2C_INTFS_rdata(31 downto 0);
  slave_interconnect_M02_AXI_RRESP(1 downto 0) <= C2C_INTFS_rresp(1 downto 0);
  slave_interconnect_M02_AXI_RVALID(0) <= C2C_INTFS_rvalid(0);
  slave_interconnect_M02_AXI_WREADY(0) <= C2C_INTFS_wready(0);
  slave_interconnect_M04_AXI_ARREADY(0) <= HOG_arready(0);
  slave_interconnect_M04_AXI_AWREADY(0) <= HOG_awready(0);
  slave_interconnect_M04_AXI_BRESP(1 downto 0) <= HOG_bresp(1 downto 0);
  slave_interconnect_M04_AXI_BVALID(0) <= HOG_bvalid(0);
  slave_interconnect_M04_AXI_RDATA(31 downto 0) <= HOG_rdata(31 downto 0);
  slave_interconnect_M04_AXI_RRESP(1 downto 0) <= HOG_rresp(1 downto 0);
  slave_interconnect_M04_AXI_RVALID(0) <= HOG_rvalid(0);
  slave_interconnect_M04_AXI_WREADY(0) <= HOG_wready(0);
  slave_interconnect_M05_AXI_ARREADY <= HAL_arready;
  slave_interconnect_M05_AXI_AWREADY <= HAL_awready;
  slave_interconnect_M05_AXI_BRESP(1 downto 0) <= HAL_bresp(1 downto 0);
  slave_interconnect_M05_AXI_BVALID <= HAL_bvalid;
  slave_interconnect_M05_AXI_RDATA(31 downto 0) <= HAL_rdata(31 downto 0);
  slave_interconnect_M05_AXI_RRESP(1 downto 0) <= HAL_rresp(1 downto 0);
  slave_interconnect_M05_AXI_RVALID <= HAL_rvalid;
  slave_interconnect_M05_AXI_WREADY <= HAL_wready;
  slave_interconnect_M06_AXI_ARREADY <= MTC_arready;
  slave_interconnect_M06_AXI_AWREADY <= MTC_awready;
  slave_interconnect_M06_AXI_BRESP(1 downto 0) <= MTC_bresp(1 downto 0);
  slave_interconnect_M06_AXI_BVALID <= MTC_bvalid;
  slave_interconnect_M06_AXI_RDATA(31 downto 0) <= MTC_rdata(31 downto 0);
  slave_interconnect_M06_AXI_RRESP(1 downto 0) <= MTC_rresp(1 downto 0);
  slave_interconnect_M06_AXI_RVALID <= MTC_rvalid;
  slave_interconnect_M06_AXI_WREADY <= MTC_wready;
  slave_interconnect_M07_AXI_ARREADY <= TF_arready;
  slave_interconnect_M07_AXI_AWREADY <= TF_awready;
  slave_interconnect_M07_AXI_BRESP(1 downto 0) <= TF_bresp(1 downto 0);
  slave_interconnect_M07_AXI_BVALID <= TF_bvalid;
  slave_interconnect_M07_AXI_RDATA(31 downto 0) <= TF_rdata(31 downto 0);
  slave_interconnect_M07_AXI_RRESP(1 downto 0) <= TF_rresp(1 downto 0);
  slave_interconnect_M07_AXI_RVALID <= TF_rvalid;
  slave_interconnect_M07_AXI_WREADY <= TF_wready;
  slave_interconnect_M08_AXI_ARREADY <= UCM_arready;
  slave_interconnect_M08_AXI_AWREADY <= UCM_awready;
  slave_interconnect_M08_AXI_BRESP(1 downto 0) <= UCM_bresp(1 downto 0);
  slave_interconnect_M08_AXI_BVALID <= UCM_bvalid;
  slave_interconnect_M08_AXI_RDATA(31 downto 0) <= UCM_rdata(31 downto 0);
  slave_interconnect_M08_AXI_RRESP(1 downto 0) <= UCM_rresp(1 downto 0);
  slave_interconnect_M08_AXI_RVALID <= UCM_rvalid;
  slave_interconnect_M08_AXI_WREADY <= UCM_wready;
  slave_interconnect_M09_AXI_ARREADY <= DAQ_arready;
  slave_interconnect_M09_AXI_AWREADY <= DAQ_awready;
  slave_interconnect_M09_AXI_BRESP(1 downto 0) <= DAQ_bresp(1 downto 0);
  slave_interconnect_M09_AXI_BVALID <= DAQ_bvalid;
  slave_interconnect_M09_AXI_RDATA(31 downto 0) <= DAQ_rdata(31 downto 0);
  slave_interconnect_M09_AXI_RRESP(1 downto 0) <= DAQ_rresp(1 downto 0);
  slave_interconnect_M09_AXI_RVALID <= DAQ_rvalid;
  slave_interconnect_M09_AXI_WREADY <= DAQ_wready;
  slave_interconnect_M10_AXI_ARREADY <= MPL_arready;
  slave_interconnect_M10_AXI_AWREADY <= MPL_awready;
  slave_interconnect_M10_AXI_BRESP(1 downto 0) <= MPL_bresp(1 downto 0);
  slave_interconnect_M10_AXI_BVALID <= MPL_bvalid;
  slave_interconnect_M10_AXI_RDATA(31 downto 0) <= MPL_rdata(31 downto 0);
  slave_interconnect_M10_AXI_RRESP(1 downto 0) <= MPL_rresp(1 downto 0);
  slave_interconnect_M10_AXI_RVALID <= MPL_rvalid;
  slave_interconnect_M10_AXI_WREADY <= MPL_wready;
  slave_interconnect_M11_AXI_ARREADY <= FM_arready;
  slave_interconnect_M11_AXI_AWREADY <= FM_awready;
  slave_interconnect_M11_AXI_BRESP(1 downto 0) <= FM_bresp(1 downto 0);
  slave_interconnect_M11_AXI_BVALID <= FM_bvalid;
  slave_interconnect_M11_AXI_RDATA(31 downto 0) <= FM_rdata(31 downto 0);
  slave_interconnect_M11_AXI_RRESP(1 downto 0) <= FM_rresp(1 downto 0);
  slave_interconnect_M11_AXI_RVALID <= FM_rvalid;
  slave_interconnect_M11_AXI_WREADY <= FM_wready;
CM1_PB_UART: component c2cSlave_CM1_PB_UART_0
     port map (
      interrupt => CM1_PB_UART_interrupt,
      rx => CM1_PB_UART_UART_RxD,
      s_axi_aclk => AXI_CLK_1,
      s_axi_araddr(3 downto 0) => slave_interconnect_M03_AXI_ARADDR(3 downto 0),
      s_axi_aresetn => sys_reseter_interconnect_aresetn(0),
      s_axi_arready => slave_interconnect_M03_AXI_ARREADY,
      s_axi_arvalid => slave_interconnect_M03_AXI_ARVALID,
      s_axi_awaddr(3 downto 0) => slave_interconnect_M03_AXI_AWADDR(3 downto 0),
      s_axi_awready => slave_interconnect_M03_AXI_AWREADY,
      s_axi_awvalid => slave_interconnect_M03_AXI_AWVALID,
      s_axi_bready => slave_interconnect_M03_AXI_BREADY,
      s_axi_bresp(1 downto 0) => slave_interconnect_M03_AXI_BRESP(1 downto 0),
      s_axi_bvalid => slave_interconnect_M03_AXI_BVALID,
      s_axi_rdata(31 downto 0) => slave_interconnect_M03_AXI_RDATA(31 downto 0),
      s_axi_rready => slave_interconnect_M03_AXI_RREADY,
      s_axi_rresp(1 downto 0) => slave_interconnect_M03_AXI_RRESP(1 downto 0),
      s_axi_rvalid => slave_interconnect_M03_AXI_RVALID,
      s_axi_wdata(31 downto 0) => slave_interconnect_M03_AXI_WDATA(31 downto 0),
      s_axi_wready => slave_interconnect_M03_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => slave_interconnect_M03_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => slave_interconnect_M03_AXI_WVALID,
      tx => CM1_PB_UART_UART_TxD
    );
INTERCONNECT_INN: entity work.c2cSlave_INTERCONNECT_INN_0
     port map (
      ACLK => AXI_CLK_1,
      ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_ACLK => clk40_1,
      M00_ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_AXI_araddr(31 downto 0) => INTERCONNECT_INN_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arprot(2 downto 0) => INTERCONNECT_INN_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => INTERCONNECT_INN_M00_AXI_ARREADY,
      M00_AXI_arvalid => INTERCONNECT_INN_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => INTERCONNECT_INN_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awprot(2 downto 0) => INTERCONNECT_INN_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => INTERCONNECT_INN_M00_AXI_AWREADY,
      M00_AXI_awvalid => INTERCONNECT_INN_M00_AXI_AWVALID,
      M00_AXI_bready => INTERCONNECT_INN_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => INTERCONNECT_INN_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => INTERCONNECT_INN_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => INTERCONNECT_INN_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => INTERCONNECT_INN_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => INTERCONNECT_INN_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => INTERCONNECT_INN_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => INTERCONNECT_INN_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => INTERCONNECT_INN_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => INTERCONNECT_INN_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => INTERCONNECT_INN_M00_AXI_WVALID,
      M01_ACLK => clk40_1,
      M01_ARESETN => sys_reseter_interconnect_aresetn(0),
      M01_AXI_araddr(31 downto 0) => INTERCONNECT_INN_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arprot(2 downto 0) => INTERCONNECT_INN_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready => INTERCONNECT_INN_M01_AXI_ARREADY,
      M01_AXI_arvalid => INTERCONNECT_INN_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => INTERCONNECT_INN_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awprot(2 downto 0) => INTERCONNECT_INN_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready => INTERCONNECT_INN_M01_AXI_AWREADY,
      M01_AXI_awvalid => INTERCONNECT_INN_M01_AXI_AWVALID,
      M01_AXI_bready => INTERCONNECT_INN_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => INTERCONNECT_INN_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => INTERCONNECT_INN_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => INTERCONNECT_INN_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => INTERCONNECT_INN_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => INTERCONNECT_INN_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => INTERCONNECT_INN_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => INTERCONNECT_INN_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => INTERCONNECT_INN_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => INTERCONNECT_INN_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => INTERCONNECT_INN_M01_AXI_WVALID,
      S00_ACLK => AXI_CLK_1,
      S00_ARESETN => sys_reseter_interconnect_aresetn(0),
      S00_AXI_araddr(31 downto 0) => slave_interconnect_M12_AXI_ARADDR(31 downto 0),
      S00_AXI_arprot(2 downto 0) => slave_interconnect_M12_AXI_ARPROT(2 downto 0),
      S00_AXI_arready(0) => slave_interconnect_M12_AXI_ARREADY(0),
      S00_AXI_arvalid(0) => slave_interconnect_M12_AXI_ARVALID(0),
      S00_AXI_awaddr(31 downto 0) => slave_interconnect_M12_AXI_AWADDR(31 downto 0),
      S00_AXI_awprot(2 downto 0) => slave_interconnect_M12_AXI_AWPROT(2 downto 0),
      S00_AXI_awready(0) => slave_interconnect_M12_AXI_AWREADY(0),
      S00_AXI_awvalid(0) => slave_interconnect_M12_AXI_AWVALID(0),
      S00_AXI_bready(0) => slave_interconnect_M12_AXI_BREADY(0),
      S00_AXI_bresp(1 downto 0) => slave_interconnect_M12_AXI_BRESP(1 downto 0),
      S00_AXI_bvalid(0) => slave_interconnect_M12_AXI_BVALID(0),
      S00_AXI_rdata(31 downto 0) => slave_interconnect_M12_AXI_RDATA(31 downto 0),
      S00_AXI_rready(0) => slave_interconnect_M12_AXI_RREADY(0),
      S00_AXI_rresp(1 downto 0) => slave_interconnect_M12_AXI_RRESP(1 downto 0),
      S00_AXI_rvalid(0) => slave_interconnect_M12_AXI_RVALID(0),
      S00_AXI_wdata(31 downto 0) => slave_interconnect_M12_AXI_WDATA(31 downto 0),
      S00_AXI_wready(0) => slave_interconnect_M12_AXI_WREADY(0),
      S00_AXI_wstrb(3 downto 0) => slave_interconnect_M12_AXI_WSTRB(3 downto 0),
      S00_AXI_wvalid(0) => slave_interconnect_M12_AXI_WVALID(0)
    );
INTERCONNECT_MID: entity work.c2cSlave_INTERCONNECT_MID_0
     port map (
      ACLK => AXI_CLK_1,
      ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_ACLK => clk40_1,
      M00_ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_AXI_araddr(31 downto 0) => INTERCONNECT_MID_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arprot(2 downto 0) => INTERCONNECT_MID_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => INTERCONNECT_MID_M00_AXI_ARREADY,
      M00_AXI_arvalid => INTERCONNECT_MID_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => INTERCONNECT_MID_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awprot(2 downto 0) => INTERCONNECT_MID_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => INTERCONNECT_MID_M00_AXI_AWREADY,
      M00_AXI_awvalid => INTERCONNECT_MID_M00_AXI_AWVALID,
      M00_AXI_bready => INTERCONNECT_MID_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => INTERCONNECT_MID_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => INTERCONNECT_MID_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => INTERCONNECT_MID_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => INTERCONNECT_MID_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => INTERCONNECT_MID_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => INTERCONNECT_MID_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => INTERCONNECT_MID_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => INTERCONNECT_MID_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => INTERCONNECT_MID_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => INTERCONNECT_MID_M00_AXI_WVALID,
      M01_ACLK => clk40_1,
      M01_ARESETN => sys_reseter_interconnect_aresetn(0),
      M01_AXI_araddr(31 downto 0) => INTERCONNECT_MID_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arprot(2 downto 0) => INTERCONNECT_MID_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready => INTERCONNECT_MID_M01_AXI_ARREADY,
      M01_AXI_arvalid => INTERCONNECT_MID_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => INTERCONNECT_MID_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awprot(2 downto 0) => INTERCONNECT_MID_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready => INTERCONNECT_MID_M01_AXI_AWREADY,
      M01_AXI_awvalid => INTERCONNECT_MID_M01_AXI_AWVALID,
      M01_AXI_bready => INTERCONNECT_MID_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => INTERCONNECT_MID_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => INTERCONNECT_MID_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => INTERCONNECT_MID_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => INTERCONNECT_MID_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => INTERCONNECT_MID_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => INTERCONNECT_MID_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => INTERCONNECT_MID_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => INTERCONNECT_MID_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => INTERCONNECT_MID_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => INTERCONNECT_MID_M01_AXI_WVALID,
      S00_ACLK => AXI_CLK_1,
      S00_ARESETN => sys_reseter_interconnect_aresetn(0),
      S00_AXI_araddr(31 downto 0) => slave_interconnect_M13_AXI_ARADDR(31 downto 0),
      S00_AXI_arprot(2 downto 0) => slave_interconnect_M13_AXI_ARPROT(2 downto 0),
      S00_AXI_arready(0) => slave_interconnect_M13_AXI_ARREADY(0),
      S00_AXI_arvalid(0) => slave_interconnect_M13_AXI_ARVALID(0),
      S00_AXI_awaddr(31 downto 0) => slave_interconnect_M13_AXI_AWADDR(31 downto 0),
      S00_AXI_awprot(2 downto 0) => slave_interconnect_M13_AXI_AWPROT(2 downto 0),
      S00_AXI_awready(0) => slave_interconnect_M13_AXI_AWREADY(0),
      S00_AXI_awvalid(0) => slave_interconnect_M13_AXI_AWVALID(0),
      S00_AXI_bready(0) => slave_interconnect_M13_AXI_BREADY(0),
      S00_AXI_bresp(1 downto 0) => slave_interconnect_M13_AXI_BRESP(1 downto 0),
      S00_AXI_bvalid(0) => slave_interconnect_M13_AXI_BVALID(0),
      S00_AXI_rdata(31 downto 0) => slave_interconnect_M13_AXI_RDATA(31 downto 0),
      S00_AXI_rready(0) => slave_interconnect_M13_AXI_RREADY(0),
      S00_AXI_rresp(1 downto 0) => slave_interconnect_M13_AXI_RRESP(1 downto 0),
      S00_AXI_rvalid(0) => slave_interconnect_M13_AXI_RVALID(0),
      S00_AXI_wdata(31 downto 0) => slave_interconnect_M13_AXI_WDATA(31 downto 0),
      S00_AXI_wready(0) => slave_interconnect_M13_AXI_WREADY(0),
      S00_AXI_wstrb(3 downto 0) => slave_interconnect_M13_AXI_WSTRB(3 downto 0),
      S00_AXI_wvalid(0) => slave_interconnect_M13_AXI_WVALID(0)
    );
INTERCONNECT_OUT: entity work.c2cSlave_INTERCONNECT_OUT_0
     port map (
      ACLK => AXI_CLK_1,
      ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_ACLK => clk40_1,
      M00_ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_AXI_araddr(31 downto 0) => INTERCONNECT_OUT_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arprot(2 downto 0) => INTERCONNECT_OUT_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => INTERCONNECT_OUT_M00_AXI_ARREADY,
      M00_AXI_arvalid => INTERCONNECT_OUT_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => INTERCONNECT_OUT_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awprot(2 downto 0) => INTERCONNECT_OUT_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => INTERCONNECT_OUT_M00_AXI_AWREADY,
      M00_AXI_awvalid => INTERCONNECT_OUT_M00_AXI_AWVALID,
      M00_AXI_bready => INTERCONNECT_OUT_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => INTERCONNECT_OUT_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => INTERCONNECT_OUT_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => INTERCONNECT_OUT_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => INTERCONNECT_OUT_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => INTERCONNECT_OUT_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => INTERCONNECT_OUT_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => INTERCONNECT_OUT_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => INTERCONNECT_OUT_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => INTERCONNECT_OUT_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => INTERCONNECT_OUT_M00_AXI_WVALID,
      M01_ACLK => clk40_1,
      M01_ARESETN => sys_reseter_interconnect_aresetn(0),
      M01_AXI_araddr(31 downto 0) => INTERCONNECT_OUT_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arprot(2 downto 0) => INTERCONNECT_OUT_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready => INTERCONNECT_OUT_M01_AXI_ARREADY,
      M01_AXI_arvalid => INTERCONNECT_OUT_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => INTERCONNECT_OUT_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awprot(2 downto 0) => INTERCONNECT_OUT_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready => INTERCONNECT_OUT_M01_AXI_AWREADY,
      M01_AXI_awvalid => INTERCONNECT_OUT_M01_AXI_AWVALID,
      M01_AXI_bready => INTERCONNECT_OUT_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => INTERCONNECT_OUT_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => INTERCONNECT_OUT_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => INTERCONNECT_OUT_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => INTERCONNECT_OUT_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => INTERCONNECT_OUT_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => INTERCONNECT_OUT_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => INTERCONNECT_OUT_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => INTERCONNECT_OUT_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => INTERCONNECT_OUT_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => INTERCONNECT_OUT_M01_AXI_WVALID,
      S00_ACLK => AXI_CLK_1,
      S00_ARESETN => sys_reseter_interconnect_aresetn(0),
      S00_AXI_araddr(31 downto 0) => slave_interconnect_M14_AXI_ARADDR(31 downto 0),
      S00_AXI_arprot(2 downto 0) => slave_interconnect_M14_AXI_ARPROT(2 downto 0),
      S00_AXI_arready(0) => slave_interconnect_M14_AXI_ARREADY(0),
      S00_AXI_arvalid(0) => slave_interconnect_M14_AXI_ARVALID(0),
      S00_AXI_awaddr(31 downto 0) => slave_interconnect_M14_AXI_AWADDR(31 downto 0),
      S00_AXI_awprot(2 downto 0) => slave_interconnect_M14_AXI_AWPROT(2 downto 0),
      S00_AXI_awready(0) => slave_interconnect_M14_AXI_AWREADY(0),
      S00_AXI_awvalid(0) => slave_interconnect_M14_AXI_AWVALID(0),
      S00_AXI_bready(0) => slave_interconnect_M14_AXI_BREADY(0),
      S00_AXI_bresp(1 downto 0) => slave_interconnect_M14_AXI_BRESP(1 downto 0),
      S00_AXI_bvalid(0) => slave_interconnect_M14_AXI_BVALID(0),
      S00_AXI_rdata(31 downto 0) => slave_interconnect_M14_AXI_RDATA(31 downto 0),
      S00_AXI_rready(0) => slave_interconnect_M14_AXI_RREADY(0),
      S00_AXI_rresp(1 downto 0) => slave_interconnect_M14_AXI_RRESP(1 downto 0),
      S00_AXI_rvalid(0) => slave_interconnect_M14_AXI_RVALID(0),
      S00_AXI_wdata(31 downto 0) => slave_interconnect_M14_AXI_WDATA(31 downto 0),
      S00_AXI_wready(0) => slave_interconnect_M14_AXI_WREADY(0),
      S00_AXI_wstrb(3 downto 0) => slave_interconnect_M14_AXI_WSTRB(3 downto 0),
      S00_AXI_wvalid(0) => slave_interconnect_M14_AXI_WVALID(0)
    );
JTAG_AXI_Master: component c2cSlave_JTAG_AXI_Master_0
     port map (
      aclk => AXI_CLK_1,
      aresetn => sys_reseter_interconnect_aresetn(0),
      m_axi_araddr(31 downto 0) => JTAG_AXI_Master_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => JTAG_AXI_Master_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => JTAG_AXI_Master_M_AXI_ARCACHE(3 downto 0),
      m_axi_arid(0) => JTAG_AXI_Master_M_AXI_ARID(0),
      m_axi_arlen(7 downto 0) => JTAG_AXI_Master_M_AXI_ARLEN(7 downto 0),
      m_axi_arlock => JTAG_AXI_Master_M_AXI_ARLOCK,
      m_axi_arprot(2 downto 0) => JTAG_AXI_Master_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => JTAG_AXI_Master_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => JTAG_AXI_Master_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => JTAG_AXI_Master_M_AXI_ARSIZE(2 downto 0),
      m_axi_arvalid => JTAG_AXI_Master_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => JTAG_AXI_Master_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => JTAG_AXI_Master_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => JTAG_AXI_Master_M_AXI_AWCACHE(3 downto 0),
      m_axi_awid(0) => JTAG_AXI_Master_M_AXI_AWID(0),
      m_axi_awlen(7 downto 0) => JTAG_AXI_Master_M_AXI_AWLEN(7 downto 0),
      m_axi_awlock => JTAG_AXI_Master_M_AXI_AWLOCK,
      m_axi_awprot(2 downto 0) => JTAG_AXI_Master_M_AXI_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => JTAG_AXI_Master_M_AXI_AWQOS(3 downto 0),
      m_axi_awready => JTAG_AXI_Master_M_AXI_AWREADY,
      m_axi_awsize(2 downto 0) => JTAG_AXI_Master_M_AXI_AWSIZE(2 downto 0),
      m_axi_awvalid => JTAG_AXI_Master_M_AXI_AWVALID,
      m_axi_bid(0) => JTAG_AXI_Master_M_AXI_BID(0),
      m_axi_bready => JTAG_AXI_Master_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => JTAG_AXI_Master_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => JTAG_AXI_Master_M_AXI_BVALID,
      m_axi_rdata(31 downto 0) => JTAG_AXI_Master_M_AXI_RDATA(31 downto 0),
      m_axi_rid(0) => JTAG_AXI_Master_M_AXI_RID(0),
      m_axi_rlast => JTAG_AXI_Master_M_AXI_RLAST,
      m_axi_rready => JTAG_AXI_Master_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => JTAG_AXI_Master_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => JTAG_AXI_Master_M_AXI_RVALID,
      m_axi_wdata(31 downto 0) => JTAG_AXI_Master_M_AXI_WDATA(31 downto 0),
      m_axi_wlast => JTAG_AXI_Master_M_AXI_WLAST,
      m_axi_wready => JTAG_AXI_Master_M_AXI_WREADY,
      m_axi_wstrb(3 downto 0) => JTAG_AXI_Master_M_AXI_WSTRB(3 downto 0),
      m_axi_wvalid => JTAG_AXI_Master_M_AXI_WVALID
    );
KINTEX_SYS_MGMT: component c2cSlave_KINTEX_SYS_MGMT_0
     port map (
      alarm_out => KINTEX_SYS_MGMT_alarm_out,
      busy_out => NLW_KINTEX_SYS_MGMT_busy_out_UNCONNECTED,
      channel_out(5 downto 0) => NLW_KINTEX_SYS_MGMT_channel_out_UNCONNECTED(5 downto 0),
      eoc_out => NLW_KINTEX_SYS_MGMT_eoc_out_UNCONNECTED,
      eos_out => NLW_KINTEX_SYS_MGMT_eos_out_UNCONNECTED,
      ip2intc_irpt => NLW_KINTEX_SYS_MGMT_ip2intc_irpt_UNCONNECTED,
      ot_out => KINTEX_SYS_MGMT_ot_out,
      s_axi_aclk => AXI_CLK_1,
      s_axi_araddr(12 downto 0) => slave_interconnect_M00_AXI_ARADDR(12 downto 0),
      s_axi_aresetn => sys_reseter_interconnect_aresetn(0),
      s_axi_arready => slave_interconnect_M00_AXI_ARREADY,
      s_axi_arvalid => slave_interconnect_M00_AXI_ARVALID,
      s_axi_awaddr(12 downto 0) => slave_interconnect_M00_AXI_AWADDR(12 downto 0),
      s_axi_awready => slave_interconnect_M00_AXI_AWREADY,
      s_axi_awvalid => slave_interconnect_M00_AXI_AWVALID,
      s_axi_bready => slave_interconnect_M00_AXI_BREADY,
      s_axi_bresp(1 downto 0) => slave_interconnect_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => slave_interconnect_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => slave_interconnect_M00_AXI_RDATA(31 downto 0),
      s_axi_rready => slave_interconnect_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => slave_interconnect_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => slave_interconnect_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => slave_interconnect_M00_AXI_WDATA(31 downto 0),
      s_axi_wready => slave_interconnect_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => slave_interconnect_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => slave_interconnect_M00_AXI_WVALID,
      vccaux_alarm_out => KINTEX_SYS_MGMT_vccaux_alarm_out,
      vccint_alarm_out => KINTEX_SYS_MGMT_vccint_alarm_out,
      vn => '0',
      vp => '0'
    );
K_C2C: component c2cSlave_K_C2C_0
     port map (
      aurora_do_cc => K_C2C_aurora_do_cc1,
      aurora_init_clk => clk50Mhz_1,
      aurora_mmcm_not_locked => K_C2C_PHY_mmcm_not_locked_out1,
      aurora_pma_init_in => K_C2C_aurora_pma_init_in_1,
      aurora_pma_init_out => K_C2C_aurora_pma_init_out,
      aurora_reset_pb => K_C2C_aurora_reset_pb,
      axi_c2c_aurora_channel_up => K_C2C_PHY_channel_up1,
      axi_c2c_aurora_rx_tdata(63) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(0),
      axi_c2c_aurora_rx_tdata(62) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(1),
      axi_c2c_aurora_rx_tdata(61) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(2),
      axi_c2c_aurora_rx_tdata(60) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(3),
      axi_c2c_aurora_rx_tdata(59) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(4),
      axi_c2c_aurora_rx_tdata(58) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(5),
      axi_c2c_aurora_rx_tdata(57) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(6),
      axi_c2c_aurora_rx_tdata(56) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(7),
      axi_c2c_aurora_rx_tdata(55) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(8),
      axi_c2c_aurora_rx_tdata(54) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(9),
      axi_c2c_aurora_rx_tdata(53) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(10),
      axi_c2c_aurora_rx_tdata(52) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(11),
      axi_c2c_aurora_rx_tdata(51) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(12),
      axi_c2c_aurora_rx_tdata(50) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(13),
      axi_c2c_aurora_rx_tdata(49) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(14),
      axi_c2c_aurora_rx_tdata(48) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(15),
      axi_c2c_aurora_rx_tdata(47) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(16),
      axi_c2c_aurora_rx_tdata(46) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(17),
      axi_c2c_aurora_rx_tdata(45) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(18),
      axi_c2c_aurora_rx_tdata(44) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(19),
      axi_c2c_aurora_rx_tdata(43) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(20),
      axi_c2c_aurora_rx_tdata(42) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(21),
      axi_c2c_aurora_rx_tdata(41) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(22),
      axi_c2c_aurora_rx_tdata(40) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(23),
      axi_c2c_aurora_rx_tdata(39) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(24),
      axi_c2c_aurora_rx_tdata(38) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(25),
      axi_c2c_aurora_rx_tdata(37) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(26),
      axi_c2c_aurora_rx_tdata(36) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(27),
      axi_c2c_aurora_rx_tdata(35) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(28),
      axi_c2c_aurora_rx_tdata(34) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(29),
      axi_c2c_aurora_rx_tdata(33) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(30),
      axi_c2c_aurora_rx_tdata(32) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(31),
      axi_c2c_aurora_rx_tdata(31) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(32),
      axi_c2c_aurora_rx_tdata(30) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(33),
      axi_c2c_aurora_rx_tdata(29) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(34),
      axi_c2c_aurora_rx_tdata(28) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(35),
      axi_c2c_aurora_rx_tdata(27) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(36),
      axi_c2c_aurora_rx_tdata(26) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(37),
      axi_c2c_aurora_rx_tdata(25) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(38),
      axi_c2c_aurora_rx_tdata(24) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(39),
      axi_c2c_aurora_rx_tdata(23) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(40),
      axi_c2c_aurora_rx_tdata(22) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(41),
      axi_c2c_aurora_rx_tdata(21) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(42),
      axi_c2c_aurora_rx_tdata(20) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(43),
      axi_c2c_aurora_rx_tdata(19) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(44),
      axi_c2c_aurora_rx_tdata(18) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(45),
      axi_c2c_aurora_rx_tdata(17) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(46),
      axi_c2c_aurora_rx_tdata(16) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(47),
      axi_c2c_aurora_rx_tdata(15) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(48),
      axi_c2c_aurora_rx_tdata(14) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(49),
      axi_c2c_aurora_rx_tdata(13) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(50),
      axi_c2c_aurora_rx_tdata(12) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(51),
      axi_c2c_aurora_rx_tdata(11) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(52),
      axi_c2c_aurora_rx_tdata(10) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(53),
      axi_c2c_aurora_rx_tdata(9) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(54),
      axi_c2c_aurora_rx_tdata(8) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(55),
      axi_c2c_aurora_rx_tdata(7) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(56),
      axi_c2c_aurora_rx_tdata(6) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(57),
      axi_c2c_aurora_rx_tdata(5) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(58),
      axi_c2c_aurora_rx_tdata(4) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(59),
      axi_c2c_aurora_rx_tdata(3) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(60),
      axi_c2c_aurora_rx_tdata(2) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(61),
      axi_c2c_aurora_rx_tdata(1) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(62),
      axi_c2c_aurora_rx_tdata(0) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(63),
      axi_c2c_aurora_rx_tvalid => K_C2C_PHY_USER_DATA_M_AXIS_RX_TVALID,
      axi_c2c_aurora_tx_tdata(63 downto 0) => K_C2C_AXIS_TX_TDATA(63 downto 0),
      axi_c2c_aurora_tx_tready => K_C2C_AXIS_TX_TREADY,
      axi_c2c_aurora_tx_tvalid => K_C2C_AXIS_TX_TVALID,
      axi_c2c_config_error_out => K_C2C_axi_c2c_config_error_out1,
      axi_c2c_link_status_out => K_C2C_axi_c2c_link_status_out1,
      axi_c2c_m2s_intr_out(3 downto 0) => NLW_K_C2C_axi_c2c_m2s_intr_out_UNCONNECTED(3 downto 0),
      axi_c2c_multi_bit_error_out => K_C2C_axi_c2c_multi_bit_error_out1,
      axi_c2c_phy_clk => K_C2C_PHY_user_clk_out,
      axi_c2c_s2m_intr_in(3 downto 0) => B"0000",
      m_aclk => AXI_CLK_1,
      m_aresetn => sys_reseter_interconnect_aresetn(0),
      m_axi_araddr(31 downto 0) => K_C2C_m_axi_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => K_C2C_m_axi_ARBURST(1 downto 0),
      m_axi_arlen(7 downto 0) => K_C2C_m_axi_ARLEN(7 downto 0),
      m_axi_arready => K_C2C_m_axi_ARREADY,
      m_axi_arsize(2 downto 0) => K_C2C_m_axi_ARSIZE(2 downto 0),
      m_axi_arvalid => K_C2C_m_axi_ARVALID,
      m_axi_awaddr(31 downto 0) => K_C2C_m_axi_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => K_C2C_m_axi_AWBURST(1 downto 0),
      m_axi_awlen(7 downto 0) => K_C2C_m_axi_AWLEN(7 downto 0),
      m_axi_awready => K_C2C_m_axi_AWREADY,
      m_axi_awsize(2 downto 0) => K_C2C_m_axi_AWSIZE(2 downto 0),
      m_axi_awvalid => K_C2C_m_axi_AWVALID,
      m_axi_bready => K_C2C_m_axi_BREADY,
      m_axi_bresp(1 downto 0) => K_C2C_m_axi_BRESP(1 downto 0),
      m_axi_bvalid => K_C2C_m_axi_BVALID,
      m_axi_lite_aclk => AXI_CLK_1,
      m_axi_lite_araddr(31 downto 0) => NLW_K_C2C_m_axi_lite_araddr_UNCONNECTED(31 downto 0),
      m_axi_lite_arprot(1 downto 0) => NLW_K_C2C_m_axi_lite_arprot_UNCONNECTED(1 downto 0),
      m_axi_lite_arready => '0',
      m_axi_lite_arvalid => NLW_K_C2C_m_axi_lite_arvalid_UNCONNECTED,
      m_axi_lite_awaddr(31 downto 0) => NLW_K_C2C_m_axi_lite_awaddr_UNCONNECTED(31 downto 0),
      m_axi_lite_awprot(1 downto 0) => NLW_K_C2C_m_axi_lite_awprot_UNCONNECTED(1 downto 0),
      m_axi_lite_awready => '0',
      m_axi_lite_awvalid => NLW_K_C2C_m_axi_lite_awvalid_UNCONNECTED,
      m_axi_lite_bready => NLW_K_C2C_m_axi_lite_bready_UNCONNECTED,
      m_axi_lite_bresp(1 downto 0) => B"00",
      m_axi_lite_bvalid => '0',
      m_axi_lite_rdata(31 downto 0) => B"00000000000000000000000000000000",
      m_axi_lite_rready => NLW_K_C2C_m_axi_lite_rready_UNCONNECTED,
      m_axi_lite_rresp(1 downto 0) => B"00",
      m_axi_lite_rvalid => '0',
      m_axi_lite_wdata(31 downto 0) => NLW_K_C2C_m_axi_lite_wdata_UNCONNECTED(31 downto 0),
      m_axi_lite_wready => '0',
      m_axi_lite_wstrb(3 downto 0) => NLW_K_C2C_m_axi_lite_wstrb_UNCONNECTED(3 downto 0),
      m_axi_lite_wvalid => NLW_K_C2C_m_axi_lite_wvalid_UNCONNECTED,
      m_axi_rdata(31 downto 0) => K_C2C_m_axi_RDATA(31 downto 0),
      m_axi_rlast => K_C2C_m_axi_RLAST,
      m_axi_rready => K_C2C_m_axi_RREADY,
      m_axi_rresp(1 downto 0) => K_C2C_m_axi_RRESP(1 downto 0),
      m_axi_rvalid => K_C2C_m_axi_RVALID,
      m_axi_wdata(31 downto 0) => K_C2C_m_axi_WDATA(31 downto 0),
      m_axi_wlast => K_C2C_m_axi_WLAST,
      m_axi_wready => K_C2C_m_axi_WREADY,
      m_axi_wstrb(3 downto 0) => K_C2C_m_axi_WSTRB(3 downto 0),
      m_axi_wvalid => K_C2C_m_axi_WVALID
    );
K_C2CB: component c2cSlave_K_C2CB_0
     port map (
      aurora_do_cc => K_C2CB_aurora_do_cc1,
      aurora_init_clk => clk50Mhz_1,
      aurora_mmcm_not_locked => K_C2C_PHY_mmcm_not_locked_out1,
      aurora_pma_init_in => K_C2CB_aurora_pma_init_in_1,
      aurora_pma_init_out => K_C2CB_aurora_pma_init_out,
      aurora_reset_pb => K_C2CB_aurora_reset_pb,
      axi_c2c_aurora_channel_up => K_C2CB_PHY_channel_up1,
      axi_c2c_aurora_rx_tdata(63) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(0),
      axi_c2c_aurora_rx_tdata(62) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(1),
      axi_c2c_aurora_rx_tdata(61) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(2),
      axi_c2c_aurora_rx_tdata(60) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(3),
      axi_c2c_aurora_rx_tdata(59) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(4),
      axi_c2c_aurora_rx_tdata(58) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(5),
      axi_c2c_aurora_rx_tdata(57) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(6),
      axi_c2c_aurora_rx_tdata(56) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(7),
      axi_c2c_aurora_rx_tdata(55) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(8),
      axi_c2c_aurora_rx_tdata(54) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(9),
      axi_c2c_aurora_rx_tdata(53) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(10),
      axi_c2c_aurora_rx_tdata(52) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(11),
      axi_c2c_aurora_rx_tdata(51) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(12),
      axi_c2c_aurora_rx_tdata(50) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(13),
      axi_c2c_aurora_rx_tdata(49) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(14),
      axi_c2c_aurora_rx_tdata(48) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(15),
      axi_c2c_aurora_rx_tdata(47) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(16),
      axi_c2c_aurora_rx_tdata(46) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(17),
      axi_c2c_aurora_rx_tdata(45) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(18),
      axi_c2c_aurora_rx_tdata(44) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(19),
      axi_c2c_aurora_rx_tdata(43) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(20),
      axi_c2c_aurora_rx_tdata(42) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(21),
      axi_c2c_aurora_rx_tdata(41) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(22),
      axi_c2c_aurora_rx_tdata(40) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(23),
      axi_c2c_aurora_rx_tdata(39) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(24),
      axi_c2c_aurora_rx_tdata(38) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(25),
      axi_c2c_aurora_rx_tdata(37) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(26),
      axi_c2c_aurora_rx_tdata(36) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(27),
      axi_c2c_aurora_rx_tdata(35) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(28),
      axi_c2c_aurora_rx_tdata(34) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(29),
      axi_c2c_aurora_rx_tdata(33) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(30),
      axi_c2c_aurora_rx_tdata(32) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(31),
      axi_c2c_aurora_rx_tdata(31) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(32),
      axi_c2c_aurora_rx_tdata(30) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(33),
      axi_c2c_aurora_rx_tdata(29) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(34),
      axi_c2c_aurora_rx_tdata(28) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(35),
      axi_c2c_aurora_rx_tdata(27) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(36),
      axi_c2c_aurora_rx_tdata(26) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(37),
      axi_c2c_aurora_rx_tdata(25) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(38),
      axi_c2c_aurora_rx_tdata(24) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(39),
      axi_c2c_aurora_rx_tdata(23) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(40),
      axi_c2c_aurora_rx_tdata(22) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(41),
      axi_c2c_aurora_rx_tdata(21) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(42),
      axi_c2c_aurora_rx_tdata(20) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(43),
      axi_c2c_aurora_rx_tdata(19) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(44),
      axi_c2c_aurora_rx_tdata(18) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(45),
      axi_c2c_aurora_rx_tdata(17) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(46),
      axi_c2c_aurora_rx_tdata(16) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(47),
      axi_c2c_aurora_rx_tdata(15) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(48),
      axi_c2c_aurora_rx_tdata(14) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(49),
      axi_c2c_aurora_rx_tdata(13) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(50),
      axi_c2c_aurora_rx_tdata(12) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(51),
      axi_c2c_aurora_rx_tdata(11) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(52),
      axi_c2c_aurora_rx_tdata(10) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(53),
      axi_c2c_aurora_rx_tdata(9) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(54),
      axi_c2c_aurora_rx_tdata(8) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(55),
      axi_c2c_aurora_rx_tdata(7) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(56),
      axi_c2c_aurora_rx_tdata(6) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(57),
      axi_c2c_aurora_rx_tdata(5) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(58),
      axi_c2c_aurora_rx_tdata(4) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(59),
      axi_c2c_aurora_rx_tdata(3) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(60),
      axi_c2c_aurora_rx_tdata(2) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(61),
      axi_c2c_aurora_rx_tdata(1) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(62),
      axi_c2c_aurora_rx_tdata(0) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(63),
      axi_c2c_aurora_rx_tvalid => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TVALID,
      axi_c2c_aurora_tx_tdata(63 downto 0) => K_C2CB_AXIS_TX_TDATA(63 downto 0),
      axi_c2c_aurora_tx_tready => K_C2CB_AXIS_TX_TREADY,
      axi_c2c_aurora_tx_tvalid => K_C2CB_AXIS_TX_TVALID,
      axi_c2c_config_error_out => K_C2CB_axi_c2c_config_error_out1,
      axi_c2c_link_status_out => K_C2CB_axi_c2c_link_status_out1,
      axi_c2c_m2s_intr_out(3 downto 0) => NLW_K_C2CB_axi_c2c_m2s_intr_out_UNCONNECTED(3 downto 0),
      axi_c2c_multi_bit_error_out => K_C2CB_axi_c2c_multi_bit_error_out1,
      axi_c2c_phy_clk => K_C2C_PHY_user_clk_out,
      axi_c2c_s2m_intr_in(3) => CM1_PB_UART_interrupt,
      axi_c2c_s2m_intr_in(2) => CM1_PB_UART_interrupt,
      axi_c2c_s2m_intr_in(1) => CM1_PB_UART_interrupt,
      axi_c2c_s2m_intr_in(0) => CM1_PB_UART_interrupt,
      m_aclk => AXI_CLK_1,
      m_aresetn => sys_reseter_interconnect_aresetn(0),
      m_axi_araddr(31 downto 0) => NLW_K_C2CB_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_K_C2CB_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arlen(7 downto 0) => NLW_K_C2CB_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arready => '0',
      m_axi_arsize(2 downto 0) => NLW_K_C2CB_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_arvalid => NLW_K_C2CB_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_K_C2CB_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_K_C2CB_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awlen(7 downto 0) => NLW_K_C2CB_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awready => '0',
      m_axi_awsize(2 downto 0) => NLW_K_C2CB_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awvalid => NLW_K_C2CB_m_axi_awvalid_UNCONNECTED,
      m_axi_bready => NLW_K_C2CB_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_bvalid => '0',
      m_axi_lite_aclk => AXI_CLK_1,
      m_axi_lite_araddr(31 downto 0) => K_C2CB_m_axi_lite_ARADDR(31 downto 0),
      m_axi_lite_arprot(1 downto 0) => K_C2CB_m_axi_lite_ARPROT(1 downto 0),
      m_axi_lite_arready => K_C2CB_m_axi_lite_ARREADY(0),
      m_axi_lite_arvalid => K_C2CB_m_axi_lite_ARVALID,
      m_axi_lite_awaddr(31 downto 0) => K_C2CB_m_axi_lite_AWADDR(31 downto 0),
      m_axi_lite_awprot(1 downto 0) => K_C2CB_m_axi_lite_AWPROT(1 downto 0),
      m_axi_lite_awready => K_C2CB_m_axi_lite_AWREADY(0),
      m_axi_lite_awvalid => K_C2CB_m_axi_lite_AWVALID,
      m_axi_lite_bready => K_C2CB_m_axi_lite_BREADY,
      m_axi_lite_bresp(1 downto 0) => K_C2CB_m_axi_lite_BRESP(1 downto 0),
      m_axi_lite_bvalid => K_C2CB_m_axi_lite_BVALID(0),
      m_axi_lite_rdata(31 downto 0) => K_C2CB_m_axi_lite_RDATA(31 downto 0),
      m_axi_lite_rready => K_C2CB_m_axi_lite_RREADY,
      m_axi_lite_rresp(1 downto 0) => K_C2CB_m_axi_lite_RRESP(1 downto 0),
      m_axi_lite_rvalid => K_C2CB_m_axi_lite_RVALID(0),
      m_axi_lite_wdata(31 downto 0) => K_C2CB_m_axi_lite_WDATA(31 downto 0),
      m_axi_lite_wready => K_C2CB_m_axi_lite_WREADY(0),
      m_axi_lite_wstrb(3 downto 0) => K_C2CB_m_axi_lite_WSTRB(3 downto 0),
      m_axi_lite_wvalid => K_C2CB_m_axi_lite_WVALID,
      m_axi_rdata(31 downto 0) => B"00000000000000000000000000000000",
      m_axi_rlast => '0',
      m_axi_rready => NLW_K_C2CB_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_rvalid => '0',
      m_axi_wdata(31 downto 0) => NLW_K_C2CB_m_axi_wdata_UNCONNECTED(31 downto 0),
      m_axi_wlast => NLW_K_C2CB_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(3 downto 0) => NLW_K_C2CB_m_axi_wstrb_UNCONNECTED(3 downto 0),
      m_axi_wvalid => NLW_K_C2CB_m_axi_wvalid_UNCONNECTED
    );
K_C2CB_PHY: component c2cSlave_K_C2CB_PHY_0
     port map (
      bufg_gt_clr_out => NLW_K_C2CB_PHY_bufg_gt_clr_out_UNCONNECTED,
      channel_up => K_C2CB_PHY_channel_up1,
      gt0_drpaddr(9 downto 0) => K_C2CB_PHY_DRP_1_DADDR(9 downto 0),
      gt0_drpdi(15 downto 0) => K_C2CB_PHY_DRP_1_DI(15 downto 0),
      gt0_drpdo(15 downto 0) => K_C2CB_PHY_DRP_1_DO(15 downto 0),
      gt0_drpen => K_C2CB_PHY_DRP_1_DEN,
      gt0_drprdy => K_C2CB_PHY_DRP_1_DRDY,
      gt0_drpwe => K_C2CB_PHY_DRP_1_DWE,
      gt_cplllock(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_cplllock(0),
      gt_dmonitorout(15 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_dmonitorout(15 downto 0),
      gt_eyescandataerror(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescandataerror(0),
      gt_eyescanreset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescanreset(0),
      gt_eyescantrigger(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_eyescantrigger(0),
      gt_pcsrsvdin(15 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_pcsrsvdin(15 downto 0),
      gt_pll_lock => K_C2CB_PHY_gt_pll_lock1,
      gt_powergood(0) => NLW_K_C2CB_PHY_gt_powergood_UNCONNECTED(0),
      gt_qplllock(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_qplllock(0),
      gt_rxbufreset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxbufreset(0),
      gt_rxbufstatus(2 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxbufstatus(2 downto 0),
      gt_rxcdrhold(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxcdrhold(0),
      gt_rxcdrovrden_in => '0',
      gt_rxdfelpmreset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxdfelpmreset(0),
      gt_rxlpmen(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxlpmen(0),
      gt_rxpcsreset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpcsreset(0),
      gt_rxpmareset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpmareset(0),
      gt_rxpmaresetdone(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxpmaresetdone(0),
      gt_rxprbscntreset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbscntreset(0),
      gt_rxprbserr(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbserr(0),
      gt_rxprbssel(3 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxprbssel(3 downto 0),
      gt_rxrate(2 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxrate(2 downto 0),
      gt_rxresetdone(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_rxresetdone(0),
      gt_rxusrclk_out => NLW_K_C2CB_PHY_gt_rxusrclk_out_UNCONNECTED,
      gt_txbufstatus(1 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txbufstatus(1 downto 0),
      gt_txdiffctrl(4 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txdiffctrl(4 downto 0),
      gt_txinhibit(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txinhibit(0),
      gt_txpcsreset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txpcsreset(0),
      gt_txpmareset(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txpmareset(0),
      gt_txpolarity(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txpolarity(0),
      gt_txpostcursor(4 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txpostcursor(4 downto 0),
      gt_txprbsforceerr(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txprbsforceerr(0),
      gt_txprbssel(3 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txprbssel(3 downto 0),
      gt_txprecursor(4 downto 0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txprecursor(4 downto 0),
      gt_txresetdone(0) => K_C2CB_PHY_TRANSCEIVER_DEBUG_txresetdone(0),
      hard_err => K_C2CB_PHY_hard_err1,
      init_clk => clk50Mhz_1,
      lane_up(0) => K_C2CB_PHY_lane_up1(0),
      link_reset_out => K_C2CB_PHY_link_reset_out1,
      loopback(2 downto 0) => B"000",
      m_axi_rx_tdata(0 to 63) => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TDATA(0 to 63),
      m_axi_rx_tvalid => K_C2CB_PHY_USER_DATA_M_AXIS_RX_TVALID,
      mmcm_not_locked => '0',
      pma_init => K_C2CB_aurora_pma_init_out,
      power_down => K_C2CB_PHY_power_down_1,
      refclk1_in => K_C2C_PHY_gt_refclk1_out1,
      reset_pb => K_C2CB_aurora_reset_pb,
      rxn(0) => K_C2CB_PHY_Rx_1_RXN(0),
      rxp(0) => K_C2CB_PHY_Rx_1_RXP(0),
      s_axi_tx_tdata(0) => K_C2CB_AXIS_TX_TDATA(63),
      s_axi_tx_tdata(1) => K_C2CB_AXIS_TX_TDATA(62),
      s_axi_tx_tdata(2) => K_C2CB_AXIS_TX_TDATA(61),
      s_axi_tx_tdata(3) => K_C2CB_AXIS_TX_TDATA(60),
      s_axi_tx_tdata(4) => K_C2CB_AXIS_TX_TDATA(59),
      s_axi_tx_tdata(5) => K_C2CB_AXIS_TX_TDATA(58),
      s_axi_tx_tdata(6) => K_C2CB_AXIS_TX_TDATA(57),
      s_axi_tx_tdata(7) => K_C2CB_AXIS_TX_TDATA(56),
      s_axi_tx_tdata(8) => K_C2CB_AXIS_TX_TDATA(55),
      s_axi_tx_tdata(9) => K_C2CB_AXIS_TX_TDATA(54),
      s_axi_tx_tdata(10) => K_C2CB_AXIS_TX_TDATA(53),
      s_axi_tx_tdata(11) => K_C2CB_AXIS_TX_TDATA(52),
      s_axi_tx_tdata(12) => K_C2CB_AXIS_TX_TDATA(51),
      s_axi_tx_tdata(13) => K_C2CB_AXIS_TX_TDATA(50),
      s_axi_tx_tdata(14) => K_C2CB_AXIS_TX_TDATA(49),
      s_axi_tx_tdata(15) => K_C2CB_AXIS_TX_TDATA(48),
      s_axi_tx_tdata(16) => K_C2CB_AXIS_TX_TDATA(47),
      s_axi_tx_tdata(17) => K_C2CB_AXIS_TX_TDATA(46),
      s_axi_tx_tdata(18) => K_C2CB_AXIS_TX_TDATA(45),
      s_axi_tx_tdata(19) => K_C2CB_AXIS_TX_TDATA(44),
      s_axi_tx_tdata(20) => K_C2CB_AXIS_TX_TDATA(43),
      s_axi_tx_tdata(21) => K_C2CB_AXIS_TX_TDATA(42),
      s_axi_tx_tdata(22) => K_C2CB_AXIS_TX_TDATA(41),
      s_axi_tx_tdata(23) => K_C2CB_AXIS_TX_TDATA(40),
      s_axi_tx_tdata(24) => K_C2CB_AXIS_TX_TDATA(39),
      s_axi_tx_tdata(25) => K_C2CB_AXIS_TX_TDATA(38),
      s_axi_tx_tdata(26) => K_C2CB_AXIS_TX_TDATA(37),
      s_axi_tx_tdata(27) => K_C2CB_AXIS_TX_TDATA(36),
      s_axi_tx_tdata(28) => K_C2CB_AXIS_TX_TDATA(35),
      s_axi_tx_tdata(29) => K_C2CB_AXIS_TX_TDATA(34),
      s_axi_tx_tdata(30) => K_C2CB_AXIS_TX_TDATA(33),
      s_axi_tx_tdata(31) => K_C2CB_AXIS_TX_TDATA(32),
      s_axi_tx_tdata(32) => K_C2CB_AXIS_TX_TDATA(31),
      s_axi_tx_tdata(33) => K_C2CB_AXIS_TX_TDATA(30),
      s_axi_tx_tdata(34) => K_C2CB_AXIS_TX_TDATA(29),
      s_axi_tx_tdata(35) => K_C2CB_AXIS_TX_TDATA(28),
      s_axi_tx_tdata(36) => K_C2CB_AXIS_TX_TDATA(27),
      s_axi_tx_tdata(37) => K_C2CB_AXIS_TX_TDATA(26),
      s_axi_tx_tdata(38) => K_C2CB_AXIS_TX_TDATA(25),
      s_axi_tx_tdata(39) => K_C2CB_AXIS_TX_TDATA(24),
      s_axi_tx_tdata(40) => K_C2CB_AXIS_TX_TDATA(23),
      s_axi_tx_tdata(41) => K_C2CB_AXIS_TX_TDATA(22),
      s_axi_tx_tdata(42) => K_C2CB_AXIS_TX_TDATA(21),
      s_axi_tx_tdata(43) => K_C2CB_AXIS_TX_TDATA(20),
      s_axi_tx_tdata(44) => K_C2CB_AXIS_TX_TDATA(19),
      s_axi_tx_tdata(45) => K_C2CB_AXIS_TX_TDATA(18),
      s_axi_tx_tdata(46) => K_C2CB_AXIS_TX_TDATA(17),
      s_axi_tx_tdata(47) => K_C2CB_AXIS_TX_TDATA(16),
      s_axi_tx_tdata(48) => K_C2CB_AXIS_TX_TDATA(15),
      s_axi_tx_tdata(49) => K_C2CB_AXIS_TX_TDATA(14),
      s_axi_tx_tdata(50) => K_C2CB_AXIS_TX_TDATA(13),
      s_axi_tx_tdata(51) => K_C2CB_AXIS_TX_TDATA(12),
      s_axi_tx_tdata(52) => K_C2CB_AXIS_TX_TDATA(11),
      s_axi_tx_tdata(53) => K_C2CB_AXIS_TX_TDATA(10),
      s_axi_tx_tdata(54) => K_C2CB_AXIS_TX_TDATA(9),
      s_axi_tx_tdata(55) => K_C2CB_AXIS_TX_TDATA(8),
      s_axi_tx_tdata(56) => K_C2CB_AXIS_TX_TDATA(7),
      s_axi_tx_tdata(57) => K_C2CB_AXIS_TX_TDATA(6),
      s_axi_tx_tdata(58) => K_C2CB_AXIS_TX_TDATA(5),
      s_axi_tx_tdata(59) => K_C2CB_AXIS_TX_TDATA(4),
      s_axi_tx_tdata(60) => K_C2CB_AXIS_TX_TDATA(3),
      s_axi_tx_tdata(61) => K_C2CB_AXIS_TX_TDATA(2),
      s_axi_tx_tdata(62) => K_C2CB_AXIS_TX_TDATA(1),
      s_axi_tx_tdata(63) => K_C2CB_AXIS_TX_TDATA(0),
      s_axi_tx_tready => K_C2CB_AXIS_TX_TREADY,
      s_axi_tx_tvalid => K_C2CB_AXIS_TX_TVALID,
      soft_err => K_C2CB_PHY_soft_err1,
      sync_clk => K_C2C_PHY_sync_clk_out,
      sys_reset_out => NLW_K_C2CB_PHY_sys_reset_out_UNCONNECTED,
      tx_out_clk => NLW_K_C2CB_PHY_tx_out_clk_UNCONNECTED,
      txn(0) => K_C2CB_PHY_GT_SERIAL_TX_TXN(0),
      txp(0) => K_C2CB_PHY_GT_SERIAL_TX_TXP(0),
      user_clk => K_C2C_PHY_user_clk_out
    );
K_C2C_PHY: component c2cSlave_K_C2C_PHY_0
     port map (
      channel_up => K_C2C_PHY_channel_up1,
      gt0_drpaddr(9 downto 0) => K_C2C_PHY_DRP_1_DADDR(9 downto 0),
      gt0_drpdi(15 downto 0) => K_C2C_PHY_DRP_1_DI(15 downto 0),
      gt0_drpdo(15 downto 0) => K_C2C_PHY_DRP_1_DO(15 downto 0),
      gt0_drpen => K_C2C_PHY_DRP_1_DEN,
      gt0_drprdy => K_C2C_PHY_DRP_1_DRDY,
      gt0_drpwe => K_C2C_PHY_DRP_1_DWE,
      gt_cplllock(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_cplllock(0),
      gt_dmonitorout(15 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_dmonitorout(15 downto 0),
      gt_eyescandataerror(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_eyescandataerror(0),
      gt_eyescanreset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_eyescanreset(0),
      gt_eyescantrigger(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_eyescantrigger(0),
      gt_pcsrsvdin(15 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_pcsrsvdin(15 downto 0),
      gt_pll_lock => K_C2C_PHY_gt_pll_lock1,
      gt_powergood(0) => NLW_K_C2C_PHY_gt_powergood_UNCONNECTED(0),
      gt_qplllock(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_qplllock(0),
      gt_refclk1_n => K_C2C_PHY_refclk_1_CLK_N,
      gt_refclk1_out => K_C2C_PHY_gt_refclk1_out1,
      gt_refclk1_p => K_C2C_PHY_refclk_1_CLK_P,
      gt_reset_out => NLW_K_C2C_PHY_gt_reset_out_UNCONNECTED,
      gt_rxbufreset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxbufreset(0),
      gt_rxbufstatus(2 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxbufstatus(2 downto 0),
      gt_rxcdrhold(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxcdrhold(0),
      gt_rxcdrovrden_in => '0',
      gt_rxdfelpmreset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxdfelpmreset(0),
      gt_rxlpmen(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxlpmen(0),
      gt_rxpcsreset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxpcsreset(0),
      gt_rxpmareset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxpmareset(0),
      gt_rxpmaresetdone(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxpmaresetdone(0),
      gt_rxprbscntreset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbscntreset(0),
      gt_rxprbserr(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbserr(0),
      gt_rxprbssel(3 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxprbssel(3 downto 0),
      gt_rxrate(2 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxrate(2 downto 0),
      gt_rxresetdone(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_rxresetdone(0),
      gt_rxusrclk_out => NLW_K_C2C_PHY_gt_rxusrclk_out_UNCONNECTED,
      gt_txbufstatus(1 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txbufstatus(1 downto 0),
      gt_txdiffctrl(4 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txdiffctrl(4 downto 0),
      gt_txinhibit(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txinhibit(0),
      gt_txpcsreset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txpcsreset(0),
      gt_txpmareset(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txpmareset(0),
      gt_txpolarity(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txpolarity(0),
      gt_txpostcursor(4 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txpostcursor(4 downto 0),
      gt_txprbsforceerr(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txprbsforceerr(0),
      gt_txprbssel(3 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txprbssel(3 downto 0),
      gt_txprecursor(4 downto 0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txprecursor(4 downto 0),
      gt_txresetdone(0) => K_C2C_PHY_TRANSCEIVER_DEBUG_txresetdone(0),
      hard_err => K_C2C_PHY_hard_err1,
      init_clk => clk50Mhz_1,
      lane_up(0) => K_C2C_PHY_lane_up1(0),
      link_reset_out => K_C2C_PHY_link_reset_out1,
      loopback(2 downto 0) => B"000",
      m_axi_rx_tdata(0 to 63) => K_C2C_PHY_USER_DATA_M_AXIS_RX_TDATA(0 to 63),
      m_axi_rx_tvalid => K_C2C_PHY_USER_DATA_M_AXIS_RX_TVALID,
      mmcm_not_locked_out => K_C2C_PHY_mmcm_not_locked_out1,
      pma_init => K_C2C_aurora_pma_init_out,
      power_down => K_C2C_PHY_power_down_1,
      reset_pb => K_C2C_aurora_reset_pb,
      rxn(0) => K_C2C_PHY_Rx_1_RXN(0),
      rxp(0) => K_C2C_PHY_Rx_1_RXP(0),
      s_axi_tx_tdata(0) => K_C2C_AXIS_TX_TDATA(63),
      s_axi_tx_tdata(1) => K_C2C_AXIS_TX_TDATA(62),
      s_axi_tx_tdata(2) => K_C2C_AXIS_TX_TDATA(61),
      s_axi_tx_tdata(3) => K_C2C_AXIS_TX_TDATA(60),
      s_axi_tx_tdata(4) => K_C2C_AXIS_TX_TDATA(59),
      s_axi_tx_tdata(5) => K_C2C_AXIS_TX_TDATA(58),
      s_axi_tx_tdata(6) => K_C2C_AXIS_TX_TDATA(57),
      s_axi_tx_tdata(7) => K_C2C_AXIS_TX_TDATA(56),
      s_axi_tx_tdata(8) => K_C2C_AXIS_TX_TDATA(55),
      s_axi_tx_tdata(9) => K_C2C_AXIS_TX_TDATA(54),
      s_axi_tx_tdata(10) => K_C2C_AXIS_TX_TDATA(53),
      s_axi_tx_tdata(11) => K_C2C_AXIS_TX_TDATA(52),
      s_axi_tx_tdata(12) => K_C2C_AXIS_TX_TDATA(51),
      s_axi_tx_tdata(13) => K_C2C_AXIS_TX_TDATA(50),
      s_axi_tx_tdata(14) => K_C2C_AXIS_TX_TDATA(49),
      s_axi_tx_tdata(15) => K_C2C_AXIS_TX_TDATA(48),
      s_axi_tx_tdata(16) => K_C2C_AXIS_TX_TDATA(47),
      s_axi_tx_tdata(17) => K_C2C_AXIS_TX_TDATA(46),
      s_axi_tx_tdata(18) => K_C2C_AXIS_TX_TDATA(45),
      s_axi_tx_tdata(19) => K_C2C_AXIS_TX_TDATA(44),
      s_axi_tx_tdata(20) => K_C2C_AXIS_TX_TDATA(43),
      s_axi_tx_tdata(21) => K_C2C_AXIS_TX_TDATA(42),
      s_axi_tx_tdata(22) => K_C2C_AXIS_TX_TDATA(41),
      s_axi_tx_tdata(23) => K_C2C_AXIS_TX_TDATA(40),
      s_axi_tx_tdata(24) => K_C2C_AXIS_TX_TDATA(39),
      s_axi_tx_tdata(25) => K_C2C_AXIS_TX_TDATA(38),
      s_axi_tx_tdata(26) => K_C2C_AXIS_TX_TDATA(37),
      s_axi_tx_tdata(27) => K_C2C_AXIS_TX_TDATA(36),
      s_axi_tx_tdata(28) => K_C2C_AXIS_TX_TDATA(35),
      s_axi_tx_tdata(29) => K_C2C_AXIS_TX_TDATA(34),
      s_axi_tx_tdata(30) => K_C2C_AXIS_TX_TDATA(33),
      s_axi_tx_tdata(31) => K_C2C_AXIS_TX_TDATA(32),
      s_axi_tx_tdata(32) => K_C2C_AXIS_TX_TDATA(31),
      s_axi_tx_tdata(33) => K_C2C_AXIS_TX_TDATA(30),
      s_axi_tx_tdata(34) => K_C2C_AXIS_TX_TDATA(29),
      s_axi_tx_tdata(35) => K_C2C_AXIS_TX_TDATA(28),
      s_axi_tx_tdata(36) => K_C2C_AXIS_TX_TDATA(27),
      s_axi_tx_tdata(37) => K_C2C_AXIS_TX_TDATA(26),
      s_axi_tx_tdata(38) => K_C2C_AXIS_TX_TDATA(25),
      s_axi_tx_tdata(39) => K_C2C_AXIS_TX_TDATA(24),
      s_axi_tx_tdata(40) => K_C2C_AXIS_TX_TDATA(23),
      s_axi_tx_tdata(41) => K_C2C_AXIS_TX_TDATA(22),
      s_axi_tx_tdata(42) => K_C2C_AXIS_TX_TDATA(21),
      s_axi_tx_tdata(43) => K_C2C_AXIS_TX_TDATA(20),
      s_axi_tx_tdata(44) => K_C2C_AXIS_TX_TDATA(19),
      s_axi_tx_tdata(45) => K_C2C_AXIS_TX_TDATA(18),
      s_axi_tx_tdata(46) => K_C2C_AXIS_TX_TDATA(17),
      s_axi_tx_tdata(47) => K_C2C_AXIS_TX_TDATA(16),
      s_axi_tx_tdata(48) => K_C2C_AXIS_TX_TDATA(15),
      s_axi_tx_tdata(49) => K_C2C_AXIS_TX_TDATA(14),
      s_axi_tx_tdata(50) => K_C2C_AXIS_TX_TDATA(13),
      s_axi_tx_tdata(51) => K_C2C_AXIS_TX_TDATA(12),
      s_axi_tx_tdata(52) => K_C2C_AXIS_TX_TDATA(11),
      s_axi_tx_tdata(53) => K_C2C_AXIS_TX_TDATA(10),
      s_axi_tx_tdata(54) => K_C2C_AXIS_TX_TDATA(9),
      s_axi_tx_tdata(55) => K_C2C_AXIS_TX_TDATA(8),
      s_axi_tx_tdata(56) => K_C2C_AXIS_TX_TDATA(7),
      s_axi_tx_tdata(57) => K_C2C_AXIS_TX_TDATA(6),
      s_axi_tx_tdata(58) => K_C2C_AXIS_TX_TDATA(5),
      s_axi_tx_tdata(59) => K_C2C_AXIS_TX_TDATA(4),
      s_axi_tx_tdata(60) => K_C2C_AXIS_TX_TDATA(3),
      s_axi_tx_tdata(61) => K_C2C_AXIS_TX_TDATA(2),
      s_axi_tx_tdata(62) => K_C2C_AXIS_TX_TDATA(1),
      s_axi_tx_tdata(63) => K_C2C_AXIS_TX_TDATA(0),
      s_axi_tx_tready => K_C2C_AXIS_TX_TREADY,
      s_axi_tx_tvalid => K_C2C_AXIS_TX_TVALID,
      soft_err => K_C2C_PHY_soft_err1,
      sync_clk_out => K_C2C_PHY_sync_clk_out,
      sys_reset_out => NLW_K_C2C_PHY_sys_reset_out_UNCONNECTED,
      tx_out_clk => NLW_K_C2C_PHY_tx_out_clk_UNCONNECTED,
      txn(0) => K_C2C_PHY_GT_SERIAL_TX_TXN(0),
      txp(0) => K_C2C_PHY_GT_SERIAL_TX_TXP(0),
      user_clk_out => K_C2C_PHY_user_clk_out
    );
slave_interconnect: entity work.c2cSlave_slave_interconnect_0
     port map (
      ACLK => AXI_CLK_1,
      ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_ACLK => AXI_CLK_1,
      M00_ARESETN => sys_reseter_interconnect_aresetn(0),
      M00_AXI_araddr(31 downto 0) => slave_interconnect_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arready => slave_interconnect_M00_AXI_ARREADY,
      M00_AXI_arvalid => slave_interconnect_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => slave_interconnect_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awready => slave_interconnect_M00_AXI_AWREADY,
      M00_AXI_awvalid => slave_interconnect_M00_AXI_AWVALID,
      M00_AXI_bready => slave_interconnect_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => slave_interconnect_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => slave_interconnect_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => slave_interconnect_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => slave_interconnect_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => slave_interconnect_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => slave_interconnect_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => slave_interconnect_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => slave_interconnect_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => slave_interconnect_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => slave_interconnect_M00_AXI_WVALID,
      M01_ACLK => AXI_CLK_1,
      M01_ARESETN => sys_reseter_interconnect_aresetn(0),
      M01_AXI_araddr(31 downto 0) => slave_interconnect_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arprot(2 downto 0) => slave_interconnect_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready(0) => slave_interconnect_M01_AXI_ARREADY(0),
      M01_AXI_arvalid(0) => slave_interconnect_M01_AXI_ARVALID(0),
      M01_AXI_awaddr(31 downto 0) => slave_interconnect_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awprot(2 downto 0) => slave_interconnect_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready(0) => slave_interconnect_M01_AXI_AWREADY(0),
      M01_AXI_awvalid(0) => slave_interconnect_M01_AXI_AWVALID(0),
      M01_AXI_bready(0) => slave_interconnect_M01_AXI_BREADY(0),
      M01_AXI_bresp(1 downto 0) => slave_interconnect_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid(0) => slave_interconnect_M01_AXI_BVALID(0),
      M01_AXI_rdata(31 downto 0) => slave_interconnect_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready(0) => slave_interconnect_M01_AXI_RREADY(0),
      M01_AXI_rresp(1 downto 0) => slave_interconnect_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid(0) => slave_interconnect_M01_AXI_RVALID(0),
      M01_AXI_wdata(31 downto 0) => slave_interconnect_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready(0) => slave_interconnect_M01_AXI_WREADY(0),
      M01_AXI_wstrb(3 downto 0) => slave_interconnect_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid(0) => slave_interconnect_M01_AXI_WVALID(0),
      M02_ACLK => AXI_CLK_1,
      M02_ARESETN => sys_reseter_interconnect_aresetn(0),
      M02_AXI_araddr(31 downto 0) => slave_interconnect_M02_AXI_ARADDR(31 downto 0),
      M02_AXI_arprot(2 downto 0) => slave_interconnect_M02_AXI_ARPROT(2 downto 0),
      M02_AXI_arready(0) => slave_interconnect_M02_AXI_ARREADY(0),
      M02_AXI_arvalid(0) => slave_interconnect_M02_AXI_ARVALID(0),
      M02_AXI_awaddr(31 downto 0) => slave_interconnect_M02_AXI_AWADDR(31 downto 0),
      M02_AXI_awprot(2 downto 0) => slave_interconnect_M02_AXI_AWPROT(2 downto 0),
      M02_AXI_awready(0) => slave_interconnect_M02_AXI_AWREADY(0),
      M02_AXI_awvalid(0) => slave_interconnect_M02_AXI_AWVALID(0),
      M02_AXI_bready(0) => slave_interconnect_M02_AXI_BREADY(0),
      M02_AXI_bresp(1 downto 0) => slave_interconnect_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid(0) => slave_interconnect_M02_AXI_BVALID(0),
      M02_AXI_rdata(31 downto 0) => slave_interconnect_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready(0) => slave_interconnect_M02_AXI_RREADY(0),
      M02_AXI_rresp(1 downto 0) => slave_interconnect_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid(0) => slave_interconnect_M02_AXI_RVALID(0),
      M02_AXI_wdata(31 downto 0) => slave_interconnect_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready(0) => slave_interconnect_M02_AXI_WREADY(0),
      M02_AXI_wstrb(3 downto 0) => slave_interconnect_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid(0) => slave_interconnect_M02_AXI_WVALID(0),
      M03_ACLK => AXI_CLK_1,
      M03_ARESETN => sys_reseter_interconnect_aresetn(0),
      M03_AXI_araddr(31 downto 0) => slave_interconnect_M03_AXI_ARADDR(31 downto 0),
      M03_AXI_arready => slave_interconnect_M03_AXI_ARREADY,
      M03_AXI_arvalid => slave_interconnect_M03_AXI_ARVALID,
      M03_AXI_awaddr(31 downto 0) => slave_interconnect_M03_AXI_AWADDR(31 downto 0),
      M03_AXI_awready => slave_interconnect_M03_AXI_AWREADY,
      M03_AXI_awvalid => slave_interconnect_M03_AXI_AWVALID,
      M03_AXI_bready => slave_interconnect_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => slave_interconnect_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => slave_interconnect_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => slave_interconnect_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => slave_interconnect_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => slave_interconnect_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => slave_interconnect_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => slave_interconnect_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => slave_interconnect_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => slave_interconnect_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => slave_interconnect_M03_AXI_WVALID,
      M04_ACLK => AXI_CLK_1,
      M04_ARESETN => sys_reseter_interconnect_aresetn(0),
      M04_AXI_araddr(31 downto 0) => slave_interconnect_M04_AXI_ARADDR(31 downto 0),
      M04_AXI_arprot(2 downto 0) => slave_interconnect_M04_AXI_ARPROT(2 downto 0),
      M04_AXI_arready(0) => slave_interconnect_M04_AXI_ARREADY(0),
      M04_AXI_arvalid(0) => slave_interconnect_M04_AXI_ARVALID(0),
      M04_AXI_awaddr(31 downto 0) => slave_interconnect_M04_AXI_AWADDR(31 downto 0),
      M04_AXI_awprot(2 downto 0) => slave_interconnect_M04_AXI_AWPROT(2 downto 0),
      M04_AXI_awready(0) => slave_interconnect_M04_AXI_AWREADY(0),
      M04_AXI_awvalid(0) => slave_interconnect_M04_AXI_AWVALID(0),
      M04_AXI_bready(0) => slave_interconnect_M04_AXI_BREADY(0),
      M04_AXI_bresp(1 downto 0) => slave_interconnect_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid(0) => slave_interconnect_M04_AXI_BVALID(0),
      M04_AXI_rdata(31 downto 0) => slave_interconnect_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready(0) => slave_interconnect_M04_AXI_RREADY(0),
      M04_AXI_rresp(1 downto 0) => slave_interconnect_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid(0) => slave_interconnect_M04_AXI_RVALID(0),
      M04_AXI_wdata(31 downto 0) => slave_interconnect_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready(0) => slave_interconnect_M04_AXI_WREADY(0),
      M04_AXI_wstrb(3 downto 0) => slave_interconnect_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid(0) => slave_interconnect_M04_AXI_WVALID(0),
      M05_ACLK => clk40_1,
      M05_ARESETN => sys_reseter_interconnect_aresetn(0),
      M05_AXI_araddr(31 downto 0) => slave_interconnect_M05_AXI_ARADDR(31 downto 0),
      M05_AXI_arprot(2 downto 0) => slave_interconnect_M05_AXI_ARPROT(2 downto 0),
      M05_AXI_arready => slave_interconnect_M05_AXI_ARREADY,
      M05_AXI_arvalid => slave_interconnect_M05_AXI_ARVALID,
      M05_AXI_awaddr(31 downto 0) => slave_interconnect_M05_AXI_AWADDR(31 downto 0),
      M05_AXI_awprot(2 downto 0) => slave_interconnect_M05_AXI_AWPROT(2 downto 0),
      M05_AXI_awready => slave_interconnect_M05_AXI_AWREADY,
      M05_AXI_awvalid => slave_interconnect_M05_AXI_AWVALID,
      M05_AXI_bready => slave_interconnect_M05_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => slave_interconnect_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => slave_interconnect_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => slave_interconnect_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready => slave_interconnect_M05_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => slave_interconnect_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => slave_interconnect_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => slave_interconnect_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready => slave_interconnect_M05_AXI_WREADY,
      M05_AXI_wstrb(3 downto 0) => slave_interconnect_M05_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid => slave_interconnect_M05_AXI_WVALID,
      M06_ACLK => clk40_1,
      M06_ARESETN => sys_reseter_interconnect_aresetn(0),
      M06_AXI_araddr(31 downto 0) => slave_interconnect_M06_AXI_ARADDR(31 downto 0),
      M06_AXI_arprot(2 downto 0) => slave_interconnect_M06_AXI_ARPROT(2 downto 0),
      M06_AXI_arready => slave_interconnect_M06_AXI_ARREADY,
      M06_AXI_arvalid => slave_interconnect_M06_AXI_ARVALID,
      M06_AXI_awaddr(31 downto 0) => slave_interconnect_M06_AXI_AWADDR(31 downto 0),
      M06_AXI_awprot(2 downto 0) => slave_interconnect_M06_AXI_AWPROT(2 downto 0),
      M06_AXI_awready => slave_interconnect_M06_AXI_AWREADY,
      M06_AXI_awvalid => slave_interconnect_M06_AXI_AWVALID,
      M06_AXI_bready => slave_interconnect_M06_AXI_BREADY,
      M06_AXI_bresp(1 downto 0) => slave_interconnect_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid => slave_interconnect_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => slave_interconnect_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready => slave_interconnect_M06_AXI_RREADY,
      M06_AXI_rresp(1 downto 0) => slave_interconnect_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid => slave_interconnect_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => slave_interconnect_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready => slave_interconnect_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => slave_interconnect_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid => slave_interconnect_M06_AXI_WVALID,
      M07_ACLK => clk40_1,
      M07_ARESETN => sys_reseter_interconnect_aresetn(0),
      M07_AXI_araddr(31 downto 0) => slave_interconnect_M07_AXI_ARADDR(31 downto 0),
      M07_AXI_arprot(2 downto 0) => slave_interconnect_M07_AXI_ARPROT(2 downto 0),
      M07_AXI_arready => slave_interconnect_M07_AXI_ARREADY,
      M07_AXI_arvalid => slave_interconnect_M07_AXI_ARVALID,
      M07_AXI_awaddr(31 downto 0) => slave_interconnect_M07_AXI_AWADDR(31 downto 0),
      M07_AXI_awprot(2 downto 0) => slave_interconnect_M07_AXI_AWPROT(2 downto 0),
      M07_AXI_awready => slave_interconnect_M07_AXI_AWREADY,
      M07_AXI_awvalid => slave_interconnect_M07_AXI_AWVALID,
      M07_AXI_bready => slave_interconnect_M07_AXI_BREADY,
      M07_AXI_bresp(1 downto 0) => slave_interconnect_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid => slave_interconnect_M07_AXI_BVALID,
      M07_AXI_rdata(31 downto 0) => slave_interconnect_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready => slave_interconnect_M07_AXI_RREADY,
      M07_AXI_rresp(1 downto 0) => slave_interconnect_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid => slave_interconnect_M07_AXI_RVALID,
      M07_AXI_wdata(31 downto 0) => slave_interconnect_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready => slave_interconnect_M07_AXI_WREADY,
      M07_AXI_wstrb(3 downto 0) => slave_interconnect_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid => slave_interconnect_M07_AXI_WVALID,
      M08_ACLK => clk40_1,
      M08_ARESETN => sys_reseter_interconnect_aresetn(0),
      M08_AXI_araddr(31 downto 0) => slave_interconnect_M08_AXI_ARADDR(31 downto 0),
      M08_AXI_arprot(2 downto 0) => slave_interconnect_M08_AXI_ARPROT(2 downto 0),
      M08_AXI_arready => slave_interconnect_M08_AXI_ARREADY,
      M08_AXI_arvalid => slave_interconnect_M08_AXI_ARVALID,
      M08_AXI_awaddr(31 downto 0) => slave_interconnect_M08_AXI_AWADDR(31 downto 0),
      M08_AXI_awprot(2 downto 0) => slave_interconnect_M08_AXI_AWPROT(2 downto 0),
      M08_AXI_awready => slave_interconnect_M08_AXI_AWREADY,
      M08_AXI_awvalid => slave_interconnect_M08_AXI_AWVALID,
      M08_AXI_bready => slave_interconnect_M08_AXI_BREADY,
      M08_AXI_bresp(1 downto 0) => slave_interconnect_M08_AXI_BRESP(1 downto 0),
      M08_AXI_bvalid => slave_interconnect_M08_AXI_BVALID,
      M08_AXI_rdata(31 downto 0) => slave_interconnect_M08_AXI_RDATA(31 downto 0),
      M08_AXI_rready => slave_interconnect_M08_AXI_RREADY,
      M08_AXI_rresp(1 downto 0) => slave_interconnect_M08_AXI_RRESP(1 downto 0),
      M08_AXI_rvalid => slave_interconnect_M08_AXI_RVALID,
      M08_AXI_wdata(31 downto 0) => slave_interconnect_M08_AXI_WDATA(31 downto 0),
      M08_AXI_wready => slave_interconnect_M08_AXI_WREADY,
      M08_AXI_wstrb(3 downto 0) => slave_interconnect_M08_AXI_WSTRB(3 downto 0),
      M08_AXI_wvalid => slave_interconnect_M08_AXI_WVALID,
      M09_ACLK => clk40_1,
      M09_ARESETN => sys_reseter_interconnect_aresetn(0),
      M09_AXI_araddr(31 downto 0) => slave_interconnect_M09_AXI_ARADDR(31 downto 0),
      M09_AXI_arprot(2 downto 0) => slave_interconnect_M09_AXI_ARPROT(2 downto 0),
      M09_AXI_arready => slave_interconnect_M09_AXI_ARREADY,
      M09_AXI_arvalid => slave_interconnect_M09_AXI_ARVALID,
      M09_AXI_awaddr(31 downto 0) => slave_interconnect_M09_AXI_AWADDR(31 downto 0),
      M09_AXI_awprot(2 downto 0) => slave_interconnect_M09_AXI_AWPROT(2 downto 0),
      M09_AXI_awready => slave_interconnect_M09_AXI_AWREADY,
      M09_AXI_awvalid => slave_interconnect_M09_AXI_AWVALID,
      M09_AXI_bready => slave_interconnect_M09_AXI_BREADY,
      M09_AXI_bresp(1 downto 0) => slave_interconnect_M09_AXI_BRESP(1 downto 0),
      M09_AXI_bvalid => slave_interconnect_M09_AXI_BVALID,
      M09_AXI_rdata(31 downto 0) => slave_interconnect_M09_AXI_RDATA(31 downto 0),
      M09_AXI_rready => slave_interconnect_M09_AXI_RREADY,
      M09_AXI_rresp(1 downto 0) => slave_interconnect_M09_AXI_RRESP(1 downto 0),
      M09_AXI_rvalid => slave_interconnect_M09_AXI_RVALID,
      M09_AXI_wdata(31 downto 0) => slave_interconnect_M09_AXI_WDATA(31 downto 0),
      M09_AXI_wready => slave_interconnect_M09_AXI_WREADY,
      M09_AXI_wstrb(3 downto 0) => slave_interconnect_M09_AXI_WSTRB(3 downto 0),
      M09_AXI_wvalid => slave_interconnect_M09_AXI_WVALID,
      M10_ACLK => clk40_1,
      M10_ARESETN => sys_reseter_interconnect_aresetn(0),
      M10_AXI_araddr(31 downto 0) => slave_interconnect_M10_AXI_ARADDR(31 downto 0),
      M10_AXI_arprot(2 downto 0) => slave_interconnect_M10_AXI_ARPROT(2 downto 0),
      M10_AXI_arready => slave_interconnect_M10_AXI_ARREADY,
      M10_AXI_arvalid => slave_interconnect_M10_AXI_ARVALID,
      M10_AXI_awaddr(31 downto 0) => slave_interconnect_M10_AXI_AWADDR(31 downto 0),
      M10_AXI_awprot(2 downto 0) => slave_interconnect_M10_AXI_AWPROT(2 downto 0),
      M10_AXI_awready => slave_interconnect_M10_AXI_AWREADY,
      M10_AXI_awvalid => slave_interconnect_M10_AXI_AWVALID,
      M10_AXI_bready => slave_interconnect_M10_AXI_BREADY,
      M10_AXI_bresp(1 downto 0) => slave_interconnect_M10_AXI_BRESP(1 downto 0),
      M10_AXI_bvalid => slave_interconnect_M10_AXI_BVALID,
      M10_AXI_rdata(31 downto 0) => slave_interconnect_M10_AXI_RDATA(31 downto 0),
      M10_AXI_rready => slave_interconnect_M10_AXI_RREADY,
      M10_AXI_rresp(1 downto 0) => slave_interconnect_M10_AXI_RRESP(1 downto 0),
      M10_AXI_rvalid => slave_interconnect_M10_AXI_RVALID,
      M10_AXI_wdata(31 downto 0) => slave_interconnect_M10_AXI_WDATA(31 downto 0),
      M10_AXI_wready => slave_interconnect_M10_AXI_WREADY,
      M10_AXI_wstrb(3 downto 0) => slave_interconnect_M10_AXI_WSTRB(3 downto 0),
      M10_AXI_wvalid => slave_interconnect_M10_AXI_WVALID,
      M11_ACLK => clk40_1,
      M11_ARESETN => sys_reseter_interconnect_aresetn(0),
      M11_AXI_araddr(31 downto 0) => slave_interconnect_M11_AXI_ARADDR(31 downto 0),
      M11_AXI_arprot(2 downto 0) => slave_interconnect_M11_AXI_ARPROT(2 downto 0),
      M11_AXI_arready => slave_interconnect_M11_AXI_ARREADY,
      M11_AXI_arvalid => slave_interconnect_M11_AXI_ARVALID,
      M11_AXI_awaddr(31 downto 0) => slave_interconnect_M11_AXI_AWADDR(31 downto 0),
      M11_AXI_awprot(2 downto 0) => slave_interconnect_M11_AXI_AWPROT(2 downto 0),
      M11_AXI_awready => slave_interconnect_M11_AXI_AWREADY,
      M11_AXI_awvalid => slave_interconnect_M11_AXI_AWVALID,
      M11_AXI_bready => slave_interconnect_M11_AXI_BREADY,
      M11_AXI_bresp(1 downto 0) => slave_interconnect_M11_AXI_BRESP(1 downto 0),
      M11_AXI_bvalid => slave_interconnect_M11_AXI_BVALID,
      M11_AXI_rdata(31 downto 0) => slave_interconnect_M11_AXI_RDATA(31 downto 0),
      M11_AXI_rready => slave_interconnect_M11_AXI_RREADY,
      M11_AXI_rresp(1 downto 0) => slave_interconnect_M11_AXI_RRESP(1 downto 0),
      M11_AXI_rvalid => slave_interconnect_M11_AXI_RVALID,
      M11_AXI_wdata(31 downto 0) => slave_interconnect_M11_AXI_WDATA(31 downto 0),
      M11_AXI_wready => slave_interconnect_M11_AXI_WREADY,
      M11_AXI_wstrb(3 downto 0) => slave_interconnect_M11_AXI_WSTRB(3 downto 0),
      M11_AXI_wvalid => slave_interconnect_M11_AXI_WVALID,
      M12_ACLK => AXI_CLK_1,
      M12_ARESETN => sys_reseter_interconnect_aresetn(0),
      M12_AXI_araddr(31 downto 0) => slave_interconnect_M12_AXI_ARADDR(31 downto 0),
      M12_AXI_arprot(2 downto 0) => slave_interconnect_M12_AXI_ARPROT(2 downto 0),
      M12_AXI_arready(0) => slave_interconnect_M12_AXI_ARREADY(0),
      M12_AXI_arvalid(0) => slave_interconnect_M12_AXI_ARVALID(0),
      M12_AXI_awaddr(31 downto 0) => slave_interconnect_M12_AXI_AWADDR(31 downto 0),
      M12_AXI_awprot(2 downto 0) => slave_interconnect_M12_AXI_AWPROT(2 downto 0),
      M12_AXI_awready(0) => slave_interconnect_M12_AXI_AWREADY(0),
      M12_AXI_awvalid(0) => slave_interconnect_M12_AXI_AWVALID(0),
      M12_AXI_bready(0) => slave_interconnect_M12_AXI_BREADY(0),
      M12_AXI_bresp(1 downto 0) => slave_interconnect_M12_AXI_BRESP(1 downto 0),
      M12_AXI_bvalid(0) => slave_interconnect_M12_AXI_BVALID(0),
      M12_AXI_rdata(31 downto 0) => slave_interconnect_M12_AXI_RDATA(31 downto 0),
      M12_AXI_rready(0) => slave_interconnect_M12_AXI_RREADY(0),
      M12_AXI_rresp(1 downto 0) => slave_interconnect_M12_AXI_RRESP(1 downto 0),
      M12_AXI_rvalid(0) => slave_interconnect_M12_AXI_RVALID(0),
      M12_AXI_wdata(31 downto 0) => slave_interconnect_M12_AXI_WDATA(31 downto 0),
      M12_AXI_wready(0) => slave_interconnect_M12_AXI_WREADY(0),
      M12_AXI_wstrb(3 downto 0) => slave_interconnect_M12_AXI_WSTRB(3 downto 0),
      M12_AXI_wvalid(0) => slave_interconnect_M12_AXI_WVALID(0),
      M13_ACLK => AXI_CLK_1,
      M13_ARESETN => sys_reseter_interconnect_aresetn(0),
      M13_AXI_araddr(31 downto 0) => slave_interconnect_M13_AXI_ARADDR(31 downto 0),
      M13_AXI_arprot(2 downto 0) => slave_interconnect_M13_AXI_ARPROT(2 downto 0),
      M13_AXI_arready(0) => slave_interconnect_M13_AXI_ARREADY(0),
      M13_AXI_arvalid(0) => slave_interconnect_M13_AXI_ARVALID(0),
      M13_AXI_awaddr(31 downto 0) => slave_interconnect_M13_AXI_AWADDR(31 downto 0),
      M13_AXI_awprot(2 downto 0) => slave_interconnect_M13_AXI_AWPROT(2 downto 0),
      M13_AXI_awready(0) => slave_interconnect_M13_AXI_AWREADY(0),
      M13_AXI_awvalid(0) => slave_interconnect_M13_AXI_AWVALID(0),
      M13_AXI_bready(0) => slave_interconnect_M13_AXI_BREADY(0),
      M13_AXI_bresp(1 downto 0) => slave_interconnect_M13_AXI_BRESP(1 downto 0),
      M13_AXI_bvalid(0) => slave_interconnect_M13_AXI_BVALID(0),
      M13_AXI_rdata(31 downto 0) => slave_interconnect_M13_AXI_RDATA(31 downto 0),
      M13_AXI_rready(0) => slave_interconnect_M13_AXI_RREADY(0),
      M13_AXI_rresp(1 downto 0) => slave_interconnect_M13_AXI_RRESP(1 downto 0),
      M13_AXI_rvalid(0) => slave_interconnect_M13_AXI_RVALID(0),
      M13_AXI_wdata(31 downto 0) => slave_interconnect_M13_AXI_WDATA(31 downto 0),
      M13_AXI_wready(0) => slave_interconnect_M13_AXI_WREADY(0),
      M13_AXI_wstrb(3 downto 0) => slave_interconnect_M13_AXI_WSTRB(3 downto 0),
      M13_AXI_wvalid(0) => slave_interconnect_M13_AXI_WVALID(0),
      M14_ACLK => AXI_CLK_1,
      M14_ARESETN => sys_reseter_interconnect_aresetn(0),
      M14_AXI_araddr(31 downto 0) => slave_interconnect_M14_AXI_ARADDR(31 downto 0),
      M14_AXI_arprot(2 downto 0) => slave_interconnect_M14_AXI_ARPROT(2 downto 0),
      M14_AXI_arready(0) => slave_interconnect_M14_AXI_ARREADY(0),
      M14_AXI_arvalid(0) => slave_interconnect_M14_AXI_ARVALID(0),
      M14_AXI_awaddr(31 downto 0) => slave_interconnect_M14_AXI_AWADDR(31 downto 0),
      M14_AXI_awprot(2 downto 0) => slave_interconnect_M14_AXI_AWPROT(2 downto 0),
      M14_AXI_awready(0) => slave_interconnect_M14_AXI_AWREADY(0),
      M14_AXI_awvalid(0) => slave_interconnect_M14_AXI_AWVALID(0),
      M14_AXI_bready(0) => slave_interconnect_M14_AXI_BREADY(0),
      M14_AXI_bresp(1 downto 0) => slave_interconnect_M14_AXI_BRESP(1 downto 0),
      M14_AXI_bvalid(0) => slave_interconnect_M14_AXI_BVALID(0),
      M14_AXI_rdata(31 downto 0) => slave_interconnect_M14_AXI_RDATA(31 downto 0),
      M14_AXI_rready(0) => slave_interconnect_M14_AXI_RREADY(0),
      M14_AXI_rresp(1 downto 0) => slave_interconnect_M14_AXI_RRESP(1 downto 0),
      M14_AXI_rvalid(0) => slave_interconnect_M14_AXI_RVALID(0),
      M14_AXI_wdata(31 downto 0) => slave_interconnect_M14_AXI_WDATA(31 downto 0),
      M14_AXI_wready(0) => slave_interconnect_M14_AXI_WREADY(0),
      M14_AXI_wstrb(3 downto 0) => slave_interconnect_M14_AXI_WSTRB(3 downto 0),
      M14_AXI_wvalid(0) => slave_interconnect_M14_AXI_WVALID(0),
      S00_ACLK => AXI_CLK_1,
      S00_ARESETN => sys_reseter_interconnect_aresetn(0),
      S00_AXI_araddr(31 downto 0) => K_C2C_m_axi_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => K_C2C_m_axi_ARBURST(1 downto 0),
      S00_AXI_arlen(7 downto 0) => K_C2C_m_axi_ARLEN(7 downto 0),
      S00_AXI_arready => K_C2C_m_axi_ARREADY,
      S00_AXI_arsize(2 downto 0) => K_C2C_m_axi_ARSIZE(2 downto 0),
      S00_AXI_arvalid => K_C2C_m_axi_ARVALID,
      S00_AXI_awaddr(31 downto 0) => K_C2C_m_axi_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => K_C2C_m_axi_AWBURST(1 downto 0),
      S00_AXI_awlen(7 downto 0) => K_C2C_m_axi_AWLEN(7 downto 0),
      S00_AXI_awready => K_C2C_m_axi_AWREADY,
      S00_AXI_awsize(2 downto 0) => K_C2C_m_axi_AWSIZE(2 downto 0),
      S00_AXI_awvalid => K_C2C_m_axi_AWVALID,
      S00_AXI_bready => K_C2C_m_axi_BREADY,
      S00_AXI_bresp(1 downto 0) => K_C2C_m_axi_BRESP(1 downto 0),
      S00_AXI_bvalid => K_C2C_m_axi_BVALID,
      S00_AXI_rdata(31 downto 0) => K_C2C_m_axi_RDATA(31 downto 0),
      S00_AXI_rlast => K_C2C_m_axi_RLAST,
      S00_AXI_rready => K_C2C_m_axi_RREADY,
      S00_AXI_rresp(1 downto 0) => K_C2C_m_axi_RRESP(1 downto 0),
      S00_AXI_rvalid => K_C2C_m_axi_RVALID,
      S00_AXI_wdata(31 downto 0) => K_C2C_m_axi_WDATA(31 downto 0),
      S00_AXI_wlast => K_C2C_m_axi_WLAST,
      S00_AXI_wready => K_C2C_m_axi_WREADY,
      S00_AXI_wstrb(3 downto 0) => K_C2C_m_axi_WSTRB(3 downto 0),
      S00_AXI_wvalid => K_C2C_m_axi_WVALID,
      S01_ACLK => AXI_CLK_1,
      S01_ARESETN => sys_reseter_interconnect_aresetn(0),
      S01_AXI_araddr(31 downto 0) => K_C2CB_m_axi_lite_ARADDR(31 downto 0),
      S01_AXI_arprot(1 downto 0) => K_C2CB_m_axi_lite_ARPROT(1 downto 0),
      S01_AXI_arready(0) => K_C2CB_m_axi_lite_ARREADY(0),
      S01_AXI_arvalid(0) => K_C2CB_m_axi_lite_ARVALID,
      S01_AXI_awaddr(31 downto 0) => K_C2CB_m_axi_lite_AWADDR(31 downto 0),
      S01_AXI_awprot(1 downto 0) => K_C2CB_m_axi_lite_AWPROT(1 downto 0),
      S01_AXI_awready(0) => K_C2CB_m_axi_lite_AWREADY(0),
      S01_AXI_awvalid(0) => K_C2CB_m_axi_lite_AWVALID,
      S01_AXI_bready(0) => K_C2CB_m_axi_lite_BREADY,
      S01_AXI_bresp(1 downto 0) => K_C2CB_m_axi_lite_BRESP(1 downto 0),
      S01_AXI_bvalid(0) => K_C2CB_m_axi_lite_BVALID(0),
      S01_AXI_rdata(31 downto 0) => K_C2CB_m_axi_lite_RDATA(31 downto 0),
      S01_AXI_rready(0) => K_C2CB_m_axi_lite_RREADY,
      S01_AXI_rresp(1 downto 0) => K_C2CB_m_axi_lite_RRESP(1 downto 0),
      S01_AXI_rvalid(0) => K_C2CB_m_axi_lite_RVALID(0),
      S01_AXI_wdata(31 downto 0) => K_C2CB_m_axi_lite_WDATA(31 downto 0),
      S01_AXI_wready(0) => K_C2CB_m_axi_lite_WREADY(0),
      S01_AXI_wstrb(3 downto 0) => K_C2CB_m_axi_lite_WSTRB(3 downto 0),
      S01_AXI_wvalid(0) => K_C2CB_m_axi_lite_WVALID,
      S02_ACLK => AXI_CLK_1,
      S02_ARESETN => sys_reseter_interconnect_aresetn(0),
      S02_AXI_araddr(31 downto 0) => JTAG_AXI_Master_M_AXI_ARADDR(31 downto 0),
      S02_AXI_arburst(1 downto 0) => JTAG_AXI_Master_M_AXI_ARBURST(1 downto 0),
      S02_AXI_arcache(3 downto 0) => JTAG_AXI_Master_M_AXI_ARCACHE(3 downto 0),
      S02_AXI_arid(0) => JTAG_AXI_Master_M_AXI_ARID(0),
      S02_AXI_arlen(7 downto 0) => JTAG_AXI_Master_M_AXI_ARLEN(7 downto 0),
      S02_AXI_arlock(0) => JTAG_AXI_Master_M_AXI_ARLOCK,
      S02_AXI_arprot(2 downto 0) => JTAG_AXI_Master_M_AXI_ARPROT(2 downto 0),
      S02_AXI_arqos(3 downto 0) => JTAG_AXI_Master_M_AXI_ARQOS(3 downto 0),
      S02_AXI_arready => JTAG_AXI_Master_M_AXI_ARREADY,
      S02_AXI_arsize(2 downto 0) => JTAG_AXI_Master_M_AXI_ARSIZE(2 downto 0),
      S02_AXI_arvalid => JTAG_AXI_Master_M_AXI_ARVALID,
      S02_AXI_awaddr(31 downto 0) => JTAG_AXI_Master_M_AXI_AWADDR(31 downto 0),
      S02_AXI_awburst(1 downto 0) => JTAG_AXI_Master_M_AXI_AWBURST(1 downto 0),
      S02_AXI_awcache(3 downto 0) => JTAG_AXI_Master_M_AXI_AWCACHE(3 downto 0),
      S02_AXI_awid(0) => JTAG_AXI_Master_M_AXI_AWID(0),
      S02_AXI_awlen(7 downto 0) => JTAG_AXI_Master_M_AXI_AWLEN(7 downto 0),
      S02_AXI_awlock(0) => JTAG_AXI_Master_M_AXI_AWLOCK,
      S02_AXI_awprot(2 downto 0) => JTAG_AXI_Master_M_AXI_AWPROT(2 downto 0),
      S02_AXI_awqos(3 downto 0) => JTAG_AXI_Master_M_AXI_AWQOS(3 downto 0),
      S02_AXI_awready => JTAG_AXI_Master_M_AXI_AWREADY,
      S02_AXI_awsize(2 downto 0) => JTAG_AXI_Master_M_AXI_AWSIZE(2 downto 0),
      S02_AXI_awvalid => JTAG_AXI_Master_M_AXI_AWVALID,
      S02_AXI_bid(0) => JTAG_AXI_Master_M_AXI_BID(0),
      S02_AXI_bready => JTAG_AXI_Master_M_AXI_BREADY,
      S02_AXI_bresp(1 downto 0) => JTAG_AXI_Master_M_AXI_BRESP(1 downto 0),
      S02_AXI_bvalid => JTAG_AXI_Master_M_AXI_BVALID,
      S02_AXI_rdata(31 downto 0) => JTAG_AXI_Master_M_AXI_RDATA(31 downto 0),
      S02_AXI_rid(0) => JTAG_AXI_Master_M_AXI_RID(0),
      S02_AXI_rlast => JTAG_AXI_Master_M_AXI_RLAST,
      S02_AXI_rready => JTAG_AXI_Master_M_AXI_RREADY,
      S02_AXI_rresp(1 downto 0) => JTAG_AXI_Master_M_AXI_RRESP(1 downto 0),
      S02_AXI_rvalid => JTAG_AXI_Master_M_AXI_RVALID,
      S02_AXI_wdata(31 downto 0) => JTAG_AXI_Master_M_AXI_WDATA(31 downto 0),
      S02_AXI_wlast => JTAG_AXI_Master_M_AXI_WLAST,
      S02_AXI_wready => JTAG_AXI_Master_M_AXI_WREADY,
      S02_AXI_wstrb(3 downto 0) => JTAG_AXI_Master_M_AXI_WSTRB(3 downto 0),
      S02_AXI_wvalid => JTAG_AXI_Master_M_AXI_WVALID
    );
sys_reseter: component c2cSlave_sys_reseter_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_sys_reseter_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => reset_n_1,
      interconnect_aresetn(0) => sys_reseter_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_sys_reseter_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => NLW_sys_reseter_peripheral_aresetn_UNCONNECTED(0),
      peripheral_reset(0) => NLW_sys_reseter_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => AXI_CLK_1
    );
end STRUCTURE;
