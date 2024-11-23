@echo off
Echo Before you continue this file will delete both the local Outlook profile and its suporting files.
Echo There is a very good chance you will have to remap the favorites. So please make sure you know the directory path(s)
pause
taskkill /IM Outlook.exe /f
timeout /t 5 /nobreak
Echo .
echo Deleting old Outlook profile
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Profiles\Outlook /f
timeout /t 5 /nobreak
Echo .
Echo Deleting old OST and NST files (These will be rebuilt when new profile is created)
del %userprofile%\AppData\Local\Microsoft\Outlook\*.ost /q 
del %userprofile%\AppData\Local\Microsoft\Outlook\*.nst /q 
timeout /t 5 /nobreak
Echo .
Echo Restarting Outlook
start "" "%ProgramFiles%\Microsoft Office\root\Office16\outlook.exe"
Echo This window is no longer needed and will close when the timer runs out
timeout /t 30