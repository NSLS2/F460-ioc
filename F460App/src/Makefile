TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = F460
# F460.dbd will be created and installed
#DBD += F460.dbd
DBD += ${PROD_IOC}.dbd

# F460.dbd will be made up from these files:
${PROD_IOC}_DBD += base.dbd
${PROD_IOC}_DBD += sscan.dbd
${PROD_IOC}_DBD += calcSupport.dbd
${PROD_IOC}_DBD += asSupport.dbd
#${PROD_IOC}_DBD += busySupport.dbd
${PROD_IOC}_DBD += stream.dbd
${PROD_IOC}_DBD += asyn.dbd
#${PROD_IOC}_DBD += motorSupport.dbd
${PROD_IOC}_DBD += drvAsynIPPort.dbd
${PROD_IOC}_DBD += drvAsynSerialPort.dbd
${PROD_IOC}_DBD += calcoutRecord.dbd
#${PROD_IOC}_DBD += uIOCSystem.dbd
#${PROD_IOC}_DBD += generic_scan.dbd

# Include dbd files from all support applications:
#${PROD_IOC}_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#${PROD_IOC}_LIBS += xxx
${PROD_IOC}_LIBS += autosave
#${PROD_IOC}_LIBS += seq pv
${PROD_IOC}_LIBS += calc
${PROD_IOC}_LIBS += sscan busy
${PROD_IOC}_LIBS += stream
${PROD_IOC}_LIBS += asyn
#${PROD_IOC}_LIBS += uIOCSystem
#${PROD_IOC}_LIBS += generic_scan

# F460_registerRecordDeviceDriver.cpp derives from F460.dbd
${PROD_IOC}_SRCS += F460_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
${PROD_IOC}_SRCS_DEFAULT += F460Main.cpp
${PROD_IOC}_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#F460_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
${PROD_IOC}_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

