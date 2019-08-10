@echo off
setlocal EnableExtensions
setlocal enabledelayedexpansion
chcp 936 >nul
mode 80, 25

if /i "%1" == "pi" (
	set "sub=%2"
	mode 40, 25
	goto pi_sub
)

title cmdtest v2.0
echo cmdtest v2.0 命令行基准测试程序 by：paper_mo
echo,
echo 按下任意键开始......
pause>nul

:help_test
title 当前项目：命令处理
set "t=%time%"
for /l %%i in (1,1,100) do (
	cls
	echo 当前项目：命令处理
	echo 进度：%%i^\100
	help >nul
	for /? >nul
	if /? >nul
	taskkill /? >nul
	copy /? >nul
	net /? >nul 2>nul
	wmic /? >nul
)
set "t1=%time%"
if "%t1:~,2%" lss "%t:~,2%" set "add=+24"
set /a "times=(%t1:~,2%-%t:~,2%%add%)*360000+(1%t1:~3,2%%%100-1%t:~3,2%%%100)*6000+(1%t1:~6,2%%%100-1%t:~6,2%%%100)*100+(1%t1:~-2%%%100-1%t:~-2%%%100)" 
set "help_test=%times%"
echo 命令处理测试已完成，用时%times%ms & echo,

:pi_test
title 当前项目：计算圆周率（300位）
echo 当前项目：计算圆周率（300位）
set "t=%time%"
set c=300&set/a c=(c*100/3)+70,cc=c/10,n=cc
for /l %%a in (1 1 %cc%)do set/a f_%%a=2000
for /l %%a in (%c% -132 100)do (set/a n=%%a/10,m=2*n-1
   set/a "d=f_!n!*10000,f_!n!=d%%m,d=d/m,n-=1"
   for /l %%b in (!n! -1 1)do (set/a n=%%b,m=2*n-1
      set/a "d=d*n+f_!n!*10000,f_!n!=d%%m,d=d/m,n-=1"
   )
   set/a "an=e+d/10000,e=d%%10000"
   if !an! lss 1000 set an=000!an!
   set/p=!an:~-4!<nul
)
set "t1=%time%" & echo,
if "%t1:~,2%" lss "%t:~,2%" set "add=+24"
set /a "times=(%t1:~,2%-%t:~,2%%add%)*360000+(1%t1:~3,2%%%100-1%t:~3,2%%%100)*6000+(1%t1:~6,2%%%100-1%t:~6,2%%%100)*100+(1%t1:~-2%%%100-1%t:~-2%%%100)"
set "pi_test=%times%"
echo 计算圆周率（300位），测试已完成，用时%times%ms & echo,

:pisub_test
title 当前项目：CPU多线程
echo 当前项目：CPU多线程
start /min CMDtest pi 1
start /min CMDtest pi 2
start /min CMDtest pi 3
start /min CMDtest pi 4
start /min CMDtest pi 5
set "t=%time%"
echo start>>run
set i=0
:pisub
if exist "1" (set/a "i=!i!+1" & echo 线程1已完成 & del /q 1) 
if exist "2" (set/a "i=!i!+1" & echo 线程2已完成 & del /q 2)
if exist "3" (set/a "i=!i!+1" & echo 线程3已完成 & del /q 3)
if exist "4" (set/a "i=!i!+1" & echo 线程4已完成 & del /q 4)
if exist "5" (set/a "i=!i!+1" & echo 线程5已完成 & del /q 5)
if "%i%"=="5" (del /q run & goto pisub_ok)
goto pisub
:pisub_ok
set "t1=%time%"
if "%t1:~,2%" lss "%t:~,2%" set "add=+24"
set /a "times=(%t1:~,2%-%t:~,2%%add%)*360000+(1%t1:~3,2%%%100-1%t:~3,2%%%100)*6000+(1%t1:~6,2%%%100-1%t:~6,2%%%100)*100+(1%t1:~-2%%%100-1%t:~-2%%%100)"
set "pisub=%times%"
echo CPU多线程测试已完成，用时%times%ms & echo,
title 测试完成
echo 按任意键结束程序......
pause>nul
exit

:pi_sub
title 计算圆周率（300位）线程%sub%
echo 等待指令中.....
if not exist "run" (goto pi_sub)
set c=300&set/a c=(c*100/3)+70,cc=c/10,n=cc
for /l %%a in (1 1 %cc%)do set/a f_%%a=2000
for /l %%a in (%c% -132 100)do (set/a n=%%a/10,m=2*n-1
   set/a "d=f_!n!*10000,f_!n!=d%%m,d=d/m,n-=1"
   for /l %%b in (!n! -1 1)do (set/a n=%%b,m=2*n-1
      set/a "d=d*n+f_!n!*10000,f_!n!=d%%m,d=d/m,n-=1"
   )
   set/a "an=e+d/10000,e=d%%10000"
   if !an! lss 1000 set an=000!an!
   set/p=!an:~-4!<nul
)
echo ok>>%sub%
exit
