--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Mon Feb 27 09:26:58 2023
--Host        : atlas126a running 64-bit openSUSE Tumbleweed
--Command     : generate_target c2cSlave.bd
--Design      : c2cSlave
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
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
end m03_couplers_imp_1JC34VL;

architecture STRUCTURE of m03_couplers_imp_1JC34VL is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m03_couplers_to_m03_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m03_couplers_to_m03_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m03_couplers_to_m03_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m03_couplers_to_m03_couplers_AWVALID(0);
  M_AXI_bready(0) <= m03_couplers_to_m03_couplers_BREADY(0);
  M_AXI_rready(0) <= m03_couplers_to_m03_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m03_couplers_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m03_couplers_to_m03_couplers_WVALID(0);
  S_AXI_arready(0) <= m03_couplers_to_m03_couplers_ARREADY(0);
  S_AXI_awready(0) <= m03_couplers_to_m03_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m03_couplers_to_m03_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m03_couplers_to_m03_couplers_RVALID(0);
  S_AXI_wready(0) <= m03_couplers_to_m03_couplers_WREADY(0);
  m03_couplers_to_m03_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_m03_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m03_couplers_to_m03_couplers_ARREADY(0) <= M_AXI_arready(0);
  m03_couplers_to_m03_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m03_couplers_to_m03_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_m03_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m03_couplers_to_m03_couplers_AWREADY(0) <= M_AXI_awready(0);
  m03_couplers_to_m03_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m03_couplers_to_m03_couplers_BREADY(0) <= S_AXI_bready(0);
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY(0) <= S_AXI_rready(0);
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY(0) <= M_AXI_wready(0);
  m03_couplers_to_m03_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_m03_couplers_WVALID(0) <= S_AXI_wvalid(0);
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
end m04_couplers_imp_AM3X91;

architecture STRUCTURE of m04_couplers_imp_AM3X91 is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m04_couplers_to_m04_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m04_couplers_to_m04_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m04_couplers_to_m04_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m04_couplers_to_m04_couplers_AWVALID;
  M_AXI_bready <= m04_couplers_to_m04_couplers_BREADY;
  M_AXI_rready <= m04_couplers_to_m04_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m04_couplers_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m04_couplers_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m04_couplers_to_m04_couplers_WVALID;
  S_AXI_arready <= m04_couplers_to_m04_couplers_ARREADY;
  S_AXI_awready <= m04_couplers_to_m04_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_m04_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m04_couplers_to_m04_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_m04_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_m04_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m04_couplers_to_m04_couplers_RVALID;
  S_AXI_wready <= m04_couplers_to_m04_couplers_WREADY;
  m04_couplers_to_m04_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m04_couplers_to_m04_couplers_ARREADY <= M_AXI_arready;
  m04_couplers_to_m04_couplers_ARVALID <= S_AXI_arvalid;
  m04_couplers_to_m04_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m04_couplers_to_m04_couplers_AWREADY <= M_AXI_awready;
  m04_couplers_to_m04_couplers_AWVALID <= S_AXI_awvalid;
  m04_couplers_to_m04_couplers_BREADY <= S_AXI_bready;
  m04_couplers_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m04_couplers_to_m04_couplers_BVALID <= M_AXI_bvalid;
  m04_couplers_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m04_couplers_to_m04_couplers_RREADY <= S_AXI_rready;
  m04_couplers_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m04_couplers_to_m04_couplers_RVALID <= M_AXI_rvalid;
  m04_couplers_to_m04_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_m04_couplers_WREADY <= M_AXI_wready;
  m04_couplers_to_m04_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_m04_couplers_WVALID <= S_AXI_wvalid;
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
end m05_couplers_imp_1JSI4MS;

architecture STRUCTURE of m05_couplers_imp_1JSI4MS is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m05_couplers_to_m05_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m05_couplers_to_m05_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m05_couplers_to_m05_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m05_couplers_to_m05_couplers_AWVALID(0);
  M_AXI_bready(0) <= m05_couplers_to_m05_couplers_BREADY(0);
  M_AXI_rready(0) <= m05_couplers_to_m05_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m05_couplers_to_m05_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m05_couplers_to_m05_couplers_WVALID(0);
  S_AXI_arready(0) <= m05_couplers_to_m05_couplers_ARREADY(0);
  S_AXI_awready(0) <= m05_couplers_to_m05_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m05_couplers_to_m05_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m05_couplers_to_m05_couplers_RVALID(0);
  S_AXI_wready(0) <= m05_couplers_to_m05_couplers_WREADY(0);
  m05_couplers_to_m05_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m05_couplers_to_m05_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m05_couplers_to_m05_couplers_ARREADY(0) <= M_AXI_arready(0);
  m05_couplers_to_m05_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m05_couplers_to_m05_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m05_couplers_to_m05_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m05_couplers_to_m05_couplers_AWREADY(0) <= M_AXI_awready(0);
  m05_couplers_to_m05_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m05_couplers_to_m05_couplers_BREADY(0) <= S_AXI_bready(0);
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RREADY(0) <= S_AXI_rready(0);
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WREADY(0) <= M_AXI_wready(0);
  m05_couplers_to_m05_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m05_couplers_to_m05_couplers_WVALID(0) <= S_AXI_wvalid(0);
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
end m06_couplers_imp_9VFMHI;

architecture STRUCTURE of m06_couplers_imp_9VFMHI is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m06_couplers_to_m06_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m06_couplers_to_m06_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m06_couplers_to_m06_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m06_couplers_to_m06_couplers_AWVALID(0);
  M_AXI_bready(0) <= m06_couplers_to_m06_couplers_BREADY(0);
  M_AXI_rready(0) <= m06_couplers_to_m06_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m06_couplers_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m06_couplers_to_m06_couplers_WVALID(0);
  S_AXI_arready(0) <= m06_couplers_to_m06_couplers_ARREADY(0);
  S_AXI_awready(0) <= m06_couplers_to_m06_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m06_couplers_to_m06_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m06_couplers_to_m06_couplers_RVALID(0);
  S_AXI_wready(0) <= m06_couplers_to_m06_couplers_WREADY(0);
  m06_couplers_to_m06_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m06_couplers_to_m06_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m06_couplers_to_m06_couplers_ARREADY(0) <= M_AXI_arready(0);
  m06_couplers_to_m06_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m06_couplers_to_m06_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m06_couplers_to_m06_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m06_couplers_to_m06_couplers_AWREADY(0) <= M_AXI_awready(0);
  m06_couplers_to_m06_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m06_couplers_to_m06_couplers_BREADY(0) <= S_AXI_bready(0);
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RREADY(0) <= S_AXI_rready(0);
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WREADY(0) <= M_AXI_wready(0);
  m06_couplers_to_m06_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_m06_couplers_WVALID(0) <= S_AXI_wvalid(0);
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
end m07_couplers_imp_1KTHV1Z;

