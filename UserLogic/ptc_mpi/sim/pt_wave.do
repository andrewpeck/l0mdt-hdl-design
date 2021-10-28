onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pt_tb/clk
add wave -noupdate /pt_tb/seg_I
add wave -noupdate /pt_tb/seg_M
add wave -noupdate /pt_tb/seg_O
add wave -noupdate /pt_tb/i_segment_I
add wave -noupdate /pt_tb/i_segment_M
add wave -noupdate /pt_tb/i_segment_O
add wave -noupdate /pt_tb/i_SLC
add wave -noupdate /pt_tb/slc
add wave -noupdate /pt_tb/o_mtc
add wave -noupdate /pt_tb/mtc
add wave -noupdate /pt_tb/rst
add wave -noupdate /pt_tb/enable
add wave -noupdate /pt_tb/done
add wave -noupdate /glbl/GSR
add wave -noupdate /pt_tb/clk
add wave -noupdate /pt_tb/seg_I
add wave -noupdate /pt_tb/seg_M
add wave -noupdate /pt_tb/seg_O
add wave -noupdate /pt_tb/i_segment_I
add wave -noupdate /pt_tb/i_segment_M
add wave -noupdate /pt_tb/i_segment_O
add wave -noupdate /pt_tb/i_SLC
add wave -noupdate -childformat {{/pt_tb/slc.phimod -radix decimal -childformat {{/pt_tb/slc.phimod(7) -radix decimal} {/pt_tb/slc.phimod(6) -radix decimal} {/pt_tb/slc.phimod(5) -radix decimal} {/pt_tb/slc.phimod(4) -radix decimal} {/pt_tb/slc.phimod(3) -radix decimal} {/pt_tb/slc.phimod(2) -radix decimal} {/pt_tb/slc.phimod(1) -radix decimal} {/pt_tb/slc.phimod(0) -radix decimal}}}} -expand -subitemconfig {/pt_tb/slc.muid {-height 21 -childformat {{/pt_tb/slc.muid.bcid -radix unsigned}} -expand} /pt_tb/slc.muid.bcid {-height 21 -radix unsigned} /pt_tb/slc.phimod {-height 21 -radix decimal -childformat {{/pt_tb/slc.phimod(7) -radix decimal} {/pt_tb/slc.phimod(6) -radix decimal} {/pt_tb/slc.phimod(5) -radix decimal} {/pt_tb/slc.phimod(4) -radix decimal} {/pt_tb/slc.phimod(3) -radix decimal} {/pt_tb/slc.phimod(2) -radix decimal} {/pt_tb/slc.phimod(1) -radix decimal} {/pt_tb/slc.phimod(0) -radix decimal}} -expand} /pt_tb/slc.phimod(7) {-height 21 -radix decimal} /pt_tb/slc.phimod(6) {-height 21 -radix decimal} /pt_tb/slc.phimod(5) {-height 21 -radix decimal} /pt_tb/slc.phimod(4) {-height 21 -radix decimal} /pt_tb/slc.phimod(3) {-height 21 -radix decimal} /pt_tb/slc.phimod(2) {-height 21 -radix decimal} /pt_tb/slc.phimod(1) {-height 21 -radix decimal} /pt_tb/slc.phimod(0) {-height 21 -radix decimal}} /pt_tb/slc
add wave -noupdate /pt_tb/o_mtc
add wave -noupdate -childformat {{/pt_tb/mtc.mdt_pt -radix unsigned}} -expand -subitemconfig {/pt_tb/mtc.mdt_pt {-height 21 -radix unsigned}} /pt_tb/mtc
add wave -noupdate /pt_tb/rst
add wave -noupdate /pt_tb/enable
add wave -noupdate /pt_tb/done
add wave -noupdate /glbl/GSR
add wave -noupdate /pt_tb/clk
add wave -noupdate -childformat {{/pt_tb/seg_I.segpos -radix unsigned} {/pt_tb/seg_I.segangle -radix unsigned}} -subitemconfig {/pt_tb/seg_I.segpos {-height 21 -radix unsigned} /pt_tb/seg_I.segangle {-height 21 -radix unsigned}} /pt_tb/seg_I
add wave -noupdate /pt_tb/seg_M
add wave -noupdate /pt_tb/seg_O
add wave -noupdate /pt_tb/i_segment_I
add wave -noupdate /pt_tb/i_segment_M
add wave -noupdate /pt_tb/i_segment_O
add wave -noupdate /pt_tb/i_SLC
add wave -noupdate /pt_tb/slc
add wave -noupdate /pt_tb/o_mtc
add wave -noupdate /pt_tb/rst
add wave -noupdate /pt_tb/enable
add wave -noupdate /pt_tb/done
add wave -noupdate /glbl/GSR
add wave -noupdate -divider PT
add wave -noupdate /pt_tb/pt/i_segment_I
add wave -noupdate /pt_tb/pt/i_segment_M
add wave -noupdate /pt_tb/pt/i_segment_O
add wave -noupdate /pt_tb/pt/segment_I
add wave -noupdate /pt_tb/pt/segment_M
add wave -noupdate /pt_tb/pt/segment_O
add wave -noupdate -divider Sagitta
add wave -noupdate /pt_tb/pt/SagittaCalculator/seg0
add wave -noupdate /pt_tb/pt/SagittaCalculator/seg1
add wave -noupdate /pt_tb/pt/SagittaCalculator/seg2
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv0
add wave -noupdate /pt_tb/pt/SagittaCalculator/delta_z_20
add wave -noupdate /pt_tb/pt/SagittaCalculator/delta_z_10
add wave -noupdate /pt_tb/pt/SagittaCalculator/DELTA_R_20
add wave -noupdate /pt_tb/pt/SagittaCalculator/DELTA_R_10
add wave -noupdate /pt_tb/pt/SagittaCalculator/REC_DELTA_R_20
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv3
add wave -noupdate /pt_tb/pt/SagittaCalculator/m_sagitta_full
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv4
add wave -noupdate /pt_tb/pt/SagittaCalculator/m_mult_delta_z_10
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv5
add wave -noupdate /pt_tb/pt/SagittaCalculator/m_sagitta
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv6
add wave -noupdate /pt_tb/pt/SagittaCalculator/m_delta_r_10
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv7
add wave -noupdate /pt_tb/pt/SagittaCalculator/sqrt_m_io
add wave -noupdate /pt_tb/pt/SagittaCalculator/den_sagitta
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv8
add wave -noupdate /pt_tb/pt/SagittaCalculator/den_sagitta_red
add wave -noupdate /pt_tb/pt/SagittaCalculator/dv11
add wave -noupdate /pt_tb/pt/SagittaCalculator/inv_sagitta_full
add wave -noupdate /pt_tb/pt/SagittaCalculator/o_dv_s
add wave -noupdate -radix unsigned /pt_tb/pt/SagittaCalculator/o_inv_s
add wave -noupdate -divider pt_s
add wave -noupdate /pt_tb/pt/dv_combo_s
add wave -noupdate /pt_tb/pt/dv_a
add wave -noupdate -radix unsigned /pt_tb/pt/a1
add wave -noupdate -radix unsigned /pt_tb/pt/a0
add wave -noupdate /pt_tb/pt/inv_s
add wave -noupdate /pt_tb/pt/dv0
add wave -noupdate /pt_tb/pt/a1_invs
add wave -noupdate /pt_tb/pt/dv1
add wave -noupdate -radix decimal /pt_tb/pt/pt_s
add wave -noupdate -divider pt_sp
add wave -noupdate -radix decimal /pt_tb/pt/p0_0
add wave -noupdate -radix decimal /pt_tb/pt/p0_1
add wave -noupdate -radix decimal /pt_tb/pt/p1_0
add wave -noupdate -radix decimal /pt_tb/pt/p1_1
add wave -noupdate -radix decimal /pt_tb/pt/p2_0
add wave -noupdate -radix decimal /pt_tb/pt/p2_1
add wave -noupdate /pt_tb/pt/dv2
add wave -noupdate -radix decimal /pt_tb/pt/p0
add wave -noupdate -radix decimal /pt_tb/pt/p1
add wave -noupdate -radix decimal /pt_tb/pt/p2
add wave -noupdate /pt_tb/pt/dv3
add wave -noupdate -radix decimal /pt_tb/pt/slc_s.phimod
add wave -noupdate /pt_tb/pt/p1_phi
add wave -noupdate /pt_tb/pt/p2_phi
add wave -noupdate /pt_tb/pt/pt_s1
add wave -noupdate /pt_tb/pt/dv4
add wave -noupdate /pt_tb/pt/pt_s2
add wave -noupdate /pt_tb/pt/p2_phi2
add wave -noupdate /pt_tb/pt/dv5
add wave -noupdate -radix decimal /pt_tb/pt/pt_sp
add wave -noupdate -divider pt_spe
add wave -noupdate -radix decimal /pt_tb/pt/e0_0
add wave -noupdate -radix decimal /pt_tb/pt/e0_1
add wave -noupdate -radix decimal /pt_tb/pt/e1_0
add wave -noupdate -radix decimal /pt_tb/pt/e1_1
add wave -noupdate /pt_tb/pt/dv6
add wave -noupdate -radix decimal /pt_tb/pt/e0
add wave -noupdate -radix decimal /pt_tb/pt/e1
add wave -noupdate /pt_tb/pt/dv7
add wave -noupdate /pt_tb/pt/pt_sp1
add wave -noupdate -radix decimal /pt_tb/pt/eta
add wave -noupdate /pt_tb/pt/e1_eta
add wave -noupdate /pt_tb/pt/dv8
add wave -noupdate -radix decimal /pt_tb/pt/pt_spe
add wave -noupdate /pt_tb/pt/dv_pt
add wave -noupdate -radix unsigned /pt_tb/pt/pt
add wave -noupdate -childformat {{/pt_tb/pt/mtc.mdt_pt -radix decimal}} -expand -subitemconfig {/pt_tb/pt/mtc.mdt_pt {-radix decimal}} /pt_tb/pt/mtc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {108452035 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {25312500 fs} {156562500 fs}
