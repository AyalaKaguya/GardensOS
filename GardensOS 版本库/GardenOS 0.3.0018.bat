@echo off
IF NOT EXIST "Shell\" (MD Shell)
IF NOT EXIST "Temp\" (MD Temp)
IF NOT EXIST "Program\" (MD Program)
set nam=GardensCMD & set ver=0.3.0018 & set tmp=temp
set pgf=program & set she=shell & set frm=unknown
Setlocal enabledelayedexpansion
chcp 936 & color 0F & Mode Con: Cols=125 Lines=40 & cls
echo GardensCMD 命令行解释器 [版本 %ver%]
echo (c) 2018 Initial Sudio。保留所有权利。& echo,
:Command_input
set command=Uninput & title GardensCMD  版本号: %ver%
set /p command=GardensCMD $
if "%command%"=="Uninput" goto Command_input
if /I "%command:~,1%"==" " goto Command_input
call :command_Dismant %command%
if exist "%she%\%cm1%.bat" (call %she%\%command% & goto Command_input)
if exist "%pgf%\%cm1%.bat" (start %pgf%\%cm1%.bat & goto Command_input)
echo 未知的指令^!  "command" & echo,
goto Command_input
:command_Dismant
Set cm1=%1 & Set cm2=%2 & Set cm3=%3 & Set cm4=%4
Set cm5=%5 & Set cm6=%6 & Set cm7=%7 & Set cm8=%8
goto :eof