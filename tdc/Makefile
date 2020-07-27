SOURCES=$(wildcard src/tdc_decoder/*.vhd)
SIM=$(wildcard sim/*.vhd)

framer_top_tb:  src/tdc_decoder/decoder_framer.vhd sim/reverse_framer.vhd sim/framer_top_tb.vhd
	@ghdl  -a --std=08 --ieee=synopsys src/tdc_decoder/x_oneshot.vhd src/tdc_decoder/decoder_framer.vhd sim/encoder_framer.vhd sim/framer_top_tb.vhd
	@ghdl -e --std=08 --ieee=synopsys framer_top_tb
	@./framer_top_tb

tdc_decoder_tb: src/tdc_decoder/decoder_framer.vhd sim/tdc_decoder_tb.vhd src/tdc_decoder/alignment_buffer.vhd src/tdc_decoder/tdc_packet_processor.vhd src/tdc_decoder/dec_8b10b.vhd  src/tdc_decoder/srl16_inf.vhd src/tdc_decoder/tdc_decoder.vhd sim/enc_8b10b.vhd sim/encoder_framer.vhd sim/framer_top_tb.vhd
	@ghdl  -a --std=08 --ieee=synopsys src/tdc_decoder/decoder_framer.vhd  sim/enc_8b10b.vhd src/tdc_decoder/alignment_buffer.vhd src/tdc_decoder/tdc_packet_processor.vhd src/tdc_decoder/dec_8b10b.vhd src/tdc_decoder/srl16_inf.vhd src/tdc_decoder/tdc_decoder.vhd src/tdc_decoder/x_oneshot.vhd  sim/encoder_framer.vhd sim/tdc_decoder_tb.vhd
	@ghdl -e --std=08 --ieee=synopsys tdc_decoder_tb
	@./tdc_decoder_tb

8b10b_tb :  src/tdc_decoder/decoder_framer.vhd sim/reverse_framer.vhd sim/framer_top_tb.vhd
	@ghdl  -a --std=08 --ieee=synopsys src/tdc_decoder/x_oneshot.vhd src/tdc_decoder/decoder_framer.vhd sim/encoder_framer.vhd sim/framer_top_tb.vhd
	@ghdl -e --std=08 --ieee=synopsys framer_top_tb
	@./framer_top_tb

find_kchars_tb :  src/tdc_decoder/find_kchars.vhd sim/find_kchars_tb.vhd
	@ghdl  -a --std=08 --ieee=synopsys src/tdc_decoder/find_kchars.vhd sim/find_kchars_tb.vhd
	@ghdl -e --std=08 --ieee=synopsys find_kchars_tb
	@./find_kchars_tb

clean:
	rm *.o *.cf
