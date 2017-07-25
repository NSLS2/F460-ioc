#!../../bin/linux-x86_64/F460

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/F460.dbd",0,0)
F460_registerRecordDeviceDriver(pdbbase)

## User defined ENV variables
epicsEnvSet(HOSTNAME,"F460IOC")

epicsEnvSet("STREAM_PROTOCOL_PATH", "${TOP}/F460App/src")
epicsEnvSet("Sys", "XF:06BM-BI")
epicsEnvSet("Dev", "{F460:1}")
epicsEnvSet("PORT", "E1")
epicsEnvSet("Dev2", "{F460:2}")
epicsEnvSet("PORT2", "E2")

drvAsynIPPortConfigure("$(PORT)", "10.6.130.52:4002")
drvAsynIPPortConfigure("$(PORT2)", "10.6.130.55:4002")

## Load records
dbLoadRecords("./db/F460.db", "Sys=$(Sys),Dev=$(Dev),PORT=$(PORT),PINI=YES,BUFSZ=12,PREC=9")
dbLoadRecords("./db/asyn.db", "Sys=$(Sys),Dev=$(Dev),PORT=$(PORT),ADDR=0")
dbLoadRecords("./db/F460.db", "Sys=$(Sys),Dev=$(Dev2),PORT=$(PORT2),PINI=YES,BUFSZ=12,PREC=9")
dbLoadRecords("./db/asyn.db", "Sys=$(Sys),Dev=$(Dev2),PORT=$(PORT2),ADDR=1")

#asynSetTraceMask("E1",0,9)
#asynSetTraceIOMask("E1",0,9)
asynSetTraceMask("E2",0,9)
asynSetTraceIOMask("E2",0,9)

cd ${TOP}/iocBoot/${IOC}/
< autosave.cmd

iocInit()
dbl > ${TOP}/pvs.pvlist

create_monitor_set("info_settings.req", 30)
create_monitor_set("info_positions.req", 15)
