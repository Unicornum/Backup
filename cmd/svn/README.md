﻿
## Backup репозиториев Subversion

Скрипт создания резервной копии репозиториев на файловом сервере (где используется [VisualSvn Server](https://www.visualsvn.com/server/)). Скрипт создает 'горячую' копию для каждого из существующих репозиториев и упаковывает их в одиный запароленный архив, имя файла которого содержит дату/время его создания.

- Репозитории, имена которых оканчиваются на .no.backup будут проигнорированы на стадии создания 'горячей' копии.
- Файл exclude.txt может содержать маски для игнорирования отдельных репозиториев при упаковке в архив.

Запуск скрипта:
```
backup.cmd D:\Repositories D:\DropBox\Backup password
```