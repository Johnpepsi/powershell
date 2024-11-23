:: Modified July 3,2023
:: Refinment of Deere's original Bat
:: JM - Justin MacKeracher
@echo off
TITLE %~nx0
mode con: cols=100 lines=33
pause
	
::stopping SA5.x services and making sure their associated processes are killed (1st pass)

net stop SANodeService
net stop SolrService
net stop SAApacheCouchDB
taskkill /f /im mongod.exe
taskkill /f /im node.exe
taskkill /f /im OfflineNotificationEngine.exe
taskkill /f /im SANodeService.exe
taskkill /f /im SolrService.exe

::removing files in data directories and subdirectories

del /f /s /q "%PROGRAMDATA%\Service ADVISOR\db\*.*"
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\Logs\*.*" 
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\private\Data\manifests\*.*"
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\public\*.*"
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\solr\*.*"

::removing root level data directories

rd /s /q "%PROGRAMDATA%\Service ADVISOR\db"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\Logs"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\private\Data\manifests"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\public"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\solr"

::verifying directories were deleted

set result=false
if exist "%PROGRAMDATA%\Service ADVISOR\db" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\Logs" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\private\Data\manifests" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\public" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\solr" set result=true
if "%result%" == "true" (
    goto 2ndpass
)

::starting SA5.x related processes and services

net start SANodeService
net start SolrService

set OSBITS="HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0" /v "Identifier"
reg query %OSBITS% | find /i "x86" 
if %ERRORLEVEL% == 0 goto x86

if exist "%programfiles(x86)%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe" start "" "%programfiles(x86)%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe" 
goto end1stpass

:x86
if exist "%programfiles%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe" start "" "%programfiles%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe"

:end1stpass
msg * "The data wipe is complete."
exit

::stopping SA5.x services and making sure their associated processes are killed (2nd pass)

:2ndpass
net stop SANodeService
net stop SolrService
net stop SAApacheCouchDB
taskkill /f /im mongod.exe
taskkill /f /im node.exe
taskkill /f /im OfflineNotificationEngine.exe
taskkill /f /im SANodeService.exe
taskkill /f /im SolrService.exe

::removing files in data directories and subdirectories

del /f /s /q "%PROGRAMDATA%\Service ADVISOR\db\*.*"
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\Logs\*.*" 
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\private\Data\manifests\*.*"
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\public\*.*"
del /f /s /q "%PROGRAMDATA%\Service ADVISOR\solr\*.*"

::removing root level data directories

rd /s /q "%PROGRAMDATA%\Service ADVISOR\db"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\Logs"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\private\Data\manifests"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\public"
rd /s /q "%PROGRAMDATA%\Service ADVISOR\solr"

::verifying directories were deleted

set result=false
if exist "%PROGRAMDATA%\Service ADVISOR\db" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\Logs" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\private\Data\manifests" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\public" set result=true
if exist "%PROGRAMDATA%\Service ADVISOR\solr" set result=true
if "%result%" == "true" (
    goto reboot
)

::starting SA5.x related processes and services

net start SANodeService
net start SolrService

set OSBITS="HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0" /v "Identifier"
reg query %OSBITS% | find /i "x86" 
if %ERRORLEVEL% == 0 goto x86

if exist "%programfiles(x86)%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe" start "" "%programfiles(x86)%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe" 
goto end2ndpass

:x86
if exist "%programfiles%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe" start "" "%programfiles%\Service ADVISOR\ONE\English\OfflineNotificationEngine.exe"

:end2ndpass
msg * "The data wipe is complete."
exit

:reboot
msg * "Unable to fully wipe data. Reboot, then retry."
exit