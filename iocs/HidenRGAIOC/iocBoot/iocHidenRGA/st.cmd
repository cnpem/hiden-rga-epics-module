#!../../bin/linux-x86_64/HidenRGA

< envPaths

# Prefix configuration:
#   IP_ADDR - Hiden MSIU IP address
#   P       - EPICS PV system prefix
#   R       - EPICS PV device prefix

epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/db")

## Register all support components
dbLoadDatabase "$(TOP)/dbd/HidenRGA.dbd"
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

reAddAlias "(.*):Cmd:MID_(.*)-Cmd" "$1:$2MID-Cmd"
dbCreateAlias(pdbbase, "${P}${R}Ind:Run-Sts", "${P}${R}Run-Mon")

reAddAlias "(.*):.*:Fil(.*)-Cmd" "$1:Filament$2En-Sel"
# use .? to match a single or no character so it doesn't run recursively and match the newly created aliases
reAddAlias "(.*):.*:Fil(.?)-Sts" "$1:Filament$2En-Sts"

reAddAlias "(.*):P:MID(.*)-I" "$1:MID$2Pressure-Mon"

iocshLoad set-mid.cmd "MID=1,Mass=2"
iocshLoad set-mid.cmd "MID=2,Mass=4"
iocshLoad set-mid.cmd "MID=3,Mass=18"
iocshLoad set-mid.cmd "MID=4,Mass=20"
iocshLoad set-mid.cmd "MID=5,Mass=28"
iocshLoad set-mid.cmd "MID=6,Mass=32"
iocshLoad set-mid.cmd "MID=7,Mass=40"
iocshLoad set-mid.cmd "MID=8,Mass=44"

iocInit

seq sncDegas, "Sys=${P},Dev=${R}"

dbpf "${P}${R}Cnt:MID_Cyc-SP" 0
dbpf "${P}${R}Cmd:MID_Set-Cmd" 1
dbpf "${P}${R}E:RGA_DeltaM-SP" 0
dbpf "${P}${R}Res:RGA-SP" 0
dbpf "${P}${R}Cmd:Env-Cmd" 1
