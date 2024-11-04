@echo off
setlocal enableextensions enabledelayedexpansion

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem
rem backup_local PathToProjectsDirectory PathToBackupDirectory ArchivePassword
rem
rem Example:
rem
rem backup_local p:\projects p:\backup\work MySuperMegaPassword
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set PATH_TO_PROJECTS_DIRECTORY=%~1
set BACKUP_DIRECTORY=%~2
set PASSWORD=%3

FOR /D %%d IN ("%PATH_TO_PROJECTS_DIRECTORY%\*") DO (

set URL_SOURCE=%%d
set REPOSITOPY_NAME=%%~nxd
set LOCAL_COPY=.\!REPOSITOPY_NAME!_LocalCopy
set BUNDLE_FILE_NAME=!REPOSITOPY_NAME!.bundle

echo ========================================================
echo Bundle repository: !REPOSITOPY_NAME!
echo.

git clone --mirror !URL_SOURCE! !LOCAL_COPY!
cd !LOCAL_COPY!
git bundle create ..\!BUNDLE_FILE_NAME! --all
cd ..
rd !LOCAL_COPY! /S /Q

call bin\archiver.cmd .\!BUNDLE_FILE_NAME! . %PASSWORD%
del .\!BUNDLE_FILE_NAME! /S /Q

FOR %%f IN (.\backup*.7z) DO (

set BACKUP_FILE_NAME=!REPOSITOPY_NAME!_%%~nxf

rem rename %%f !BACKUP_FILE_NAME!
move /Y %%f "%BACKUP_DIRECTORY%\!BACKUP_FILE_NAME!"

)

echo.

)