architecture STRUCTURE of m07_couplers_imp_1KTHV1Z is
  signal m07_couplers_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_m07_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_m07_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m07_couplers_to_m07_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m07_couplers_to_m07_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m07_couplers_to_m07_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m07_couplers_to_m07_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m07_couplers_to_m07_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m07_couplers_to_m07_couplers_AWVALID(0);
  M_AXI_bready(0) <= m07_couplers_to_m07_couplers_BREADY(0);
  M_AXI_rready(0) <= m07_couplers_to_m07_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m07_couplers_to_m07_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m07_couplers_to_m07_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m07_couplers_to_m07_couplers_WVALID(0);
  S_AXI_arready(0) <= m07_couplers_to_m07_couplers_ARREADY(0);
  S_AXI_awready(0) <= m07_couplers_to_m07_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m07_couplers_to_m07_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m07_couplers_to_m07_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m07_couplers_to_m07_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m07_couplers_to_m07_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m07_couplers_to_m07_couplers_RVALID(0);
  S_AXI_wready(0) <= m07_couplers_to_m07_couplers_WREADY(0);
  m07_couplers_to_m07_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m07_couplers_to_m07_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m07_couplers_to_m07_couplers_ARREADY(0) <= M_AXI_arready(0);
  m07_couplers_to_m07_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m07_couplers_to_m07_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m07_couplers_to_m07_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m07_couplers_to_m07_couplers_AWREADY(0) <= M_AXI_awready(0);
  m07_couplers_to_m07_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m07_couplers_to_m07_couplers_BREADY(0) <= S_AXI_bready(0);
  m07_couplers_to_m07_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m07_couplers_to_m07_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m07_couplers_to_m07_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m07_couplers_to_m07_couplers_RREADY(0) <= S_AXI_rready(0);
  m07_couplers_to_m07_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m07_couplers_to_m07_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m07_couplers_to_m07_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m07_couplers_to_m07_couplers_WREADY(0) <= M_AXI_wready(0);
  m07_couplers_to_m07_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m07_couplers_to_m07_couplers_WVALID(0) <= S_AXI_wvalid(0);
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
    M03_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC;
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC;
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_ACLK : in STD_LOGIC;
    M07_ARESETN : in STD_LOGIC;
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component c2cSlave_xbar_0;
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
  signal m03_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_ARREADY : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_ARVALID : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_AWREADY : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_AWVALID : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_BREADY : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_slave_interconnect_BVALID : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_RREADY : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_slave_interconnect_RVALID : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_slave_interconnect_WREADY : STD_LOGIC;
  signal m04_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_slave_interconnect_WVALID : STD_LOGIC;
  signal m05_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_slave_interconnect_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_slave_interconnect_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_slave_interconnect_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_slave_interconnect_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_slave_interconnect_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_slave_interconnect_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_slave_interconnect_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
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
  signal xbar_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 28 );
  signal xbar_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 14 downto 0 );
