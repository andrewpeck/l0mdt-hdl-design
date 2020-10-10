-- The header processor row will keep one header node for each data
-- column instantiated, which is configured in the daq_package. The
-- header node is supposed to prepare the header of the packet to be
-- sent by the Packet Builder.

library ieee;
library types_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_hrow is
  generic(G: daq_row_grt);
   port (port_ir : in daq_hrow_irt; port_or : out daq_row_ort);
end entity daq_hrow;

architecture V2 of daq_hrow is

  type hnode_airt is array (0 to G.PIPELINES-1) of hnode_irt;
  signal hnode_air : hnode_airt;
  
  type dnode_airt is array (0 to G.PIPELINES-1) of dnode_irt;
  signal dnode_air : dnode_airt;

  type node_aort is array (0 to G.PIPELINES-1) of node_ort;
  signal node_aor : node_aort;
  
  type bconvs is (cnt, pld);

  type bconv_lrt is record
    data    : std_logic_vector(DAQ_FELIX_STREAM_WIDTH-1 downto 0);
    nempty  : std_logic;
    rd_strb : std_logic;
  end record bconv_lrt;

  type bconv_art is array(bconvs) of bconv_ert;
  type bconv_lart is array(bconvs) of bconv_lrt;
  type bconv_agrt is array(bconvs) of bconv_grt;
  
  signal bconv_ar : bconv_art;
  signal bconv_lar : bconv_lart;

  constant bconv_agr : bconv_agrt := (cnt => (INPUT_DATA_WIDTH => G.COUNTER_WIDTH),
                                      pld => (INPUT_DATA_WIDTH => G.INPUT_DATA_WIDTH));

  signal hub_er : hub_ert;
  
begin

  -- breaking interesting signals out ==========================================

  -- payload signals -----------------------------------------------------------
  
  -- port_or.pbldr.payload.data
  --   <= (port_or.pbldr.payload.data'left downto bconv_lar(pld).data'length => '0')
  --   & bconv_lar(pld).data;
  
  -- port_or.pbldr.payload.nempty  <= bconv_lar(pld).nempty;
  
  -- bconv_lar(pld).rd_strb <= port_ir.pbldr.payload.rd_strb;

  -- counter signals -----------------------------------------------------------
  
  -- port_or.pbldr.counter.data
  --   <= (port_or.pbldr.counter.data'left downto bconv_lar(cnt).data'length => '0')
  --   & bconv_lar(cnt).data;
  -- 
  -- port_or.pbldr.counter.nempty  <= bconv_lar(cnt).nempty;
  -- 
  -- bconv_lar(cnt).rd_strb <= port_ir.pbldr.counter.rd_strb;
                             
  -- instantiating blocks ======================================================

  -- hub -----------------------------------------------------------------------

  u_hub : entity work.daq_hub
    port map (port_ir => hub_er.i, port_or => hub_er.o);
  
  hub_er.i.dst <= port_ir.pbldr.payload;
  port_or.pbldr.payload <= hub_er.o.dst;

  -- bus converters ------------------------------------------------------------

  gen_bconvs: for j in bconv_ar'range generate
    
    u_bconv : entity work.daq_bus_conv
      generic map(G => bconv_agr(j))
      port map (port_ir => bconv_ar(j).i, port_or => bconv_ar(j).o);

    bconv_ar(j).i.sys <= port_ir.sys;
    
  end generate gen_bconvs;

  hub_er.i.cnt <= bconv_ar(cnt).o.dst;
  bconv_ar(cnt).i.dst <= hub_er.o.cnt;

  hub_er.i.pld <= bconv_ar(pld).o.dst;
  bconv_ar(pld).i.dst <= hub_er.o.pld;

  hnodes : for j in 0 to G.PIPELINES-1 generate
    
    u_hnode : entity work.daq_header_node
      generic map(G => (COUNTER_WIDTH => G.COUNTER_WIDTH))
      port map (port_ir => hnode_air(j), port_or => node_aor(j));
    
    hnode_air(j).sys        <= port_ir.sys;
    hnode_air(j).mngt.en    <= port_ir.mngt.en(j);
    hnode_air(j).mngt.rd_en <= port_ir.mngt.rd_en(j);
    hnode_air(j).req        <= port_ir.req;

    port_or.mngt.nempty(j) <= node_aor(j).mngt.nempty;

    hnode_air(j).bconv.payload <= bconv_ar(pld).o.src
                                  when (port_ir.pbldr.sel = '1'
                                        and port_ir.mngt.rd_en(j) = '1')
                                  else nullify(hnode_air(j).bconv.payload);
    
    hnode_air(j).bconv.counter <= bconv_ar(cnt).o.src
                                  when (port_ir.pbldr.sel = '1'
                                        and port_ir.mngt.rd_en(j) = '1')
                                  else nullify(hnode_air(j).bconv.counter);    
  end generate hnodes;

  -- connections ===============================================================

  gen_conn : for j in 0 to G.PIPELINES-1 generate

    -- node | bconv (payload) --------------------------------------------------
    bconv_ar(pld).i.src <= node_aor(j).bconv.payload
                           when (port_ir.pbldr.sel = '1'
                                 and port_ir.mngt.rd_en(j) = '1')
                           else nullify(bconv_ar(pld).i.src);
    
    -- node | bconv (counter) --------------------------------------------------
    bconv_ar(cnt).i.src <= node_aor(j).bconv.counter
                           when (port_ir.pbldr.sel = '1'
                                 and port_ir.mngt.rd_en(j) = '1')
                           else nullify(bconv_ar(cnt).i.src);
    
    -- node | done -------------------------------------------------------------
    port_or.mngt.done(j) <= node_aor(j).mngt.done
                            when (port_ir.pbldr.sel = '1'
                                  and port_ir.mngt.rd_en(j) = '1')
                            else '0';
  
  end generate gen_conn;

  -- no error handling for now
  port_or.mngt.err <= (others => '0');

end V2;

--------------------------------------------------------------------------------

library ieee;
library types_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_hrow_wrap is
  generic(G: daq_row_grt);
   port (port_iv : in daq_hrow_ivt; port_ov : out daq_row_ovt);
end entity daq_hrow_wrap;

architecture V2 of daq_hrow_wrap is
  signal port_ir : daq_hrow_irt;
  signal port_or : daq_row_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_hrow : entity work.daq_hrow
    generic map (G) port map (port_ir, port_or);
end V2;
  
