-- This is the top level file for the NSW L1A algorithm. It is based
-- on a scheme that can be described as a matrix where each row
-- (besides the first one) is a data stream and every column is a
-- concurrent request handler. The first row is reserved to handle
-- header information that is common to all the processing cells and
-- that need to be sent out later.
--
-- The data input interface, named as Snake Interface after a joke
-- during discussions on a white board where lines representing this
-- path where marked with an "snake" pattern. The Snake Interface is
-- very simple: a variable length payload, a BCID signal to
-- characterize the payload information and a write strobe to validate
-- the payload. Each Snake Interface is dedicated to a processing row
-- in the L1A processing matrix.
--
-- Upon receiving an L1A request, a processing column will be
-- activated, which will happen always from left to right. If all the
-- columns are busy, it will wait for the current pointed column to be
-- released.
--
-- In the L1A processing matrix, multiple columns can be activated in
-- parallel, however there is just one lane to send data out, which is
-- a elink in a CERN GBT link. Another constraint is that data related
-- to L1A requests must be sent in the same order that the L1A
-- requests were received. Thus information is retrieved by a packet
-- builder block for one column at a time and it will go always from
-- left to right as well, which will solve both constraints.

library ieee;
library types_def;
library ttc_def;
library daq_def;
library ttc_lib;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_top is
  generic(G: daq_top_grt := (BRANCHES_STRUCT => (
                               (96, 128, others => 0),
                               (96, 128, others => 0),
                               others => (others => 0)),
                             COUNTER_WIDTH => 64));
  port(port_ir: in daq_top_irt; port_or: out daq_top_ort);
end entity daq_top;

architecture V2 of daq_top is

  type algo_art is array(G.BRANCHES_STRUCT'range) of daq_algo_ert;
  signal algo_ar : algo_art;

  signal ttc_er : ttc_ert;

begin

  gen_daq_algo_mask: for j in G.BRANCHES_STRUCT'range generate
    gen_daq_algo_map: if (G.BRANCHES_STRUCT(j)
                          /= (daq_branch_struct_t'range => 0))  generate

      u_daq_algo : entity work.daq_algo
        generic map(G => (BRANCH_STRUCT   => G.BRANCHES_STRUCT(j),
                          COUNTER_WIDTH   => G.COUNTER_WIDTH))
        port map (port_ir => algo_ar(j).i, port_or => algo_ar(j).o);

      algo_ar(j).i.sys <= port_ir.sys;
      algo_ar(j).i.ttc <= port_ir.ttc;
      algo_ar(j).i.ctrl <= port_ir.ctrl;

      algo_ar(j).i.f2e   <= port_ir.f2e_bus(j);
      port_or.f2e_bus(j) <= algo_ar(j).o.f2e;

      port_or.status_bus(j) <= algo_ar(j).o.status;

      gen_streams: for k in G.BRANCHES_STRUCT(j)'range generate
        gen_stream: if G.BRANCHES_STRUCT(j)(k) /= 0 generate
          algo_ar(j).i.branch(k) <= port_ir.branches(j)(k);
        end generate gen_stream;
      end generate gen_streams;


    end generate gen_daq_algo_map;
  end generate gen_daq_algo_mask;




  -- snake_ar <= structify(snake_av, snake_ar);



  -- -- FELIX Data IO --
  -- FIFO2Elink_MON_F2E : entity work.FIFO2Elink --use christos's SCX source
  --                                             --FIFO2Elink_MON_F2E : entity work.MON_FIFO2Elink
  --   generic map (
  --     OutputDataRate => 320, --nf switch to 2 bit 320,
  --     elinkEncoding  => "01" -- 8b10b encoding
  --   )
  --   port map (
  --     clk40       => clk40_i,
  --     clk80       => clk80_i,
  --     clk160      => clk160_i,
  --     clk320      => clk320_i,
  --     rst         => f2e_rst_i,
  --     fifo_flush  => f2e_flush_i,
  --     reverse_tx  => f2e_reverse_tx_i,
  --     swap_output => f2e_swap_output_i,
  --
  --     efifoDin   => f2e_data,
  --     efifoWe    => f2e_wren,
  --     efifoPfull => f2e_hfull,
  --     efifoWclk  => clk320_i,
  --
  --     DATA1bitOUT => open,
  --     elink2bit   => open,
  --     elink4bit   => open,
  --     elink8bit   => elink8bit_o
  --   );

end architecture V2;


--------------------------------------------------------------------------------

library ieee;
library types_def;
library ttc_def;
library ttc_lib;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_top_wrap is
  generic(G_v: daq_top_gvt);
  port(port_iv: in daq_top_ivt; port_ov: out daq_top_ovt);
end entity daq_top_wrap;

architecture V2 of daq_top_wrap is

  impure function G return daq_top_grt is
    variable aux : daq_top_grt;
  begin
    return structify(G_v, aux);
  end function G;

  signal port_ir : daq_top_irt;
  signal port_or : daq_top_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_daq_top : entity work.daq_top
    generic map (G => G)
    port map (port_ir => port_ir, port_or => port_or);
end architecture V2;
