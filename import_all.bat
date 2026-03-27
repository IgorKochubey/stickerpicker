@echo off
chcp 65001 > nul
set PYTHONIOENCODING=utf-8

echo Getting sticker pack list...
sticker-import --list > packs_list.txt

echo.
echo Importing stickers...
echo.

for /f "tokens=2 delims=()" %%i in ('findstr "t.me/addstickers" packs_list.txt') do (
    set "pack_url=%%i"
    setlocal enabledelayedexpansion
    echo Importing: !pack_url!
    sticker-import --config config.json !pack_url!
    endlocal
    echo.
)

del packs_list.txt
echo.
echo All done!
pause
