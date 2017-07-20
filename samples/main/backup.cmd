@echo off

set OutDirectory=%TEMP%\backup
set DropBox=E:\DropBox\backup
set CloudMailRu="E:\Cloud Mail.Ru\backup"

call bin\archiver.cmd H:\Work\* %OutDirectory% password > backup.log

copy %OutDirectory%\*.* %DropBox% /Y
copy %OutDirectory%\*.* %CloudMailRu% /Y

rd %OutDirectory% /S /Q
