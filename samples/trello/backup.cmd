@echo off

set OutDirectory=%TEMP%\backup
set CloudMailRu="E:\Cloud Mail.Ru\trello"

call trello\backup.cmd KEY TOKEN > backup.log
call bin\archiver.cmd Account\* %OutDirectory% password >> backup.log

copy %OutDirectory%\*.* %CloudMailRu% /Y

rd %OutDirectory% /S /Q
rd Account /S /Q
