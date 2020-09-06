library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;
library daq_lib;
use daq_lib.daq_user_defs_pkg.all;
use daq_lib.daq_devel_defs_pkg.all;

package daq_defs_pkg is

  type daq_sys_rt is record
    clk320 : std_logic;
    rst : std_logic;
  end record daq_sys_rt;
  constant DAQ_SYS_LEN : integer := 2;
  subtype daq_sys_rvt is std_logic_vector(DAQ_SYS_LEN-1 downto 0);
  function vectorify(x: daq_sys_rt) return daq_sys_rvt;
  function structify(x: daq_sys_rvt) return daq_sys_rt;
  function nullify(x: daq_sys_rt) return daq_sys_rt;

  subtype daq_evt_cntr_t is unsigned(32-1 downto 0);

  -- Fields required by swROD
  type daq_hdr_swrod_rt is record
    -- flag_0: example of flag from swROD
    flag_0 : std_logic_vector(8-1 downto 0);
    flag_1 : std_logic_vector(8-1 downto 0);
    flag_2 : std_logic_vector(16-1 downto 0);
    eventid : daq_evt_cntr_t;
  end record daq_hdr_swrod_rt;
  constant DAQ_HDR_SWROD_LEN : integer := 64;
  subtype daq_hdr_swrod_rvt is std_logic_vector(DAQ_HDR_SWROD_LEN-1 downto 0);
  function vectorify(x: daq_hdr_swrod_rt) return daq_hdr_swrod_rvt;
  function structify(x: daq_hdr_swrod_rvt) return daq_hdr_swrod_rt;
  function nullify(x: daq_hdr_swrod_rt) return daq_hdr_swrod_rt;

  type daq_hdr_extra_rt is record
    win_lower : bcid_t;
    daq_bcid : bcid_t;
    win_width : bcid_t;
    win_lower_ref : bcid_t;
    win_upper_ref : bcid_t;
  end record daq_hdr_extra_rt;
  constant DAQ_HDR_EXTRA_LEN : integer := 60;
  subtype daq_hdr_extra_rvt is std_logic_vector(DAQ_HDR_EXTRA_LEN-1 downto 0);
  function vectorify(x: daq_hdr_extra_rt) return daq_hdr_extra_rvt;
  function structify(x: daq_hdr_extra_rvt) return daq_hdr_extra_rt;
  function nullify(x: daq_hdr_extra_rt) return daq_hdr_extra_rt;

  type daq_hdr_rt is record
    swrod : daq_hdr_swrod_rt;
    extra : daq_hdr_extra_rt;
  end record daq_hdr_rt;
  constant DAQ_HDR_LEN : integer := 124;
  subtype daq_hdr_rvt is std_logic_vector(DAQ_HDR_LEN-1 downto 0);
  function vectorify(x: daq_hdr_rt) return daq_hdr_rvt;
  function structify(x: daq_hdr_rvt) return daq_hdr_rt;
  function nullify(x: daq_hdr_rt) return daq_hdr_rt;

  type stream_rt is record
    bcid : bcid_t;
    valid : std_logic;
    data : std_logic_vector(DEV_CELL_DATA_BUS_WIDTH-1 downto 0);
  end record stream_rt;
  constant STREAM_LEN : integer := 525;
  subtype stream_rvt is std_logic_vector(STREAM_LEN-1 downto 0);
  function vectorify(x: stream_rt) return stream_rvt;
  function structify(x: stream_rvt) return stream_rt;
  function nullify(x: stream_rt) return stream_rt;

  subtype f2e_data_t is std_logic_vector(DEV_F2E_OUTPUT_DATA_WIDTH-1 downto 0);

  type daq_stream_bus_at is array(DAQ_N_STREAMS-1 downto 0) of stream_rt;
  type daq_stream_bus_avt is array(DAQ_N_STREAMS-1 downto 0) of stream_rvt;
  function vectorify(x: daq_stream_bus_at) return daq_stream_bus_avt;
  function vectorify(x: daq_stream_bus_at) return std_logic_vector;
  function structify(x: daq_stream_bus_avt) return daq_stream_bus_at;
  function structify(x: std_logic_vector) return daq_stream_bus_at;
  function nullify(x: daq_stream_bus_at) return daq_stream_bus_at;
  function nullify(x: daq_stream_bus_avt) return daq_stream_bus_avt;

  type daq_output_payload_bus_at is array(DAQ_N_STREAMS-1 downto 0) of f2e_data_t;
  type daq_output_payload_bus_avt is array(DAQ_N_STREAMS-1 downto 0) of f2e_data_t;
  function vectorify(x: daq_output_payload_bus_at) return daq_output_payload_bus_avt;
  function vectorify(x: daq_output_payload_bus_at) return std_logic_vector;
  function structify(x: daq_output_payload_bus_avt) return daq_output_payload_bus_at;
  function structify(x: std_logic_vector) return daq_output_payload_bus_at;
  function nullify(x: daq_output_payload_bus_at) return daq_output_payload_bus_at;
  function nullify(x: daq_output_payload_bus_avt) return daq_output_payload_bus_avt;

  type daq_counters_rt is record
    daq_bcid : bcid_t;
    win_lower : bcid_t;
  end record daq_counters_rt;
  constant DAQ_COUNTERS_LEN : integer := 24;
  subtype daq_counters_rvt is std_logic_vector(DAQ_COUNTERS_LEN-1 downto 0);
  function vectorify(x: daq_counters_rt) return daq_counters_rvt;
  function structify(x: daq_counters_rvt) return daq_counters_rt;
  function nullify(x: daq_counters_rt) return daq_counters_rt;

  type stability_rt is record
    win_upper : std_logic;
    win_lower : std_logic;
    latency : std_logic;
    base : std_logic;
  end record stability_rt;
  constant STABILITY_LEN : integer := 4;
  subtype stability_rvt is std_logic_vector(STABILITY_LEN-1 downto 0);
  function vectorify(x: stability_rt) return stability_rvt;
  function structify(x: stability_rvt) return stability_rt;
  function nullify(x: stability_rt) return stability_rt;

  type daq_ctrl_rt is record
    win_upper : bcid_t;
    win_lower : bcid_t;
    latency : bcid_t;
    win_width : bcid_t;
  end record daq_ctrl_rt;
  constant DAQ_CTRL_LEN : integer := 48;
  subtype daq_ctrl_rvt is std_logic_vector(DAQ_CTRL_LEN-1 downto 0);
  function vectorify(x: daq_ctrl_rt) return daq_ctrl_rvt;
  function structify(x: daq_ctrl_rvt) return daq_ctrl_rt;
  function nullify(x: daq_ctrl_rt) return daq_ctrl_rt;

  type cell_fifo_write_irt is record
    clk : std_logic;
    en : std_logic;
    data : std_logic_vector(DEV_CELL_DATA_BUS_WIDTH-1 downto 0);
  end record cell_fifo_write_irt;
  constant CELL_FIFO_WRITE_ILEN : integer := 514;
  subtype cell_fifo_write_irvt is std_logic_vector(CELL_FIFO_WRITE_ILEN-1 downto 0);
  function vectorify(x: cell_fifo_write_irt) return cell_fifo_write_irvt;
  function structify(x: cell_fifo_write_irvt) return cell_fifo_write_irt;
  function nullify(x: cell_fifo_write_irt) return cell_fifo_write_irt;

  type cell_fifo_write_ort is record
    full : std_logic;
    rst_busy : std_logic;
  end record cell_fifo_write_ort;
  constant CELL_FIFO_WRITE_OLEN : integer := 2;
  subtype cell_fifo_write_orvt is std_logic_vector(CELL_FIFO_WRITE_OLEN-1 downto 0);
  function vectorify(x: cell_fifo_write_ort) return cell_fifo_write_orvt;
  function structify(x: cell_fifo_write_orvt) return cell_fifo_write_ort;
  function nullify(x: cell_fifo_write_ort) return cell_fifo_write_ort;

  type cell_fifo_read_irt is record
    clk : std_logic;
    en : std_logic;
  end record cell_fifo_read_irt;
  constant CELL_FIFO_READ_ILEN : integer := 2;
  subtype cell_fifo_read_irvt is std_logic_vector(CELL_FIFO_READ_ILEN-1 downto 0);
  function vectorify(x: cell_fifo_read_irt) return cell_fifo_read_irvt;
  function structify(x: cell_fifo_read_irvt) return cell_fifo_read_irt;
  function nullify(x: cell_fifo_read_irt) return cell_fifo_read_irt;

  type cell_fifo_read_ort is record
    data : std_logic_vector(DEV_CELL_DATA_BUS_WIDTH-1 downto 0);
    count : std_logic_vector(DEV_CELL_COUNTER_WIDTH-1 downto 0);
    empty : std_logic;
    rst_busy : std_logic;
  end record cell_fifo_read_ort;
  constant CELL_FIFO_READ_OLEN : integer := 526;
  subtype cell_fifo_read_orvt is std_logic_vector(CELL_FIFO_READ_OLEN-1 downto 0);
  function vectorify(x: cell_fifo_read_ort) return cell_fifo_read_orvt;
  function structify(x: cell_fifo_read_orvt) return cell_fifo_read_ort;
  function nullify(x: cell_fifo_read_ort) return cell_fifo_read_ort;

  type cell_fifo_irt is record
    wr : cell_fifo_write_irt;
    rd : cell_fifo_read_irt;
  end record cell_fifo_irt;
  constant CELL_FIFO_ILEN : integer := 516;
  subtype cell_fifo_irvt is std_logic_vector(CELL_FIFO_ILEN-1 downto 0);
  function vectorify(x: cell_fifo_irt) return cell_fifo_irvt;
  function structify(x: cell_fifo_irvt) return cell_fifo_irt;
  function nullify(x: cell_fifo_irt) return cell_fifo_irt;

  type cell_fifo_ort is record
    wr : cell_fifo_write_ort;
    rd : cell_fifo_read_ort;
  end record cell_fifo_ort;
  constant CELL_FIFO_OLEN : integer := 528;
  subtype cell_fifo_orvt is std_logic_vector(CELL_FIFO_OLEN-1 downto 0);
  function vectorify(x: cell_fifo_ort) return cell_fifo_orvt;
  function structify(x: cell_fifo_orvt) return cell_fifo_ort;
  function nullify(x: cell_fifo_ort) return cell_fifo_ort;

  type cell_fifo_rt is record
    i : cell_fifo_irt;
    o : cell_fifo_ort;
  end record cell_fifo_rt;
  constant CELL_FIFO_LEN : integer := 1044;
  subtype cell_fifo_rvt is std_logic_vector(CELL_FIFO_LEN-1 downto 0);
  function vectorify(x: cell_fifo_rt) return cell_fifo_rvt;
  function structify(x: cell_fifo_rvt) return cell_fifo_rt;
  function nullify(x: cell_fifo_rt) return cell_fifo_rt;

  type lxa_req_fifo_write_irt is record
    clk : std_logic;
    en : std_logic;
    data : std_logic_vector(DEV_LXA_REQ_DATA_BUS_WIDTH-1 downto 0);
  end record lxa_req_fifo_write_irt;
  constant LXA_REQ_FIFO_WRITE_ILEN : integer := 514;
  subtype lxa_req_fifo_write_irvt is std_logic_vector(LXA_REQ_FIFO_WRITE_ILEN-1 downto 0);
  function vectorify(x: lxa_req_fifo_write_irt) return lxa_req_fifo_write_irvt;
  function structify(x: lxa_req_fifo_write_irvt) return lxa_req_fifo_write_irt;
  function nullify(x: lxa_req_fifo_write_irt) return lxa_req_fifo_write_irt;

  type lxa_req_fifo_write_ort is record
    full : std_logic;
    rst_busy : std_logic;
  end record lxa_req_fifo_write_ort;
  constant LXA_REQ_FIFO_WRITE_OLEN : integer := 2;
  subtype lxa_req_fifo_write_orvt is std_logic_vector(LXA_REQ_FIFO_WRITE_OLEN-1 downto 0);
  function vectorify(x: lxa_req_fifo_write_ort) return lxa_req_fifo_write_orvt;
  function structify(x: lxa_req_fifo_write_orvt) return lxa_req_fifo_write_ort;
  function nullify(x: lxa_req_fifo_write_ort) return lxa_req_fifo_write_ort;

  type lxa_req_fifo_read_irt is record
    clk : std_logic;
    en : std_logic;
  end record lxa_req_fifo_read_irt;
  constant LXA_REQ_FIFO_READ_ILEN : integer := 2;
  subtype lxa_req_fifo_read_irvt is std_logic_vector(LXA_REQ_FIFO_READ_ILEN-1 downto 0);
  function vectorify(x: lxa_req_fifo_read_irt) return lxa_req_fifo_read_irvt;
  function structify(x: lxa_req_fifo_read_irvt) return lxa_req_fifo_read_irt;
  function nullify(x: lxa_req_fifo_read_irt) return lxa_req_fifo_read_irt;

  type lxa_req_fifo_read_ort is record
    data : std_logic_vector(DEV_LXA_REQ_DATA_BUS_WIDTH-1 downto 0);
    count : std_logic_vector(DEV_LXA_REQ_COUNTER_WIDTH-1 downto 0);
    empty : std_logic;
    rst_busy : std_logic;
  end record lxa_req_fifo_read_ort;
  constant LXA_REQ_FIFO_READ_OLEN : integer := 525;
  subtype lxa_req_fifo_read_orvt is std_logic_vector(LXA_REQ_FIFO_READ_OLEN-1 downto 0);
  function vectorify(x: lxa_req_fifo_read_ort) return lxa_req_fifo_read_orvt;
  function structify(x: lxa_req_fifo_read_orvt) return lxa_req_fifo_read_ort;
  function nullify(x: lxa_req_fifo_read_ort) return lxa_req_fifo_read_ort;

  type lxa_req_fifo_irt is record
    wr : lxa_req_fifo_write_irt;
    rd : lxa_req_fifo_read_irt;
  end record lxa_req_fifo_irt;
  constant LXA_REQ_FIFO_ILEN : integer := 516;
  subtype lxa_req_fifo_irvt is std_logic_vector(LXA_REQ_FIFO_ILEN-1 downto 0);
  function vectorify(x: lxa_req_fifo_irt) return lxa_req_fifo_irvt;
  function structify(x: lxa_req_fifo_irvt) return lxa_req_fifo_irt;
  function nullify(x: lxa_req_fifo_irt) return lxa_req_fifo_irt;

  type lxa_req_fifo_ort is record
    wr : lxa_req_fifo_write_ort;
    rd : lxa_req_fifo_read_ort;
  end record lxa_req_fifo_ort;
  constant LXA_REQ_FIFO_OLEN : integer := 527;
  subtype lxa_req_fifo_orvt is std_logic_vector(LXA_REQ_FIFO_OLEN-1 downto 0);
  function vectorify(x: lxa_req_fifo_ort) return lxa_req_fifo_orvt;
  function structify(x: lxa_req_fifo_orvt) return lxa_req_fifo_ort;
  function nullify(x: lxa_req_fifo_ort) return lxa_req_fifo_ort;

  type lxa_req_fifo_rt is record
    i : lxa_req_fifo_irt;
    o : lxa_req_fifo_ort;
  end record lxa_req_fifo_rt;
  constant LXA_REQ_FIFO_LEN : integer := 1043;
  subtype lxa_req_fifo_rvt is std_logic_vector(LXA_REQ_FIFO_LEN-1 downto 0);
  function vectorify(x: lxa_req_fifo_rt) return lxa_req_fifo_rvt;
  function structify(x: lxa_req_fifo_rvt) return lxa_req_fifo_rt;
  function nullify(x: lxa_req_fifo_rt) return lxa_req_fifo_rt;

  type row_to_mngt_rt is record
    done : std_logic;
    err : std_logic_vector(DEV_ROWS_ERR_WIDTH-1 downto 0);
  end record row_to_mngt_rt;
  constant ROW_TO_MNGT_LEN : integer := 5;
  subtype row_to_mngt_rvt is std_logic_vector(ROW_TO_MNGT_LEN-1 downto 0);
  function vectorify(x: row_to_mngt_rt) return row_to_mngt_rvt;
  function structify(x: row_to_mngt_rvt) return row_to_mngt_rt;
  function nullify(x: row_to_mngt_rt) return row_to_mngt_rt;

  type mngt_to_row_rt is record
    col_wr_en : std_logic_vector(DEV_COL_SEL_WIDTH-1 downto 0);
    col_rd_en : std_logic_vector(DEV_COL_SEL_WIDTH-1 downto 0);
    win_lower : bcid_t;
    win_width : bcid_t;
  end record mngt_to_row_rt;
  constant MNGT_TO_ROW_LEN : integer := 32;
  subtype mngt_to_row_rvt is std_logic_vector(MNGT_TO_ROW_LEN-1 downto 0);
  function vectorify(x: mngt_to_row_rt) return mngt_to_row_rvt;
  function structify(x: mngt_to_row_rvt) return mngt_to_row_rt;
  function nullify(x: mngt_to_row_rt) return mngt_to_row_rt;

  type mngt_to_pkt_bldr_rt is record
    en : std_logic;
  end record mngt_to_pkt_bldr_rt;
  constant MNGT_TO_PKT_BLDR_LEN : integer := 1;
  subtype mngt_to_pkt_bldr_rvt is std_logic_vector(MNGT_TO_PKT_BLDR_LEN-1 downto 0);
  function vectorify(x: mngt_to_pkt_bldr_rt) return mngt_to_pkt_bldr_rvt;
  function structify(x: mngt_to_pkt_bldr_rvt) return mngt_to_pkt_bldr_rt;
  function nullify(x: mngt_to_pkt_bldr_rt) return mngt_to_pkt_bldr_rt;

  type pkt_bldr_to_mngt_rt is record
    done : std_logic;
    row_sel : std_logic_vector(DEV_ROW_SEL_WIDTH-1 downto 0);
  end record pkt_bldr_to_mngt_rt;
  constant PKT_BLDR_TO_MNGT_LEN : integer := 2;
  subtype pkt_bldr_to_mngt_rvt is std_logic_vector(PKT_BLDR_TO_MNGT_LEN-1 downto 0);
  function vectorify(x: pkt_bldr_to_mngt_rt) return pkt_bldr_to_mngt_rvt;
  function structify(x: pkt_bldr_to_mngt_rvt) return pkt_bldr_to_mngt_rt;
  function nullify(x: pkt_bldr_to_mngt_rt) return pkt_bldr_to_mngt_rt;

  type row_to_pkt_bldr_rt is record
    counter : std_logic_vector(DEV_F2E_INPUT_DATA_WIDTH-1 downto 0);
    data : std_logic_vector(DEV_F2E_INPUT_DATA_WIDTH-1 downto 0);
    nempty : std_logic;
  end record row_to_pkt_bldr_rt;
  constant ROW_TO_PKT_BLDR_LEN : integer := 33;
  subtype row_to_pkt_bldr_rvt is std_logic_vector(ROW_TO_PKT_BLDR_LEN-1 downto 0);
  function vectorify(x: row_to_pkt_bldr_rt) return row_to_pkt_bldr_rvt;
  function structify(x: row_to_pkt_bldr_rvt) return row_to_pkt_bldr_rt;
  function nullify(x: row_to_pkt_bldr_rt) return row_to_pkt_bldr_rt;

  type pkt_bldr_to_row_rt is record
    rd_strb : std_logic;
  end record pkt_bldr_to_row_rt;
  constant PKT_BLDR_TO_ROW_LEN : integer := 1;
  subtype pkt_bldr_to_row_rvt is std_logic_vector(PKT_BLDR_TO_ROW_LEN-1 downto 0);
  function vectorify(x: pkt_bldr_to_row_rt) return pkt_bldr_to_row_rvt;
  function structify(x: pkt_bldr_to_row_rvt) return pkt_bldr_to_row_rt;
  function nullify(x: pkt_bldr_to_row_rt) return pkt_bldr_to_row_rt;

  type f2e_to_daq_algo_rt is record
    hfull : std_logic;
  end record f2e_to_daq_algo_rt;
  constant F2E_TO_DAQ_ALGO_LEN : integer := 1;
  subtype f2e_to_daq_algo_rvt is std_logic_vector(F2E_TO_DAQ_ALGO_LEN-1 downto 0);
  function vectorify(x: f2e_to_daq_algo_rt) return f2e_to_daq_algo_rvt;
  function structify(x: f2e_to_daq_algo_rvt) return f2e_to_daq_algo_rt;
  function nullify(x: f2e_to_daq_algo_rt) return f2e_to_daq_algo_rt;

  type daq_algo_to_f2e_rt is record
    wr_en : std_logic;
    data : f2e_data_t;
  end record daq_algo_to_f2e_rt;
  constant DAQ_ALGO_TO_F2E_LEN : integer := 19;
  subtype daq_algo_to_f2e_rvt is std_logic_vector(DAQ_ALGO_TO_F2E_LEN-1 downto 0);
  function vectorify(x: daq_algo_to_f2e_rt) return daq_algo_to_f2e_rvt;
  function structify(x: daq_algo_to_f2e_rvt) return daq_algo_to_f2e_rt;
  function nullify(x: daq_algo_to_f2e_rt) return daq_algo_to_f2e_rt;

  type ctrl_to_daq_rt is record
    wr_en : std_logic;
    latency : bcid_t;
    win_lower : bcid_t;
    win_upper : bcid_t;
  end record ctrl_to_daq_rt;
  constant CTRL_TO_DAQ_LEN : integer := 37;
  subtype ctrl_to_daq_rvt is std_logic_vector(CTRL_TO_DAQ_LEN-1 downto 0);
  function vectorify(x: ctrl_to_daq_rt) return ctrl_to_daq_rvt;
  function structify(x: ctrl_to_daq_rvt) return ctrl_to_daq_rt;
  function nullify(x: ctrl_to_daq_rt) return ctrl_to_daq_rt;

  type daq_to_ctrl_rt is record
    invalid_values : std_logic;
    stability : std_logic_vector(4-1 downto 0);
  end record daq_to_ctrl_rt;
  constant DAQ_TO_CTRL_LEN : integer := 5;
  subtype daq_to_ctrl_rvt is std_logic_vector(DAQ_TO_CTRL_LEN-1 downto 0);
  function vectorify(x: daq_to_ctrl_rt) return daq_to_ctrl_rvt;
  function structify(x: daq_to_ctrl_rvt) return daq_to_ctrl_rt;
  function nullify(x: daq_to_ctrl_rt) return daq_to_ctrl_rt;

  type row_generics_rt is record
    INPUT_DATA_LEN : natural;
    OUTPUT_DATA_LEN : natural;
    COUNTER_LEN : natural;
    -- CELL_TYPE: 0 for header, 1 otherwise
    CELL_TYPE : natural;
  end record row_generics_rt;
  constant ROW_GENERICS_LEN : integer := 128;
  subtype row_generics_rvt is std_logic_vector(ROW_GENERICS_LEN-1 downto 0);
  function vectorify(x: row_generics_rt) return row_generics_rvt;
  function structify(x: row_generics_rvt) return row_generics_rt;
  function nullify(x: row_generics_rt) return row_generics_rt;

  type row_irt is record
    sys : daq_sys_rt;
    mngt : mngt_to_row_rt;
    stream : stream_rt;
    pkt_bldr : pkt_bldr_to_row_rt;
  end record row_irt;
  constant ROW_ILEN : integer := 560;
  subtype row_irvt is std_logic_vector(ROW_ILEN-1 downto 0);
  function vectorify(x: row_irt) return row_irvt;
  function structify(x: row_irvt) return row_irt;
  function nullify(x: row_irt) return row_irt;

  type row_ort is record
    mngt : row_to_mngt_rt;
    pkt_bldr : row_to_pkt_bldr_rt;
  end record row_ort;
  constant ROW_OLEN : integer := 38;
  subtype row_orvt is std_logic_vector(ROW_OLEN-1 downto 0);
  function vectorify(x: row_ort) return row_orvt;
  function structify(x: row_orvt) return row_ort;
  function nullify(x: row_ort) return row_ort;

  type row_rt is record
    i : row_irt;
    o : row_ort;
  end record row_rt;
  constant ROW_LEN : integer := 598;
  subtype row_rvt is std_logic_vector(ROW_LEN-1 downto 0);
  function vectorify(x: row_rt) return row_rvt;
  function structify(x: row_rvt) return row_rt;
  function nullify(x: row_rt) return row_rt;

  type row_bus_at is array(DEV_ROWS-1 downto 0) of row_rt;
  type row_bus_avt is array(DEV_ROWS-1 downto 0) of row_rvt;
  function vectorify(x: row_bus_at) return row_bus_avt;
  function vectorify(x: row_bus_at) return std_logic_vector;
  function structify(x: row_bus_avt) return row_bus_at;
  function structify(x: std_logic_vector) return row_bus_at;
  function nullify(x: row_bus_at) return row_bus_at;
  function nullify(x: row_bus_avt) return row_bus_avt;

  type pkt_bldr_generics_rt is record
    PAYLOAD_LEN : natural;
  end record pkt_bldr_generics_rt;
  constant PKT_BLDR_GENERICS_LEN : integer := 32;
  subtype pkt_bldr_generics_rvt is std_logic_vector(PKT_BLDR_GENERICS_LEN-1 downto 0);
  function vectorify(x: pkt_bldr_generics_rt) return pkt_bldr_generics_rvt;
  function structify(x: pkt_bldr_generics_rvt) return pkt_bldr_generics_rt;
  function nullify(x: pkt_bldr_generics_rt) return pkt_bldr_generics_rt;

  type pkt_bldr_irt is record
    sys : daq_sys_rt;
    mngt : mngt_to_pkt_bldr_rt;
    row : row_to_pkt_bldr_rt;
    f2e : f2e_to_daq_algo_rt;
  end record pkt_bldr_irt;
  constant PKT_BLDR_ILEN : integer := 37;
  subtype pkt_bldr_irvt is std_logic_vector(PKT_BLDR_ILEN-1 downto 0);
  function vectorify(x: pkt_bldr_irt) return pkt_bldr_irvt;
  function structify(x: pkt_bldr_irvt) return pkt_bldr_irt;
  function nullify(x: pkt_bldr_irt) return pkt_bldr_irt;

  type pkt_bldr_ort is record
    mngt : pkt_bldr_to_mngt_rt;
    row : pkt_bldr_to_row_rt;
    f2e : daq_algo_to_f2e_rt;
  end record pkt_bldr_ort;
  constant PKT_BLDR_OLEN : integer := 22;
  subtype pkt_bldr_orvt is std_logic_vector(PKT_BLDR_OLEN-1 downto 0);
  function vectorify(x: pkt_bldr_ort) return pkt_bldr_orvt;
  function structify(x: pkt_bldr_orvt) return pkt_bldr_ort;
  function nullify(x: pkt_bldr_ort) return pkt_bldr_ort;

  type pkt_bldr_rt is record
    i : pkt_bldr_irt;
    o : pkt_bldr_ort;
  end record pkt_bldr_rt;
  constant PKT_BLDR_LEN : integer := 59;
  subtype pkt_bldr_rvt is std_logic_vector(PKT_BLDR_LEN-1 downto 0);
  function vectorify(x: pkt_bldr_rt) return pkt_bldr_rvt;
  function structify(x: pkt_bldr_rvt) return pkt_bldr_rt;
  function nullify(x: pkt_bldr_rt) return pkt_bldr_rt;

  subtype daq_payload_alen_t is integer_bus_at(DAQ_N_STREAMS-1 downto 0);

  type algo_irt is record
    sys : daq_sys_rt;
    ttc : ttc_ort;
    ctrl : ctrl_to_daq_rt;
    stream_bus : daq_stream_bus_at;
    f2e : f2e_to_daq_algo_rt;
  end record algo_irt;
  constant ALGO_ILEN : integer := 646;
  subtype algo_irvt is std_logic_vector(ALGO_ILEN-1 downto 0);
  function vectorify(x: algo_irt) return algo_irvt;
  function structify(x: algo_irvt) return algo_irt;
  function nullify(x: algo_irt) return algo_irt;

  type algo_ort is record
    ctrl : daq_to_ctrl_rt;
    f2e : daq_algo_to_f2e_rt;
  end record algo_ort;
  constant ALGO_OLEN : integer := 24;
  subtype algo_orvt is std_logic_vector(ALGO_OLEN-1 downto 0);
  function vectorify(x: algo_ort) return algo_orvt;
  function structify(x: algo_orvt) return algo_ort;
  function nullify(x: algo_ort) return algo_ort;

  type algo_rt is record
    i : algo_irt;
    o : algo_ort;
  end record algo_rt;
  constant ALGO_LEN : integer := 670;
  subtype algo_rvt is std_logic_vector(ALGO_LEN-1 downto 0);
  function vectorify(x: algo_rt) return algo_rvt;
  function structify(x: algo_rvt) return algo_rt;
  function nullify(x: algo_rt) return algo_rt;

  type algo_bus_at is array(DAQ_N_FLOWS-1 downto 0) of algo_rt;
  type algo_bus_avt is array(DAQ_N_FLOWS-1 downto 0) of algo_rvt;
  function vectorify(x: algo_bus_at) return algo_bus_avt;
  function vectorify(x: algo_bus_at) return std_logic_vector;
  function structify(x: algo_bus_avt) return algo_bus_at;
  function structify(x: std_logic_vector) return algo_bus_at;
  function nullify(x: algo_bus_at) return algo_bus_at;
  function nullify(x: algo_bus_avt) return algo_bus_avt;

  type f2e_to_daq_top_at is array(DAQ_N_FLOWS-1 downto 0) of f2e_to_daq_algo_rt;
  type f2e_to_daq_top_avt is array(DAQ_N_FLOWS-1 downto 0) of f2e_to_daq_algo_rvt;
  function vectorify(x: f2e_to_daq_top_at) return f2e_to_daq_top_avt;
  function vectorify(x: f2e_to_daq_top_at) return std_logic_vector;
  function structify(x: f2e_to_daq_top_avt) return f2e_to_daq_top_at;
  function structify(x: std_logic_vector) return f2e_to_daq_top_at;
  function nullify(x: f2e_to_daq_top_at) return f2e_to_daq_top_at;
  function nullify(x: f2e_to_daq_top_avt) return f2e_to_daq_top_avt;

  type daq_flow_bus_at is array(DAQ_N_FLOWS-1 downto 0) of daq_stream_bus_at;
  type daq_flow_bus_avt is array(DAQ_N_FLOWS-1 downto 0) of daq_stream_bus_avt;
  function vectorify(x: daq_flow_bus_at) return daq_flow_bus_avt;
  function vectorify(x: daq_flow_bus_at) return std_logic_vector;
  function structify(x: daq_flow_bus_avt) return daq_flow_bus_at;
  function structify(x: std_logic_vector) return daq_flow_bus_at;
  function nullify(x: daq_flow_bus_at) return daq_flow_bus_at;
  function nullify(x: daq_flow_bus_avt) return daq_flow_bus_avt;

  type top_irt is record
    sys : daq_sys_rt;
    ttc : ttc_ort;
    ctrl : ctrl_to_daq_rt;
    flow_bus : daq_flow_bus_at;
    f2e_bus : f2e_to_daq_top_at;
  end record top_irt;
  constant TOP_ILEN : integer := 3276;
  subtype top_irvt is std_logic_vector(TOP_ILEN-1 downto 0);
  function vectorify(x: top_irt) return top_irvt;
  function structify(x: top_irvt) return top_irt;
  function nullify(x: top_irt) return top_irt;

  type daq_top_to_ext_ctrl_at is array(DAQ_N_FLOWS-1 downto 0) of daq_to_ctrl_rt;
  type daq_top_to_ext_ctrl_avt is array(DAQ_N_FLOWS-1 downto 0) of daq_to_ctrl_rvt;
  function vectorify(x: daq_top_to_ext_ctrl_at) return daq_top_to_ext_ctrl_avt;
  function vectorify(x: daq_top_to_ext_ctrl_at) return std_logic_vector;
  function structify(x: daq_top_to_ext_ctrl_avt) return daq_top_to_ext_ctrl_at;
  function structify(x: std_logic_vector) return daq_top_to_ext_ctrl_at;
  function nullify(x: daq_top_to_ext_ctrl_at) return daq_top_to_ext_ctrl_at;
  function nullify(x: daq_top_to_ext_ctrl_avt) return daq_top_to_ext_ctrl_avt;

  type daq_top_to_ext_f2e_at is array(DAQ_N_FLOWS-1 downto 0) of daq_algo_to_f2e_rt;
  type daq_top_to_ext_f2e_avt is array(DAQ_N_FLOWS-1 downto 0) of daq_algo_to_f2e_rvt;
  function vectorify(x: daq_top_to_ext_f2e_at) return daq_top_to_ext_f2e_avt;
  function vectorify(x: daq_top_to_ext_f2e_at) return std_logic_vector;
  function structify(x: daq_top_to_ext_f2e_avt) return daq_top_to_ext_f2e_at;
  function structify(x: std_logic_vector) return daq_top_to_ext_f2e_at;
  function nullify(x: daq_top_to_ext_f2e_at) return daq_top_to_ext_f2e_at;
  function nullify(x: daq_top_to_ext_f2e_avt) return daq_top_to_ext_f2e_avt;

  type top_ort is record
    ctrl_bus : daq_top_to_ext_ctrl_at;
    f2e_bus : daq_top_to_ext_f2e_at;
  end record top_ort;
  constant TOP_OLEN : integer := 144;
  subtype top_orvt is std_logic_vector(TOP_OLEN-1 downto 0);
  function vectorify(x: top_ort) return top_orvt;
  function structify(x: top_orvt) return top_ort;
  function nullify(x: top_ort) return top_ort;

  type top_rt is record
    i : algo_irt;
    o : algo_ort;
  end record top_rt;
  constant TOP_LEN : integer := 670;
  subtype top_rvt is std_logic_vector(TOP_LEN-1 downto 0);
  function vectorify(x: top_rt) return top_rvt;
  function structify(x: top_rvt) return top_rt;
  function nullify(x: top_rt) return top_rt;

