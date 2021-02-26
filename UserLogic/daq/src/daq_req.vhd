library ieee;
library types_def;
library ttc_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;

entity daq_req is
  port(port_ir: in daq_req_irt; port_or: out daq_req_ort);
end entity daq_req;

architecture V2 of daq_req is

  -- daq instantaneous base counters 
  signal cnt_r : daq_cnt_rt;

  -- window parameters
  signal win_r : daq_win_rt;

  -- stability of the daq base counters (after changes)
  signal stability_r : stability_rt;

begin

  port_or.row.common.win_start <= cnt_r.win_start;
  port_or.row.common.win_width <= win_r.width;
  port_or.row.extra.latency   <= win_r.latency;
  port_or.row.extra.win_lower <= win_r.lower;
  port_or.row.extra.win_upper <= win_r.upper;
  port_or.row.extra.daq_bcid  <= cnt_r.daq_bcid;
  port_or.row.extra.evid      <= port_ir.ttc.cnt.evid;
  port_or.row.extra.bcid      <= port_ir.ttc.cnt.bcid;
          
  -- the DAQ BCID should follow the latency pipeline. For that, a
  -- counter is used as base for resets on the the DAQ BCID and DAQ
  -- window limits counters later on.
  
  -- Because the way the calculation of the DAQ window limits is done,
  -- every change in these will result in an temporary incorrect
  -- state, this is exposed by the `stability` flags. 
  
  win_r.width <= win_r.lower + 1 + win_r.upper;
  port_or.status.stability <= stability_r;
  
  process (port_ir.sys.clk320)
  begin
    if rising_edge(port_ir.sys.clk320) then
      
      if port_ir.sys.rst = '1' then
        win_r.lower   <= port_ir.ctrl.win_lower;
        win_r.latency <= port_ir.ctrl.latency;
        win_r.upper   <= port_ir.ctrl.win_upper;
        stability_r   <= nullify(stability_r);
      else

        -- kept for backward compatibility
        stability_r.win_upper <= '1';

        -- window information is registered when wr_en is active. Ready signals
        -- are deactivated to indicate the transition period.
        if port_ir.ctrl.wr_en = '1' then
          win_r.lower <= port_ir.ctrl.win_lower;
          win_r.latency   <= port_ir.ctrl.latency;
          win_r.upper <= port_ir.ctrl.win_upper;
          stability_r <= nullify(stability_r);
  
        else
  
          -- wait for BX strobe to update the 40MHz counters
          if port_ir.ttc.cmds.bx = '1' then
  
            -- handling of the counter for the lower limit of the window
            if  port_ir.ttc.cnt.bcid = win_r.latency + win_r.lower then
              cnt_r.win_start <= to_unsigned(0, cnt_r.win_start'length);
              stability_r.win_lower <= '1';
            else
              cnt_r.win_start <= cnt_r.win_start + 1;
            end if;
            
            -- handling of the counter for the latency delay
            if  port_ir.ttc.cnt.bcid = win_r.latency then
              cnt_r.daq_bcid <= to_unsigned(0, cnt_r.daq_bcid'length);
              stability_r.latency <= '1';
            else
              cnt_r.daq_bcid <= cnt_r.daq_bcid + 1;
            end if;
            
          end if; -- BX strobe
  
          -- mark data as valid on lxa commands if counters are stable
          if(port_ir.ttc.cmds.lxa = '1'
             and stability_r.win_lower = '1'
             and stability_r.latency = '1') then
            port_or.row.common.strb <= '1';
          else
            port_or.row.common.strb <= '0';
          end if;
          
        end if;  -- configuration
      end if; -- reset
    end if; -- clk edge
  end process;
  
end architecture V2;
  
--------------------------------------------------------------------------------

library ieee;
library types_def;
library ttc_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;

entity daq_req_wrap is
  port(port_iv: in daq_req_ivt; port_ov: out daq_req_ovt);
end entity daq_req_wrap;

architecture V2 of daq_req_wrap is
  signal port_ir : daq_req_irt;
  signal port_or : daq_req_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_req : entity work.daq_req
    port map (port_ir => port_ir, port_or => port_or);
end architecture V2;
