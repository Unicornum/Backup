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
set DateTime=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

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

rem ===== Настройки архиватора =====

set a_opt=-t7z -r -p%Password% -mhe
set a_not=-scsWIN -x@exclude.txt
set a_out=%PathToResult%\backup%DateTime%.7z

rem ===== Запуск архиватора =====

echo Archived...
bin\7z.exe a %a_opt% %a_not% "%a_out%" "%PathToCopyRepositories%\*"

rd "%PathToBackupDirectory%" /S /Q
