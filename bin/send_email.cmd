@echo off

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem 
rem send_email UrlServer MailTo MailFrom Password File
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set UrlServer=%~1
set MailTo=%~2
set MailFrom=%~3
set Password=%~4
set File=%~5

echo Send email...
bin\curl.exe --user %MailFrom%:%Password% -n --ssl-reqd --mail-from %MailFrom% --mail-rcpt %MailTo% --url %UrlServer% --upload-file %File%
