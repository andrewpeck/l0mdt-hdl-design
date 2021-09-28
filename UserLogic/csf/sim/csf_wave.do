onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /csf_tb/clk
add wave -noupdate /csf_tb/seed
add wave -noupdate /csf_tb/mdt_hit
add wave -noupdate /csf_tb/eof
add wave -noupdate /csf_tb/rst
add wave -noupdate /csf_tb/v_seg
add wave -noupdate /csf_tb/seg
add wave -noupdate -divider CSF_Histo_0
add wave -noupdate -format Literal /csf_tb/CSF/b_e_generate/histograms(0)/histogram/i_eof
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/i_mdthit
add wave -noupdate -childformat {{/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localx -radix unsigned} {/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localy -radix unsigned} {/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.radius -radix unsigned}} -expand -subitemconfig {/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localx {-height 21 -radix unsigned} /csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localy {-height 21 -radix unsigned} /csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.radius {-height 21 -radix unsigned}} /csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/i_seed
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/mbar
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dv0
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dsp_squ_m_r
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dsp_m_x
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dsp_y_m_multi
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dsp_m_inv_squ_m
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dv1
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dsp_m_x_y_multi
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dv2
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/bplus_full
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/bminus_full
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dv3
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/bplus
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/bminus
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/eof8
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/max_counter_2
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/max_counter_1
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dv4
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/fill_minus
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/fill_plus
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/dv5
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/max_bin2
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/max_bin1
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/max_bin1_s
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/max_bin2_s
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/bminus_s
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/histograms(0)/histogram/bplus_s
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/w_hit_vec(45)
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/w_addr(45)
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/w_en(45)
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/o_histo_hit0
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/o_histo_hit1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {201872417 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 367
configure wave -valuecolwidth 105
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {190327996 fs} {255952996 fs}
