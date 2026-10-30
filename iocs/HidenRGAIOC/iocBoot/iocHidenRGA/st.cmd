#!../../bin/linux-x86_64/HidenRGA

< envPaths

# Prefix configuration:
#   IP_ADDR - Hiden MSIU IP address
#   P       - EPICS PV system prefix
#   R       - EPICS PV device prefix

epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/db")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/HidenRGA.dbd"
HidenRGA_registerRecordDeviceDriver pdbbase

# Connect to MSIU
drvAsynIPPortConfigure("LO","${IP_ADDR}:5025",0,0,0)

# Load record instances
dbLoadRecords("${TOP}/db/hiden_rga_global.template", "Sys=${P},Dev=${R},MaxMass=200,PORT=LO")
dbLoadRecords("${TOP}/db/hiden_rga_prfl.template", "Sys=${P},Dev=${R},MinMass=1,MaxMass=200,PORT=LO")
dbLoadRecords("${TOP}/db/hiden_rga_bar.template", "Sys=${P},Dev=${R},MinMass=1,MaxMass=200,PORT=LO")
dbLoadRecords("${TOP}/db/hiden_rga_mid.template", "Sys=${P},Dev=${R},PORT=LO")
dbLoadRecords("${TOP}/db/hiden_rga_degas.template", "Sys=${P},Dev=${R},PORT=LO")
dbLoadRecords("${TOP}/db/hiden_rga_ld.template", "Sys=${P},Dev=${R},MinMass=1,MaxMass=200,PORT=LO")

cd "${TOP}/iocBoot/${IOC}"
iocInit

seq sncDegas, "Sys=${P},Dev=${R}"
