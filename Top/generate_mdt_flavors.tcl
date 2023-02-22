#/usr/bin/env tclsh

package require yaml

set script_path "[file normalize [file dirname [info script]]]"

proc update_trigger_libs {lib pt_calc segment_finder fpga_short} {

    exec sed -i  "s/ku15p/${fpga_short}/g" $lib

    exec sed -i  "s/hal_.*.src/hal_[string range ${fpga_short} 0 1].src/g" $lib

    if {[string compare "upt" $pt_calc]==0} {
        # enable upt
        exec sed -i  "s/^#\\(UserLogic.*upt_lib_${fpga_short}.src\\)/\\1/g" $lib
        # disable upt empty
        exec sed -i  "s/^UserLogic.*upt_lib_empty.src/#&/g" $lib
    } else {
        # disable upt
        exec sed -i  "s/^UserLogic.*upt_lib_${fpga_short}.src/#&/g" $lib
        # enable upt empty
        exec sed -i  "s/^#\\(UserLogic.*upt_lib_empty.src\\)/\\1/g" $lib
    }

    if {[string compare "mpt" $pt_calc]==0} {
        # enable ptc
        exec sed -i  "s/^#\\(UserLogic.*ptc_lib.src\\)/\\1/g" $lib
    } else {
        # disable ptc
        exec sed -i  "s/^UserLogic.*ptc_lib.src/#&/g" $lib
    }

    if {[string compare "lsf" $segment_finder]==0} {
        # enable lsf
        exec sed -i  "s/^#\\(UserLogic.*lsf_lib_${fpga_short}.src\\)/\\1/g" $lib
        # disable lsf empty
        exec sed -i  "s/^UserLogic.*lsf_lib_empty.src/#&/g" $lib
    } else {
        # disable lsf
        exec sed -i  "s/^UserLogic.*lsf_lib_${fpga_short}.src/#&/g" $lib
        # enable empty lsf
        exec sed -i  "s/^#\\(UserLogic.*lsf_lib_empty.src\\)/\\1/g" $lib
    }

    # need to keep csf lib in the sources for now, since
    # hps_sf_wrap.vhd has many '0' and others => '0' in the instantiation
    # of the csf, so xilinx fails with
    # errors e.g. ERROR near character '0' ; 3 visible types match here
    #
    # if the hps_sf_wrap module gets updated to actually connect all of the
    # input ports then this can be uncommented
    #
    # if {[string compare "csf" $segment_finder]==0} {
    #     # enable csf
    #     exec sed -i  "s/^#\\(UserLogic.*csf_lib.src\\)/\\1/g" $lib
    # } else {
    #     # disable csf
    #     exec sed -i  "s/^UserLogic.*csf_lib.src/#&/g" $lib
    # }
}