begin
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_slave_interconnect_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_slave_interconnect_AWVALID;
  M00_AXI_bready <= m00_couplers_to_slave_interconnect_BREADY;
  M00_AXI_rready <= m00_couplers_to_slave_interconnect_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_slave_interconnect_WVALID;
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
  M03_AXI_araddr(31 downto 0) <= m03_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M03_AXI_arprot(2 downto 0) <= m03_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M03_AXI_arvalid(0) <= m03_couplers_to_slave_interconnect_ARVALID(0);
  M03_AXI_awaddr(31 downto 0) <= m03_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M03_AXI_awprot(2 downto 0) <= m03_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M03_AXI_awvalid(0) <= m03_couplers_to_slave_interconnect_AWVALID(0);
  M03_AXI_bready(0) <= m03_couplers_to_slave_interconnect_BREADY(0);
  M03_AXI_rready(0) <= m03_couplers_to_slave_interconnect_RREADY(0);
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M03_AXI_wvalid(0) <= m03_couplers_to_slave_interconnect_WVALID(0);
  M04_AXI_araddr(31 downto 0) <= m04_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M04_AXI_arvalid <= m04_couplers_to_slave_interconnect_ARVALID;
  M04_AXI_awaddr(31 downto 0) <= m04_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M04_AXI_awvalid <= m04_couplers_to_slave_interconnect_AWVALID;
  M04_AXI_bready <= m04_couplers_to_slave_interconnect_BREADY;
  M04_AXI_rready <= m04_couplers_to_slave_interconnect_RREADY;
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M04_AXI_wvalid <= m04_couplers_to_slave_interconnect_WVALID;
  M05_AXI_araddr(31 downto 0) <= m05_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M05_AXI_arprot(2 downto 0) <= m05_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M05_AXI_arvalid(0) <= m05_couplers_to_slave_interconnect_ARVALID(0);
  M05_AXI_awaddr(31 downto 0) <= m05_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M05_AXI_awprot(2 downto 0) <= m05_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M05_AXI_awvalid(0) <= m05_couplers_to_slave_interconnect_AWVALID(0);
  M05_AXI_bready(0) <= m05_couplers_to_slave_interconnect_BREADY(0);
  M05_AXI_rready(0) <= m05_couplers_to_slave_interconnect_RREADY(0);
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= m05_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M05_AXI_wvalid(0) <= m05_couplers_to_slave_interconnect_WVALID(0);
  M06_AXI_araddr(31 downto 0) <= m06_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M06_AXI_arprot(2 downto 0) <= m06_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M06_AXI_arvalid(0) <= m06_couplers_to_slave_interconnect_ARVALID(0);
  M06_AXI_awaddr(31 downto 0) <= m06_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M06_AXI_awprot(2 downto 0) <= m06_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M06_AXI_awvalid(0) <= m06_couplers_to_slave_interconnect_AWVALID(0);
  M06_AXI_bready(0) <= m06_couplers_to_slave_interconnect_BREADY(0);
  M06_AXI_rready(0) <= m06_couplers_to_slave_interconnect_RREADY(0);
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M06_AXI_wvalid(0) <= m06_couplers_to_slave_interconnect_WVALID(0);
  M07_AXI_araddr(31 downto 0) <= m07_couplers_to_slave_interconnect_ARADDR(31 downto 0);
  M07_AXI_arprot(2 downto 0) <= m07_couplers_to_slave_interconnect_ARPROT(2 downto 0);
  M07_AXI_arvalid(0) <= m07_couplers_to_slave_interconnect_ARVALID(0);
  M07_AXI_awaddr(31 downto 0) <= m07_couplers_to_slave_interconnect_AWADDR(31 downto 0);
  M07_AXI_awprot(2 downto 0) <= m07_couplers_to_slave_interconnect_AWPROT(2 downto 0);
  M07_AXI_awvalid(0) <= m07_couplers_to_slave_interconnect_AWVALID(0);
  M07_AXI_bready(0) <= m07_couplers_to_slave_interconnect_BREADY(0);
  M07_AXI_rready(0) <= m07_couplers_to_slave_interconnect_RREADY(0);
  M07_AXI_wdata(31 downto 0) <= m07_couplers_to_slave_interconnect_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= m07_couplers_to_slave_interconnect_WSTRB(3 downto 0);
  M07_AXI_wvalid(0) <= m07_couplers_to_slave_interconnect_WVALID(0);
  S00_AXI_arready <= slave_interconnect_to_s00_couplers_ARREADY;
  S00_AXI_awready <= slave_interconnect_to_s00_couplers_AWREADY;
  S00_AXI_bresp(1 downto 0) <= slave_interconnect_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= slave_interconnect_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= slave_interconnect_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rlast <= slave_interconnect_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= slave_interconnect_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= slave_interconnect_to_s00_couplers_RVALID;
  S00_AXI_wready <= slave_interconnect_to_s00_couplers_WREADY;
  S01_AXI_arready(0) <= slave_interconnect_to_s01_couplers_ARREADY(0);
  S01_AXI_awready(0) <= slave_interconnect_to_s01_couplers_AWREADY(0);
  S01_AXI_bresp(1 downto 0) <= slave_interconnect_to_s01_couplers_BRESP(1 downto 0);
  S01_AXI_bvalid(0) <= slave_interconnect_to_s01_couplers_BVALID(0);
  S01_AXI_rdata(31 downto 0) <= slave_interconnect_to_s01_couplers_RDATA(31 downto 0);
  S01_AXI_rresp(1 downto 0) <= slave_interconnect_to_s01_couplers_RRESP(1 downto 0);
  S01_AXI_rvalid(0) <= slave_interconnect_to_s01_couplers_RVALID(0);
  S01_AXI_wready(0) <= slave_interconnect_to_s01_couplers_WREADY(0);
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
  m03_couplers_to_slave_interconnect_ARREADY(0) <= M03_AXI_arready(0);
  m03_couplers_to_slave_interconnect_AWREADY(0) <= M03_AXI_awready(0);
  m03_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_slave_interconnect_BVALID(0) <= M03_AXI_bvalid(0);
  m03_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_slave_interconnect_RVALID(0) <= M03_AXI_rvalid(0);
  m03_couplers_to_slave_interconnect_WREADY(0) <= M03_AXI_wready(0);
  m04_couplers_to_slave_interconnect_ARREADY <= M04_AXI_arready;
  m04_couplers_to_slave_interconnect_AWREADY <= M04_AXI_awready;
  m04_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_slave_interconnect_BVALID <= M04_AXI_bvalid;
  m04_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_slave_interconnect_RVALID <= M04_AXI_rvalid;
  m04_couplers_to_slave_interconnect_WREADY <= M04_AXI_wready;
  m05_couplers_to_slave_interconnect_ARREADY(0) <= M05_AXI_arready(0);
  m05_couplers_to_slave_interconnect_AWREADY(0) <= M05_AXI_awready(0);
  m05_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_slave_interconnect_BVALID(0) <= M05_AXI_bvalid(0);
  m05_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_slave_interconnect_RVALID(0) <= M05_AXI_rvalid(0);
  m05_couplers_to_slave_interconnect_WREADY(0) <= M05_AXI_wready(0);
  m06_couplers_to_slave_interconnect_ARREADY(0) <= M06_AXI_arready(0);
  m06_couplers_to_slave_interconnect_AWREADY(0) <= M06_AXI_awready(0);
  m06_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_slave_interconnect_BVALID(0) <= M06_AXI_bvalid(0);
  m06_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_slave_interconnect_RVALID(0) <= M06_AXI_rvalid(0);
  m06_couplers_to_slave_interconnect_WREADY(0) <= M06_AXI_wready(0);
  m07_couplers_to_slave_interconnect_ARREADY(0) <= M07_AXI_arready(0);
  m07_couplers_to_slave_interconnect_AWREADY(0) <= M07_AXI_awready(0);
  m07_couplers_to_slave_interconnect_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  m07_couplers_to_slave_interconnect_BVALID(0) <= M07_AXI_bvalid(0);
  m07_couplers_to_slave_interconnect_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  m07_couplers_to_slave_interconnect_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  m07_couplers_to_slave_interconnect_RVALID(0) <= M07_AXI_rvalid(0);
  m07_couplers_to_slave_interconnect_WREADY(0) <= M07_AXI_wready(0);
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
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
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
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
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
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
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
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m03_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m03_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m03_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m03_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m03_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m03_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m03_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m03_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m03_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m03_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m03_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m03_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m03_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m03_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m03_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m03_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m03_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m03_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arprot(2 downto 0) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      S_AXI_arready(0) => xbar_to_m03_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awprot(2 downto 0) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      S_AXI_awready(0) => xbar_to_m03_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready(0) => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m03_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m03_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready(0) => xbar_to_m03_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid(0) => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_AM3X91
     port map (
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m04_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arready => m04_couplers_to_slave_interconnect_ARREADY,
      M_AXI_arvalid => m04_couplers_to_slave_interconnect_ARVALID,
      M_AXI_awaddr(31 downto 0) => m04_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awready => m04_couplers_to_slave_interconnect_AWREADY,
      M_AXI_awvalid => m04_couplers_to_slave_interconnect_AWVALID,
      M_AXI_bready => m04_couplers_to_slave_interconnect_BREADY,
      M_AXI_bresp(1 downto 0) => m04_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid => m04_couplers_to_slave_interconnect_BVALID,
      M_AXI_rdata(31 downto 0) => m04_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready => m04_couplers_to_slave_interconnect_RREADY,
      M_AXI_rresp(1 downto 0) => m04_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid => m04_couplers_to_slave_interconnect_RVALID,
      M_AXI_wdata(31 downto 0) => m04_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready => m04_couplers_to_slave_interconnect_WREADY,
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid => m04_couplers_to_slave_interconnect_WVALID,
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      S_AXI_arready => xbar_to_m04_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(31 downto 0) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      S_AXI_awready => xbar_to_m04_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m04_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m04_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wready => xbar_to_m04_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_1JSI4MS
     port map (
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m05_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m05_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m05_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m05_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m05_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m05_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m05_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m05_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m05_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m05_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m05_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m05_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m05_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m05_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m05_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m05_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m05_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m05_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m05_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      S_AXI_arprot(2 downto 0) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      S_AXI_arready(0) => xbar_to_m05_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(31 downto 0) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      S_AXI_awprot(2 downto 0) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      S_AXI_awready(0) => xbar_to_m05_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready(0) => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m05_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m05_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready(0) => xbar_to_m05_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      S_AXI_wvalid(0) => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_9VFMHI
     port map (
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m06_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m06_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m06_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m06_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m06_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m06_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m06_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m06_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m06_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m06_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m06_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m06_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m06_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m06_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m06_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m06_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m06_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m06_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      S_AXI_arprot(2 downto 0) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      S_AXI_arready(0) => xbar_to_m06_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(31 downto 0) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      S_AXI_awprot(2 downto 0) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      S_AXI_awready(0) => xbar_to_m06_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready(0) => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m06_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m06_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready(0) => xbar_to_m06_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid(0) => xbar_to_m06_couplers_WVALID(6)
    );
m07_couplers: entity work.m07_couplers_imp_1KTHV1Z
     port map (
      M_ACLK => slave_interconnect_ACLK_net,
      M_ARESETN => slave_interconnect_ARESETN_net,
      M_AXI_araddr(31 downto 0) => m07_couplers_to_slave_interconnect_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m07_couplers_to_slave_interconnect_ARPROT(2 downto 0),
      M_AXI_arready(0) => m07_couplers_to_slave_interconnect_ARREADY(0),
      M_AXI_arvalid(0) => m07_couplers_to_slave_interconnect_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m07_couplers_to_slave_interconnect_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m07_couplers_to_slave_interconnect_AWPROT(2 downto 0),
      M_AXI_awready(0) => m07_couplers_to_slave_interconnect_AWREADY(0),
      M_AXI_awvalid(0) => m07_couplers_to_slave_interconnect_AWVALID(0),
      M_AXI_bready(0) => m07_couplers_to_slave_interconnect_BREADY(0),
      M_AXI_bresp(1 downto 0) => m07_couplers_to_slave_interconnect_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m07_couplers_to_slave_interconnect_BVALID(0),
      M_AXI_rdata(31 downto 0) => m07_couplers_to_slave_interconnect_RDATA(31 downto 0),
      M_AXI_rready(0) => m07_couplers_to_slave_interconnect_RREADY(0),
      M_AXI_rresp(1 downto 0) => m07_couplers_to_slave_interconnect_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m07_couplers_to_slave_interconnect_RVALID(0),
      M_AXI_wdata(31 downto 0) => m07_couplers_to_slave_interconnect_WDATA(31 downto 0),
      M_AXI_wready(0) => m07_couplers_to_slave_interconnect_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m07_couplers_to_slave_interconnect_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m07_couplers_to_slave_interconnect_WVALID(0),
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      S_AXI_arprot(2 downto 0) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      S_AXI_arready(0) => xbar_to_m07_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m07_couplers_ARVALID(7),
      S_AXI_awaddr(31 downto 0) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      S_AXI_awprot(2 downto 0) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      S_AXI_awready(0) => xbar_to_m07_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m07_couplers_AWVALID(7),
      S_AXI_bready(0) => xbar_to_m07_couplers_BREADY(7),
      S_AXI_bresp(1 downto 0) => xbar_to_m07_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m07_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m07_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m07_couplers_RREADY(7),
      S_AXI_rresp(1 downto 0) => xbar_to_m07_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m07_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m07_couplers_WDATA(255 downto 224),
      S_AXI_wready(0) => xbar_to_m07_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      S_AXI_wvalid(0) => xbar_to_m07_couplers_WVALID(7)
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
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
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
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
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
      S_ACLK => slave_interconnect_ACLK_net,
      S_ARESETN => slave_interconnect_ARESETN_net,
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
      m_axi_araddr(255 downto 224) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      m_axi_araddr(223 downto 192) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(23 downto 21) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      m_axi_arprot(20 downto 18) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      m_axi_arprot(17 downto 15) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      m_axi_arprot(14 downto 12) => NLW_xbar_m_axi_arprot_UNCONNECTED(14 downto 12),
      m_axi_arprot(11 downto 9) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => NLW_xbar_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready(7) => xbar_to_m07_couplers_ARREADY(0),
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY(0),
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY(0),
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY,
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY(0),
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY(0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY(0),
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(7) => xbar_to_m07_couplers_ARVALID(7),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(255 downto 224) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      m_axi_awaddr(223 downto 192) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(23 downto 21) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      m_axi_awprot(20 downto 18) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      m_axi_awprot(17 downto 15) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      m_axi_awprot(14 downto 12) => NLW_xbar_m_axi_awprot_UNCONNECTED(14 downto 12),
      m_axi_awprot(11 downto 9) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => NLW_xbar_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready(7) => xbar_to_m07_couplers_AWREADY(0),
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY(0),
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY(0),
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY,
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY(0),
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY(0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY(0),
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(7) => xbar_to_m07_couplers_AWVALID(7),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(7) => xbar_to_m07_couplers_BREADY(7),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(15 downto 14) => xbar_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(7) => xbar_to_m07_couplers_BVALID(0),
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID(0),
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID(0),
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID,
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID(0),
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID(0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID(0),
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(255 downto 224) => xbar_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(7) => xbar_to_m07_couplers_RREADY(7),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(15 downto 14) => xbar_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(7) => xbar_to_m07_couplers_RVALID(0),
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID(0),
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID(0),
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID,
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID(0),
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID(0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID(0),
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(255 downto 224) => xbar_to_m07_couplers_WDATA(255 downto 224),
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(7) => xbar_to_m07_couplers_WREADY(0),
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY(0),
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY(0),
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY,
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY(0),
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY(0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY(0),
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(31 downto 28) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
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
    FM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FM_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    HAL_CORE_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_CORE_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    clk50Mhz : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of c2cSlave : entity is "c2cSlave,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=c2cSlave,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=23,numReposBlks=11,numNonXlnxBlks=0,numHierBlks=12,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
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
  signal slave_interconnect_M03_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M03_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M03_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M03_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M03_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M03_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M03_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M03_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M03_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_ARREADY : STD_LOGIC;
  signal slave_interconnect_M04_AXI_ARVALID : STD_LOGIC;
  signal slave_interconnect_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_AWREADY : STD_LOGIC;
  signal slave_interconnect_M04_AXI_AWVALID : STD_LOGIC;
  signal slave_interconnect_M04_AXI_BREADY : STD_LOGIC;
  signal slave_interconnect_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M04_AXI_BVALID : STD_LOGIC;
  signal slave_interconnect_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_RREADY : STD_LOGIC;
  signal slave_interconnect_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M04_AXI_RVALID : STD_LOGIC;
  signal slave_interconnect_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M04_AXI_WREADY : STD_LOGIC;
  signal slave_interconnect_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M04_AXI_WVALID : STD_LOGIC;
  signal slave_interconnect_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M05_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M05_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M05_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M05_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M05_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M05_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M05_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M06_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M06_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M06_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M06_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M06_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M06_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M07_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal slave_interconnect_M07_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M07_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slave_interconnect_M07_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slave_interconnect_M07_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal slave_interconnect_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal slave_interconnect_M07_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
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
  attribute X_INTERFACE_PARAMETER of AXI_CLK : signal is "XIL_INTERFACENAME CLK.AXI_CLK, ASSOCIATED_BUSIF HAL:FW_INFO:FM:C2C_INTFS:HOG:HAL_CORE, CLK_DOMAIN c2cSlave_AXI_CLK, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of CM1_PB_UART_rxd : signal is "xilinx.com:interface:uart:1.0 CM1_PB_UART RxD";
  attribute X_INTERFACE_INFO of CM1_PB_UART_txd : signal is "xilinx.com:interface:uart:1.0 CM1_PB_UART TxD";
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
  attribute X_INTERFACE_INFO of FM_araddr : signal is "xilinx.com:interface:aximm:1.0 FM ARADDR";
  attribute X_INTERFACE_PARAMETER of FM_araddr : signal is "XIL_INTERFACENAME FM, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_AXI_CLK, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of FM_arprot : signal is "xilinx.com:interface:aximm:1.0 FM ARPROT";
  attribute X_INTERFACE_INFO of FM_arready : signal is "xilinx.com:interface:aximm:1.0 FM ARREADY";
  attribute X_INTERFACE_INFO of FM_arvalid : signal is "xilinx.com:interface:aximm:1.0 FM ARVALID";
  attribute X_INTERFACE_INFO of FM_awaddr : signal is "xilinx.com:interface:aximm:1.0 FM AWADDR";
  attribute X_INTERFACE_INFO of FM_awprot : signal is "xilinx.com:interface:aximm:1.0 FM AWPROT";
  attribute X_INTERFACE_INFO of FM_awready : signal is "xilinx.com:interface:aximm:1.0 FM AWREADY";
  attribute X_INTERFACE_INFO of FM_awvalid : signal is "xilinx.com:interface:aximm:1.0 FM AWVALID";
  attribute X_INTERFACE_INFO of FM_bready : signal is "xilinx.com:interface:aximm:1.0 FM BREADY";
  attribute X_INTERFACE_INFO of FM_bresp : signal is "xilinx.com:interface:aximm:1.0 FM BRESP";
  attribute X_INTERFACE_INFO of FM_bvalid : signal is "xilinx.com:interface:aximm:1.0 FM BVALID";
  attribute X_INTERFACE_INFO of FM_rdata : signal is "xilinx.com:interface:aximm:1.0 FM RDATA";
  attribute X_INTERFACE_INFO of FM_rready : signal is "xilinx.com:interface:aximm:1.0 FM RREADY";
  attribute X_INTERFACE_INFO of FM_rresp : signal is "xilinx.com:interface:aximm:1.0 FM RRESP";
  attribute X_INTERFACE_INFO of FM_rvalid : signal is "xilinx.com:interface:aximm:1.0 FM RVALID";
  attribute X_INTERFACE_INFO of FM_wdata : signal is "xilinx.com:interface:aximm:1.0 FM WDATA";
  attribute X_INTERFACE_INFO of FM_wready : signal is "xilinx.com:interface:aximm:1.0 FM WREADY";
  attribute X_INTERFACE_INFO of FM_wstrb : signal is "xilinx.com:interface:aximm:1.0 FM WSTRB";
  attribute X_INTERFACE_INFO of FM_wvalid : signal is "xilinx.com:interface:aximm:1.0 FM WVALID";
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
  attribute X_INTERFACE_INFO of HAL_CORE_araddr : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE ARADDR";
  attribute X_INTERFACE_PARAMETER of HAL_CORE_araddr : signal is "XIL_INTERFACENAME HAL_CORE, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_AXI_CLK, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of HAL_CORE_arprot : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE ARPROT";
  attribute X_INTERFACE_INFO of HAL_CORE_arready : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE ARREADY";
  attribute X_INTERFACE_INFO of HAL_CORE_arvalid : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE ARVALID";
  attribute X_INTERFACE_INFO of HAL_CORE_awaddr : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE AWADDR";
  attribute X_INTERFACE_INFO of HAL_CORE_awprot : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE AWPROT";
  attribute X_INTERFACE_INFO of HAL_CORE_awready : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE AWREADY";
  attribute X_INTERFACE_INFO of HAL_CORE_awvalid : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE AWVALID";
  attribute X_INTERFACE_INFO of HAL_CORE_bready : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE BREADY";
  attribute X_INTERFACE_INFO of HAL_CORE_bresp : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE BRESP";
  attribute X_INTERFACE_INFO of HAL_CORE_bvalid : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE BVALID";
  attribute X_INTERFACE_INFO of HAL_CORE_rdata : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE RDATA";
  attribute X_INTERFACE_INFO of HAL_CORE_rready : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE RREADY";
  attribute X_INTERFACE_INFO of HAL_CORE_rresp : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE RRESP";
  attribute X_INTERFACE_INFO of HAL_CORE_rvalid : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE RVALID";
  attribute X_INTERFACE_INFO of HAL_CORE_wdata : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE WDATA";
  attribute X_INTERFACE_INFO of HAL_CORE_wready : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE WREADY";
  attribute X_INTERFACE_INFO of HAL_CORE_wstrb : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE WSTRB";
  attribute X_INTERFACE_INFO of HAL_CORE_wvalid : signal is "xilinx.com:interface:aximm:1.0 HAL_CORE WVALID";
  attribute X_INTERFACE_INFO of HAL_araddr : signal is "xilinx.com:interface:aximm:1.0 HAL ARADDR";
  attribute X_INTERFACE_PARAMETER of HAL_araddr : signal is "XIL_INTERFACENAME HAL, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN c2cSlave_AXI_CLK, DATA_WIDTH 32, FREQ_HZ 50000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of HAL_arprot : signal is "xilinx.com:interface:aximm:1.0 HAL ARPROT";
  attribute X_INTERFACE_INFO of HAL_arready : signal is "xilinx.com:interface:aximm:1.0 HAL ARREADY";
  attribute X_INTERFACE_INFO of HAL_arvalid : signal is "xilinx.com:interface:aximm:1.0 HAL ARVALID";
  attribute X_INTERFACE_INFO of HAL_awaddr : signal is "xilinx.com:interface:aximm:1.0 HAL AWADDR";
  attribute X_INTERFACE_INFO of HAL_awprot : signal is "xilinx.com:interface:aximm:1.0 HAL AWPROT";
  attribute X_INTERFACE_INFO of HAL_awready : signal is "xilinx.com:interface:aximm:1.0 HAL AWREADY";
  attribute X_INTERFACE_INFO of HAL_awvalid : signal is "xilinx.com:interface:aximm:1.0 HAL AWVALID";
  attribute X_INTERFACE_INFO of HAL_bready : signal is "xilinx.com:interface:aximm:1.0 HAL BREADY";
  attribute X_INTERFACE_INFO of HAL_bresp : signal is "xilinx.com:interface:aximm:1.0 HAL BRESP";
  attribute X_INTERFACE_INFO of HAL_bvalid : signal is "xilinx.com:interface:aximm:1.0 HAL BVALID";
  attribute X_INTERFACE_INFO of HAL_rdata : signal is "xilinx.com:interface:aximm:1.0 HAL RDATA";
  attribute X_INTERFACE_INFO of HAL_rready : signal is "xilinx.com:interface:aximm:1.0 HAL RREADY";
  attribute X_INTERFACE_INFO of HAL_rresp : signal is "xilinx.com:interface:aximm:1.0 HAL RRESP";
  attribute X_INTERFACE_INFO of HAL_rvalid : signal is "xilinx.com:interface:aximm:1.0 HAL RVALID";
  attribute X_INTERFACE_INFO of HAL_wdata : signal is "xilinx.com:interface:aximm:1.0 HAL WDATA";
  attribute X_INTERFACE_INFO of HAL_wready : signal is "xilinx.com:interface:aximm:1.0 HAL WREADY";
  attribute X_INTERFACE_INFO of HAL_wstrb : signal is "xilinx.com:interface:aximm:1.0 HAL WSTRB";
  attribute X_INTERFACE_INFO of HAL_wvalid : signal is "xilinx.com:interface:aximm:1.0 HAL WVALID";
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
begin
  AXI_CLK_1 <= AXI_CLK;
  AXI_RST_N(0) <= sys_reseter_interconnect_aresetn(0);
  C2C_INTFS_araddr(31 downto 0) <= slave_interconnect_M03_AXI_ARADDR(31 downto 0);
  C2C_INTFS_arprot(2 downto 0) <= slave_interconnect_M03_AXI_ARPROT(2 downto 0);
  C2C_INTFS_arvalid(0) <= slave_interconnect_M03_AXI_ARVALID(0);
  C2C_INTFS_awaddr(31 downto 0) <= slave_interconnect_M03_AXI_AWADDR(31 downto 0);
  C2C_INTFS_awprot(2 downto 0) <= slave_interconnect_M03_AXI_AWPROT(2 downto 0);
  C2C_INTFS_awvalid(0) <= slave_interconnect_M03_AXI_AWVALID(0);
  C2C_INTFS_bready(0) <= slave_interconnect_M03_AXI_BREADY(0);
  C2C_INTFS_rready(0) <= slave_interconnect_M03_AXI_RREADY(0);
  C2C_INTFS_wdata(31 downto 0) <= slave_interconnect_M03_AXI_WDATA(31 downto 0);
  C2C_INTFS_wstrb(3 downto 0) <= slave_interconnect_M03_AXI_WSTRB(3 downto 0);
  C2C_INTFS_wvalid(0) <= slave_interconnect_M03_AXI_WVALID(0);
  CM1_PB_UART_UART_RxD <= CM1_PB_UART_rxd;
  CM1_PB_UART_txd <= CM1_PB_UART_UART_TxD;
  FM_araddr(31 downto 0) <= slave_interconnect_M02_AXI_ARADDR(31 downto 0);
  FM_arprot(2 downto 0) <= slave_interconnect_M02_AXI_ARPROT(2 downto 0);
  FM_arvalid(0) <= slave_interconnect_M02_AXI_ARVALID(0);
  FM_awaddr(31 downto 0) <= slave_interconnect_M02_AXI_AWADDR(31 downto 0);
  FM_awprot(2 downto 0) <= slave_interconnect_M02_AXI_AWPROT(2 downto 0);
  FM_awvalid(0) <= slave_interconnect_M02_AXI_AWVALID(0);
  FM_bready(0) <= slave_interconnect_M02_AXI_BREADY(0);
  FM_rready(0) <= slave_interconnect_M02_AXI_RREADY(0);
  FM_wdata(31 downto 0) <= slave_interconnect_M02_AXI_WDATA(31 downto 0);
  FM_wstrb(3 downto 0) <= slave_interconnect_M02_AXI_WSTRB(3 downto 0);
  FM_wvalid(0) <= slave_interconnect_M02_AXI_WVALID(0);
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
  HAL_CORE_araddr(31 downto 0) <= slave_interconnect_M06_AXI_ARADDR(31 downto 0);
  HAL_CORE_arprot(2 downto 0) <= slave_interconnect_M06_AXI_ARPROT(2 downto 0);
  HAL_CORE_arvalid(0) <= slave_interconnect_M06_AXI_ARVALID(0);
  HAL_CORE_awaddr(31 downto 0) <= slave_interconnect_M06_AXI_AWADDR(31 downto 0);
  HAL_CORE_awprot(2 downto 0) <= slave_interconnect_M06_AXI_AWPROT(2 downto 0);
  HAL_CORE_awvalid(0) <= slave_interconnect_M06_AXI_AWVALID(0);
  HAL_CORE_bready(0) <= slave_interconnect_M06_AXI_BREADY(0);
  HAL_CORE_rready(0) <= slave_interconnect_M06_AXI_RREADY(0);
  HAL_CORE_wdata(31 downto 0) <= slave_interconnect_M06_AXI_WDATA(31 downto 0);
  HAL_CORE_wstrb(3 downto 0) <= slave_interconnect_M06_AXI_WSTRB(3 downto 0);
  HAL_CORE_wvalid(0) <= slave_interconnect_M06_AXI_WVALID(0);
  HAL_araddr(31 downto 0) <= slave_interconnect_M07_AXI_ARADDR(31 downto 0);
  HAL_arprot(2 downto 0) <= slave_interconnect_M07_AXI_ARPROT(2 downto 0);
  HAL_arvalid(0) <= slave_interconnect_M07_AXI_ARVALID(0);
  HAL_awaddr(31 downto 0) <= slave_interconnect_M07_AXI_AWADDR(31 downto 0);
  HAL_awprot(2 downto 0) <= slave_interconnect_M07_AXI_AWPROT(2 downto 0);
  HAL_awvalid(0) <= slave_interconnect_M07_AXI_AWVALID(0);
  HAL_bready(0) <= slave_interconnect_M07_AXI_BREADY(0);
  HAL_rready(0) <= slave_interconnect_M07_AXI_RREADY(0);
  HAL_wdata(31 downto 0) <= slave_interconnect_M07_AXI_WDATA(31 downto 0);
  HAL_wstrb(3 downto 0) <= slave_interconnect_M07_AXI_WSTRB(3 downto 0);
  HAL_wvalid(0) <= slave_interconnect_M07_AXI_WVALID(0);
  HOG_araddr(31 downto 0) <= slave_interconnect_M05_AXI_ARADDR(31 downto 0);
  HOG_arprot(2 downto 0) <= slave_interconnect_M05_AXI_ARPROT(2 downto 0);
  HOG_arvalid(0) <= slave_interconnect_M05_AXI_ARVALID(0);
  HOG_awaddr(31 downto 0) <= slave_interconnect_M05_AXI_AWADDR(31 downto 0);
  HOG_awprot(2 downto 0) <= slave_interconnect_M05_AXI_AWPROT(2 downto 0);
  HOG_awvalid(0) <= slave_interconnect_M05_AXI_AWVALID(0);
  HOG_bready(0) <= slave_interconnect_M05_AXI_BREADY(0);
  HOG_rready(0) <= slave_interconnect_M05_AXI_RREADY(0);
  HOG_wdata(31 downto 0) <= slave_interconnect_M05_AXI_WDATA(31 downto 0);
  HOG_wstrb(3 downto 0) <= slave_interconnect_M05_AXI_WSTRB(3 downto 0);
  HOG_wvalid(0) <= slave_interconnect_M05_AXI_WVALID(0);
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
  slave_interconnect_M02_AXI_ARREADY(0) <= FM_arready(0);
  slave_interconnect_M02_AXI_AWREADY(0) <= FM_awready(0);
  slave_interconnect_M02_AXI_BRESP(1 downto 0) <= FM_bresp(1 downto 0);
  slave_interconnect_M02_AXI_BVALID(0) <= FM_bvalid(0);
  slave_interconnect_M02_AXI_RDATA(31 downto 0) <= FM_rdata(31 downto 0);
  slave_interconnect_M02_AXI_RRESP(1 downto 0) <= FM_rresp(1 downto 0);
  slave_interconnect_M02_AXI_RVALID(0) <= FM_rvalid(0);
  slave_interconnect_M02_AXI_WREADY(0) <= FM_wready(0);
  slave_interconnect_M03_AXI_ARREADY(0) <= C2C_INTFS_arready(0);
  slave_interconnect_M03_AXI_AWREADY(0) <= C2C_INTFS_awready(0);
  slave_interconnect_M03_AXI_BRESP(1 downto 0) <= C2C_INTFS_bresp(1 downto 0);
  slave_interconnect_M03_AXI_BVALID(0) <= C2C_INTFS_bvalid(0);
  slave_interconnect_M03_AXI_RDATA(31 downto 0) <= C2C_INTFS_rdata(31 downto 0);
  slave_interconnect_M03_AXI_RRESP(1 downto 0) <= C2C_INTFS_rresp(1 downto 0);
  slave_interconnect_M03_AXI_RVALID(0) <= C2C_INTFS_rvalid(0);
  slave_interconnect_M03_AXI_WREADY(0) <= C2C_INTFS_wready(0);
  slave_interconnect_M05_AXI_ARREADY(0) <= HOG_arready(0);
  slave_interconnect_M05_AXI_AWREADY(0) <= HOG_awready(0);
  slave_interconnect_M05_AXI_BRESP(1 downto 0) <= HOG_bresp(1 downto 0);
  slave_interconnect_M05_AXI_BVALID(0) <= HOG_bvalid(0);
  slave_interconnect_M05_AXI_RDATA(31 downto 0) <= HOG_rdata(31 downto 0);
  slave_interconnect_M05_AXI_RRESP(1 downto 0) <= HOG_rresp(1 downto 0);
  slave_interconnect_M05_AXI_RVALID(0) <= HOG_rvalid(0);
  slave_interconnect_M05_AXI_WREADY(0) <= HOG_wready(0);
  slave_interconnect_M06_AXI_ARREADY(0) <= HAL_CORE_arready(0);
  slave_interconnect_M06_AXI_AWREADY(0) <= HAL_CORE_awready(0);
  slave_interconnect_M06_AXI_BRESP(1 downto 0) <= HAL_CORE_bresp(1 downto 0);
  slave_interconnect_M06_AXI_BVALID(0) <= HAL_CORE_bvalid(0);
  slave_interconnect_M06_AXI_RDATA(31 downto 0) <= HAL_CORE_rdata(31 downto 0);
  slave_interconnect_M06_AXI_RRESP(1 downto 0) <= HAL_CORE_rresp(1 downto 0);
  slave_interconnect_M06_AXI_RVALID(0) <= HAL_CORE_rvalid(0);
  slave_interconnect_M06_AXI_WREADY(0) <= HAL_CORE_wready(0);
  slave_interconnect_M07_AXI_ARREADY(0) <= HAL_arready(0);
  slave_interconnect_M07_AXI_AWREADY(0) <= HAL_awready(0);
  slave_interconnect_M07_AXI_BRESP(1 downto 0) <= HAL_bresp(1 downto 0);
  slave_interconnect_M07_AXI_BVALID(0) <= HAL_bvalid(0);
  slave_interconnect_M07_AXI_RDATA(31 downto 0) <= HAL_rdata(31 downto 0);
  slave_interconnect_M07_AXI_RRESP(1 downto 0) <= HAL_rresp(1 downto 0);
  slave_interconnect_M07_AXI_RVALID(0) <= HAL_rvalid(0);
  slave_interconnect_M07_AXI_WREADY(0) <= HAL_wready(0);
CM1_PB_UART: component c2cSlave_CM1_PB_UART_0
     port map (
      interrupt => CM1_PB_UART_interrupt,
      rx => CM1_PB_UART_UART_RxD,
      s_axi_aclk => AXI_CLK_1,
      s_axi_araddr(3 downto 0) => slave_interconnect_M04_AXI_ARADDR(3 downto 0),
      s_axi_aresetn => sys_reseter_interconnect_aresetn(0),
      s_axi_arready => slave_interconnect_M04_AXI_ARREADY,
      s_axi_arvalid => slave_interconnect_M04_AXI_ARVALID,
      s_axi_awaddr(3 downto 0) => slave_interconnect_M04_AXI_AWADDR(3 downto 0),
      s_axi_awready => slave_interconnect_M04_AXI_AWREADY,
      s_axi_awvalid => slave_interconnect_M04_AXI_AWVALID,
      s_axi_bready => slave_interconnect_M04_AXI_BREADY,
      s_axi_bresp(1 downto 0) => slave_interconnect_M04_AXI_BRESP(1 downto 0),
      s_axi_bvalid => slave_interconnect_M04_AXI_BVALID,
      s_axi_rdata(31 downto 0) => slave_interconnect_M04_AXI_RDATA(31 downto 0),
      s_axi_rready => slave_interconnect_M04_AXI_RREADY,
      s_axi_rresp(1 downto 0) => slave_interconnect_M04_AXI_RRESP(1 downto 0),
      s_axi_rvalid => slave_interconnect_M04_AXI_RVALID,
      s_axi_wdata(31 downto 0) => slave_interconnect_M04_AXI_WDATA(31 downto 0),
      s_axi_wready => slave_interconnect_M04_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => slave_interconnect_M04_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => slave_interconnect_M04_AXI_WVALID,
      tx => CM1_PB_UART_UART_TxD
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
      M03_AXI_arprot(2 downto 0) => slave_interconnect_M03_AXI_ARPROT(2 downto 0),
      M03_AXI_arready(0) => slave_interconnect_M03_AXI_ARREADY(0),
      M03_AXI_arvalid(0) => slave_interconnect_M03_AXI_ARVALID(0),
      M03_AXI_awaddr(31 downto 0) => slave_interconnect_M03_AXI_AWADDR(31 downto 0),
      M03_AXI_awprot(2 downto 0) => slave_interconnect_M03_AXI_AWPROT(2 downto 0),
      M03_AXI_awready(0) => slave_interconnect_M03_AXI_AWREADY(0),
      M03_AXI_awvalid(0) => slave_interconnect_M03_AXI_AWVALID(0),
      M03_AXI_bready(0) => slave_interconnect_M03_AXI_BREADY(0),
      M03_AXI_bresp(1 downto 0) => slave_interconnect_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid(0) => slave_interconnect_M03_AXI_BVALID(0),
      M03_AXI_rdata(31 downto 0) => slave_interconnect_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready(0) => slave_interconnect_M03_AXI_RREADY(0),
      M03_AXI_rresp(1 downto 0) => slave_interconnect_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid(0) => slave_interconnect_M03_AXI_RVALID(0),
      M03_AXI_wdata(31 downto 0) => slave_interconnect_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready(0) => slave_interconnect_M03_AXI_WREADY(0),
      M03_AXI_wstrb(3 downto 0) => slave_interconnect_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid(0) => slave_interconnect_M03_AXI_WVALID(0),
      M04_ACLK => AXI_CLK_1,
      M04_ARESETN => sys_reseter_interconnect_aresetn(0),
      M04_AXI_araddr(31 downto 0) => slave_interconnect_M04_AXI_ARADDR(31 downto 0),
      M04_AXI_arready => slave_interconnect_M04_AXI_ARREADY,
      M04_AXI_arvalid => slave_interconnect_M04_AXI_ARVALID,
      M04_AXI_awaddr(31 downto 0) => slave_interconnect_M04_AXI_AWADDR(31 downto 0),
      M04_AXI_awready => slave_interconnect_M04_AXI_AWREADY,
      M04_AXI_awvalid => slave_interconnect_M04_AXI_AWVALID,
      M04_AXI_bready => slave_interconnect_M04_AXI_BREADY,
      M04_AXI_bresp(1 downto 0) => slave_interconnect_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid => slave_interconnect_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => slave_interconnect_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready => slave_interconnect_M04_AXI_RREADY,
      M04_AXI_rresp(1 downto 0) => slave_interconnect_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid => slave_interconnect_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => slave_interconnect_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready => slave_interconnect_M04_AXI_WREADY,
      M04_AXI_wstrb(3 downto 0) => slave_interconnect_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid => slave_interconnect_M04_AXI_WVALID,
      M05_ACLK => AXI_CLK_1,
      M05_ARESETN => sys_reseter_interconnect_aresetn(0),
      M05_AXI_araddr(31 downto 0) => slave_interconnect_M05_AXI_ARADDR(31 downto 0),
      M05_AXI_arprot(2 downto 0) => slave_interconnect_M05_AXI_ARPROT(2 downto 0),
      M05_AXI_arready(0) => slave_interconnect_M05_AXI_ARREADY(0),
      M05_AXI_arvalid(0) => slave_interconnect_M05_AXI_ARVALID(0),
      M05_AXI_awaddr(31 downto 0) => slave_interconnect_M05_AXI_AWADDR(31 downto 0),
      M05_AXI_awprot(2 downto 0) => slave_interconnect_M05_AXI_AWPROT(2 downto 0),
      M05_AXI_awready(0) => slave_interconnect_M05_AXI_AWREADY(0),
      M05_AXI_awvalid(0) => slave_interconnect_M05_AXI_AWVALID(0),
      M05_AXI_bready(0) => slave_interconnect_M05_AXI_BREADY(0),
      M05_AXI_bresp(1 downto 0) => slave_interconnect_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid(0) => slave_interconnect_M05_AXI_BVALID(0),
      M05_AXI_rdata(31 downto 0) => slave_interconnect_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready(0) => slave_interconnect_M05_AXI_RREADY(0),
      M05_AXI_rresp(1 downto 0) => slave_interconnect_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid(0) => slave_interconnect_M05_AXI_RVALID(0),
      M05_AXI_wdata(31 downto 0) => slave_interconnect_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready(0) => slave_interconnect_M05_AXI_WREADY(0),
      M05_AXI_wstrb(3 downto 0) => slave_interconnect_M05_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid(0) => slave_interconnect_M05_AXI_WVALID(0),
      M06_ACLK => AXI_CLK_1,
      M06_ARESETN => sys_reseter_interconnect_aresetn(0),
      M06_AXI_araddr(31 downto 0) => slave_interconnect_M06_AXI_ARADDR(31 downto 0),
      M06_AXI_arprot(2 downto 0) => slave_interconnect_M06_AXI_ARPROT(2 downto 0),
      M06_AXI_arready(0) => slave_interconnect_M06_AXI_ARREADY(0),
      M06_AXI_arvalid(0) => slave_interconnect_M06_AXI_ARVALID(0),
      M06_AXI_awaddr(31 downto 0) => slave_interconnect_M06_AXI_AWADDR(31 downto 0),
      M06_AXI_awprot(2 downto 0) => slave_interconnect_M06_AXI_AWPROT(2 downto 0),
      M06_AXI_awready(0) => slave_interconnect_M06_AXI_AWREADY(0),
      M06_AXI_awvalid(0) => slave_interconnect_M06_AXI_AWVALID(0),
      M06_AXI_bready(0) => slave_interconnect_M06_AXI_BREADY(0),
      M06_AXI_bresp(1 downto 0) => slave_interconnect_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid(0) => slave_interconnect_M06_AXI_BVALID(0),
      M06_AXI_rdata(31 downto 0) => slave_interconnect_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready(0) => slave_interconnect_M06_AXI_RREADY(0),
      M06_AXI_rresp(1 downto 0) => slave_interconnect_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid(0) => slave_interconnect_M06_AXI_RVALID(0),
      M06_AXI_wdata(31 downto 0) => slave_interconnect_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready(0) => slave_interconnect_M06_AXI_WREADY(0),
      M06_AXI_wstrb(3 downto 0) => slave_interconnect_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid(0) => slave_interconnect_M06_AXI_WVALID(0),
      M07_ACLK => AXI_CLK_1,
      M07_ARESETN => sys_reseter_interconnect_aresetn(0),
      M07_AXI_araddr(31 downto 0) => slave_interconnect_M07_AXI_ARADDR(31 downto 0),
      M07_AXI_arprot(2 downto 0) => slave_interconnect_M07_AXI_ARPROT(2 downto 0),
      M07_AXI_arready(0) => slave_interconnect_M07_AXI_ARREADY(0),
      M07_AXI_arvalid(0) => slave_interconnect_M07_AXI_ARVALID(0),
      M07_AXI_awaddr(31 downto 0) => slave_interconnect_M07_AXI_AWADDR(31 downto 0),
      M07_AXI_awprot(2 downto 0) => slave_interconnect_M07_AXI_AWPROT(2 downto 0),
      M07_AXI_awready(0) => slave_interconnect_M07_AXI_AWREADY(0),
      M07_AXI_awvalid(0) => slave_interconnect_M07_AXI_AWVALID(0),
      M07_AXI_bready(0) => slave_interconnect_M07_AXI_BREADY(0),
      M07_AXI_bresp(1 downto 0) => slave_interconnect_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid(0) => slave_interconnect_M07_AXI_BVALID(0),
      M07_AXI_rdata(31 downto 0) => slave_interconnect_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready(0) => slave_interconnect_M07_AXI_RREADY(0),
      M07_AXI_rresp(1 downto 0) => slave_interconnect_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid(0) => slave_interconnect_M07_AXI_RVALID(0),
      M07_AXI_wdata(31 downto 0) => slave_interconnect_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready(0) => slave_interconnect_M07_AXI_WREADY(0),
      M07_AXI_wstrb(3 downto 0) => slave_interconnect_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid(0) => slave_interconnect_M07_AXI_WVALID(0),
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
