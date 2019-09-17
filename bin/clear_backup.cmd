@echo off
SetLocal EnableExtensions EnableDelayedExpansion

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem 
rem clear_backup SrcBackupFile DestBackupFile
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set SrcBackupFile=%~1
set DestBackupFile=%~2

(
FOR /F "tokens=1-3*" %%i IN (%SrcBackupFile%) DO (
if "%%i %%j %%k" EQU "* Copied revision" (
set max_revision=%%i %%j %%k %%l
) else (
if "!max_revision!" NEQ "" echo !max_revision!
echo %%i %%j %%k %%l
set max_revision=
)
)
) > %DestBackupFile%
