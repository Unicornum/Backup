
@echo off
setlocal enabledelayedexpansion

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem Using:
rem
rem backup RepositoryListFile ArchivePassword PathToBackupDirectory
rem
rem Example:
rem
rem backup .\Repositories.txt MySuperMegaPassword E:\DropBox\backup
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set REPOSITORIES_LIST_FILE="%1"
set PASSWORD=%2
set BACKUP_DIRECTORY="%~3"

set /a NumberLine=0
set GitHubUserUrl=

FOR /f "usebackq delims=" %%a IN (%REPOSITORIES_LIST_FILE%) DO (
  set /a NumberLine+=1
  rem echo !NumberLine!:%%a
  if !NumberLine! EQU 1 (
    set GitHubUserUrl=%%a
  ) else (
    call child\backup_repository !GitHubUserUrl! %%a
  )
)

set OPTIONS=a -ac -ag -cfg- -dh -ep2 -hp%PASSWORD% -m5 -mdg -r0 -rr10%% -s -idp -df -ep
set OUT_DIRECTORY=%BACKUP_DIRECTORY%
set LOG_FILE=%TEMP%\GitHubBackup.log
del %LOG_FILE%

bin\rar.exe %OPTIONS% %OUT_DIRECTORY%\backup.rar *.bundle > %LOG_FILE%

endlocal
pause
