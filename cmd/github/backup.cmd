@echo off
setlocal enabledelayedexpansion

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem
rem backup RepositoryListFile PathToBackupDirectory ArchivePassword
rem
rem Example:
rem
rem backup .\Repositories.txt E:\DropBox\backup MySuperMegaPassword
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set REPOSITORIES_LIST_FILE="%1"
set BACKUP_DIRECTORY="%~2"
set PASSWORD=%3

set /a NumberLine=0
set GitHubUserUrl=

FOR /f "usebackq delims=" %%a IN (%REPOSITORIES_LIST_FILE%) DO (
  set /a NumberLine+=1
  rem echo !NumberLine!:%%a
  if !NumberLine! EQU 1 (
    set GitHubUserUrl=%%a
  ) else (
    call github\backup_repository !GitHubUserUrl! %%a
  )
)

bin\archiver.cmd "%CD%\*.bundle" "%BACKUP_DIRECTORY%" %PASSWORD%

endlocal
