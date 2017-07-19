@echo off

set PATH=%PATH%;C:\Program Files\git\bin

call github\backup.cmd "%CD%\repositories.txt" "D:\Cloud.backup\GitHub Backup" password > backup.log