proc replace_prj_cfg_std_logic {entry new_value dest_file} {
    exec sed -i s|\\(proj_cfg.${entry}\\s*:=\\s*'\\)\\(\[0-1\]\\)|\\1${new_value}|g $dest_file
}

proc replace_prj_cfg_int {entry new_value dest_file} {
    exec sed -i s,\\(proj_cfg.${entry}\\s*:=\\s*\\)\\(\[0-9\]*\\),\\1${new_value},g $dest_file
}

proc replace_constant_int {entry new_value dest_file} {
    exec sed -i s,\\(constant\\s*${entry}\\s*:\\s*integer\\s*:=\\s*\\)\\(\\-\\?\[0-9\]*\\),\\1${new_value},g $dest_file
    # puts sed -i s,\\(constant\\s*${entry}\\s*:\\s*integer\\s*:=\\s*\\)\\(-\?\[0-9\]*\\),\\1${new_value},g $dest_file
}

proc update_hal_config {dest_file props} {
    # default values
    set csm_links -1
    set tdc_links -1
    set lpgbt_uplinks -1
    set lpgbt_downlinks -1

    # destructure the input properties into variables
    foreach prop [huddle keys $props] {
        set $prop [huddle get_stripped $props $prop]
    }

    replace_constant_int user_CSM_LINKS ${csm_links} ${dest_file}
    replace_constant_int user_TDC_INPUTS ${tdc_links} ${dest_file}
    replace_constant_int user_LPGBT_UPLINKS ${lpgbt_uplinks} ${dest_file}
    replace_constant_int user_LPGBT_DOWNLINKS ${lpgbt_downlinks} ${dest_file}
}

proc update_prj_config {dest_file segment_finder pt_calc props} {

    # find + replace the csf vs. lsf, mpt vs. upt choices
    if {0 == [string compare ${segment_finder} "lsf"]} {
        set sf_type 1
    } else {
        set sf_type 0
    }

    # find + replace the csf vs. lsf, mpt vs. upt choices
    if {0 == [string compare ${pt_calc} "upt"]} {
        set pt_type 1
    } else {
        set pt_type 0
    }

    # default values
    set sector_id 3
    set sector_side 0
    set endcap 0
    set large 0
    set en_neighbors 0

    # module enables
    set en_daq 1
    set en_h2s 1
    set en_ucm 1
    set en_mpl 1
    set en_sf 1
    set en_fm 1
    set en_pt 1
    set en_mtc 1
    set en_tar 1

    # destructure the input properties into variables
    foreach prop [huddle keys $props] {
        set $prop [huddle get_stripped $props $prop]
    }

    # update the SF_TYPE and PT_TYPE
    replace_prj_cfg_std_logic SF_TYPE ${sf_type} ${dest_file}
    replace_prj_cfg_std_logic PT_TYPE ${pt_type} ${dest_file}
    replace_prj_cfg_std_logic ENABLE_NEIGHBORS ${en_neighbors} ${dest_file}
    replace_prj_cfg_std_logic ENDCAP_nSMALL_LARGE ${large} ${dest_file}
    replace_prj_cfg_std_logic ST_nBARREL_ENDCAP ${endcap} ${dest_file}

    replace_prj_cfg_std_logic ENABLE_DAQ ${en_daq} ${dest_file}
    replace_prj_cfg_std_logic ENABLE_FM  ${en_fm}  ${dest_file}
    replace_prj_cfg_std_logic ENABLE_SF  ${en_sf}  ${dest_file}
    replace_prj_cfg_std_logic ENABLE_PT  ${en_pt}  ${dest_file}
    replace_prj_cfg_std_logic ENABLE_UCM ${en_ucm} ${dest_file}
    replace_prj_cfg_std_logic ENABLE_H2S ${en_h2s} ${dest_file}
    replace_prj_cfg_std_logic ENABLE_MPL ${en_mpl} ${dest_file}
    replace_prj_cfg_std_logic ENABLE_MTC ${en_mtc} ${dest_file}
    replace_prj_cfg_std_logic ENABLE_TAR ${en_tar} ${dest_file}

    replace_prj_cfg_int SECTOR_SIDE ${sector_side} ${dest_file}
    replace_prj_cfg_int SECTOR_ID ${sector_id} ${dest_file}
}

proc clone_mdt_project {top_path name fpga board_pkg pt_calc segment_finder constraints link_map props} {

    # default values
    set hog_only_synth 0
    set hog_no_bitstream 0 
    set hog_check_syntax 0
    set hog_chk 0
    set hog_tag "heavy-duty"
    set zynq_target usp

    # destructure the input properties into variables
    foreach prop [huddle keys $props] {
        set $prop [huddle get_stripped $props $prop]
    }

    regexp {xc([0-9A-z]*)} $fpga match fpga_shortname

    set source_path ${top_path}/base_l0mdt
    set dest_path ${top_path}/$name

    file mkdir $dest_path
    file mkdir $dest_path/list

    # copy the base files
    set files_to_copy "get_fpga_name.tcl gitlab-ci.yml hog.conf
    list
    pre-synthesis.tcl
    user_pkg.vhd
    post-bitstream.tcl
    post-creation.tcl prj_cfg.vhd address_tables top_control.vhd top_l0mdt.vhd slaves.yaml"

    foreach file $files_to_copy {
        # file copy -force ${source_path}/$file ${dest_path}
        exec cp -r ${source_path}/$file ${dest_path}
    }

    # update the link mapping
    exec sed -i "s|HAL/link_maps/.*$|HAL/link_maps/${link_map}.vhd|g" "$dest_path/list/hal.src"

    # update hog.conf
    file rename -force "$dest_path/hog.conf" "$dest_path/hog.conf"

    # replace fpga shortname
    exec sed -i "s/ku15p/${fpga_shortname}/g" "$dest_path/hog.conf"
    exec sed -i "s/vu13p/${fpga_shortname}/g" "$dest_path/hog.conf"

    # update fpga part number
    exec sed -i "s|PART=.*$|PART=$fpga|g" "$dest_path/hog.conf"
    exec sed -i "s|PART=.*$|PART=$fpga|g" "$dest_path/hog.conf"

    # update zynq target
    if {$zynq_target == "usp"} {
        exec sed -i "s|^set.*AXI_BASE_ADDRESS.*0x.*|set AXI_BASE_ADDRESS 0xB0000000 ; # USP|g" "$dest_path/post-creation.tcl"
    } elseif {$zynq_target == "7s"} {
        exec sed -i "s|^set.*AXI_BASE_ADDRESS.+0x.*|set AXI_BASE_ADDRESS 0x80000000 ; # 7-Series|g" "$dest_path/post-creation.tcl"
    } else {
        error "Unrecognized zynq target \"$zynq_target\""
    }

    # create the board specific constraints
    set brd_con [open "$dest_path/list/board.con" w+]
    foreach constraint_file $constraints {
        puts $brd_con "HAL/constraints/$constraint_file"
    }
    close $brd_con

    # update the libraries
    update_trigger_libs "$dest_path/list/l0mdt.src" \
        $pt_calc $segment_finder $fpga_shortname

    # update the board package
    set board_pkg_dir {HAL/boards/}
    set foo ${board_pkg_dir}.*board_pkg.*.vhd
    set bar ${board_pkg_dir}${board_pkg}.vhd
    set re "s|${foo}|${bar}|g"
    exec sed -i $re "$dest_path/list/hal.src"

    # update the project/hal configs
    update_prj_config "$dest_path/prj_cfg.vhd" $segment_finder $pt_calc $props
    update_hal_config "$dest_path/user_pkg.vhd" $props

    # update the hal.src file
    exec sed -i "s|base_l0mdt|${name}|g" "$dest_path/list/hal.src"

    # update the ctrl_lib.src file
    # exec sed -i "s|base_l0mdt|${name}|g" "$dest_path/list/ctrl_lib.src"

    # update the l0mdt.src file
    exec sed -i "s|base_l0mdt|${name}|g" "$dest_path/list/l0mdt.src"

    # update the project_lib.src file
    exec sed -i "s|base_l0mdt|${name}|g" "$dest_path/list/project_lib.src"

    # update the gitlab ci file
    exec sed -i "s|base_l0mdt|${name}|g" "$dest_path/gitlab-ci.yml"

    # change the gitlab-ci hog_only_synth property
    exec sed -i "s|\\(.*HOG_ONLY_SYNTH:\\).*\\(#.*\\)|\\1 $hog_only_synth \\2|g" "$dest_path/gitlab-ci.yml"
    puts "$hog_only_synth"
    # change the gitlab-ci hog_check_syntax property
    exec sed -i "s|\\(.*HOG_CHECK_SYNTAX:\\).*\\(#.*\\)|\\1 $hog_check_syntax \\2|g" "$dest_path/gitlab-ci.yml"

    # change the gitlab-ci hog_no_bitstream property
    exec sed -i "s|\\(.*HOG_NO_BITSTREAM:\\).*\\(.*\\)|\\1 $hog_no_bitstream \\2|g" "$dest_path/gitlab-ci.yml"

    # update the tag
    exec sed -i "s|- heavy-duty|- ${hog_tag}|g" "$dest_path/gitlab-ci.yml"


    # change the gitlab-ci hog_no_bitstream property
    exec sed -i "s|\\(.*HOG_NO_BITSTREAM:\\).*\\(#.*\\)|\\1 $hog_no_bitstream \\2|g" "$dest_path/gitlab-ci.yml"

    # remove hog_chk for projects
    if {0 == $hog_chk} {
        exec sed -i "/^CHK:/,/PROJECT_NAME.*/d" "$dest_path/gitlab-ci.yml"
    }
}

proc clone_projects {huddle} {

    foreach key [huddle keys $huddle] {

        set build [huddle get $huddle $key]

        set fpga        [huddle get_stripped $build fpga]
        set board_pkg   [huddle get_stripped $build board_pkg]
        set pt          [huddle get_stripped $build pt]
        set sf          [huddle get_stripped $build sf]
        set constraints [huddle get_stripped $build constraints]

        puts " Build: $key"
        puts "  - FPGA   : $fpga"
        puts "  - Board  : $board_pkg"
        puts "  - Constr : $constraints"

        set variants [huddle get $build variants]
        foreach variant [huddle keys $variants] {

            set props [huddle get $variants $variant]

            set link_map       [huddle get_stripped $props link_map]
            set zynq_target    [huddle get_stripped $props zynq_target]

            puts "    - Flavor: $variant"
            puts "        link_map       : $link_map"
            puts "        zynq_target    : $zynq_target"
            puts "        sf             : $sf"
            puts "        pt             : $pt"
            foreach prop [huddle keys $props] {
                puts "        [format %-14s $prop] : [huddle get_stripped $props $prop]"
            }

            global script_path

            # if the variant is "default" don't add a suffix,
            # otherwise add the variant name
            set suffix "_${variant}"
            if { [string compare ${variant} "default"] == 0} {
                set suffix ""
            }
            clone_mdt_project "$script_path" "l0mdt_${key}${suffix}" \
                $fpga $board_pkg $pt $sf $constraints $link_map $props
            }}}

clone_projects [yaml::yaml2huddle -file ${script_path}/mdt_flavors.yml]
