@echo off

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem
rem Using:
rem 
rem backup KEY TOKEN
rem
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set PATH=%PATH%;%CD%\bin

set Key=%1
set Token=%2

mkdir Account

rem ���������� �� ��������
curl -o Account\Account.json "https://api.trello.com/1/members/me?key=%Key%&token=%Token%"

rem ������ ���� ����� ��������
for /F "usebackq" %%i in (`jq-win64 -r ".idBoards[]" Account\Account.json`) do (

echo Board id: %%i

mkdir Account\Board%%i

rem ��������� ������ ������� ��� ��������� �����
curl -o Account\Board%%i\Lists.json "https://api.trello.com/1/boards/%%i/lists?key=%Key%&token=%Token%"

for /F "usebackq" %%j in (`jq-win64 -r ".[] | .id" Account\Board%%i\Lists.json`) do (

echo Lists id: %%j

mkdir Account\Board%%i\Lists%%j

rem ��������� ������ �������� ��� ���������� ������
curl -o Account\Board%%i\Lists%%j\Cards.json "https://api.trello.com/1/lists/%%j/cards?key=%Key%&token=%Token%"

for /F "usebackq" %%k in (`jq-win64 -r ".[] | .id" Account\Board%%i\Lists%%j\Cards.json`) do (

echo Cards id: %%k

rem ��������� ����� ��� ��������� ��������
curl -o Account\Board%%i\Lists%%j\Card%%k.json "https://api.trello.com/1/cards/%%k/checklists?key=%Key%&token=%Token%"

)
)
)

