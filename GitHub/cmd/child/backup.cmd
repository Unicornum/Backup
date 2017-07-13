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
set BACKUP_DIRECTORY="%3"

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

endlocal
pause
