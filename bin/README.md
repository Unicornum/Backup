
## Вспомогательные утилиты/скрипты

### archiver.cmd

Скрипт упаковки файлов в запароленный архив. 

Для работы скрипта необходим файл exclude.txt (содержащий шаблоны для файлов, которые должны быть проигнорированы при упаковке; может быть пустым) в рабочей папке.

```
bin\archiver.cmd Path\To\Source\*.txt Path\To\Result\Directory Password
```

Результатом работы скрипта будет файл, имя которого будет содержать дату/время создания файла в формате backupYYYYMMDDhhmmss.7z.

### send_email.cmd

Скрипт отправки содержимого файла на почту.

```
call bin\send_email.cmd "smtps://server:port" "mail_to" "mail_from" "password" "file.log"
```
