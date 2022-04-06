onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ncsf_tb/clk
add wave -noupdate /ncsf_tb/CSF/mdt_hits(1)
add wave -noupdate /ncsf_tb/CSF/mdt_hits(0)
add wave -noupdate /ncsf_tb/CSF/seed_i
add wave -noupdate /ncsf_tb/CSF/i_eof
add wave -noupdate /ncsf_tb/CSF/cluster_hits_ml(0)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(0)/SUMMING(1)/CSF_SUM/hit
add wave -noupdate /ncsf_tb/CSF/fitter_en_ml(0)
add wave -noupdate /ncsf_tb/CSF/sums_ml(0)
add wave -noupdate /ncsf_tb/CSF/cluster_hits_ml(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/SUMMING(1)/CSF_SUM/hit
add wave -noupdate /ncsf_tb/CSF/fitter_en_ml(1)
add wave -noupdate /ncsf_tb/CSF/sums_ml(1)
add wave -noupdate /ncsf_tb/CSF/locseg
add wave -noupdate -childformat {{/ncsf_tb/CSF/Fitter/output_seg.b -radix unsigned} {/ncsf_tb/CSF/Fitter/output_seg.m -radix unsigned}} -expand -subitemconfig {/ncsf_tb/CSF/Fitter/output_seg.b {-height 16 -radix unsigned} /ncsf_tb/CSF/Fitter/output_seg.m {-height 16 -radix unsigned}} /ncsf_tb/CSF/Fitter/output_seg
add wave -noupdate -divider Cluster0
add wave -noupdate -divider Cluster1
add wave -noupdate -childformat {{/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit.localx -radix unsigned} {/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit.localy -radix unsigned} {/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit.radius -radix unsigned}} -expand -subitemconfig {/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit.localx {-radix unsigned} /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit.localy {-radix unsigned} /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit.radius {-radix unsigned}} /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv0
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dsp_squ_m_r
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv1
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv2
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv3
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv4
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv_v(0)
add wave -noupdate -childformat {{/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(0).x -radix unsigned} {/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(0).y -radix unsigned}} -expand -subitemconfig {/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(0).x {-radix unsigned} /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(0).y {-radix unsigned}} /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(0)
add wave -noupdate -childformat {{/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(0).x -radix unsigned} {/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(0).y -radix unsigned}} -expand -subitemconfig {/ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(0).x {-radix unsigned} /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(0).y {-radix unsigned}} /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(0)
add wave -noupdate -radix unsigned /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bminus(0)
add wave -noupdate -radix unsigned /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bplus(0)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(0)
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv_v(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/on_cluster(0)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/reference_b(0)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/reference_b(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/counters(0)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/counters(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/o_cluster_hits(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/o_cluster_hits(0)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bminus(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bplus(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(1)
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv_v(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/on_cluster(1)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/reference_b(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/reference_b(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/counters(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/counters(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/o_cluster_hits(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/o_cluster_hits(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bplus(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bminus(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(2)
add wave -noupdate -color Yellow -itemcolor Yellow /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/dv_v(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/on_cluster(2)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/reference_b(4)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/reference_b(5)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/counters(4)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/counters(5)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/o_cluster_hits(5)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/o_cluster_hits(4)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bplus(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/a_bminus(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_plus(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/hit_minus(3)
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/out_cluster
add wave -noupdate /ncsf_tb/CSF/CLUSTERING_GEN(1)/Cluster/max_counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {65810599 fs} 0} {{Cursor 2} {299999315 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 154
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
WaveRestoreZoom {54801670 fs} {133230242 fs}
