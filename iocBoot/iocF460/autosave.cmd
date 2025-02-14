# Autosave/restore
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("info_settings.sav")
set_pass0_restoreFile("info_positions.sav")

makeAutosaveFileFromDbInfo("$(TOP)/as/req/info_settings.req", "autosaveFields")
makeAutosaveFileFromDbInfo("$(TOP)/as/req/info_positions.req", "autosaveFields_pass0")
