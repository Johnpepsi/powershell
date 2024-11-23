@Echo Off 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\PST /v WarnLargeFileSize /t REG_DWORD /d 94000 /f
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\PST /v MaxLargeFileSize /t REG_DWORD /d 99000 /f