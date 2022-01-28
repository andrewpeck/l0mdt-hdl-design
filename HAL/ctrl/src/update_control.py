#!/usr/bin/env python3

from insert_code import insert_code

FILENAME = "top_control.vhd"

ULT_SLAVES = [
    "hps_inn",
    "hps_mid",
    "hps_out",
    "hps_ext",
    "tar_inn",
    "tar_mid",
    "tar_out",
    "tar_ext",
    "mtc",
    "ucm",
    "daq",
    "tf",
    "mpl"]


def strip_station(s):
    for station in ["_inn", "_mid", "_out", "_ext"]:
        s = s.replace(station, "")
    return s

def write_axi_signals(filename):

    f = filename

    padding = "  "
    for slave in ULT_SLAVES:
        f.write('%ssignal %s_readmosi  : axireadmosi;\n' % (padding, slave))
        f.write('%ssignal %s_readmiso  : axireadmiso;\n' % (padding, slave))
        f.write('%ssignal %s_writemosi : axiwritemosi;\n' % (padding, slave))
        f.write('%ssignal %s_writemiso : axiwritemiso;\n' % (padding, slave))
        f.write('%ssignal %s_ctrl_r    : %s_CTRL_t;\n' % (padding, slave, strip_station(slave).upper()))
        f.write('%ssignal %s_mon_r     : %s_MON_t;\n' % (padding, slave, strip_station(slave).upper()))

        f.write('\n')

def write_ult_io(filename):

    f = filename

    padding = "    "
    for slave in ULT_SLAVES:
        f.write('%s%s_ctrl : out %s_CTRL_t;\n' % (padding, slave, strip_station(slave).upper()))
        f.write('%s%s_mon  : in  %s_MON_t;\n' % (padding, slave, strip_station(slave).upper()))
        f.write('\n')

def write_ult_ports(filename):

    f = filename

    padding = "      "
    for slave in ULT_SLAVES:
        f.write('%s%s_araddr  => %s_readmosi.address,\n' % (padding, slave, slave))
        f.write('%s%s_arprot  => %s_readmosi.protection_type,\n' % (padding, slave, slave))
        f.write('%s%s_arready => %s_readmiso.ready_for_address,\n' % (padding, slave, slave))
        f.write('%s%s_arvalid => %s_readmosi.address_valid,\n' % (padding, slave, slave))
        f.write('%s%s_awaddr  => %s_writemosi.address,\n' % (padding, slave, slave))
        f.write('%s%s_awprot  => %s_writemosi.protection_type,\n' % (padding, slave, slave))
        f.write('%s%s_awready => %s_writemiso.ready_for_address,\n' % (padding, slave, slave))
        f.write('%s%s_awvalid => %s_writemosi.address_valid,\n' % (padding, slave, slave))
        f.write('%s%s_bready  => %s_writemosi.ready_for_response,\n' % (padding, slave, slave))
        f.write('%s%s_bresp   => %s_writemiso.response,\n' % (padding, slave, slave))
        f.write('%s%s_bvalid  => %s_writemiso.response_valid,\n' % (padding, slave, slave))
        f.write('%s%s_rdata   => %s_readmiso.data,\n' % (padding, slave, slave))
        f.write('%s%s_rready  => %s_readmosi.ready_for_data,\n' % (padding, slave, slave))
        f.write('%s%s_rresp   => %s_readmiso.response,\n' % (padding, slave, slave))
        f.write('%s%s_rvalid  => %s_readmiso.data_valid,\n' % (padding, slave, slave))
        f.write('%s%s_wdata   => %s_writemosi.data,\n' % (padding, slave, slave))
        f.write('%s%s_wready  => %s_writemiso.ready_for_data,\n' % (padding, slave, slave))
        f.write('%s%s_wstrb   => %s_writemosi.data_write_strobe,\n' % (padding, slave, slave))
        f.write('%s%s_wvalid  => %s_writemosi.data_valid,\n' % (padding, slave, slave))

        f.write('\n')

def write_ult_slaves(filename):

    f = filename

    padding = "    "
    for slave in ULT_SLAVES:
        f.write('%s%s_map_inst : entity ctrl_lib.%s_map\n' % (padding, slave, strip_station(slave)))
        f.write('%sport map (\n' % (padding))
        f.write('%s  clk_axi         => clk40,\n' % (padding))
        f.write('%s  reset_axi_n     => std_logic1,\n' % (padding))
        f.write('%s  slave_readmosi  => %s_readmosi,\n' % (padding, slave))
        f.write('%s  slave_readmiso  => %s_readmiso,\n' % (padding, slave))
        f.write('%s  slave_writemosi => %s_writemosi,\n' % (padding, slave))
        f.write('%s  slave_writemiso => %s_writemiso,\n' % (padding, slave))

        f.write('%s  -- monitor signals in\n' % (padding))
        f.write('%s  mon  => %s_mon_r,\n' % (padding, slave))
        f.write('%s  -- control signals out\n' % (padding))
        f.write('%s  ctrl => %s_ctrl_r\n' % (padding, slave))
        f.write('%s  );\n' % (padding))

        f.write('\n')


MARKER_START = "-- START: ULT_IO :: DO NOT EDIT"
MARKER_END = "-- END: ULT_IO :: DO NOT EDIT"
insert_code(FILENAME, FILENAME, MARKER_START, MARKER_END, write_ult_io)

MARKER_START = "-- START: ULT_AXI_SIGNALS :: DO NOT EDIT"
MARKER_END = "-- END: ULT_AXI_SIGNALS :: DO NOT EDIT"
insert_code(FILENAME, FILENAME, MARKER_START, MARKER_END, write_axi_signals)

MARKER_START = "-- START: ULT_PORTS :: DO NOT EDIT"
MARKER_END = "-- END: ULT_PORTS :: DO NOT EDIT"
insert_code(FILENAME, FILENAME, MARKER_START, MARKER_END, write_ult_ports)

MARKER_START = "-- START: ULT_SLAVES :: DO NOT EDIT"
MARKER_END = "-- END: ULT_SLAVES :: DO NOT EDIT"
insert_code(FILENAME, FILENAME, MARKER_START, MARKER_END, write_ult_slaves)
