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
  if "%%i %%j %%k" EQU "* Verifying repository" (
    set dummy_revision=
  ) else (
  if "%%i %%j %%k" EQU "* Verifying metadata" (
    set dummy_revision=
  ) else (
  if "%%i %%j %%k" EQU "* Verified revision" (
    set max_verified_revision=%%i %%j %%k %%l
  ) else (
    if "!max_verified_revision!" NEQ "" echo !max_verified_revision!
    if "!max_revision!" NEQ "" echo !max_revision!
    echo %%i %%j %%k %%l
    set max_revision=
    set max_verified_revision=
  ))))

  if "%%i" EQU "Subject:" (
    echo.
  )

)

) > %DestBackupFile%
