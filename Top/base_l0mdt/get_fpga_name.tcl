set FPGA [exec sed -n s|\\s*\\(PART\\)\\s*=\\s*\\(\[0-9,A-z\]*\\)|\\2|p "[file dirname [info script]]/hog.conf"]
regexp {xc([0-9A-z]*)} $FPGA match fpga_shortname
