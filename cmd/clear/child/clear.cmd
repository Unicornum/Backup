@echo off
setlocal enableextensions enabledelayedexpansion

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem 
rem clear PathToClearDirectory FilesCount
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set sFolder=%1
set /a iCount=%2

for /f "skip=%iCount% usebackq delims=" %%i in (
  `dir /b /a:-d /o:-d /t:w "%sFolder%"`
) do del /f /q "%sFolder%\%%~i"

endlocal
exit /b 0
