#/usr/bin/env tclsh

package require yaml

set script_path "[file normalize [file dirname [info script]]]"

proc update_trigger_libs {lib pt_calc segment_finder fpga_short} {

    exec sed -i  "s/ku15p/${fpga_short}/g" $lib

    if {[string compare "upt" $pt_calc]==0} {
        # enable upt
        exec sed -i  "s/^#\\(UserLogic.*upt_lib.src\\)/\\1/g" $lib
    } else {
        # disable upt
        exec sed -i  "s/^UserLogic.*upt_lib.src/#&/g" $lib
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
        exec sed -i  "s/^#\\(UserLogic.*lsf_lib.src\\)/\\1/g" $lib
    } else {
        # disable lsf
        exec sed -i  "s/^UserLogic.*lsf_lib.src/#&/g" $lib
    }

    if {[string compare "csf" $segment_finder]==0} {
        # enable csf
        exec sed -i  "s/^#\\(UserLogic.*csf_lib.src\\)/\\1/g" $lib
    } else {
        # disable csf
        exec sed -i  "s/^UserLogic.*csf_lib.src/#&/g" $lib
    }

    exec sed -i  "s/^#\(UserLogic.*csf_lib.src\)/\1/g" $lib
}

proc update_prj_config {dest_file segment_finder pt_calc} {

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

    exec sed -i s|\\(proj_cfg.SF_TYPE\\s*:=\\s*'\\)\\(\[0-1\]\\)|\\1${sf_type}|g $dest_file
    exec sed -i s|\\(proj_cfg.PT_TYPE\\s*:=\\s*'\\)\\(\[0-1\]\\)|\\1${pt_type}|g $dest_file
}

proc clone_mdt_project {top_path name fpga board_pkg pt_calc segment_finder constraints link_map} {

    set source_path ${top_path}/base_l0mdt
    set dest_path ${top_path}/$name

    file mkdir $dest_path
    file mkdir $dest_path/list

    # copy the base files
    set files_to_copy "get_fpga_name.tcl gitlab-ci.yml hog.conf list/ctrl_lib.src list/hal.src list/l0mdt.src list/project_lib.src list/shared_lib.src list/xdc.con post-creation.tcl prj_cfg_default.vhd"

    foreach file $files_to_copy {
        file copy -force ${source_path}/$file ${dest_path}/$file
    }

    # update the link mapping
    exec sed -i "s|HAL/link_maps/.*$|HAL/link_maps/${link_map}.vhd|g" "$dest_path/list/hal.src"

    # update hog.conf
    file rename -force "$dest_path/hog.conf" "$dest_path/hog.conf"
    exec sed -i "s|PART = .*$|PART = $fpga|g" "$dest_path/hog.conf"

    # update the post-creation script
    exec sed -i "s|set FPGA .*$|set FPGA $fpga|g" "$dest_path/post-creation.tcl"

    # update the fpga
    exec sed -i "s|set FPGA .*$|set FPGA $fpga|g" "$dest_path/create_c2c.tcl"
    exec sed -i "s|set FPGA .*$|set FPGA $fpga|g" "$dest_path/create_c2c.tcl"

    # update the ip repo path
    regexp {xc([0-9A-z]*)} $fpga match fpga_shortname
    exec sed -i "s|ip_repo_paths .*$|ip_repo_paths = \"IP_repository/${fpga_shortname}\"|g" "$dest_path/hog.conf"
    file rename -force "$dest_path/hog.conf" "$dest_path/hog.conf"
    exec sed -i "s|PART.*$|PART = $fpga|g" "$dest_path/hog.conf"

    # create the board specific constraints
    set brd_con [open "$dest_path/list/board.con" w+]
    foreach constraint_file $constraints {
        puts $brd_con "HAL/constraints/$constraint_file"
    }
    close $brd_con

    # update the libraries
    update_trigger_libs "$dest_path/list/l0mdt.src" $pt_calc $segment_finder $fpga_shortname

    # update the board package
    set board_pkg_dir {HAL/boards/}
    set foo ${board_pkg_dir}.*board_pkg.*.vhd
    set bar ${board_pkg_dir}${board_pkg}.vhd
    set re "s|${foo}|${bar}|g"
    exec sed -i $re "$dest_path/list/hal.src"

    # update the project config
    file rename -force "$dest_path/prj_cfg_default.vhd" "$dest_path/prj_cfg_default.vhd"
    update_prj_config "$dest_path/prj_cfg_default.vhd" $segment_finder $pt_calc

    # update the project_lib.src file
    exec sed -i "s|base_l0mdt|${name}|g" "$dest_path/list/project_lib.src"
    #exec sed -i "s|prj_cfg_default|prj_cfg_${name}|g" "$dest_path/list/project_lib.src"

    # update the gitlab ci file
    exec sed -i "s|base_l0mdt|${name}|g" "$dest_path/gitlab-ci.yml"

    # update the ctrl_lib
    exec sed -i "s|ku15p|${fpga_shortname}|g" "$dest_path/list/ctrl_lib.src"
}

proc clone_projects {huddle} {

    foreach key [huddle keys $huddle] {

        set build [huddle get $huddle $key]

        set fpga [huddle get_stripped $build fpga]
        set board_pkg [huddle get_stripped $build board_pkg]
        set pt        [huddle get_stripped $build pt]
        set sf [huddle get_stripped $build sf]
        set constraints [huddle get_stripped $build constraints]

        puts " Build: $key"
        puts "  - FPGA   : $fpga"
        puts "  - Board  : $board_pkg"
        puts "  - Constr : $constraints"

        set variants [huddle get $build variants]
        foreach variant [huddle keys $variants] {

            set props [huddle get $variants $variant]

            set link_map       [huddle get_stripped $props link_map]
            #set prj_cfg        [huddle get_stripped $props prj_cfg]
            puts "    - Flavor: $variant"
            puts "        link_map : $link_map"
            #puts "        prj_cfg  : $prj_cfg"
            puts "        sf       : $sf"
            puts "        pt       : $pt"

            global script_path
            clone_mdt_project "$script_path" "l0mdt_${key}_${variant}" $fpga $board_pkg $pt $sf $constraints $link_map
        }}}

clone_projects [yaml::yaml2huddle -file ${script_path}/mdt_flavors.yml]
