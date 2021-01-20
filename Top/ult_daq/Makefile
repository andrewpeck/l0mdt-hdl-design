mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))
proj := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

proj:
	cd "$(mkfile_dir)" && "../../Hog/CreateProject.sh" "$(proj)"
	cd "$(mkfile_dir)" && make clean

gui:
	cd "$(mkfile_dir)" && vivado "../../VivadoProject/$(proj)/$(proj).xpr"
	cd "$(mkfile_dir)" && make clean

clean:
	cd "$(mkfile_dir)" && $(RM) *.jou *.log *.str *.tmp vivado*

clean_proj:
	cd "$(mkfile_dir)" && $(RM) -r "../../VivadoProject/$(proj)"

clean_pkgs:
	cd "$(mkfile_dir)" && make -C "../../types" clean
	cd "$(mkfile_dir)" && make -C "../../ttc/pkg" clean 
	cd "$(mkfile_dir)" && make -C "../../daq/pkg" clean

clean_all: clean_pkgs clean_proj clean
