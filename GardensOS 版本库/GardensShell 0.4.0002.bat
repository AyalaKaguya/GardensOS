@echo off & chcp 936 & color 0F & mode con: cols=100 lines=30
setlocal ENABLEEXTENSIONS & setlocal enabledelayedexpansion

:Gardens_system_boot
call :Gardens_system_register

:Gardens_command_hander
echo Gardens Shell [�汾 %inf_version%]
echo ��Ȩ���У�C��2018 Initial Studio ��������Ȩ����

:Gardens_command_inputer
set raw_inputer=
echo,
:Gardens_command_inputer_uninput
set /p raw_inputer=%inf_user_name% ~:
if "%raw_inputer%" == "" (goto Gardens_command_inputer_uninput)
call :Command_%raw_inputer% 2>NUL
::echo ����ִ��ʧ��^^! 
goto Gardens_command_inputer

:Gardens_system_register
set inf_version=0.4.0002
set inf_user_name=Public
set meta_path=%~dp0
goto :eof

:Gardens_error_fall_to_jump
cls
echo,
echo Gardensϵͳ����
echo �������:Gardens_error_fall_to_jump
echo ��������˳�.....
pause >NUL
exit

:Command_kill
taskkill /F /IM StudentMain.exe /T
goto :eof

:Command_help
help %1 %2
goto :eof
