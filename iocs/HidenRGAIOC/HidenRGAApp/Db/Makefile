TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db
DB_INSTALLS += $(HIDEN)/db/hiden_rga_bar.template
DB_INSTALLS += $(HIDEN)/db/hiden_rga_degas.template
DB_INSTALLS += $(HIDEN)/db/hiden_rga_global.template
DB_INSTALLS += $(HIDEN)/db/hiden_rga_ld.template
DB_INSTALLS += $(HIDEN)/db/hiden_rga_mid.template
DB_INSTALLS += $(HIDEN)/db/hiden_rga_prfl.template
DB_INSTALLS += $(HIDEN)/db/hiden_rga.proto

DB_INSTALLS += ${RECCASTER}/db/reccaster.db
DB_INSTALLS += ${AUTOSAVE}/db/save_restoreStatus.db
DB_INSTALLS += ${DEVIOCSTATS}/db/iocAdminSoft.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

