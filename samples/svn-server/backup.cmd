@echo off

set PATH=%PATH%;C:\Program Files\VisualSVN Server\bin

call svn\backup.cmd D:\Repositories "D:\Cloud.backup\SVN Backup" password > backup.log
