@echo off
setlocal enabledelayedexpansion 

if  /I "%1" == "-gdb" (
	if /I "%2" == "library" (goto mode_gdb_library)
	echo gdb command can't find
	call :Lib_dump
	goto :eof
)
if /I "%1" == "-build" (
	call :Lib_cmd_checker !GDA_command!
	if "!C1!" == "dual_list" (
		goto dual_list_maker
	)
)
if /I "%1" == "-init" (
	goto :GDA_init
)
if /I "%1" == "-info" (
	goto :GDA_info
)
if /I "%1" == "" (
	if /i "!GDA_command!" == "" (
		echo can't find any command
		call :Lib_dump
		goto :eof
	)
)
goto :eof

:dual_list_maker
set t_clos= & set t_clos1= & set t_clos2=
set "str=%GDA_text1%" & call:lostr & set "t_clos1=%return%"
set "str=%GDA_text2%" & call:lostr & set "t_clos2=%return%"
set /a t_clos=%t_clos1%+%t_clos2%
if /i "%t_clos%" GEQ "GDA_clos" (
	call :Lib_dump
	echo ����ģ���ȳ����ܿ��
	goto :eof
)
goto :eof
















:GDA_init
echo GardensDrawAPI v1.0
goto :eof

:GDA_info
set "GDA_info=false"
::FOR /F  %%i in (%~f0) do (
for /f "eol=[tokens=1,*" %%a in (' type "%~f0" ') do (
	if "%%a" == "*#*#info#*#*" (
		set "GDA_info=ture"
	)
	if "!GDA_info!" == "ture" (
		if "%%a" == "*#*#end#*#*" (
			set "GDA_info=false"
			call :Lib_dump
			goto :eof
		)
	)
	if "!GDA_info!" == "ture" (
		if not "%%a" == "*#*#info#*#*" (
			echo %%a %%b
		)
	)
)
goto :eof

*#*#info#*#*
GDA��GardensDrawAPI����¼�ı�
������

	���������
	GDA_lines	�ж���Ⱦ�������������ʱû��
	GDA_clos		�ж���Ⱦ�������
	GDA_command 	���ı�ִ�в���������
	GDA_text1	�����ı�1
	GDA_text2	�����ı�2
	GDA_text*	�����ı�
	GDA_title		�������
	GDA_blank	��ͷ���м���
	GDA_form	��Ⱦ������ʽ
	GDA_shell		���ٽ���ű���ַ

	���������
	return		���ģ���ʱû��
	errorlevel		�������

	���ر�����
	GDA_b_shell	����ֵ������ִ�п��ٽ���ű�

	�ڲ�������
	%*		����ע��
	C*		ͬ%*
	gdb_command	GDB�������л���
	i		��ʱ����������
	str		�ַ���������ʱ����
	return		�ڲ��������ģ���Ҫ��
	num		������������
	t_line		�ݹ�����ʱ����ʱ����

���ò�����

	-gdb [-library,...]		����GardensDebugBridge
	-shell <path>		���ÿ��ٽ���ű�
	-build			ִ�б�������

�������Դ����
*#*#end#*#*

:mode_gdb_library
echo GardensDrawAPI is running on debug mode now
:gdb_library
echo.
set gdb_command=*#*#uninput#*#*
set /p gdb_command=^>
if /i "%gdb_command%" == "*#*#uninput#*#*" (goto gdb_library)
if /i "%gdb_command%" == "exit" (goto :eof)
if /i "%gdb_command:~0,3%" == "set" (%gdb_command% & goto gdb_library)
if /i "%gdb_command:~0,4%" == "echo" (%gdb_command% & goto gdb_library)
call :Lib_%gdb_command%
goto gdb_library

:Lib_dump
set GDA_linse= & set GDA_clos= & set GDA_command= & set GDA_title= & set GDA_blank=
set GDA_form= & set GDA_shell= & set return= & set GDA_b_shell=false & set GDA_info=
call :Lib_cmd_checker
for /l %%i in (1,1,9) do (
	set GDA_text%%i=
)
goto :eof

:Lib_lostr
set "i=0"
if "%str%"== "" (
	set "str=%1"
)
:Lib_alostr
if "!str:~%i%,1!" neq "" (
	set /a i+=1
	if "!i!" == "100" (
		echo ���󣬳������ݹ����
		set i=&set str=
		goto :eof
	)
	goto :Lib_alostr
)
set return=!i!
set i=&set str=
goto :eof

:Lib_sleep
set /a i=%1+1
ping -n %i% 127.0.0.1 >nul
set i=
goto :eof

:Lib_random
set num=
set /a num=5%time:~6,2%
set /a num=%num%^*%random%%
set /a num=%num%^*%num%
set num=000%num%000
set num=%num:~5,6%%random%%
set num=1%num:~,8%
set "return=%num%" & set num=
goto :eof

:Lib_read_ini
set "rd_ini=%1"
set t_line=
FOR /F "eol=#" %%i in (!rd_ini!.ini) do (
	set "t_line=%%i"
	if not "!t_line:~0,1!" == "[" (
		if not "!t_line:~-1,0!" == "]" (
		set "!t_line!"
		)
	)
)
goto :eof

:Lib_cmd_checker
set C1=%1
set C2=%2
set C3=%3
set C4=%4
set C5=%5
set C6=%6
set C7=%7
set C8=%8
set C9=%9
goto :eof