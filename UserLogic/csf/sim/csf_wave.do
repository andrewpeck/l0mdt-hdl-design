onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /csf_tb/clk
add wave -noupdate /csf_tb/seed
add wave -noupdate /csf_tb/mdt_hit
add wave -noupdate /csf_tb/eof
add wave -noupdate /csf_tb/rst
add wave -noupdate /csf_tb/v_seg
add wave -noupdate -childformat {{/csf_tb/seg.segpos -radix unsigned} {/csf_tb/seg.segangle -radix unsigned}} -expand -subitemconfig {/csf_tb/seg.segpos {-height 21 -radix unsigned} /csf_tb/seg.segangle {-height 21 -radix unsigned}} /csf_tb/seg
add wave -noupdate -divider CSF_Histo_0
add wave -noupdate -format Literal /csf_tb/CSF/b_e_generate/histograms(0)/histogram/i_eof
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(0)/histogram/i_mdthit
add wave -noupdate -childformat {{/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localx -radix unsigned} {/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localy -radix unsigned} {/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.radius -radix unsigned}} -subitemconfig {/csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localx {-height 21 -radix unsigned} /csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.localy {-height 21 -radix unsigned} /csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit.radius {-height 21 -radix unsigned}} /csf_tb/CSF/b_e_generate/histograms(0)/histogram/mdt_hit
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
add wave -noupdate -divider {CSF Histo 1}
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(1)/histogram/mdt_hit
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(1)/histogram/mbar
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(1)/histogram/i_eof
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(1)/histogram/o_histo_hit0
add wave -noupdate /csf_tb/CSF/b_e_generate/histograms(1)/histogram/o_histo_hit1
add wave -noupdate -divider {Fitter 0}
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/hit1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/hit2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dsp_start
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dsp_NSumX2
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dsp_NSumXY
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dsp_SumXYSumX
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dsp_SumYSumX
add wave -noupdate -radix unsigned /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dsp_SumYSumX2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dv3
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/numerator_b
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/numerator_m
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/denominator
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dv4
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/numerator_b_red
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/numerator_m_red
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/reciprocal_addr
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dv7
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/reciprocal_den
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/dv9
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/mfit_full
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/bfit_full
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/o_fit_valid
add wave -noupdate -radix symbolic /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/o_bfit
add wave -noupdate -radix decimal /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/o_mfit
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/fitter0/o_nhits
add wave -noupdate -divider Chi2
add wave -noupdate -radix decimal /csf_tb/CSF/b_e_generate/fitters(0)/chi2/B_OVER_Z_MULTI_LEN
add wave -noupdate -radix decimal /csf_tb/CSF/b_e_generate/fitters(0)/chi2/B_RED_LEN
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/outhit1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/outhit2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv0_1
add wave -noupdate -radix binary /csf_tb/CSF/b_e_generate/fitters(0)/chi2/b_red
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv0_2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_mx1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_mx2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_b_y_1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_b_y_2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv1_1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv1_2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_res_1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_res_2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv2_1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv2_2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_res2_1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_res2_2
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv3_1
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dv3_2
add wave -noupdate -radix decimal /csf_tb/CSF/b_e_generate/fitters(0)/chi2/dsp_chi
add wave -noupdate /csf_tb/CSF/b_e_generate/fitters(0)/chi2/output_seg
add wave -noupdate -divider {Coordinate Transf}
add wave -noupdate -childformat {{/csf_tb/CSF/coordtransform/locseg_i.b -radix decimal} {/csf_tb/CSF/coordtransform/locseg_i.m -radix decimal} {/csf_tb/CSF/coordtransform/locseg_i.chi2 -radix decimal}} -subitemconfig {/csf_tb/CSF/coordtransform/locseg_i.b {-height 21 -radix decimal} /csf_tb/CSF/coordtransform/locseg_i.m {-height 21 -radix decimal} /csf_tb/CSF/coordtransform/locseg_i.chi2 {-height 21 -radix decimal}} /csf_tb/CSF/coordtransform/locseg_i
add wave -noupdate /csf_tb/CSF/coordtransform/seed_i
add wave -noupdate /csf_tb/CSF/coordtransform/vec_pos
add wave -noupdate /csf_tb/CSF/coordtransform/delta_r_mbar
add wave -noupdate /csf_tb/CSF/coordtransform/abs_loc_pos
add wave -noupdate /csf_tb/CSF/coordtransform/globseg
add wave -noupdate /csf_tb/CSF/coordtransform/DeltaR_BIL
add wave -noupdate /csf_tb/CSF/coordtransform/DeltaR_BML
add wave -noupdate /csf_tb/CSF/coordtransform/DeltaR_BOL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {918000000 fs} 0}
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
WaveRestoreZoom {0 fs} {1575 ns}
