package require yaml

# NOTE: this script does NOT work when executed from vivado,
# due to its use of 'huddle exists', which does NOT exist in Vivado's
# ancient version of the tcl libraries
#
# It should be executed from the system tclsh

set spies ""

proc find_slaves  {huddle} {

    foreach key [huddle keys $huddle] {
        set entry [huddle get $huddle $key]

        if {[huddle exists $entry SPYBUFFER]} {
            if {1 == [huddle get_stripped $entry SPYBUFFER]} {
                puts "Found Spybuffer : $key"

                set TCL_CALL [huddle get $entry "TCL_CALL"]

                set meta_width 0
                set meta_depth 0

                if {[huddle exists $entry "META_DATA"]} {
                    set META_DATA [huddle get $entry "META_DATA"]

                    set meta_width [huddle get_stripped $META_DATA width]
                    set meta_depth [huddle get_stripped $META_DATA depth]

                }

                set width [huddle get_stripped $TCL_CALL "width"]
                set range [huddle get_stripped [huddle get $TCL_CALL addr] range]

                set port_b "NIL"
                if {[huddle exists $TCL_CALL $port_b]} {
                    set port_b [huddle get_stripped $TCL_CALL $port_b]
                }

                set depths [dict create 1k 1024 2k 2048 4k 4096 8k 8192 16k 16384 32k 32768 64k 65536 128k 131072 256k 262144]
                set depth [dict get $depths [string tolower $range]]

                set adrb [expr {int(ceil(log($depth)/log(2)))}]
                set wenb [expr $width/8]

                puts "  > WIDTH: $width"
                puts "  > DEPTH: $depth"
                puts "  > ADRB : $adrb"
                puts "  > WENB : $wenb"

                #puts $spies
                global spies
                dict append spies $key "name [string tolower $key] width $width depth $depth adrb $adrb wenb $wenb meta_width ${meta_width} meta_depth ${meta_depth} port_b ${port_b}"
            }}

        if { 0 == [string compare "mapping" [huddle type [huddle get $huddle $key]]]} {
            find_slaves $entry
        }}}

proc create_package {spies fname} {

    set fp [open $fname w+]

    puts $fp "library ieee;"
    puts $fp "use ieee.std_logic_1164.all;"
    puts $fp ""

    puts $fp "package spies_pkg is"
    foreach key [dict keys $spies] {

        #puts $key
        set spy [dict get $spies $key]
        #puts $spy

        set name  [dict get $spy name]
        set width [dict get $spy width]
        set depth [dict get $spy depth]
        set adrb  [dict get $spy adrb]
        set wenb  [dict get $spy wenb]
        set meta_width  [dict get $spy meta_width]
        set meta_depth  [dict get $spy meta_depth]
        set port_b  [dict get $spy port_b]

        if {${meta_depth} > 0} {
            set meta_adrb [expr int(ceil(log(${meta_depth})/log(2)))]
        } else {
            set meta_adrb 0
        }

        set en_port_b [expr [string compare ${port_b} "NIL"]]

        set name [string tolower $name]

        puts $fp ""
        puts $fp "  -------------------------"
        puts $fp "  -- [string toupper $name]"
        puts $fp "  -------------------------"
        puts $fp ""
        puts $fp "  constant [string toupper ${name}]_WIDTH : natural := $width;"
        puts $fp "  constant [string toupper ${name}]_DEPTH : natural := $depth;"
        puts $fp "  constant [string toupper ${name}]_ADDRB : natural := $adrb;"
        puts $fp "  constant [string toupper ${name}]_META_DEPTH : natural := ${meta_depth};"
        puts $fp "  constant [string toupper ${name}]_META_WIDTH : natural := ${meta_width};"
        puts $fp "  constant [string toupper ${name}]_META_ADDRB : natural := ${meta_adrb};"
        puts $fp ""
        puts $fp "  -- bram control"
        puts $fp "  type ${name}_bram_ctrl_t is record"
        puts $fp "    clk  : std_logic;"
        puts $fp "    en   : std_logic;"
        puts $fp "    rst  : std_logic;"
        puts $fp "    we   : std_logic_vector ([expr $wenb-1] downto 0);"
        puts $fp "    din  : std_logic_vector ([expr $width-1] downto 0);"
        puts $fp "    addr : std_logic_vector ([expr $adrb-1] downto 0);"
        puts $fp "  end record;"

        puts $fp ""
        puts $fp "  -- spybuffer + bram control"
        puts $fp "  type ${name}_ctrl_t is record"
        puts $fp "    bram_a   : ${name}_bram_ctrl_t;"

        if {$en_port_b} {
            puts $fp "    bram_b   : ${name}_bram_ctrl_t;"
        }

        puts $fp "    freeze      : std_logic;"
        puts $fp "    playback    : std_logic_vector (1 downto 0);"
        puts $fp "    playback_we : std_logic;"

        if {${meta_width} > 0 && ${meta_depth} > 0} {

            puts $fp "    -- metadata"
           #puts $fp "    meta_read_enable : std_logic;"
            puts $fp "    meta_read_addr : std_logic_vector ([expr ${meta_adrb}-1] downto 0);"
        }

        puts $fp "  end record;"

        puts $fp ""
        puts $fp "  -- spybuffer readout"
        puts $fp "  type ${name}_mon_t is record"
        puts $fp "    dout_a : std_logic_vector ([expr $width-1] downto 0);"
        puts $fp "    almost_full    : std_logic;"
        puts $fp "    empty          : std_logic;"
        if {$en_port_b} {
            puts $fp "    dout_b : std_logic_vector ([expr $width-1] downto 0);"
        }
        if {${meta_width} > 0 && ${meta_depth} > 0} {
            puts $fp "    -- metadata"
            puts $fp "    meta_read_data          : std_logic_vector ([expr ${meta_width}-1] downto 0);"
            puts $fp "    dbg_spy_write_addr      : std_logic_vector ([expr ${width}-1] downto 0);"
            puts $fp "    dbg_spy_meta_write_addr : std_logic_vector ([expr ${meta_adrb}-1] downto 0);"
        }
        puts $fp "  end record;"

    }

    puts $fp ""
    puts $fp "  -------------------------"
    puts $fp "  -- Zipped up records"
    puts $fp "  -------------------------"

    puts $fp ""
    puts $fp "  type spy_ctrl_t is record"
    foreach key [dict keys $spies] {
        set spy [dict get $spies $key]
        set name "[string tolower [dict get $spy name]]"
        puts $fp "     $name : ${name}_ctrl_t;";
    }
    puts $fp "  end record;"

    puts $fp ""
    puts $fp "  type spy_mon_t is record"
    foreach key [dict keys $spies] {
        set spy [dict get $spies $key]
        set name "[string tolower [dict get $spy name]]"
        puts $fp "     $name : ${name}_mon_t;";
    }
    puts $fp "  end record;"

    puts $fp ""
    puts $fp "end package;"

    close $fp
}

set script_path "[file normalize [file dirname [info script]]]"
find_slaves [yaml::yaml2huddle -file ${script_path}/slaves.yaml]
set outfile [file normalize "${script_path}/../ctrl/src/spies_pkg.vhd"]
puts $outfile
create_package $spies $outfile
