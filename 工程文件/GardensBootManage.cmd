@echo off&cls
setlocal enabledelayedexpansion 
::�����������Ȩ��
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
if '%errorlevel%' NEQ '0' goto error_unable_to_get_admin
::�״ε���ע���
CD "%~dp0"
Pushd "%~dp0"
call registry.cmd

set
pause
exit

:error_unable_to_get_admin
>nul 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO Set UAC = CreateObject^("Shell.Application"^) > "Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "Getadmin.vbs"
    "Getadmin.vbs"
    DEL /f /q "Getadmin.vbs" 2>nul
    Exit
)