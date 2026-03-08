@echo off >NUL
chcp 65001 >NUL

TITLE VRChat yt-dlp Updater

echo VRChat yt-dlp Updater
echo by fiaKaiera (https://github.com/fiaKaiera)
echo.
echo Source Code: https://github.com/fiaKaiera/vrc-ytdlp-updater
echo --------------------------------------------------------------------
echo.
echo 	This file will do the following:
echo 	1. Downloads the latest version of yt-dlp.exe from github.
echo 	   (https://github.com/yt-dlp/yt-dlp)
echo 	2. Renames the old yt-dlp.exe in the same folder.
echo %date%
echo.
echo You can find your copy of yt-dlp and its backup here:
echo %LOCALAPPDATA%low\VRChat\VRChat\Tools
echo.
echo █████ WARNING: This will close VRChat if you have it open.
echo █████ If you don't want to do it right now, then simply close this window.
echo.
echo --------------------------------------------------------------------
echo 要約 (JP)
echo このファイルはVRChat用yt-dlpを更新およびバックアップします。
echo このファイルの実行中に問題が発生した場合は、管理者として実行してください。
echo.
echo █████ ※ VRChatが開いている場合、これを閉じます。
echo █████ 今すぐ実行したくない場合は、このウィンドウを閉じるだけで結構です。
echo --------------------------------------------------------------------
echo.
pause

cd /d %LOCALAPPDATA%low\VRChat\VRChat\Tools

:: ----------------------------------------------------

cls
echo Downloading 'yt-dlp.exe' from
echo https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe
echo.
curl -L -o yt-dlp.new.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe
echo Download complete as 'yt-dlp.new.exe'

:: ----------------------------------------------------

echo.
echo Killing 'vrchat.exe'
taskkill /F /IM vrchat.exe >nul
if %ERRORLEVEL%==0 echo 'vrchat.exe' has been forcefully closed.
echo.

:: ----------------------------------------------------

if not exist yt-dlp.exe goto backupmissing
for /f %%i in ('powershell -Command Get-Date -Format "yyyy-MM-dd"') do set DT=%%i
set FILENAME_PRE=yt-dlp.%DT%_
set /a n=1

:backuprenloop
if exist "%FILENAME_PRE%%n%.exe" (
    set /a n+=1
    goto backuprenloop
)
set FILENAME=%FILENAME_PRE%%n%.exe
ren yt-dlp.exe %FILENAME%
echo Backup complete!
echo Backup is located at:
echo %cd%/%FILENAME%
goto postbackup

:backupmissing
echo Original 'yt-dlp.exe' is missing, we're unable to backup anything...

:postbackup
echo.
echo Renaming downloaded 'yt-dlp.new.exe' to 'yt-dlp.exe'
ren yt-dlp.new.exe yt-dlp.exe
:: ----------------------------------------------------

echo.
echo Process is complete! 処理が完了しました！
:exit
echo Press any key to close... 任意のキーを押して終了してください...
pause>nul
goto close

:close