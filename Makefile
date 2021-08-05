XML_FILES=$(shell find HAL/ctrl/src -name *.xml -type l)
MAP_OBJS = $(patsubst %.xml, %_map.vhd, $(XML_FILES))
PKG_OBJS = $(patsubst %.xml, %_PKG.vhd, $(XML_FILES))
YML_OBJS = $(patsubst %.xml, %_PKG.yml, $(XML_FILES))
DEF_OBJS = $(patsubst %.xml, %_PKG_DEF.vhd, $(XML_FILES))
SVH_OBJS = $(patsubst %.xml, %_PKG.svh, $(XML_FILES))

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

clean_regmap:
	@rm -rf $(MAP_OBJS) $(PKG_OBJS) $(YML_OBJS) $(DEF_OBJS) $(SVH_OBJS)

# Updates the yml2hdl type system
types:
	make -C shared/types

# Generates different flavors of the MDT firmware based on Top/mdt_flavors.yml
flavors:
	tclsh Top/generate_mdt_flavors.tcl

# Update the XML2VHDL register map
regmap : $(MAP_OBJS)

# Update the XML2VHDL register map
%_map.vhd %_PKG.vhd : %.xml
	@python regmap/build_vhdl_packages.py \
			-y 2 \
			-s True \
			-x address_tables/modules/$(basename $(notdir $<)).xml \
			-o  $(dir $<) \
			--mapTemplate templates/axi_generic/template_map_withbram.vhd \
        $(basename $(notdir $<))

	@python3 tools/yml2hdl/yml2hdl.py -p $(basename $(notdir $<))_CTRL \
			$(patsubst %.xml,%_PKG.yml,$<)

all:
	make clean_regmap
	make -j8 regmap
	make types
	make flavors

clean: clean_regmap
