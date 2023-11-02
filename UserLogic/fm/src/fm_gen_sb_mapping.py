#!/usr/bin/env python3
l0mdt_TP_width = {
    "HEG2SFSLC" : 128,
    "HEG2SFHIT" : 64,
    "SF2PTCALC" : 64,
    "SLC_RX"       : 256,
    "UCM2HPS"   : 64,
    "UCM2PL"      : 256,
    "SB_DUMMY" : 64,
    "TDCPOLMUX2TAR" : 64,
    "MTC2SL" : 256,
    "CUSTOM_CSM_UPLINK_DATA" : 32
}

def create_fm_sb_pkg():
    with open("fm_sb_pkg_template.sv","r") as f_template:
        template_lines  = f_template.readlines(); #[line.rstrip('\n') for line in f_template]

        with open("fm_sb_mapping.txt","r") as f:
            #lines = f.readlines();
            lines = [line.rstrip('\n') for line in f]

        fw = open("fm_sb_pkg.sv","w")
            
        j=''    

        sb_count = 0
        sb_total_dummy = 2
        for ln in lines:      
            if(not ln.startswith("#") and ln):
                sb_count = sb_count + 1
                
        for t_ln in template_lines:
            if not "INSERT HERE" in t_ln:
                fw.write(t_ln)
            else:
                fw.write("parameter total_l0mdt_sb    = " + str(sb_count-sb_total_dummy) + ";" + "\n")
                fw.write("parameter sb_total_dummy = "+str(sb_total_dummy)+";\n")
                fw.write("parameter sb_mapped_n      = total_l0mdt_sb + sb_total_dummy;" + "\n")                        
                fw.write ("\nparameter integer sb_tp_dw[sb_mapped_n] = {\n")
                first = 1;
                for ln in lines:      
                    if(not ln.startswith("#") and ln):
                        if first == 1:
                            first = 0
                            fw.write("\t\t " + j.join((ln,"_LEN")) + "\n")
                        else:
                            fw.write('\t\t,' + j.join((ln,"_LEN")) + "\n")
                fw.write("\t\t\t};\n")
                                
                    
                fw.write ("parameter integer sb_dw[sb_mapped_n] = {\n")
                first = 1;
                for ln in lines:
                    if(not ln.startswith("#") and ln):   
                        if first == 1:
                            first = 0                   
                            fw.write ("\t\t")
                        else:
                            fw.write ("\t\t,")
                            #fw.write ("\t\t find_ceil(" + j.join((ln,"_LEN")) + ", axi_dw) * axi_dw\n")
                        #fw.write ("find_ceil("+ j.join((ln,"_LEN")) + ", find_floor(" + j.join((ln,"_LEN"))+ ",axi_dw)*axi_dw) * find_floor(" + j.join((ln,"_LEN")) + ",axi_dw) * axi_dw\n")
                        fw.write ("find_sb_dw(" + j.join((ln,"_LEN")) + ", axi_dw)\n")
                fw.write("\t\t\t};\n")
                                
                print("SB COUNT =",sb_count)
                fw.write(" parameter  reg [31:0]       axi_sb_addr_width[sb_mapped_n] = {\n")               
                for i in range(sb_count):                  
                        fw.write("\t\t$bits(FM_CTRL.SB"+str(i)+".SB_MEM.address)")
                        if  i < sb_count -1 :
                            fw.write(",\n")
             
                fw.write("\t\t\t};\n")
    f.close();
    fw.close();
    return [sb_count-sb_total_dummy, sb_total_dummy]



