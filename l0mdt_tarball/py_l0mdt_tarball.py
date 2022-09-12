import sys
import os
import shutil

HOG_PROJECT="l0mdt_ku15p_ull_empty"
PRJ=sys.argv[1] #"../bin/l0mdt_ku15p_ull_empty-v0.3.65-hogD927A1E-dirty/"
BIN_DIR="../bin/"+PRJ
SVF_FILE = BIN_DIR +"/" +  PRJ + ".svf"
DTSI_DIR = BIN_DIR + "/dtsi"
MODULES_DIR = "modules_"+HOG_PROJECT
print ("Creating tarball for ",HOG_PROJECT)
print ("BIN_DIR is ",BIN_DIR)

os.mkdir(HOG_PROJECT)
new_dir_addr_table = HOG_PROJECT+"/address_table"
os.mkdir(new_dir_addr_table)
new_dir_bit = HOG_PROJECT+"/bit"
os.mkdir(new_dir_bit)
new_dir_dtbo = HOG_PROJECT+"/dtbo"
os.mkdir(new_dir_dtbo)


HOG_PROJECT_DIRECTORY = "../Projects/"+HOG_PROJECT
shutil.copytree("../address_tables/modules", new_dir_addr_table+"/"+MODULES_DIR)
shutil.copy(SVF_FILE, new_dir_bit)

fptr = open("../address_tables/address_apollo.xml")
fptr_w = open(new_dir_addr_table + "/address_apollo.xml","w")
for line in fptr:
    fptr_w.write(line.replace("module=\"file:/"," fwinfo=\"uio_endpoint\" module=\"file:///fw/CM/l0mdt_ku15p_ull_empty/address_table/"+MODULES_DIR))
fptr.close()
fptr_w.close()

fptr   = open("../address_tables/connections.xml")
fptr_w = open(new_dir_addr_table+"/connections.xml","w")
for line in fptr:
    fptr_w.write(line.replace("/opt/","/fw/CM/l0mdt_ku15p_ull_empty/"))    
fptr.close()
fptr_w.close()

for file in os.listdir(DTSI_DIR):
    file_path =  DTSI_DIR+"/"+file
    dtb_file = new_dir_dtbo + "/" + file.replace("dtsi","") + "dtbo"
    print(file, " ", file_path, " ", dtb_file)
    dtc_command = "dtc -O dtb -o "+dtb_file+" -b 0 " + file_path
    print(dtc_command)
    os.system(dtc_command)

tar_cmd = "tar cvf "+HOG_PROJECT+".tar "+HOG_PROJECT
gzip_cmd= "gzip "+HOG_PROJECT +".tar "

os.system(tar_cmd)
os.system(gzip_cmd)
