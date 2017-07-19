@echo off
setlocal enabledelayedexpansion

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem
rem backup.cmd Path\To\Repositories Path\To\Result\Directory Password
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set PathToRepositories=%~1
set PathToResult=%~2
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
    md "%PathToCopyRepositories%\!RepositoryName!"
    svnadmin hotcopy "%PathToRepositories%\!RepositoryName!" "%PathToCopyRepositories%\!RepositoryName!"
  )  
)

rem ===== Запуск архиватора =====

call bin\archiver.cmd "%PathToCopyRepositories%\*" "%PathToResult%" %Password%

rd "%PathToBackupDirectory%" /S /Q
