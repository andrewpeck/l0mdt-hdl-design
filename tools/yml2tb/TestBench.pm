#!/usr/bin/perl
#----------------------------------------------------------------------
# this package provides template VHDL text for building test benches
# note that if the code is edited in non-trivial ways you will need
# to read and understand the main code
#
package TestBench;

#------------------------------------------------------------
# libraries for testbench
#------------------------------------------------------------
$Libs = qq{
library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;
use l0mdt_lib.mdttp_textio.all;
};


#------------------------------------------------------------
# stuff which goes in the architecture header of the testbench
#------------------------------------------------------------
$Header = qq{
-- these are fixed
  signal p_ctrl : l0mdt_control_rt;
  signal p_ttc  : l0mdt_ttc_rt;

-- global counters
  signal bunch : integer := 0;
  signal orbit : integer := 0;
  signal tick : integer := 0;

-- global constants
  constant freq    : positive := 320e6;
  constant clk_per : time     := (real(1e9)/real(freq)) * 1 ns;
};



#------------------------------------------------------------
# variables common to all reader/writer processes
#------------------------------------------------------------
$Vars = qq {
    variable v_ILINE  : line;           -- input buffer
    variable v_ORN    : integer;        -- orbit number
    variable v_BCN    : integer;        -- BX number
    variable v_SPC    : character;      -- for space parsing
    variable buff     : line;           -- for debug output
    file file_VECTORS : text;           -- file handle
};


#------------------------------------------------------------
# clock process
#------------------------------------------------------------
$ClockProcess = qq{
clock_process : process (p_ctrl.clk, p_ctrl.rst_n) is

  begin
    if p_ctrl.rst_n = '0' then          -- asynchronous reset (active low)
      bunch <= 0;
      orbit <= 0;
    elsif p_ctrl.clk'event and p_ctrl.clk = '1' then  -- rising clock edge
      if p_ctrl.bx = '1' then
        if p_ttc.bcr = '1' then
          bunch <= 0;
        else
          bunch <= bunch + 1;
        end if;
      end if;
      if p_ttc.bcr = '1' then
        orbit <= orbit + 1;
      end if;
    end if;
  end process clock_process;


};


$ProcessVars = qq{
    -- generic variables for testbench process
    variable v_LINE  : line;            -- line buffer
    variable v_ORN    : integer;        -- orbit number
    variable v_BCN    : integer;        -- BX number
    variable v_SPC    : character;      -- for space parsing/output
    variable buff     : line;           -- for debug output
    file file_VECTORS : text;           -- file handle
};

# printf format for reader process
# vars:  port, port, type, port, port, port, port, port, port
#
$ReaderProcessFormat = qq{  
  %s_reader : process is

    -- generic variables for testbench process
    variable v_LINE  : line;            -- line buffer
    variable v_ORN    : integer;        -- orbit number
    variable v_BCN    : integer;        -- BX number
    variable v_TICK   : integer;        -- pipeline clock tick
    variable v_SPC    : character;      -- for space parsing
    variable buff     : line;           -- for debug output
    file file_VECTORS : text;           -- file handle

    variable v_%s : %s;

  begin
    file_open(file_VECTORS, "%s_vectors.txt", read_mode);
        -- read vector file until a vector with times in the future is seen
    while not endfile(file_VECTORS) loop
      readline(file_VECTORS, v_LINE);

      if(v_LINE'right > 1 and v_LINE(1) = '#') then
        writeline(output, v_LINE); -- echo comment
      else
        -- parse a line as OrN, BcN, tick, value
        read(v_LINE, v_ORN);
        read(v_LINE, v_BCN);
        read(v_LINE, v_TICK);
        read(v_LINE, v_%s);

        -- wait until correct time before triggering write to UUT
        wait until orbit >= v_ORN and bunch >= v_BCN and tick >= V_TICK;
        
        s_%s <= v_%s;
	%s_dav <= '1';
        wait for clk_per;
	%s_dav <= '0';
      end if;
    end loop;
    wait;
  end process;
};



# printf format for writer process
# vars:  port, type, port, port, port, port, port
#
$WriterProcessFormat = qq{  
  %s_writer : process is

    -- generic variables for testbench process
    variable v_LINE  : line;            -- line buffer
    variable v_ORN    : integer;        -- orbit number
    variable v_BCN    : integer;        -- BX number
    variable v_TICK   : integer;        -- pipeline tick
    variable v_SPC    : character;      -- for space parsing
    variable buff     : line;           -- for debug output
    file file_RESULTS : text;           -- file handle

    variable v_%s : %s;

  begin
    file_open(file_RESULTS, "%s_vectors.txt", write_mode);

    while true loop

      wait until p_%s.%s = '1';
      v_%s := p_%s;

      write(v_LINE, orbit);
      write(v_LINE, ' ');
      write(v_LINE, bunch);
      write(v_LINE, ' ');
      write(v_LINE, tick);
      write(v_LINE, ' ');
      write(v_LINE, v_%s);
      writeline(file_RESULTS, v_LINE);
      wait for clk_per;
    end loop;
    wait;
  end process;

};

