﻿
# Backup репозитория GitHub



## Скрипт для резервного копирования репозиториев аккаунта на GitHub

> Предполагается, что на компьютере установлен git таким образом, что его можно запустить простым вызовом git.exe.

Для создания резервной копии репозиториев одного пользователя, необходимо:

- Создать файл repositories.txt, в котором в первой строке должен быть url пользователя, а в следующих - названия репозиториев этого пользователя, для которых нужно создать backup'ы.
- Запустить скрипт backup.cmd, передав ему путь к файлу repositories.txt, путь к папке, в которой архив будет создан и пароль архива.

Результатом работы скрипта будет запароленный архив, имя которого будет содержать дату/время создания, содержащий все резервные копии репозиториев, указанных в файле repositories.txt.

## Создание локальной резервной копии



- Путь к репозиторию, резервная копия которого будет создаваться:


```

set URL_SOURCE=https://<user>:<password>@github.com/<user>/<repository>.git

```



- Создание полной копии репозитория (без создания рабочей копии!):


```

git clone --mirror %URL_SOURCE% .\Backup

```



- Создание единого файла Backup.bundle, содержащего информацию обо всем репозитории:


```

cd Backup
git bundle create ..\Backup.bundle --all

```



## Восстановление репозитория из резервной копии



- Создать новый (пустой) репозиторий на GitHub.

- Путь к репозиторию, в который будет заливаться информация из резервной копии:


```

set URL_RESTORE=https://github.com/<user>/<restore>.git

```



- Распаковка резервной копии репозитория с созданием новой рабочей копии:


```

git clone .\Backup.bundle .\Copy

```



- Заливка рабочей копии в предварительно созданный пустой репозиторий (GitHub покажет окно авторизации, в котором нужно будет ввести имя пользователя/пароль для аккаунта, на котором был создан репозиторий):


```

cd .\Copy
git push --mirror %URL_RESTORE%

```
