@echo off
setlocal EnableExtensions EnableDelayedExpansion
title 批量更改前缀 by.paper_mo
cls

echo,
set/p pastname=请输入文件前缀：
set/p latername=请输入文件后缀：

for %%i in (*.!latername!) do (
	set "rename=!pastname!%%i
	echo %%i ^> !rename!
	ren %%i !rename!
)

pause
exit