@echo off & chcp 936 & color 0F & mode con: cols=100 lines=30
setlocal ENABLEEXTENSIONS & setlocal enabledelayedexpansion

:Gardens_system_boot
call :Gardens_system_register

:Gardens_command_hander
echo Gardens Shell [版本 %inf_version%]
echo 版权所有（C）2018 Initial Studio 保留所有权利。

:Gardens_command_inputer
set raw_inputer=
echo,
:Gardens_command_inputer_uninput
set /p raw_inputer=%inf_user_name% ~:
if "%raw_inputer%" == "" (goto Gardens_command_inputer_uninput)
call :Command_%raw_inputer% 2>NUL
::echo 命令执行失败^^! 
goto Gardens_command_inputer

:Gardens_system_register
set inf_version=0.4.0002
set inf_user_name=Public
set meta_path=%~dp0
goto :eof

:Gardens_error_fall_to_jump
cls
echo,
echo Gardens系统错误
echo 错误代码:Gardens_error_fall_to_jump
echo 按任意键退出.....
pause >NUL
exit

:Command_kill
taskkill /F /IM StudentMain.exe /T
goto :eof

:Command_help
help %1 %2
goto :eof
