
##################################################
# autogenerated file
# created by tb create on: 03-Jun-2020 (10:30:39)
# created by tb create for test: mtc
##################################################

##############################################################################
#
# THE USER MUST NOT EDIT THESE LINES
#
##############################################################################
$(info *** SIM_BUILD=$(SIM_BUILD))
$(info *** TESTBENCH_TOPLEVEL=$(TESTBENCH_TOPLEVEL))
$(info *** TESTBENCH_TEST_MODULE=$(TESTBENCH_TEST_MODULE))
$(info *** COMPONENTS_LIB_DIR=$(COMPONENTS_LIB_DIR))


# CocoTB configuration
TOPLEVEL=$(TESTBENCH_TOPLEVEL)
MODULE=$(TESTBENCH_TEST_MODULE)

##############################################################################
#
# BELOW HERE THE USER CAN EDIT THE LINES
#
##############################################################################

SIM ?= questa

# Location of HDL source files
SRCDIR = $(PWD)/../../../../../../../
SBDIR = $(SRCDIR)/IP_repository/SpyBuffer/src
MTCDIR = $(SRCDIR)/UserLogic/mtc/src
DFDIR  = $(SRCDIR)/dataformats

RTL_LIBRARY = shared_lib

# Specify TopLevel language for cocotb
TOPLEVEL_LANG=verilog

# Verilog source files
VERILOG_SOURCES = \
    $(DFDIR)/l0mdt_buses_constants.svh \
    $(PWD)/$(TESTBENCH_TOPLEVEL).v \
    $(MTCDIR)/mtc_builder_verilog.sv

# VHDL source files
#VHDL_SOURCES = \
#    $(MTCDIR)/../../shared/types/common_ieee_pkg.vhd \
#    $(MTCDIR)/../../shared/config/config_defaults_pkg.vhd \
#    $(MTCDIR)/../../shared/config/config_pkg.vhd \
#    $(MTCDIR)/../../shared/detector_parameters/detector_param_pkg.vhd \
#    $(MTCDIR)/../../shared/detector_parameters/gtube2chamber_pkg.vhd \
#    $(MTCDIR)/../../shared/functions/vhdl2008_functions_pkg.vhd \
#    $(MTCDIR)/../../dataformats/l0mdt_constants_pkg.vhd \
#    $(MTCDIR)/../../dataformats/l0mdt_dataformats_pkg.vhd \
#    $(MTCDIR)/../../shared/types/common_constants_pkg.vhd \
#    $(MTCDIR)/../../shared/types/common_types_pkg.vhd \
#    $(MTCDIR)/../top_mtc.vhd

# Set the include path and compilation flags for CocoTB
EXTRA_ARGS += +incdir+$(SRCDIR) +incdir+$(DFDIR) +incdir+$(MTCDIR) -L $(COMPONENTS_LIB_DIR)/unisims_ver
VSIM_ARGS  += -debugDB -voptargs=+acc -wlf $(SIM_BUILD)/mtc.wlf

##############################################################################
#
# THE USER MUST NOT EDIT THESE LINES
#
##############################################################################
include $(shell cocotb-config --makefiles)/Makefile.inc
include $(shell cocotb-config --makefiles)/Makefile.sim
