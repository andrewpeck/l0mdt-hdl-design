# Python CSM slave LpGBT register write script for ApolloBasicInterface class
# Sript written by Panagiotis Gkountoumis - pgkounto@cern.ch 
# using uhal dummy hardware from Iacopo Longarini - ilongari@cern.ch

from ApolloBasePythonInterface import ApolloBaseInterface

import sys
#import ctypes
import time

def write_lpgbt(master_slave, lpgbt_IIC):

	error_address = 0
	error_data = 0
	f = open(FileName, "r")
	for i in range(336):
		text = f.read(11)

		if(len(text) < 2):
			f.close()
			break

		address = text[2:5]
		value   = text[8:10]

		lpgbt_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_GBTX_ADDR"
		SM.Write(lpgbt_address, lpgbt_IIC)
		reg_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_REGISTER_ADDR"
		SM.Write(reg_address, int(address,16))
		tx_data = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_DATA_TO_GBTX"
		SM.Write(tx_data,int(value,16))

		#Write data to fifo --> each assertion is one clock cycle
		tx_write = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_WR"
		SM.Write(tx_write,0x01)
		SM.Write(tx_write,0x00)

		#Send data to LpGBT over IC
		tx_start = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_START_WRITE"
		SM.Write(tx_start,0x01)
		SM.Write(tx_start,0x00)
#		time.sleep(1)
		start_read = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_START_READ"
		SM.Write(start_read, 0x01)
		SM.Write(start_read, 0x00)
		read_reg_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.RX_REG_ADR"
		data0 = SM.Read(read_reg_address)
		read_reg_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.RX_DATA"
		data1 = SM.Read(read_reg_address)

		data0Hex = "0x%0.3X" % data0
		data1Hex = "0x%0.2X" % data1

		if(int(address,16) != data0):
			print("Writing address: ", text[0:5], " not equal with reading address: ", data0Hex)
			error_address+=1
		elif(int(value,16) != data1):
			print("Writing value: ", text[6:10], " not equal with reading value: ", data1Hex)
			error_data+=1
		else:
			print("Writing: ", text[6:10],"on register:", text[0:5])

		print("Reading: ", data1Hex, "on register: ", data0Hex)

	f.close()

	if(error_address + error_data == 0):
		print("No errors detected")

	#Master LpGBT uplink does not align automaticaly and needs to send initially a clock pattern
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_GBTX_ADDR",0x75)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_REGISTER_ADDR",0x128)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_DATA_TO_GBTX",0x07)

	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_WR",0x01)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_WR",0x00)

	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_START_WRITE",0x01)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_START_WRITE",0x00)

	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_GBTX_ADDR",0x75)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_REGISTER_ADDR",0x128)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_DATA_TO_GBTX",0x00)

	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_WR",0x01)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_WR",0x00)

	time.sleep(1)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_START_WRITE",0x01)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_START_WRITE",0x00)

def read_lpgbt(master_slave, lpgbt_IIC):

	
	if(Master_slave == "master"):
		f = open(r"readback_MASTER.txt", "w+")
	else:
		f = open(r"readback_SLAVE.txt", "w+")

	for i in range(0,493):
		no_of_bytes = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_NUM_BYTES_TO_READ"
		SM.Write(no_of_bytes,0x01)
		lpgbt_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_GBTX_ADDR"
		SM.Write(lpgbt_address, lpgbt_IIC)
		reg_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_REGISTER_ADDR"
		SM.Write(reg_address, i)
		start_read = "HAL.CSM.CSM_0.SC."+master_slave+".IC.TX_START_READ"
		SM.Write(start_read,0x01)
		SM.Write(start_read,0x00)

		read_reg_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.RX_REG_ADR"
		data0 = SM.Read(read_reg_address)
		read_reg_address = "HAL.CSM.CSM_0.SC."+master_slave+".IC.RX_DATA"
		data1 = SM.Read(read_reg_address)

		data0Hex = "0x%0.3X" % data0
		data1Hex = "0x%0.2X" % data1
		print("Reading: ", data0Hex, " from register: ", data1Hex)
		f.write(data0Hex+" "+data1Hex+"\n")

	f.close()

	data = hex(SM.Read("HAL.CSM.CSM_0.SC.MASTER.IC.RX_CHIP_ADR"))
	print("LpGBT address is : ", data)
	
	path_write = "readback_"+master_slave
	print("Values are stored in : ", path_write)


if len(sys.argv) < 2:
    print("provide connections.xml file and (optional) device name as arguments")
    exit(1)

connectionFile = sys.argv[1];  
deviceName = sys.argv[2];
Master_slave = sys.argv[3];
Operation = sys.argv[4];

if(Operation == "write"):
	FileName = sys.argv[5];

#Create instance of ApolloBasicInterface
SM = ApolloBaseInterface( connectionFile, deviceName);

#print("Reading register FM.SB0.SB_MEM")
#print(SM.Read("FM.SPY_CTRL.INITIALIZE_SPY_MEMORY"))

#Set to LpGBT V1.0
print("Slave LpGBT - Setting to LpGBT V1.0")
SM.Write("HAL.CSM.CSM_0.SC.FRAME_FORMAT",0x01)

#Release reset for uplink and downlink
SM.Write("HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_0.RESET",0x00)
SM.Write("HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_1.RESET",0x00)
SM.Write("HAL.CSM.CSM_0.LPGBT.DOWNLINK.RESET",0x00)
SM.Write("HAL.CSM.CSM_0.SC.SLAVE.IC.TX_START_WRITE",0x00)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.IC.TX_START_WRITE",0x00)
cnt = 0

if(Master_slave == "master" and Operation == "write"):
	print("Writting master LpGBT using :", FileName)
	lpgbt_type = str("MASTER")
	errors = write_lpgbt(lpgbt_type, 117)


elif(Master_slave == "slave" and Operation == "write"):
	print("Writting slave LpGBT using :", FileName)
	lpgbt_type = str("SLAVE")
	errors = write_lpgbt(lpgbt_type, 115)

elif(Master_slave == "master" and Operation == "read"):
	print("Reading master LpGBT")
	lpgbt_type = str("MASTER")
	read_lpgbt(lpgbt_type, 117)

elif(Master_slave == "slave" and Operation == "read"):
	print("Reading slave LpGBT:")
	lpgbt_type = str("SLAVE")
	read_lpgbt(lpgbt_type, 115)
else:
	print("Set parameters: 1. connection file, 2. device Name, 3. Lpgbt type (master/slave), 4. mode (write/read), 5. Condifuration file - only for write")


