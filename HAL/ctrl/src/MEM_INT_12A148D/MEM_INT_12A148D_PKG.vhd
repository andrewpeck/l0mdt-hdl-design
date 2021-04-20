--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-04-20 18:08:42.999161.
library IEEE;
use IEEE.std_logic_1164.all;

library shared_lib;
use shared_lib.common_ieee.all;


package MEM_INT_12A148D_CTRL is
  type MEM_INT_12A148D_wr_data_CTRL_t is record
    wr_data_0                  :std_logic_vector(31 downto 0);  -- Write Data 0
    wr_data_1                  :std_logic_vector(31 downto 0);  -- Write Data 1
    wr_data_2                  :std_logic_vector(31 downto 0);  -- Write Data 2
    wr_data_3                  :std_logic_vector(31 downto 0);  -- Write Data 3
    wr_data_4                  :std_logic_vector(19 downto 0);  -- Write Data 4
  end record MEM_INT_12A148D_wr_data_CTRL_t;


  constant DEFAULT_MEM_INT_12A148D_wr_data_CTRL_t : MEM_INT_12A148D_wr_data_CTRL_t := (
                                                                                       wr_data_2 => (others => '0'),
                                                                                       wr_data_3 => (others => '0'),
                                                                                       wr_data_0 => (others => '0'),
                                                                                       wr_data_1 => (others => '0'),
                                                                                       wr_data_4 => (others => '0')
                                                                                      );
  type MEM_INT_12A148D_rd_data_MON_t is record
    rd_data_0                  :std_logic_vector(31 downto 0);  -- Read Data 0
    rd_data_1                  :std_logic_vector(31 downto 0);  -- Read Data 1
    rd_data_2                  :std_logic_vector(31 downto 0);  -- Read Data 2
    rd_data_3                  :std_logic_vector(31 downto 0);  -- Read Data 3
    rd_data_4                  :std_logic_vector(19 downto 0);  -- Read Data 4
  end record MEM_INT_12A148D_rd_data_MON_t;


  type MEM_INT_12A148D_MON_t is record
    rd_rdy                     :std_logic;     -- Read ready
    rd_data                    :MEM_INT_12A148D_rd_data_MON_t;
  end record MEM_INT_12A148D_MON_t;


  type MEM_INT_12A148D_CTRL_t is record
    wr_req                     :std_logic;     -- Write request
    wr_ack                     :std_logic;     -- Write acknowledge
    rd_req                     :std_logic;     -- Read request
    rd_ack                     :std_logic;     -- Read Ack
    flush_req                  :std_logic;     -- flush memory to Zync
    wr_addr                    :std_logic_vector( 9 downto 0);  -- wr_Address
    rd_addr                    :std_logic_vector( 9 downto 0);  -- rd_Address
    wr_data                    :MEM_INT_12A148D_wr_data_CTRL_t;
  end record MEM_INT_12A148D_CTRL_t;


  constant DEFAULT_MEM_INT_12A148D_CTRL_t : MEM_INT_12A148D_CTRL_t := (
                                                                       flush_req => '0',
                                                                       wr_req => '0',
                                                                       wr_ack => '0',
                                                                       wr_addr => (others => '0'),
                                                                       rd_ack => '0',
                                                                       rd_req => '0',
                                                                       rd_addr => (others => '0'),
                                                                       wr_data => DEFAULT_MEM_INT_12A148D_wr_data_CTRL_t
                                                                      );


end package MEM_INT_12A148D_CTRL;