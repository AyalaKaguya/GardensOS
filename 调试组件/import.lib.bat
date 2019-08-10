@echo off
call gardensos -import
:sub
set com=*#*#uninput#*#*
set /p com=]
set return=none
if /i "%com%" equ "*#*#uninput#*#*" goto sub
%Library_Lib% %com%
echo return : %return%
echo,
set com=
goto sub