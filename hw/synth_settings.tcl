set_msg_config -id {[Synth 8-63]} -limit 100000
set_msg_config -id {[Synth 8-331]} -limit 100000
set_msg_config -id {[Synth 8-3331]} -limit 100000
set_msg_config -string {{design tdc_decoder_wrapper has unconnected port lpgbt_uplink_data[*][ic][*]}} -suppress
set_msg_config -string {{design tdc_decoder_wrapper has unconnected port lpgbt_uplink_data[*][ec][*]}} -suppress
set_msg_config -string {{Vivado Synthesis ignores library specification for Verilog or SystemVerilog files}} -suppress
