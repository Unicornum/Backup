
@echo off

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem Using:
rem
rem backup_repository GitHubUserUrl RepositoryName
rem
rem Example:
rem
rem backup_repository https://github.com/Unicornum Android
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set URL_SOURCE=%1/%2.git
set LOCAL_COPY=.\%2_LocalCopy
set BACKUP_FILE_NAME=%2.bundle

echo Source data:
echo URL_SOURCE: %URL_SOURCE%
echo LOCAL_COPY: %LOCAL_COPY%
echo BACKUP_FILE_NAME: %BACKUP_FILE_NAME%
echo .

git clone --mirror %URL_SOURCE% %LOCAL_COPY%
cd %LOCAL_COPY%
git bundle create ..\%BACKUP_FILE_NAME% --all
cd ..
rd %LOCAL_COPY% /S /Q
