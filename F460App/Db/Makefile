TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += F460_main.template
DB += F460_channel.template
DB += F460_pid.template
DB += F460.db
DB += asyn.db

##foreign modules
#external module: uIOCsystem
#DB += F460_IOCsystem.substitutions
#external  module: generic-scan
#DB += F460_generic_scan.substitutions
#DB += F460_GSCAN_Saver.substitutions
#DB += F460_save_restoreStatus.substitutions


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_TEMPLATE = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
#EOF
