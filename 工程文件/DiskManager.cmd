@echo off
if /I "%1" == "-b" (SUBST %new_disk% ��%raw_path%�� & cls & goto :eof)
if /I "%1" == "-d" (goto delete)
if /I "%1" == "-l" (SUBST & goto :eof)
if /I "%1" == "-c" (SUBST %2 "%3" & goto :eof)
if /I "%1" == "-h" (goto help)
echo ����ȷ���÷�������%0 -h��ѯ����
goto :eof

:help
echo DiskManage v1.0
echo 	%0 [-b,-d,-l,-c,-h] [others...
echo 		-b			��raw_pathӳ�䵽new_disk
echo 		-d [all��others...	ɾ��new_disk��ӳ��
echo 		-l			�о�����ӳ��
echo 		-c [arch]		ʹ��ԭ��substָ��
echo 		-h			��ʾ������Ϣ
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