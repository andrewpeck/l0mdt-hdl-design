library ieee;
library ttc_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use ttc_def.ttc_defs.all;

entity ttc is
  port(port_ir: in ttc_irt; port_or: out ttc_ort);
end entity ttc;

architecture V2 of ttc is

  signal fmt_r: ttc_fmt_rt;
  signal fmt_320_dr: ttc_fmt_rt; -- delayed
  signal fmt_40_dr: ttc_fmt_rt; -- delayed

  signal clk40_d : std_logic;
  signal clk40_dd : std_logic;
  
  signal cmds_r: ttc_cmds_rt;
  signal cnt_r: ttc_counters_rt;
  
  signal ocr: std_logic := '0';
  signal ocr_d: std_logic := '0'; -- delayed
  signal ocr_req: std_logic := '0';

  signal ecr_req: std_logic := '0';
  signal bcr_req: std_logic := '0';
  
begin

  port_or.cmds <= cmds_r;
  port_or.cnt <= cnt_r;

  fmt_r <= convert(port_ir.data, fmt_r);

  ocr <= fmt_r.bcr and fmt_40_dr.bcr;

  cmds_r.bx  <= '1' when port_ir.sys.clk40 = '1' and clk40_dd  = '0' else '0';
  cmds_r.lxa <= '1' when fmt_r.lxa = '0' and fmt_320_dr.lxa = '1' else '0';
  cmds_r.ecr <= '1' when fmt_r.ecr = '1' and fmt_320_dr.ecr = '0' else '0';
  cmds_r.bcr <= '1' when fmt_r.bcr = '1' and fmt_320_dr.bcr = '0' else '0';
  cmds_r.ocr <= '1' when ocr = '1' and ocr_d = '0' else '0';

  process (port_ir.sys.clk40)
  begin
    if rising_edge(port_ir.sys.clk40) then
      fmt_40_dr <= fmt_r;

      if port_ir.sys.rst = '1' then
        cnt_r <= nullify(cnt_r);
      else
      
        -- if BCR is doubled, OCR received.
        -- Identified with delayed BCR signal.
        if ocr = '1' then
          ocr_req <= '1';
        end if;
            
        -- ECR received, reset event counter next BCID
        if fmt_r.ecr = '1' then
          ecr_req <= '1';
        end if;

        -- Update bcid counter. Reset BCID and ORID counters accordingly.
        if fmt_r.bcr = '1' then
          cnt_r.bcid <= to_unsigned(0, cnt_r.bcid'length);
          if ocr_req = '1' then
            cnt_r.orid <= to_unsigned(0, cnt_r.orid'length);
            ocr_req <= '0';
          else
            cnt_r.orid <= cnt_r.orid + 1;
          end if;
        else
          cnt_r.bcid <= cnt_r.bcid + 1;
        end if;

        -- Update event counter. Reset event id accordingly.
        if fmt_r.lxa = '1' then
          if ecr_req = '1' then
            cnt_r.evid <= to_unsigned(0, cnt_r.evid'length);
            ecr_req <= '0';
          else
            cnt_r.evid <= cnt_r.evid + 1;
          end if;
        end if;
        
      end if; -- reset
    end if; -- clock
  end process;
  
  process (port_ir.sys.clk320)
  begin
    if rising_edge(port_ir.sys.clk320) then
      -- delay clk40 to generate BX pulses
      clk40_d <= port_ir.sys.clk40;
      clk40_dd <= clk40_d;
      -- delay data to generate pulses
      fmt_320_dr <= fmt_r;
      ocr_d <= ocr;
    end if;
  end process;

end architecture V2;

--------------------------------------------------------------------------------

library ieee;
library types_def;
library ttc_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;
use ttc_def.ttc_defs.all;

entity ttc_wrap is
  port (port_iv : in ttc_ivt; port_ov : out ttc_ovt);
end entity ttc_wrap;

architecture V2 of ttc_wrap is
  signal port_ir : ttc_irt;
  signal port_or : ttc_ort;
begin
  port_ir <= convert(port_iv, port_ir);
  port_ov <= convert(port_or, port_ov);
  u_ttc : entity work.ttc
    port map (port_ir => port_ir, port_or => port_or);
end V2;
