TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = HidenRGA
# HidenRGA.dbd will be created and installed
DBD += HidenRGA.dbd

# HidenRGA.dbd will be made up from these files:
HidenRGA_DBD += base.dbd

# Include dbd files from all support applications:
#HidenRGA_DBD += xxx.dbd
HidenRGA_DBD += asyn.dbd
HidenRGA_DBD += drvAsynIPPort.dbd
HidenRGA_DBD += calc.dbd
HidenRGA_DBD += stream.dbd
HidenRGA_DBD += HidenRGA.dbd
HidenRGA_DBD += system.dbd
HidenRGA_DBD += reccaster.dbd
HidenRGA_DBD += asSupport.dbd
HidenRGA_DBD += caPutLog.dbd
HidenRGA_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
#HidenRGA_LIBS += xxx
HidenRGA_LIBS += reccaster
HidenRGA_LIBS += autosave
HidenRGA_LIBS += caPutLog
HidenRGA_LIBS += devIocStats
HidenRGA_LIBS += HidenRGA
HidenRGA_LIBS += stream
HidenRGA_LIBS += calc
HidenRGA_LIBS += asyn

ifneq ($(SNCSEQ),)
    HidenRGA_SNCFLAGS += +d
    HidenRGA_LIBS += seq pv
endif

# HidenRGA_registerRecordDeviceDriver.cpp derives from HidenRGA.dbd
HidenRGA_SRCS += HidenRGA_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
HidenRGA_SRCS_DEFAULT += HidenRGAMain.cpp
HidenRGA_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#HidenRGA_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
HidenRGA_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