def create_fm_data(list):
    [total_l0mdt_sb, sb_total_dummy] = list
    with open("fm_data_template.sv","r") as fd_template:
        template_lines  = fd_template.readlines(); 
    fd_w = open("fm_data.sv","w")

    for d_ln in template_lines:
        if not "INSERT HERE" in d_ln:
            fd_w.write(d_ln)
        else:
            for i in range(total_l0mdt_sb + sb_total_dummy):
                fd_w.write( "assign fm_mon_out.SB"+str(i)+".SB_MEM = (axi_spy_rd_vld["+str(i)+"] == 0)? \'{rd_data:\'b0, rd_data_valid:0} :  \'{rd_data:axi_spy_data["+str(i)+"], rd_data_valid:axi_spy_rd_vld["+str(i)+"]};\n")
          
                
            fd_w.write( "\nassign  axi_sb_addr       = (init_spy_mem_internal)? axi_sb_init_addr : {\n")
            for i in range(total_l0mdt_sb +sb_total_dummy ):
                fd_w.write( "\tfm_ctrl_in.SB"+str(i)+".SB_MEM.address")          
                if  i<total_l0mdt_sb + sb_total_dummy-1:
                    fd_w.write(",\n")
            fd_w.write("\n\t\t};\n")

            fd_w.write( "\nassign  axi_sb_enable       =  {\n")
            for i in range(total_l0mdt_sb +sb_total_dummy):
                fd_w.write( "\tfm_ctrl_in.SB"+str(i)+".SB_MEM.enable")         
                if  i<total_l0mdt_sb + sb_total_dummy - 1:
                    fd_w.write(",\n")
            fd_w.write("\n\t\t};\n")

            fd_w.write( "\nassign  axi_sb_wr_enable       = (init_spy_mem_internal == 1)? '1: { \n")
            for i in range(total_l0mdt_sb +sb_total_dummy):
                fd_w.write( "\tfm_ctrl_in.SB"+str(i)+".SB_MEM.wr_enable")         
                if  i<total_l0mdt_sb + sb_total_dummy - 1:
                    fd_w.write(",\n")
            fd_w.write("\n\t\t};\n")

            fd_w.write( "\nassign  axi_sb_wr_data       = (init_spy_mem_internal == 1)? axi_sb_init_wr_data: { \n")
            for i in range(total_l0mdt_sb + sb_total_dummy):
                fd_w.write( "\tfm_ctrl_in.SB"+str(i)+".SB_MEM.wr_data")           
                if  i<total_l0mdt_sb + sb_total_dummy-1:
                    fd_w.write(",\n")
            fd_w.write("\n\t};\n")


def create_fm_xml(list):
    [total_l0mdt_sb, sb_total_dummy] = list
    print("\n**********************\n      create_fm_xml: Note: Need to Manually check to ensure no overlap between register and bram address mapping    \n**************\n")
    with open("FM_template.xml","r") as fxml_template:
        template_lines  = fxml_template.readlines(); 
    fxml_w = open("FM.xml","w")
    address_block = 512
    mem_size        = 32
    address     = 0

    with open("fm_sb_mapping.txt","r") as f:
        #lines = f.readlines();
        lines = [line.rstrip('\n') for line in f]

    df   = []
    for df_line in lines:
        if(not df_line.startswith("#") and df_line):
            df.append(df_line)
   
    
    for x_ln in template_lines:
        if not "INSERT HERE" in x_ln:
            fxml_w.write(x_ln)
        else:
            for i in range(total_l0mdt_sb+sb_total_dummy) :
                fxml_w.write("  <node id=\"SB"+str(i)+"\" address=\""+hex(address)+"\" description =\" width="+str(l0mdt_TP_width[df[i]])+" df="+df[i]+"\" >\n")
                fxml_w.write("   <node id=\"SB_MEM\" address=\"0x0\" mode=\"incremental\" size=\""+hex(address_block)+"\"  fwinfo=\"type=mem32_"+hex(address_block)+"\"/>\n")
                fxml_w.write("  </node>\n")
                address = address + address_block
def main():
    [total_l0mdt_sb, sb_total_dummy] = create_fm_sb_pkg()
    print ("TOTAL_SB=", total_l0mdt_sb," TOTAL_DUMMY=",sb_total_dummy)

    create_fm_data([total_l0mdt_sb, sb_total_dummy])
    create_fm_xml([total_l0mdt_sb, sb_total_dummy])

if __name__ == "__main__":
    main()
