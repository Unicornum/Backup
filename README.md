
# Backup репозитория GitHub

## Создание резервной копии

- Путь к репозиторию, резервная копия которого будет создаваться:
```
set URL_SOURCE=https://github.com/<user>/<source>.git
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
