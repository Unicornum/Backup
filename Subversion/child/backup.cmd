@echo off
setlocal enabledelayedexpansion

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem
rem backup.cmd PathToRepositories PathToResultDirectory Password
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set PathToRepositories=%1
set PathToResult=%2
set Password=%3
set PathToBackupDirectory=%TEMP%\BackupSvn
set PathToCopyRepositories=%PathToBackupDirectory%\CopyRepositories

rem ===== Копируем репозитории =====

md %PathToCopyRepositories%

for /d %%I in ("%PathToRepositories%\*") do (

  set RepositoryName=%%~nxI
  set ShortRepositoryName=!RepositoryName:.no.backup=!

  if NOT !RepositoryName! == !ShortRepositoryName! (
    echo Missing !RepositoryName!...
  ) else (
    echo Copy !RepositoryName!... 
    md %PathToCopyRepositories%\!RepositoryName!
    svnadmin hotcopy %PathToRepositories%\!RepositoryName! %PathToCopyRepositories%\!RepositoryName!
  )  
)

rem ===== Настройки архиватора =====

set a_opt=a -ac -ag -cfg- -dh -ep2 -hp%Password% -m5 -mdg -r0 -rr10%% -s -idp
set a_not=-x@.\exclude.txt
set a_out="%PathToResult%\backup.rar"
set a_log=%PathToBackupDirectory%\backup_log.txt

rem ===== Запуск архиватора =====

echo Archived...
bin\rar.exe %a_opt% %a_not% %a_out% %PathToCopyRepositories%\* > %a_log%

rd %PathToBackupDirectory% /S /Q
