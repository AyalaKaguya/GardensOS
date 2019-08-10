@echo off
if /I "%1" == "-b" (SUBST %new_disk% “%raw_path%” & cls & goto :eof)
if /I "%1" == "-d" (goto delete)
if /I "%1" == "-l" (SUBST & goto :eof)
if /I "%1" == "-c" (SUBST %2 "%3" & goto :eof)
if /I "%1" == "-h" (goto help)
echo 不正确的用法，输入%0 -h查询帮助
goto :eof

:help
echo DiskManage v1.0
echo 	%0 [-b,-d,-l,-c,-h] [others...
echo 		-b			将raw_path映射到new_disk
echo 		-d [all，others...	删除new_disk的映射
echo 		-l			列举所有映射
echo 		-c [arch]		使用原版subst指令
echo 		-h			显示帮助信息
goto :eof

:delete
if /i "%2" == "all" (
	for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
		subst /d %%a: >Nul 2>NUL
	) 
	goto :eof
)
SUBST /d %new_disk% 
cls
goto :eof