#!../../bin/linux-x86_64/F460

< envPaths
< /epics/common/xf31id1-ioc1-netsetup.cmd

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/F460.dbd",0,0)
F460_registerRecordDeviceDriver(pdbbase)

## User defined ENV variables
epicsEnvSet("STREAM_PROTOCOL_PATH", "${TOP}/F460App/src")
epicsEnvSet("Sys", "XF:31ID-ES")
epicsEnvSet("Dev", "{F460:1}")
epicsEnvSet("PORT", "E1")

drvAsynIPPortConfigure("$(PORT)", "xf31id1-lab3-tsrv1.nsls2.bnl.local:4008")

## Load records
dbLoadRecords("./db/F460.db", "Sys=$(Sys),Dev=$(Dev),PORT=$(PORT),PINI=YES,BUFSZ=12,PREC=9")
dbLoadRecords("./db/asyn.db", "Sys=$(Sys),Dev=$(Dev),PORT=$(PORT),ADDR=0")

# asynSetTraceMask("E1",0,9)
# asynSetTraceIOMask("E1",0,9)

cd ${TOP}/iocBoot/${IOC}/
< autosave.cmd

dbLoadRecords("${TOP}/db/reccaster.db", "P=${Sys}{F460}RecSync")
iocInit()
dbl > ${TOP}/records.dbl

create_monitor_set("info_settings.req", 30)
create_monitor_set("info_positions.req", 15)
