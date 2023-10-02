# Python example for ApolloBasicInterface class
# using uhal dummy hardware
# Iacopo Longarini - ilongari@cern.ch
 


from ApolloBasePythonInterface import ApolloBaseInterface

import sys
import time
#import ctypes

def read_sca(sca_number, cmd_type):
	command = "HAL.CSM.CSM_0.SC.MASTER.SCA_RX.RX_"+str(sca_number)+".RX_DATA"
	data = hex(SM.Read(command))
	command = "HAL.CSM.CSM_0.SC.MASTER.SCA_RX.RX_"+str(sca_number)+".RX_LEN"
	length = hex(SM.Read(command))
	command = "HAL.CSM.CSM_0.SC.MASTER.SCA_RX.RX_"+str(sca_number)+".RX_ERR"
	error = hex(SM.Read(command))
	command = "HAL.CSM.CSM_0.SC.MASTER.SCA_RX.RX_"+str(sca_number)+".RX_TRANSID"
	transid = hex(SM.Read(command))
	temperature = adc_conversion(data)
	if(cmd_type == "ADC"):
		print("SCA%d" %sca_number, "temperature   : %.2f" % temperature)
	else:
		print("SCA%d" %sca_number, " Data   : ", data)
		#print("SCA%d" %sca_number, " Length   : ", length)
		#print("SCA%d" %sca_number, " error   : ", error)
		#print("SCA%d" %sca_number, " transid   : ", transid)

	return data


def adc_conversion(input_value):
	temp = (716-(int(input_value,16)/4096)*1000)/1.829
	return temp

def write_transaction(channel, command, data, td_id):
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_CHANNEL",channel)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_CMD",command)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_DATA",data)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_TRANSID",tr_id)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.START_COMMAND",0x01)
	SM.Write("HAL.CSM.CSM_0.SC.MASTER.START_COMMAND",0x00)

if len(sys.argv) < 2:
    print("provide connections.xml file and (optional) device name as arguments")
    exit(1)

connectionFile = sys.argv[1];  
deviceName = sys.argv[2];

#Create instance of ApolloBasicInterface
SM = ApolloBaseInterface( connectionFile, deviceName);

#print("Reading register FM.SB0.SB_MEM")
#print(SM.Read("FM.SPY_CTRL.INITIALIZE_SPY_MEMORY"))

CMD  = "CMD"
ADC = "ADC"

#Set to LpGBT V1.0
print("Seeting to LpGBT V1.0")
print("Writing 0x01 on register HAL.CSM.CSM_0.SC.FRAME_FORMAT")
SM.Write("HAL.CSM.CSM_0.SC.FRAME_FORMAT",0x01)

#Release reset for uplimnk and downlink
print("Release reset for uplink and downlink")
SM.Write("HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_0.RESET",0x00)
SM.Write("HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_1.RESET",0x00)
SM.Write("HAL.CSM.CSM_0.LPGBT.DOWNLINK.RESET",0x00)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.RX_RESET",0x00)
SM.Write("HAL.CSM.CSM_0.SC.SLAVE.RX_RESET",0x00)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_RESET",0x00)

#Configure SCA
SM.Write("HAL.CSM.CSM_0.SC.MASTER.SCA_ENABLE",0x0f)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.INJ_CRC_ERR",0x00)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_ADDRESS",0x00)
tr_id = 0

#Start RESET 
write_transaction(0x00, 0x00, 0x00000000, tr_id)

SM.Write("HAL.CSM.CSM_0.SC.SLAVE.RX_RESET",0x01)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_RESET",0x01)
SM.Write("HAL.CSM.CSM_0.SC.SLAVE.RX_RESET",0x00)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.TX_RESET",0x00)
tr_id += 1
time.sleep(0.1)

#Start CONNECT 
write_transaction(0x00, 0x00, 0x00000000, tr_id)

SM.Write("HAL.CSM.CSM_0.SC.MASTER.START_RESET",0x01)
SM.Write("HAL.CSM.CSM_0.SC.MASTER.START_RESET",0x00)
tr_id += 1
time.sleep(0.1)

#Enable ADC & JTAG - Control register D
write_transaction(0x00, 0x06, 0xFF000000, tr_id)
tr_id += 1
time.sleep(0.1)

#READ CONTROL REGISTER D
write_transaction(0x00, 0x07, 0x00000000, tr_id)
tr_id += 1

print("########### READ REGISTER D ###########")
read_sca(0, CMD)
read_sca(1, CMD)
read_sca(2, CMD)
#read_sca(3, CMD)

#READ SCA ID
write_transaction(0x14, 0xD1, 0x000000001, tr_id)
tr_id += 1

print("############ READ SCA ID ##############")
read_sca(0, CMD)
read_sca(1, CMD)
read_sca(2, CMD)
read_sca(3, CMD)

#Set frequency
write_transaction(0x13, 0x90, 0x00000013, tr_id)
tr_id += 1

#TDO [31:0]
write_transaction(0x13, 0x10, 0x00000000, tr_id)
tr_id += 1
write_transaction(0x13, 0x00, 0x00000000, tr_id)
tr_id += 1

#TMS: 0x000003E800000001 
write_transaction(0x13, 0x40, 0x0000005f, tr_id)
tr_id += 1
write_transaction(0x13, 0x50, 0x00000200, tr_id)
tr_id += 1

#Configure 
write_transaction(0x13, 0x80, 0x0000422A, tr_id)
tr_id += 1

#Go
write_transaction(0x13, 0xa2, 0x00000000, tr_id)
tr_id += 1

#Read TDI
write_transaction(0x13, 0x11, 0x00000000, tr_id)
tr_id += 1

print("############## READ TDI ###############")
ID_MSB_int = int(read_sca(0, CMD),16)
ID_MSB_hex = hex(ID_MSB_int << 32)

write_transaction(0x13, 0x01, 0x00000000, tr_id)
tr_id += 1

print("############## READ TDI ###############")
ID_LSB = int(read_sca(0, CMD),16)
ID_LSB_hex = hex(ID_LSB)

ID_number =  int(ID_MSB_hex,16) + ID_LSB 			 
print("CSM Artix FPGA ID is:", hex(ID_number >> 9)) #Looks that garbages from switching states are propagated to the TDO output

#WRITE CONTROL REGISTER B
write_transaction(0x00, 0x02, 0x1C000000, tr_id)
tr_id += 1

#READ CONTROL REGISTER B
write_transaction(0x00, 0x03, 0x00000000, tr_id)
tr_id += 1

print("####### READ CONTROL REGISTER B #######")
read_sca(0, CMD)
read_sca(1, CMD)
read_sca(2, CMD)
read_sca(3, CMD)

#Set ADC multiplexer
write_transaction(0x14, 0x50, 0x0000001f, tr_id)
tr_id += 1

for i in range(0, 1):
	#Start Conversion
	write_transaction(0x14, 0x02, 0x00000001, tr_id)
	tr_id += 1

	print("########### READ TEMPERATURE ##########")
	read_sca(0, ADC)
	read_sca(1, ADC)
	read_sca(2, ADC)
	read_sca(3, ADC)
	time.sleep(1)



