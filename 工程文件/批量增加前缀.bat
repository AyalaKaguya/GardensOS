@echo off
setlocal EnableExtensions EnableDelayedExpansion
title ��������ǰ׺ by.paper_mo
cls

echo,
set/p pastname=�������ļ�ǰ׺��
set/p latername=�������ļ���׺��

for %%i in (*.!latername!) do (
	set "rename=!pastname!%%i
	echo %%i ^> !rename!
	ren %%i !rename!
)

pause
exit