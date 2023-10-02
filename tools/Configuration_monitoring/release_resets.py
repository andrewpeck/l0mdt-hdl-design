# Python example for ApolloBasicInterface class
# using uhal dummy hardware
# Iacopo Longarini - ilongari@cern.ch
 


from ApolloBasePythonInterface import ApolloBaseInterface

import sys
#import ctypes



if len(sys.argv) < 2:
    print("provide connections.xml file and (optional) device name as arguments")
    exit(1)

connectionFile = sys.argv[1];  
deviceName = sys.argv[2];

#Create instance of ApolloBasicInterface
SM = ApolloBaseInterface( connectionFile, deviceName);

#print("Reading register FM.SB0.SB_MEM")
#print(SM.Read("FM.SPY_CTRL.INITIALIZE_SPY_MEMORY"))

#Set to LpGBT V1.0
print("Seeting to LpGBT V1.0")
print("Writing 0x01 on register HAL.CSM.CSM_0.SC.FRAME_FORMAT")
SM.Write("HAL.CSM.CSM_0.SC.FRAME_FORMAT",0x01)

#Release reset for uplimnk and downlink
print("Release reset for uplimnk and downlink")
print("Writing 0x00 on register HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_0.RESET")
SM.Write("HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_0.RESET",0x00)

print("Writing 0x00 on register HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_1.RESET")
SM.Write("HAL.CSM.CSM_0.LPGBT.UPLINK.UPLINK_1.RESET",0x00)

print("Writing 0x00 on register HAL.CSM.CSM_0.LPGBT.DOWNLINK.RESET")
SM.Write("HAL.CSM.CSM_0.LPGBT.DOWNLINK.RESET",0x00)
