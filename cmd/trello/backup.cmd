@echo off

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem 
rem backup KEY TOKEN
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set Key=%1
set Token=%2

mkdir Trello

rem Информация об аккаунте
curl -o Trello\Account.json "https://api.trello.com/1/members/me?key=%Key%&token=%Token%"

rem список всех досок аккаунта
for /F "usebackq" %%i in (`jq-win64 -r ".idBoards[]" Trello\Account.json`) do (

echo Board id: %%i

mkdir Trello\Board%%i

rem Получение набора списков для указанной доски
curl -o Trello\Board%%i\Lists.json "https://api.trello.com/1/boards/%%i/lists?key=%Key%&token=%Token%"

for /F "usebackq" %%j in (`jq-win64 -r ".[] | .id" Trello\Board%%i\Lists.json`) do (

echo Lists id: %%j

mkdir Trello\Board%%i\Lists%%j

rem Получение набора карточек для указанного списка
curl -o Trello\Board%%i\Lists%%j\Cards.json "https://api.trello.com/1/lists/%%j/cards?key=%Key%&token=%Token%"

for /F "usebackq" %%k in (`jq-win64 -r ".[] | .id" Trello\Board%%i\Lists%%j\Cards.json`) do (

echo Cards id: %%k

rem Получение задач для указанной карточки
curl -o Trello\Board%%i\Lists%%j\Card%%k.json "https://api.trello.com/1/cards/%%k/checklists?key=%Key%&token=%Token%"

)
)
)