end package daq_defs_pkg;

------------------------------------------------------------

package body daq_defs_pkg is

  function vectorify(x: daq_sys_rt) return daq_sys_rvt is
    variable y : daq_sys_rvt;
  begin
    y(1 downto 1)              := vectorify(x.clk320);
    y(0 downto 0)              := vectorify(x.rst);
    return y;
  end function vectorify;
  function structify(x: daq_sys_rvt) return daq_sys_rt is
    variable y : daq_sys_rt;
  begin
    y.clk320                   := structify(x(1 downto 1));
    y.rst                      := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_sys_rt) return daq_sys_rt is
    variable y : daq_sys_rt;
  begin
    y.clk320                   := nullify(x.clk320);
    y.rst                      := nullify(x.rst);
    return y;
  end function nullify;

  function vectorify(x: daq_hdr_swrod_rt) return daq_hdr_swrod_rvt is
    variable y : daq_hdr_swrod_rvt;
  begin
    y(63 downto 56)            := vectorify(x.flag_0);
    y(55 downto 48)            := vectorify(x.flag_1);
    y(47 downto 32)            := vectorify(x.flag_2);
    y(31 downto 0)             := vectorify(x.eventid);
    return y;
  end function vectorify;
  function structify(x: daq_hdr_swrod_rvt) return daq_hdr_swrod_rt is
    variable y : daq_hdr_swrod_rt;
  begin
    y.flag_0                   := structify(x(63 downto 56));
    y.flag_1                   := structify(x(55 downto 48));
    y.flag_2                   := structify(x(47 downto 32));
    y.eventid                  := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_hdr_swrod_rt) return daq_hdr_swrod_rt is
    variable y : daq_hdr_swrod_rt;
  begin
    y.flag_0                   := nullify(x.flag_0);
    y.flag_1                   := nullify(x.flag_1);
    y.flag_2                   := nullify(x.flag_2);
    y.eventid                  := nullify(x.eventid);
    return y;
  end function nullify;

  function vectorify(x: daq_hdr_extra_rt) return daq_hdr_extra_rvt is
    variable y : daq_hdr_extra_rvt;
  begin
    y(59 downto 48)            := vectorify(x.win_lower);
    y(47 downto 36)            := vectorify(x.daq_bcid);
    y(35 downto 24)            := vectorify(x.win_width);
    y(23 downto 12)            := vectorify(x.win_lower_ref);
    y(11 downto 0)             := vectorify(x.win_upper_ref);
    return y;
  end function vectorify;
  function structify(x: daq_hdr_extra_rvt) return daq_hdr_extra_rt is
    variable y : daq_hdr_extra_rt;
  begin
    y.win_lower                := structify(x(59 downto 48));
    y.daq_bcid                 := structify(x(47 downto 36));
    y.win_width                := structify(x(35 downto 24));
    y.win_lower_ref            := structify(x(23 downto 12));
    y.win_upper_ref            := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_hdr_extra_rt) return daq_hdr_extra_rt is
    variable y : daq_hdr_extra_rt;
  begin
    y.win_lower                := nullify(x.win_lower);
    y.daq_bcid                 := nullify(x.daq_bcid);
    y.win_width                := nullify(x.win_width);
    y.win_lower_ref            := nullify(x.win_lower_ref);
    y.win_upper_ref            := nullify(x.win_upper_ref);
    return y;
  end function nullify;

  function vectorify(x: daq_hdr_rt) return daq_hdr_rvt is
    variable y : daq_hdr_rvt;
  begin
    y(123 downto 60)           := vectorify(x.swrod);
    y(59 downto 0)             := vectorify(x.extra);
    return y;
  end function vectorify;
  function structify(x: daq_hdr_rvt) return daq_hdr_rt is
    variable y : daq_hdr_rt;
  begin
    y.swrod                    := structify(x(123 downto 60));
    y.extra                    := structify(x(59 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_hdr_rt) return daq_hdr_rt is
    variable y : daq_hdr_rt;
  begin
    y.swrod                    := nullify(x.swrod);
    y.extra                    := nullify(x.extra);
    return y;
  end function nullify;

  function vectorify(x: stream_rt) return stream_rvt is
    variable y : stream_rvt;
  begin
    y(524 downto 513)          := vectorify(x.bcid);
    y(512 downto 512)          := vectorify(x.valid);
    y(511 downto 0)            := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: stream_rvt) return stream_rt is
    variable y : stream_rt;
  begin
    y.bcid                     := structify(x(524 downto 513));
    y.valid                    := structify(x(512 downto 512));
    y.data                     := structify(x(511 downto 0));
    return y;
  end function structify;
  function nullify(x: stream_rt) return stream_rt is
    variable y : stream_rt;
  begin
    y.bcid                     := nullify(x.bcid);
    y.valid                    := nullify(x.valid);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: daq_stream_bus_at) return daq_stream_bus_avt is
    variable y :  daq_stream_bus_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: daq_stream_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*525-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-525) := vectorify(x(i));
      msb := msb - 525 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: daq_stream_bus_avt) return daq_stream_bus_at is
    variable y :  daq_stream_bus_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return daq_stream_bus_at is
    variable y :  daq_stream_bus_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-525));
      msb := msb - 525 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: daq_stream_bus_at) return daq_stream_bus_at is
    variable y :  daq_stream_bus_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: daq_stream_bus_avt) return daq_stream_bus_avt is
    variable y :  daq_stream_bus_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: daq_output_payload_bus_at) return daq_output_payload_bus_avt is
    variable y :  daq_output_payload_bus_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: daq_output_payload_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*DEV_F2E_OUTPUT_DATA_WIDTH-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-DEV_F2E_OUTPUT_DATA_WIDTH) := vectorify(x(i));
      msb := msb - DEV_F2E_OUTPUT_DATA_WIDTH -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: daq_output_payload_bus_avt) return daq_output_payload_bus_at is
    variable y :  daq_output_payload_bus_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return daq_output_payload_bus_at is
    variable y :  daq_output_payload_bus_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-DEV_F2E_OUTPUT_DATA_WIDTH));
      msb := msb - DEV_F2E_OUTPUT_DATA_WIDTH -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: daq_output_payload_bus_at) return daq_output_payload_bus_at is
    variable y :  daq_output_payload_bus_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: daq_output_payload_bus_avt) return daq_output_payload_bus_avt is
    variable y :  daq_output_payload_bus_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: daq_counters_rt) return daq_counters_rvt is
    variable y : daq_counters_rvt;
  begin
    y(23 downto 12)            := vectorify(x.daq_bcid);
    y(11 downto 0)             := vectorify(x.win_lower);
    return y;
  end function vectorify;
  function structify(x: daq_counters_rvt) return daq_counters_rt is
    variable y : daq_counters_rt;
  begin
    y.daq_bcid                 := structify(x(23 downto 12));
    y.win_lower                := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_counters_rt) return daq_counters_rt is
    variable y : daq_counters_rt;
  begin
    y.daq_bcid                 := nullify(x.daq_bcid);
    y.win_lower                := nullify(x.win_lower);
    return y;
  end function nullify;

  function vectorify(x: stability_rt) return stability_rvt is
    variable y : stability_rvt;
  begin
    y(3 downto 3)              := vectorify(x.win_upper);
    y(2 downto 2)              := vectorify(x.win_lower);
    y(1 downto 1)              := vectorify(x.latency);
    y(0 downto 0)              := vectorify(x.base);
    return y;
  end function vectorify;
  function structify(x: stability_rvt) return stability_rt is
    variable y : stability_rt;
  begin
    y.win_upper                := structify(x(3 downto 3));
    y.win_lower                := structify(x(2 downto 2));
    y.latency                  := structify(x(1 downto 1));
    y.base                     := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: stability_rt) return stability_rt is
    variable y : stability_rt;
  begin
    y.win_upper                := nullify(x.win_upper);
    y.win_lower                := nullify(x.win_lower);
    y.latency                  := nullify(x.latency);
    y.base                     := nullify(x.base);
    return y;
  end function nullify;

  function vectorify(x: daq_ctrl_rt) return daq_ctrl_rvt is
    variable y : daq_ctrl_rvt;
  begin
    y(47 downto 36)            := vectorify(x.win_upper);
    y(35 downto 24)            := vectorify(x.win_lower);
    y(23 downto 12)            := vectorify(x.latency);
    y(11 downto 0)             := vectorify(x.win_width);
    return y;
  end function vectorify;
  function structify(x: daq_ctrl_rvt) return daq_ctrl_rt is
    variable y : daq_ctrl_rt;
  begin
    y.win_upper                := structify(x(47 downto 36));
    y.win_lower                := structify(x(35 downto 24));
    y.latency                  := structify(x(23 downto 12));
    y.win_width                := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_ctrl_rt) return daq_ctrl_rt is
    variable y : daq_ctrl_rt;
  begin
    y.win_upper                := nullify(x.win_upper);
    y.win_lower                := nullify(x.win_lower);
    y.latency                  := nullify(x.latency);
    y.win_width                := nullify(x.win_width);
    return y;
  end function nullify;

  function vectorify(x: cell_fifo_write_irt) return cell_fifo_write_irvt is
    variable y : cell_fifo_write_irvt;
  begin
    y(513 downto 513)          := vectorify(x.clk);
    y(512 downto 512)          := vectorify(x.en);
    y(511 downto 0)            := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: cell_fifo_write_irvt) return cell_fifo_write_irt is
    variable y : cell_fifo_write_irt;
  begin
    y.clk                      := structify(x(513 downto 513));
    y.en                       := structify(x(512 downto 512));
    y.data                     := structify(x(511 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_fifo_write_irt) return cell_fifo_write_irt is
    variable y : cell_fifo_write_irt;
  begin
    y.clk                      := nullify(x.clk);
    y.en                       := nullify(x.en);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: cell_fifo_write_ort) return cell_fifo_write_orvt is
    variable y : cell_fifo_write_orvt;
  begin
    y(1 downto 1)              := vectorify(x.full);
    y(0 downto 0)              := vectorify(x.rst_busy);
    return y;
  end function vectorify;
  function structify(x: cell_fifo_write_orvt) return cell_fifo_write_ort is
    variable y : cell_fifo_write_ort;
  begin
    y.full                     := structify(x(1 downto 1));
    y.rst_busy                 := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_fifo_write_ort) return cell_fifo_write_ort is
    variable y : cell_fifo_write_ort;
  begin
    y.full                     := nullify(x.full);
    y.rst_busy                 := nullify(x.rst_busy);
    return y;
  end function nullify;

  function vectorify(x: cell_fifo_read_irt) return cell_fifo_read_irvt is
    variable y : cell_fifo_read_irvt;
  begin
    y(1 downto 1)              := vectorify(x.clk);
    y(0 downto 0)              := vectorify(x.en);
    return y;
  end function vectorify;
  function structify(x: cell_fifo_read_irvt) return cell_fifo_read_irt is
    variable y : cell_fifo_read_irt;
  begin
    y.clk                      := structify(x(1 downto 1));
    y.en                       := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_fifo_read_irt) return cell_fifo_read_irt is
    variable y : cell_fifo_read_irt;
  begin
    y.clk                      := nullify(x.clk);
    y.en                       := nullify(x.en);
    return y;
  end function nullify;

  function vectorify(x: cell_fifo_read_ort) return cell_fifo_read_orvt is
    variable y : cell_fifo_read_orvt;
  begin
    y(525 downto 14)           := vectorify(x.data);
    y(13 downto 2)             := vectorify(x.count);
    y(1 downto 1)              := vectorify(x.empty);
    y(0 downto 0)              := vectorify(x.rst_busy);
    return y;
  end function vectorify;
  function structify(x: cell_fifo_read_orvt) return cell_fifo_read_ort is
    variable y : cell_fifo_read_ort;
  begin
    y.data                     := structify(x(525 downto 14));
    y.count                    := structify(x(13 downto 2));
    y.empty                    := structify(x(1 downto 1));
    y.rst_busy                 := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_fifo_read_ort) return cell_fifo_read_ort is
    variable y : cell_fifo_read_ort;
  begin
    y.data                     := nullify(x.data);
    y.count                    := nullify(x.count);
    y.empty                    := nullify(x.empty);
    y.rst_busy                 := nullify(x.rst_busy);
    return y;
  end function nullify;

  function vectorify(x: cell_fifo_irt) return cell_fifo_irvt is
    variable y : cell_fifo_irvt;
  begin
    y(515 downto 2)            := vectorify(x.wr);
    y(1 downto 0)              := vectorify(x.rd);
    return y;
  end function vectorify;
  function structify(x: cell_fifo_irvt) return cell_fifo_irt is
    variable y : cell_fifo_irt;
  begin
    y.wr                       := structify(x(515 downto 2));
    y.rd                       := structify(x(1 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_fifo_irt) return cell_fifo_irt is
    variable y : cell_fifo_irt;
  begin
    y.wr                       := nullify(x.wr);
    y.rd                       := nullify(x.rd);
    return y;
  end function nullify;

  function vectorify(x: cell_fifo_ort) return cell_fifo_orvt is
    variable y : cell_fifo_orvt;
  begin
    y(527 downto 526)          := vectorify(x.wr);
    y(525 downto 0)            := vectorify(x.rd);
    return y;
  end function vectorify;
  function structify(x: cell_fifo_orvt) return cell_fifo_ort is
    variable y : cell_fifo_ort;
  begin
    y.wr                       := structify(x(527 downto 526));
    y.rd                       := structify(x(525 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_fifo_ort) return cell_fifo_ort is
    variable y : cell_fifo_ort;
  begin
    y.wr                       := nullify(x.wr);
    y.rd                       := nullify(x.rd);
    return y;
  end function nullify;

  function vectorify(x: cell_fifo_rt) return cell_fifo_rvt is
    variable y : cell_fifo_rvt;
  begin
    y(1043 downto 528)         := vectorify(x.i);
    y(527 downto 0)            := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: cell_fifo_rvt) return cell_fifo_rt is
    variable y : cell_fifo_rt;
  begin
    y.i                        := structify(x(1043 downto 528));
    y.o                        := structify(x(527 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_fifo_rt) return cell_fifo_rt is
    variable y : cell_fifo_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

  function vectorify(x: lxa_req_fifo_write_irt) return lxa_req_fifo_write_irvt is
    variable y : lxa_req_fifo_write_irvt;
  begin
    y(513 downto 513)          := vectorify(x.clk);
    y(512 downto 512)          := vectorify(x.en);
    y(511 downto 0)            := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: lxa_req_fifo_write_irvt) return lxa_req_fifo_write_irt is
    variable y : lxa_req_fifo_write_irt;
  begin
    y.clk                      := structify(x(513 downto 513));
    y.en                       := structify(x(512 downto 512));
    y.data                     := structify(x(511 downto 0));
    return y;
  end function structify;
  function nullify(x: lxa_req_fifo_write_irt) return lxa_req_fifo_write_irt is
    variable y : lxa_req_fifo_write_irt;
  begin
    y.clk                      := nullify(x.clk);
    y.en                       := nullify(x.en);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: lxa_req_fifo_write_ort) return lxa_req_fifo_write_orvt is
    variable y : lxa_req_fifo_write_orvt;
  begin
    y(1 downto 1)              := vectorify(x.full);
    y(0 downto 0)              := vectorify(x.rst_busy);
    return y;
  end function vectorify;
  function structify(x: lxa_req_fifo_write_orvt) return lxa_req_fifo_write_ort is
    variable y : lxa_req_fifo_write_ort;
  begin
    y.full                     := structify(x(1 downto 1));
    y.rst_busy                 := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: lxa_req_fifo_write_ort) return lxa_req_fifo_write_ort is
    variable y : lxa_req_fifo_write_ort;
  begin
    y.full                     := nullify(x.full);
    y.rst_busy                 := nullify(x.rst_busy);
    return y;
  end function nullify;

  function vectorify(x: lxa_req_fifo_read_irt) return lxa_req_fifo_read_irvt is
    variable y : lxa_req_fifo_read_irvt;
  begin
    y(1 downto 1)              := vectorify(x.clk);
    y(0 downto 0)              := vectorify(x.en);
    return y;
  end function vectorify;
  function structify(x: lxa_req_fifo_read_irvt) return lxa_req_fifo_read_irt is
    variable y : lxa_req_fifo_read_irt;
  begin
    y.clk                      := structify(x(1 downto 1));
    y.en                       := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: lxa_req_fifo_read_irt) return lxa_req_fifo_read_irt is
    variable y : lxa_req_fifo_read_irt;
  begin
    y.clk                      := nullify(x.clk);
    y.en                       := nullify(x.en);
    return y;
  end function nullify;

  function vectorify(x: lxa_req_fifo_read_ort) return lxa_req_fifo_read_orvt is
    variable y : lxa_req_fifo_read_orvt;
  begin
    y(524 downto 13)           := vectorify(x.data);
    y(12 downto 2)             := vectorify(x.count);
    y(1 downto 1)              := vectorify(x.empty);
    y(0 downto 0)              := vectorify(x.rst_busy);
    return y;
  end function vectorify;
  function structify(x: lxa_req_fifo_read_orvt) return lxa_req_fifo_read_ort is
    variable y : lxa_req_fifo_read_ort;
  begin
    y.data                     := structify(x(524 downto 13));
    y.count                    := structify(x(12 downto 2));
    y.empty                    := structify(x(1 downto 1));
    y.rst_busy                 := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: lxa_req_fifo_read_ort) return lxa_req_fifo_read_ort is
    variable y : lxa_req_fifo_read_ort;
  begin
    y.data                     := nullify(x.data);
    y.count                    := nullify(x.count);
    y.empty                    := nullify(x.empty);
    y.rst_busy                 := nullify(x.rst_busy);
    return y;
  end function nullify;

  function vectorify(x: lxa_req_fifo_irt) return lxa_req_fifo_irvt is
    variable y : lxa_req_fifo_irvt;
  begin
    y(515 downto 2)            := vectorify(x.wr);
    y(1 downto 0)              := vectorify(x.rd);
    return y;
  end function vectorify;
  function structify(x: lxa_req_fifo_irvt) return lxa_req_fifo_irt is
    variable y : lxa_req_fifo_irt;
  begin
    y.wr                       := structify(x(515 downto 2));
    y.rd                       := structify(x(1 downto 0));
    return y;
  end function structify;
  function nullify(x: lxa_req_fifo_irt) return lxa_req_fifo_irt is
    variable y : lxa_req_fifo_irt;
  begin
    y.wr                       := nullify(x.wr);
    y.rd                       := nullify(x.rd);
    return y;
  end function nullify;

  function vectorify(x: lxa_req_fifo_ort) return lxa_req_fifo_orvt is
    variable y : lxa_req_fifo_orvt;
  begin
    y(526 downto 525)          := vectorify(x.wr);
    y(524 downto 0)            := vectorify(x.rd);
    return y;
  end function vectorify;
  function structify(x: lxa_req_fifo_orvt) return lxa_req_fifo_ort is
    variable y : lxa_req_fifo_ort;
  begin
    y.wr                       := structify(x(526 downto 525));
    y.rd                       := structify(x(524 downto 0));
    return y;
  end function structify;
  function nullify(x: lxa_req_fifo_ort) return lxa_req_fifo_ort is
    variable y : lxa_req_fifo_ort;
  begin
    y.wr                       := nullify(x.wr);
    y.rd                       := nullify(x.rd);
    return y;
  end function nullify;

  function vectorify(x: lxa_req_fifo_rt) return lxa_req_fifo_rvt is
    variable y : lxa_req_fifo_rvt;
  begin
    y(1042 downto 527)         := vectorify(x.i);
    y(526 downto 0)            := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: lxa_req_fifo_rvt) return lxa_req_fifo_rt is
    variable y : lxa_req_fifo_rt;
  begin
    y.i                        := structify(x(1042 downto 527));
    y.o                        := structify(x(526 downto 0));
    return y;
  end function structify;
  function nullify(x: lxa_req_fifo_rt) return lxa_req_fifo_rt is
    variable y : lxa_req_fifo_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

  function vectorify(x: row_to_mngt_rt) return row_to_mngt_rvt is
    variable y : row_to_mngt_rvt;
  begin
    y(4 downto 4)              := vectorify(x.done);
    y(3 downto 0)              := vectorify(x.err);
    return y;
  end function vectorify;
  function structify(x: row_to_mngt_rvt) return row_to_mngt_rt is
    variable y : row_to_mngt_rt;
  begin
    y.done                     := structify(x(4 downto 4));
    y.err                      := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify(x: row_to_mngt_rt) return row_to_mngt_rt is
    variable y : row_to_mngt_rt;
  begin
    y.done                     := nullify(x.done);
    y.err                      := nullify(x.err);
    return y;
  end function nullify;

  function vectorify(x: mngt_to_row_rt) return mngt_to_row_rvt is
    variable y : mngt_to_row_rvt;
  begin
    y(31 downto 28)            := vectorify(x.col_wr_en);
    y(27 downto 24)            := vectorify(x.col_rd_en);
    y(23 downto 12)            := vectorify(x.win_lower);
    y(11 downto 0)             := vectorify(x.win_width);
    return y;
  end function vectorify;
  function structify(x: mngt_to_row_rvt) return mngt_to_row_rt is
    variable y : mngt_to_row_rt;
  begin
    y.col_wr_en                := structify(x(31 downto 28));
    y.col_rd_en                := structify(x(27 downto 24));
    y.win_lower                := structify(x(23 downto 12));
    y.win_width                := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: mngt_to_row_rt) return mngt_to_row_rt is
    variable y : mngt_to_row_rt;
  begin
    y.col_wr_en                := nullify(x.col_wr_en);
    y.col_rd_en                := nullify(x.col_rd_en);
    y.win_lower                := nullify(x.win_lower);
    y.win_width                := nullify(x.win_width);
    return y;
  end function nullify;

  function vectorify(x: mngt_to_pkt_bldr_rt) return mngt_to_pkt_bldr_rvt is
    variable y : mngt_to_pkt_bldr_rvt;
  begin
    y(0 downto 0)              := vectorify(x.en);
    return y;
  end function vectorify;
  function structify(x: mngt_to_pkt_bldr_rvt) return mngt_to_pkt_bldr_rt is
    variable y : mngt_to_pkt_bldr_rt;
  begin
    y.en                       := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: mngt_to_pkt_bldr_rt) return mngt_to_pkt_bldr_rt is
    variable y : mngt_to_pkt_bldr_rt;
  begin
    y.en                       := nullify(x.en);
    return y;
  end function nullify;

  function vectorify(x: pkt_bldr_to_mngt_rt) return pkt_bldr_to_mngt_rvt is
    variable y : pkt_bldr_to_mngt_rvt;
  begin
    y(1 downto 1)              := vectorify(x.done);
    y(0 downto 0)              := vectorify(x.row_sel);
    return y;
  end function vectorify;
  function structify(x: pkt_bldr_to_mngt_rvt) return pkt_bldr_to_mngt_rt is
    variable y : pkt_bldr_to_mngt_rt;
  begin
    y.done                     := structify(x(1 downto 1));
    y.row_sel                  := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: pkt_bldr_to_mngt_rt) return pkt_bldr_to_mngt_rt is
    variable y : pkt_bldr_to_mngt_rt;
  begin
    y.done                     := nullify(x.done);
    y.row_sel                  := nullify(x.row_sel);
    return y;
  end function nullify;

  function vectorify(x: row_to_pkt_bldr_rt) return row_to_pkt_bldr_rvt is
    variable y : row_to_pkt_bldr_rvt;
  begin
    y(32 downto 17)            := vectorify(x.counter);
    y(16 downto 1)             := vectorify(x.data);
    y(0 downto 0)              := vectorify(x.nempty);
    return y;
  end function vectorify;
  function structify(x: row_to_pkt_bldr_rvt) return row_to_pkt_bldr_rt is
    variable y : row_to_pkt_bldr_rt;
  begin
    y.counter                  := structify(x(32 downto 17));
    y.data                     := structify(x(16 downto 1));
    y.nempty                   := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: row_to_pkt_bldr_rt) return row_to_pkt_bldr_rt is
    variable y : row_to_pkt_bldr_rt;
  begin
    y.counter                  := nullify(x.counter);
    y.data                     := nullify(x.data);
    y.nempty                   := nullify(x.nempty);
    return y;
  end function nullify;

  function vectorify(x: pkt_bldr_to_row_rt) return pkt_bldr_to_row_rvt is
    variable y : pkt_bldr_to_row_rvt;
  begin
    y(0 downto 0)              := vectorify(x.rd_strb);
    return y;
  end function vectorify;
  function structify(x: pkt_bldr_to_row_rvt) return pkt_bldr_to_row_rt is
    variable y : pkt_bldr_to_row_rt;
  begin
    y.rd_strb                  := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: pkt_bldr_to_row_rt) return pkt_bldr_to_row_rt is
    variable y : pkt_bldr_to_row_rt;
  begin
    y.rd_strb                  := nullify(x.rd_strb);
    return y;
  end function nullify;

  function vectorify(x: f2e_to_daq_algo_rt) return f2e_to_daq_algo_rvt is
    variable y : f2e_to_daq_algo_rvt;
  begin
    y(0 downto 0)              := vectorify(x.hfull);
    return y;
  end function vectorify;
  function structify(x: f2e_to_daq_algo_rvt) return f2e_to_daq_algo_rt is
    variable y : f2e_to_daq_algo_rt;
  begin
    y.hfull                    := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: f2e_to_daq_algo_rt) return f2e_to_daq_algo_rt is
    variable y : f2e_to_daq_algo_rt;
  begin
    y.hfull                    := nullify(x.hfull);
    return y;
  end function nullify;

  function vectorify(x: daq_algo_to_f2e_rt) return daq_algo_to_f2e_rvt is
    variable y : daq_algo_to_f2e_rvt;
  begin
    y(18 downto 18)            := vectorify(x.wr_en);
    y(17 downto 0)             := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: daq_algo_to_f2e_rvt) return daq_algo_to_f2e_rt is
    variable y : daq_algo_to_f2e_rt;
  begin
    y.wr_en                    := structify(x(18 downto 18));
    y.data                     := structify(x(17 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_algo_to_f2e_rt) return daq_algo_to_f2e_rt is
    variable y : daq_algo_to_f2e_rt;
  begin
    y.wr_en                    := nullify(x.wr_en);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: ctrl_to_daq_rt) return ctrl_to_daq_rvt is
    variable y : ctrl_to_daq_rvt;
  begin
    y(36 downto 36)            := vectorify(x.wr_en);
    y(35 downto 24)            := vectorify(x.latency);
    y(23 downto 12)            := vectorify(x.win_lower);
    y(11 downto 0)             := vectorify(x.win_upper);
    return y;
  end function vectorify;
  function structify(x: ctrl_to_daq_rvt) return ctrl_to_daq_rt is
    variable y : ctrl_to_daq_rt;
  begin
    y.wr_en                    := structify(x(36 downto 36));
    y.latency                  := structify(x(35 downto 24));
    y.win_lower                := structify(x(23 downto 12));
    y.win_upper                := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: ctrl_to_daq_rt) return ctrl_to_daq_rt is
    variable y : ctrl_to_daq_rt;
  begin
    y.wr_en                    := nullify(x.wr_en);
    y.latency                  := nullify(x.latency);
    y.win_lower                := nullify(x.win_lower);
    y.win_upper                := nullify(x.win_upper);
    return y;
  end function nullify;

  function vectorify(x: daq_to_ctrl_rt) return daq_to_ctrl_rvt is
    variable y : daq_to_ctrl_rvt;
  begin
    y(4 downto 4)              := vectorify(x.invalid_values);
    y(3 downto 0)              := vectorify(x.stability);
    return y;
  end function vectorify;
  function structify(x: daq_to_ctrl_rvt) return daq_to_ctrl_rt is
    variable y : daq_to_ctrl_rt;
  begin
    y.invalid_values           := structify(x(4 downto 4));
    y.stability                := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify(x: daq_to_ctrl_rt) return daq_to_ctrl_rt is
    variable y : daq_to_ctrl_rt;
  begin
    y.invalid_values           := nullify(x.invalid_values);
    y.stability                := nullify(x.stability);
    return y;
  end function nullify;

  function vectorify(x: row_generics_rt) return row_generics_rvt is
    variable y : row_generics_rvt;
  begin
    y(127 downto 96)           := vectorify(x.INPUT_DATA_LEN);
    y(95 downto 64)            := vectorify(x.OUTPUT_DATA_LEN);
    y(63 downto 32)            := vectorify(x.COUNTER_LEN);
    y(31 downto 0)             := vectorify(x.CELL_TYPE);
    return y;
  end function vectorify;
  function structify(x: row_generics_rvt) return row_generics_rt is
    variable y : row_generics_rt;
  begin
    y.INPUT_DATA_LEN           := structify(x(127 downto 96));
    y.OUTPUT_DATA_LEN          := structify(x(95 downto 64));
    y.COUNTER_LEN              := structify(x(63 downto 32));
    y.CELL_TYPE                := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: row_generics_rt) return row_generics_rt is
    variable y : row_generics_rt;
  begin
    y.INPUT_DATA_LEN           := nullify(x.INPUT_DATA_LEN);
    y.OUTPUT_DATA_LEN          := nullify(x.OUTPUT_DATA_LEN);
    y.COUNTER_LEN              := nullify(x.COUNTER_LEN);
    y.CELL_TYPE                := nullify(x.CELL_TYPE);
    return y;
  end function nullify;

  function vectorify(x: row_irt) return row_irvt is
    variable y : row_irvt;
  begin
    y(559 downto 558)          := vectorify(x.sys);
    y(557 downto 526)          := vectorify(x.mngt);
    y(525 downto 1)            := vectorify(x.stream);
    y(0 downto 0)              := vectorify(x.pkt_bldr);
    return y;
  end function vectorify;
  function structify(x: row_irvt) return row_irt is
    variable y : row_irt;
  begin
    y.sys                      := structify(x(559 downto 558));
    y.mngt                     := structify(x(557 downto 526));
    y.stream                   := structify(x(525 downto 1));
    y.pkt_bldr                 := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: row_irt) return row_irt is
    variable y : row_irt;
  begin
    y.sys                      := nullify(x.sys);
    y.mngt                     := nullify(x.mngt);
    y.stream                   := nullify(x.stream);
    y.pkt_bldr                 := nullify(x.pkt_bldr);
    return y;
  end function nullify;

  function vectorify(x: row_ort) return row_orvt is
    variable y : row_orvt;
  begin
    y(37 downto 33)            := vectorify(x.mngt);
    y(32 downto 0)             := vectorify(x.pkt_bldr);
    return y;
  end function vectorify;
  function structify(x: row_orvt) return row_ort is
    variable y : row_ort;
  begin
    y.mngt                     := structify(x(37 downto 33));
    y.pkt_bldr                 := structify(x(32 downto 0));
    return y;
  end function structify;
  function nullify(x: row_ort) return row_ort is
    variable y : row_ort;
  begin
    y.mngt                     := nullify(x.mngt);
    y.pkt_bldr                 := nullify(x.pkt_bldr);
    return y;
  end function nullify;

  function vectorify(x: row_rt) return row_rvt is
    variable y : row_rvt;
  begin
    y(597 downto 38)           := vectorify(x.i);
    y(37 downto 0)             := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: row_rvt) return row_rt is
    variable y : row_rt;
  begin
    y.i                        := structify(x(597 downto 38));
    y.o                        := structify(x(37 downto 0));
    return y;
  end function structify;
  function nullify(x: row_rt) return row_rt is
    variable y : row_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

  function vectorify(x: row_bus_at) return row_bus_avt is
    variable y :  row_bus_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: row_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*598-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-598) := vectorify(x(i));
      msb := msb - 598 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: row_bus_avt) return row_bus_at is
    variable y :  row_bus_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return row_bus_at is
    variable y :  row_bus_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-598));
      msb := msb - 598 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: row_bus_at) return row_bus_at is
    variable y :  row_bus_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: row_bus_avt) return row_bus_avt is
    variable y :  row_bus_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pkt_bldr_generics_rt) return pkt_bldr_generics_rvt is
    variable y : pkt_bldr_generics_rvt;
  begin
    y(31 downto 0)             := vectorify(x.PAYLOAD_LEN);
    return y;
  end function vectorify;
  function structify(x: pkt_bldr_generics_rvt) return pkt_bldr_generics_rt is
    variable y : pkt_bldr_generics_rt;
  begin
    y.PAYLOAD_LEN              := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: pkt_bldr_generics_rt) return pkt_bldr_generics_rt is
    variable y : pkt_bldr_generics_rt;
  begin
    y.PAYLOAD_LEN              := nullify(x.PAYLOAD_LEN);
    return y;
  end function nullify;

  function vectorify(x: pkt_bldr_irt) return pkt_bldr_irvt is
    variable y : pkt_bldr_irvt;
  begin
    y(36 downto 35)            := vectorify(x.sys);
    y(34 downto 34)            := vectorify(x.mngt);
    y(33 downto 1)             := vectorify(x.row);
    y(0 downto 0)              := vectorify(x.f2e);
    return y;
  end function vectorify;
  function structify(x: pkt_bldr_irvt) return pkt_bldr_irt is
    variable y : pkt_bldr_irt;
  begin
    y.sys                      := structify(x(36 downto 35));
    y.mngt                     := structify(x(34 downto 34));
    y.row                      := structify(x(33 downto 1));
    y.f2e                      := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: pkt_bldr_irt) return pkt_bldr_irt is
    variable y : pkt_bldr_irt;
  begin
    y.sys                      := nullify(x.sys);
    y.mngt                     := nullify(x.mngt);
    y.row                      := nullify(x.row);
    y.f2e                      := nullify(x.f2e);
    return y;
  end function nullify;

  function vectorify(x: pkt_bldr_ort) return pkt_bldr_orvt is
    variable y : pkt_bldr_orvt;
  begin
    y(21 downto 20)            := vectorify(x.mngt);
    y(19 downto 19)            := vectorify(x.row);
    y(18 downto 0)             := vectorify(x.f2e);
    return y;
  end function vectorify;
  function structify(x: pkt_bldr_orvt) return pkt_bldr_ort is
    variable y : pkt_bldr_ort;
  begin
    y.mngt                     := structify(x(21 downto 20));
    y.row                      := structify(x(19 downto 19));
    y.f2e                      := structify(x(18 downto 0));
    return y;
  end function structify;
  function nullify(x: pkt_bldr_ort) return pkt_bldr_ort is
    variable y : pkt_bldr_ort;
  begin
    y.mngt                     := nullify(x.mngt);
    y.row                      := nullify(x.row);
    y.f2e                      := nullify(x.f2e);
    return y;
  end function nullify;

  function vectorify(x: pkt_bldr_rt) return pkt_bldr_rvt is
    variable y : pkt_bldr_rvt;
  begin
    y(58 downto 22)            := vectorify(x.i);
    y(21 downto 0)             := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: pkt_bldr_rvt) return pkt_bldr_rt is
    variable y : pkt_bldr_rt;
  begin
    y.i                        := structify(x(58 downto 22));
    y.o                        := structify(x(21 downto 0));
    return y;
  end function structify;
  function nullify(x: pkt_bldr_rt) return pkt_bldr_rt is
    variable y : pkt_bldr_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

  function vectorify(x: algo_irt) return algo_irvt is
    variable y : algo_irvt;
  begin
    y(645 downto 644)          := vectorify(x.sys);
    y(643 downto 563)          := vectorify(x.ttc);
    y(562 downto 526)          := vectorify(x.ctrl);
    y(525 downto 1)            := vectorify(x.stream_bus);
    y(0 downto 0)              := vectorify(x.f2e);
    return y;
  end function vectorify;
  function structify(x: algo_irvt) return algo_irt is
    variable y : algo_irt;
  begin
    y.sys                      := structify(x(645 downto 644));
    y.ttc                      := structify(x(643 downto 563));
    y.ctrl                     := structify(x(562 downto 526));
    y.stream_bus               := structify(x(525 downto 1));
    y.f2e                      := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: algo_irt) return algo_irt is
    variable y : algo_irt;
  begin
    y.sys                      := nullify(x.sys);
    y.ttc                      := nullify(x.ttc);
    y.ctrl                     := nullify(x.ctrl);
    y.stream_bus               := nullify(x.stream_bus);
    y.f2e                      := nullify(x.f2e);
    return y;
  end function nullify;

  function vectorify(x: algo_ort) return algo_orvt is
    variable y : algo_orvt;
  begin
    y(23 downto 19)            := vectorify(x.ctrl);
    y(18 downto 0)             := vectorify(x.f2e);
    return y;
  end function vectorify;
  function structify(x: algo_orvt) return algo_ort is
    variable y : algo_ort;
  begin
    y.ctrl                     := structify(x(23 downto 19));
    y.f2e                      := structify(x(18 downto 0));
    return y;
  end function structify;
  function nullify(x: algo_ort) return algo_ort is
    variable y : algo_ort;
  begin
    y.ctrl                     := nullify(x.ctrl);
    y.f2e                      := nullify(x.f2e);
    return y;
  end function nullify;

  function vectorify(x: algo_rt) return algo_rvt is
    variable y : algo_rvt;
  begin
    y(669 downto 24)           := vectorify(x.i);
    y(23 downto 0)             := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: algo_rvt) return algo_rt is
    variable y : algo_rt;
  begin
    y.i                        := structify(x(669 downto 24));
    y.o                        := structify(x(23 downto 0));
    return y;
  end function structify;
  function nullify(x: algo_rt) return algo_rt is
    variable y : algo_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

  function vectorify(x: algo_bus_at) return algo_bus_avt is
    variable y :  algo_bus_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: algo_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*670-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-670) := vectorify(x(i));
      msb := msb - 670 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: algo_bus_avt) return algo_bus_at is
    variable y :  algo_bus_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return algo_bus_at is
    variable y :  algo_bus_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-670));
      msb := msb - 670 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: algo_bus_at) return algo_bus_at is
    variable y :  algo_bus_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: algo_bus_avt) return algo_bus_avt is
    variable y :  algo_bus_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: f2e_to_daq_top_at) return f2e_to_daq_top_avt is
    variable y :  f2e_to_daq_top_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: f2e_to_daq_top_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*1-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-1) := vectorify(x(i));
      msb := msb - 1 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: f2e_to_daq_top_avt) return f2e_to_daq_top_at is
    variable y :  f2e_to_daq_top_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return f2e_to_daq_top_at is
    variable y :  f2e_to_daq_top_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-1));
      msb := msb - 1 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: f2e_to_daq_top_at) return f2e_to_daq_top_at is
    variable y :  f2e_to_daq_top_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: f2e_to_daq_top_avt) return f2e_to_daq_top_avt is
    variable y :  f2e_to_daq_top_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: daq_flow_bus_at) return daq_flow_bus_avt is
    variable y :  daq_flow_bus_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: daq_flow_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*525-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-525) := vectorify(x(i));
      msb := msb - 525 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: daq_flow_bus_avt) return daq_flow_bus_at is
    variable y :  daq_flow_bus_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return daq_flow_bus_at is
    variable y :  daq_flow_bus_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-525));
      msb := msb - 525 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: daq_flow_bus_at) return daq_flow_bus_at is
    variable y :  daq_flow_bus_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: daq_flow_bus_avt) return daq_flow_bus_avt is
    variable y :  daq_flow_bus_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: top_irt) return top_irvt is
    variable y : top_irvt;
  begin
    y(3275 downto 3274)        := vectorify(x.sys);
    y(3273 downto 3193)        := vectorify(x.ttc);
    y(3192 downto 3156)        := vectorify(x.ctrl);
    y(3155 downto 6)           := vectorify(x.flow_bus);
    y(5 downto 0)              := vectorify(x.f2e_bus);
    return y;
  end function vectorify;
  function structify(x: top_irvt) return top_irt is
    variable y : top_irt;
  begin
    y.sys                      := structify(x(3275 downto 3274));
    y.ttc                      := structify(x(3273 downto 3193));
    y.ctrl                     := structify(x(3192 downto 3156));
    y.flow_bus                 := structify(x(3155 downto 6));
    y.f2e_bus                  := structify(x(5 downto 0));
    return y;
  end function structify;
  function nullify(x: top_irt) return top_irt is
    variable y : top_irt;
  begin
    y.sys                      := nullify(x.sys);
    y.ttc                      := nullify(x.ttc);
    y.ctrl                     := nullify(x.ctrl);
    y.flow_bus                 := nullify(x.flow_bus);
    y.f2e_bus                  := nullify(x.f2e_bus);
    return y;
  end function nullify;

  function vectorify(x: daq_top_to_ext_ctrl_at) return daq_top_to_ext_ctrl_avt is
    variable y :  daq_top_to_ext_ctrl_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: daq_top_to_ext_ctrl_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*5-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-5) := vectorify(x(i));
      msb := msb - 5 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: daq_top_to_ext_ctrl_avt) return daq_top_to_ext_ctrl_at is
    variable y :  daq_top_to_ext_ctrl_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return daq_top_to_ext_ctrl_at is
    variable y :  daq_top_to_ext_ctrl_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-5));
      msb := msb - 5 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: daq_top_to_ext_ctrl_at) return daq_top_to_ext_ctrl_at is
    variable y :  daq_top_to_ext_ctrl_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: daq_top_to_ext_ctrl_avt) return daq_top_to_ext_ctrl_avt is
    variable y :  daq_top_to_ext_ctrl_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: daq_top_to_ext_f2e_at) return daq_top_to_ext_f2e_avt is
    variable y :  daq_top_to_ext_f2e_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: daq_top_to_ext_f2e_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*19-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-19) := vectorify(x(i));
      msb := msb - 19 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: daq_top_to_ext_f2e_avt) return daq_top_to_ext_f2e_at is
    variable y :  daq_top_to_ext_f2e_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return daq_top_to_ext_f2e_at is
    variable y :  daq_top_to_ext_f2e_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-19));
      msb := msb - 19 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: daq_top_to_ext_f2e_at) return daq_top_to_ext_f2e_at is
    variable y :  daq_top_to_ext_f2e_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: daq_top_to_ext_f2e_avt) return daq_top_to_ext_f2e_avt is
    variable y :  daq_top_to_ext_f2e_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: top_ort) return top_orvt is
    variable y : top_orvt;
  begin
    y(143 downto 114)          := vectorify(x.ctrl_bus);
    y(113 downto 0)            := vectorify(x.f2e_bus);
    return y;
  end function vectorify;
  function structify(x: top_orvt) return top_ort is
    variable y : top_ort;
  begin
    y.ctrl_bus                 := structify(x(143 downto 114));
    y.f2e_bus                  := structify(x(113 downto 0));
    return y;
  end function structify;
  function nullify(x: top_ort) return top_ort is
    variable y : top_ort;
  begin
    y.ctrl_bus                 := nullify(x.ctrl_bus);
    y.f2e_bus                  := nullify(x.f2e_bus);
    return y;
  end function nullify;

  function vectorify(x: top_rt) return top_rvt is
    variable y : top_rvt;
  begin
    y(669 downto 24)           := vectorify(x.i);
    y(23 downto 0)             := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: top_rvt) return top_rt is
    variable y : top_rt;
  begin
    y.i                        := structify(x(669 downto 24));
    y.o                        := structify(x(23 downto 0));
    return y;
  end function structify;
  function nullify(x: top_rt) return top_rt is
    variable y : top_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

end package body daq_defs_pkg;
