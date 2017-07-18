@echo off

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem 
rem archiver Path\To\Source\*.txt Path\To\Result\Directory Password
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set PathToSourceFiles=%~1
set PathToResultDirectory=%~2
set Password=%3

set Time2Hour=%TIME: =0%
set DateTime=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%%Time2Hour:~0,2%%Time2Hour:~3,2%%Time2Hour:~6,2%

set Options=-t7z -r -p%Password% -mhe
set Exclude=-scsWIN -x@exclude.txt
set PathToResultFile=%PathToResultDirectory%\backup%DateTime%.7z

echo Archived...
bin\7z.exe a %Options% %Exclude% "%PathToResultFile%" "%PathToSourceFiles%"
