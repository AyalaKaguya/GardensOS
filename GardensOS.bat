@echo off
set gardens.raw.argv=%*
setlocal EnableExtensions EnableDelayedExpansion
call :gardens_loadset local
call :library_boer_check_false gardens.switch.import

::::::::::::::::::::�״�����::::::::::::::::::::
::�״�������Ҫ����ע������汾�ص�����
2>nul >nul (
	if /I "%~1" == "-ultra" (
		goto mode_ultra_boot
	)
	reg query "HKCU\Console" /t REG_DWORD /v "ForceV2" 2>nul | findstr "0x1" >nul && set "gardens.console.ver=2" || set "gardens.console.ver=1"
	for %%z in (
		"zh_CN":"936":"1":"0x30":"":"0x100008":"1"
		"zh_CN":"936":"2":"0x36":"����":"0x100000":"2"
		"en_US":"437":"1":"0x30":"":"0x120008":"2"
		"en_US":"437":"2":"0x36":"Consolas":"0x100000":"2"
	) do for /f "tokens=1-7 delims=:" %%a in ("%%z") do (
		if /i "!gardens.language!"=="%%~a" if "!gardens.console.ver!"=="%%~c" (
			reg add "HKCU\Console\Initial.Gardens" /t REG_DWORD /v "CodePage" /d "%%~b" /f
			reg add "HKCU\Console\Initial.Gardens" /t REG_DWORD /v "FontFamily" /d "%%~d" /f
			reg add "HKCU\Console\Initial.Gardens" /t REG_SZ /v "FaceName" /d "%%~e" /f
			reg add "HKCU\Console\Initial.Gardens" /t REG_DWORD /v "FontSize" /d "%%~f" /f
			reg add "HKCU\Console\Initial.Gardens" /t REG_DWORD /v "QuickEdit" /d "0x0" /f
			reg add "HKCU\Console\Initial.Gardens" /t REG_DWORD /v "ColorTable15" /d "0xffffff" /f
		)
	)
)

::::::::::::::::::::��ڼ��::::::::::::::::::::
::�����ں�����ƥ��������з�����

if /i "%gardens.switch.import%" equ "true" (
	goto mode_import
) else (
	set gardens.switch.import=false
)
if /i "%~1" equ "-import" (
	endlocal
	set "Library_Gar=call "%~0" -gar"
	set "Library_Lib=call "%~0" -lib"
	set "gardens.switch.import=true"
	goto :eof
)
if  /I "%~1" == "-gdb" (
	if /I "%2" == "library" (goto mode_gdb_library)
	if /I "%2" == "tmouse" (goto mode_gdb_tmouse)
	echo gdb command can't find
	goto :eof
)
if /I "%~1" == "-init" (
	call :library_init
	goto :eof
)
if /I "%~1" == "-info" (
	call :library_display_info
	goto :eof
)
if not defined "%~1" (
	start "Initial.Gardens" cmd /c call "%~0" -ultra %*
)
goto :eof

::::::::::::::::::::������Ϣ�ı�::::::::::::::::::::
::����Gardens��һ��������Խ�һЩ�����ļ��������ں��ڣ��Ա��ڶ�ʧ�ļ�ʱ���Ա�֤����޶����С�

*#*#info#*#*
GardensOperationSystem(GarOS) kernel v!gardens.kernel.version!
usage
:	-info		Display information text
:	-gdb		Gardens Debug Bridge
:	-init		Simple information text
:	-import	Import Gardens as a module
*#*#end#*#*

*#*#install#*#*
[main]
gardens.version=		unknown
gardens.build=			unknown
gardens.rights=			Initial Studio
gardens.friends=		TE-Puint Studio
gardens.name=			GardensOS
gardens.language=		zh_CN
[path]
gardens.dir.bin=		bin\
gardens.dir.languages=	bin\languages\
gardens.dir.components=	bin\components\
[video]
gardens.video.clos=		125
gardens.video.lines=	40
gardens.video.chcp=		936
gardens.video.text=		0
gardens.video.ground=	F
[kernel]
gardens.kernel.version=	1.3
gardens.kernel.build=	190810
gardens.kernel.code=	warp
[inset]
gardens.switch.outset=	true
gardens.switch.debug=	false
gardens.path.outset=	bin\install.ini
*#*#end#*#*

*#*#language#*#*
[main]
gardens.language.name=          ���ģ��й���
gardens.language.code=          zh_CN
gardens.language.version=       1.0
gardens.language.translators=   Paper_mo
gardens.language.console.old=   "936","0x30","","0x100008","0x0","0xffffff"
gardens.language.console.new=   "936","0x36","����","0x100000","0x0","0xffffff"
[error]
gardens.txt.occurError=         ��������
gardens.txt.grossError=         �����ش����
gardens.txt.recursiveDepthExceed=�������ݹ����
gardens.txt.fileMissing=        ��ʧ�ļ�
*#*#end#*#*

::::::::::::::::::::Gardens�˳�����::::::::::::::::::::
::��gardens�ر�ʱ���Ա����������Ĳ�����

:exit_return_only //�ر�ֻ����return����
endlocal & set return=%return%
exit /B 1

:exit_with_all //�رղ��������б���
for /f "delims=eol=" %%a in (^"!str!^")do endlocal&set str=%%a
exit /B 1

:exit_management //Gaedens�ر�ʱ��Ҫ���е�����
if /i "%gardens.exitcode%" equ "0" goto exit_return_only
if /i "%gardens.exitcode%" equ "1" goto exit_with_all
exit /B -1

::::::::::::::::::::������::::::::::::::::::::
::Gardens�����쳣�Ĵ���ʽ��

:error_recursiveDepthExceed //�ݹ���������ֵ
if not defined gardens.txt.recursiveDepthExceed (
	echo Error, exceeding maximum recursive depth
)
goto :eof

:error_missingFiles //��ʧ��Ҫ�ļ�
if not defined gardens.txt.fileMissing (
	echo Error, missing important files
)
pause
exit /b

::::::::::::::::::::Gardens�Ĳ�ͬģʽ::::::::::::::::::::
::Gardens�����ڲ�ͬ��ģʽ�������Ǵ�Ŵ�����Щģʽ�Ĵ��롣

:mode_import //������Ϊģ������ʱ
call :gardens_loadset local
call :library_boer_check_false gardens.switch.debug
set gardens.exitcode=0
set return=none
if /i "!gardens.switch.debug!" equ "true" (
	echo Debug log:
	echo Entry function:		%gardens.raw.argv%
)
if /i "%~1" equ "-gar" (
	if /i "!gardens.switch.debug!" equ "true" (
		echo Now calling:		gardens_%2 %3 %4 %5 %6 %7 %8 %9
	)
	call :gardens_%2 %3 %4 %5 %6 %7 %8 %9
	if /i "!gardens.switch.debug!" equ "true" (
		echo Return:			!return!
	)
	goto exit_management
)
if /i "%~1" == "-lib" (
	if /i "!gardens.switch.debug!" equ "true" (
		echo Now calling: 		library_%2 %3 %4 %5 %6 %7 %8 %9
	)
	call :library_%2 %3 %4 %5 %6 %7 %8 %9
	if /i "!gardens.switch.debug!" equ "true" (
		echo Return:			!return!
	)
	goto exit_management
)
goto :eof

:mode_gdb_library //Gardens���ÿ����ģʽ
echo GardensKernel is running on debug mode now
:gdb_library
echo.
set "return=none"
set "gardens.gdb.command=*#*#uninput#*#*"
set /p gardens.gdb.command=^>
if /i "%gardens.gdb.command%" == "*#*#uninput#*#*" (goto gdb_library)
if /i "%gardens.gdb.command%" == "exit" (goto :eof)
if /i "%gardens.gdb.command:~0,3%" == "set" (%gardens.gdb.command% & goto gdb_library)
if /i "%gardens.gdb.command:~0,4%" == "echo" (%gardens.gdb.command% & goto gdb_library)
call :library_%gardens.gdb.command%
echo Rerurn: %return%
goto gdb_library

:mode_gdb_tmouse //Tmouse�������ģʽ
call :gardens_tmouse -init
set msg_title=gardensDebugBridge tmouseTest
call :library_system_reset
set /a gardens.draw.lines=gardens.video.lines-2
:gdb_tmouse
!gardens.path.tmouse! /d 0 -1 1
>nul 2>nul (
	set "gardens.tmouse=!errorlevel!"
	if "!gardens.tmouse:~0,1!"=="0" set "gardens.tmouse=!gardens.tmouse:~1!"
	set /a "gardens.tmouse.x=!gardens.tmouse:~0,-3!"
	set /a "gardens.tmouse.y=!gardens.tmouse!-1000*!gardens.tmouse.x!"
)
cls
call :library_draw_blank %gardens.draw.lines%
echo;  latest click: [!gardens.tmouse.x!,!gardens.tmouse.y!]    	RawInf: !gardens.tmouse!		time: !time!	date: !date!		tmouse OK
goto gdb_tmouse

:mode_ultra_boot //��������ʱ�����еĲ���
::���������������Ԥ���õĻ������롣
call :gardens_loadset auto
call :library_system_reset
call :gardens_tmouse -init
call :gardens_language auto
%gardens.dir.components%TCurS /crv 0
goto ultra_boot_ready

::::::::::::::::::::Gardens������::::::::::::::::::::
::��������һЩ�����С�����Թ��ڲ��������С�

:gardens_language //Gardens��������
if /i "%~1" EQU "local" (
	call :library_language_local
)
if /i "%~1" EQU "auto" (
	if defined gardens.language (
		if exist "!gardens.PATH!!gardens.dir.languages!!gardens.language!.ini" (
			call :library_ini_read !gardens.PATH!!gardens.dir.languages!!gardens.language!.ini
		) else (
			call :library_language_local
		)
	)
)
goto :eof

:gardens_loadset //Gardens��������
if /i "%~1" EQU "local" (
	set "gardens.PATH=!cd!\"
	set msg_title=
	call :library_ini_local
)
if /i "%~1" EQU "auto" (
	set "gardens.PATH=!cd!\"
	set msg_title=
	call :library_ini_local
	call :library_boer_check_false gardens.switch.outset
	if /i "!gardens.switch.outset!" equ "true" (
		if  exist "!gardens.path.outset!" (
			call :library_ini_read !gardens.path.outset!
		)
	)
)
goto :eof

:gardens_diskmanage //�����ļ��е�����
if /I "%~1" == "-b" (
	SUBST %new_disk% ��%gardens.raw.path%��
	cls
)
if /I "%~1" == "-d" (
	if /i "%2" == "all" (
		for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
			subst /d %%a: >Nul 2>NUL
		)
		goto :eof
	)
	SUBST /d %new_disk%
	cls
)
if /I "%~1" == "-l" (
	SUBST
	goto :eof
)
if /I "%~1" == "-c" (
	SUBST %2 "%3"
)
goto :eof

:gardens_tmouse //������Tmouse����
if /i "%~1" equ "-init" (
	if exist "!gardens.dir.components!tmouse.exe" (
		set "gardens.path.tmouse=!gardens.dir.components!tmouse.exe"
	)
)
if /i "%~1" equ "-get" (
	!gardens.path.tmouse! /d 0 -1 1
	>nul 2>nul (
	set "gardens.tmouse=!errorlevel!"
	if "!gardens.tmouse:~0,1!"=="0" set "gardens.tmouse=!gardens.tmouse:~1!"
	set /a "gardens.tmouse.x=!gardens.tmouse:~0,-3!"
	set /a "gardens.tmouse.y=!gardens.tmouse!-1000*!gardens.tmouse.x!"
	)
	if /i "%gardens.switch.debug%" equ "true" (
		set "msg_title=Tmouse:[!gardens.tmouse.x!,!gardens.tmouse.y!] Raw: !gardens.tmouse!"
		call :library_system_reset 
	)
)
goto :eof

::::::::::::::::::::Gardens�ĺ���::::::::::::::::::::
::Gardens��׼�⣬�ṩ�㷺�Ĺ��ܡ�

:library_test //�����õļٺ���
set gardens.exitcode=1
set return=return test ok
echo echo test ok
goto :eof

:library_system_dump //�����ʱ�������
for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
	set %%i=
)
for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
	set %%i=
)
call :library_cmd_checker
goto :eof

:library_system_clear //������б���
set return=none
if "%~1" == "82648105" (
	for /f "delims==" %%a in ('set') do if /i %%a neq path set %%a=
)
goto :eof

:library_system_sudo <command> ? <command2> ... //�Թ���Ա�����������
2>nul >nul (
	set params=%*
	if defined params (
		set "params=!params:"=""!"
		set "params=!params:?=&!"
	)
	net session >nul 2>nul && (
		!params!
	) || (
		mshta vbscript:CreateObject^("Shell.Application"^).ShellExecute^("cmd.exe","/c call !params!","","runas",1^)^(window.close^)
	)
)
set params=
set return=%errorlevel%
goto :eof

:library_system_writeBoard <keyName> //�������ڵ��ַ���д����а�
set return=none
if defined %~1 (
	mshta vbscript:clipboardData.SetData("text","%~1")(window.close)
)
goto :eof

:library_init //�����������
echo GardensOperationSystem(GarOS) kernel v1.0
goto :eof

:library_display_info //��ʾ������Ϣ
set return=none
set "gardens.switch.load=false"
for /f "eol=[tokens=1,*" %%a in (' type "%~f0" ') do (
	if /i "%%a" equ "*#*#end#*#*" (
		set "gardens.switch.load=false"
	)
	if /i "!gardens.switch.load!" equ "true" (
		echo %%a%%b
	)
	if /i "%%a" equ "*#*#info#*#*" (
		set "gardens.switch.load=true"
	)
)
set "gardens.switch.load="
goto :eof

:library_display_set //��ʾ���ص�����
set return=none
set "gardens.switch.load=false"
for /f "tokens=1,*" %%a in (' type "%~f0" ') do (
	if /i "%%a" equ "*#*#end#*#*" (
		set "gardens.switch.load=false"
	)
	if /i "!gardens.switch.load!" equ "true" (
		echo %%a%%b
	)
	if /i "%%a" equ "*#*#install#*#*" (
		set "gardens.switch.load=true"
	)
)
set "gardens.switch.load="
goto :eof

:library_boer_reverse <ualue> //��ת�����Ĳ�������
set return=none
set "t=%~1"
if /i "!%t%!" equ "true" (
	set "!t!=false"
	set return=false
) else (
	set "!t!=true"
	set return=true
)
goto :eof

:library_boer_check_false <ualue> //�������������ͣ�Ĭ��Ϊfalse
set return=none
set "t=%~1"
if /i "!%t%!" equ "false" (
	set return=false
	goto :eof
)
if /i "!%t%!" equ "0" (
	set "!t!=false"
	set return=false
	goto :eof
)
if /i "!%t%!" equ "off" (
	set "!t!=false"
	set return=false
	goto :eof
)
if /i "!%t%!" equ "" (
	set "!t!=false"
	set return=false
	goto :eof
)
set "!t!=true"
set return=true
set "t="
goto :eof

:library_boer_check_true <ualue> //�������������ͣ�Ĭ��Ϊtrue
set return=none
set "t=%~1"
if /i "!%t%!" equ "false" (
	set return=false
	goto :eof
)
if /i "!%t%!" equ "0" (
	set "!t!=false"
	set return=false
	goto :eof
)
if /i "!%t%!" equ "off" (
	set "!t!=false"
	set return=false
	goto :eof
)
if /i "!%t%!" equ "" (
	set "!t!=true"
	set return=true
	goto :eof
)
set "!t!=true"
set return=true
set "t="
goto :eof

:library_str_long <keyName> //���������ַ�������
set return=none
if not defined %~1 (
	set return=0
	goto :eof
) else (
	set i=0
	set "s=!%~1!"
)
:library_str_long_runtime
if "!s:~%i%,1!" neq "" (
	set /a i+=1
	if "!i!" == "100" (
		set return=-1
		set i=
		set s=
		goto :eof
	)
	goto :library_str_long_runtime
)
set "return=!i!"
set i=
set s=
goto :eof

:library_draw_blank <lines> //�������
set return=none
if /i "%~1" == "" (
	set b=1
) else (
	set b=%~1
)
for /l %%i in (1,1,!b!) do echo,
goto :eof

:library_sleep_ping <timeout> //ping��ʱ
set return=none
set /a i=%~1+1
ping -n %i% 127.0.0.1 >nul
set i=
goto :eof

:library_str_random //���������
set return=none
set n=
set /a n=5%time:~6,2%
set /a n=%n%^*%random%%
set /a n=%n%^*%n%
set n=000%n%000
set n=%n:~5,6%%random%%
set n=1%n:~,8%
set "return=%n%"
set n=
goto :eof

:library_str_captrans [a|A] <keyName> //�������ַ�����Сдת��
set return=none
if defined %~2 (
	if "%~1"=="a" >nul (
		for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do call set "%~2=%%%~2:%%i=%%i%%"
	)

	if "%~1"=="A" >nul (
		for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do call set "%~2=%%%~2:%%i=%%i%%"
	)
)
goto :eof

:library_ini_read <fileName> //��ȡini�ļ�
set return=none
for /f "eol=[tokens=1,*" %%a in (' type "%~1" ') do set "%%a%%b"
goto:eof

:library_ini_local //�ݹ鱾�ļ�����������
set return=none
set "gardens.switch.load=false"
for /f "eol=[tokens=1,*" %%a in (' type "%~f0" ') do (
	if /i "%%a" equ "*#*#end#*#*" (
		set "gardens.switch.load=false"
	)
	if /i "!gardens.switch.load!" equ "true" (
		set "%%a%%b"
	)
	if /i "%%a" equ "*#*#install#*#*" (
		set "gardens.switch.load=true"
	)
)
set "gardens.switch.load="
goto :eof

:library_language_local //�ݹ鱾�ļ�����������
set return=none
set "gardens.switch.load=false"
for /f "eol=[tokens=1,*" %%a in (' type "%~f0" ') do (
	if /i "%%a" equ "*#*#end#*#*" (
		set "gardens.switch.load=false"
	)
	if /i "!gardens.switch.load!" equ "true" (
		set "%%a%%b"
	)
	if /i "%%a" equ "*#*#language#*#*" (
		set "gardens.switch.load=true"
	)
)
set "gardens.switch.load="
goto :eof

:library_system_reset //Ӧ������
set return=none
title %gardens.name% [version %gardens.version%] %msg_title%
Mode Con: Cols=%gardens.video.clos% Lines=%gardens.video.lines%
chcp %gardens.video.chcp% >nul 2>nul
color %gardens.video.text%%gardens.video.ground%
goto :eof

:library_system_etime <begin> <end> //��ʱ��
set return=none
set /a c=(!%2:~,2!-!%1:~,2!)*360000+(1!%2:~3,2!-1!%1:~3,2!)*6000+1!%2:~-5,2!!%2:~-2!-1!%1:~-5,2!!%1:~-2!
set /a c+=-8640000*(c^>^>31)
set "return=%c%"
goto :eof

:library_cmd_checker <commandHref> //�����ں���
set return=none
set C1=%1
set C2=%2
set C3=%3
set C4=%4
set C5=%5
set C6=%6
set C7=%7
set C8=%8
set C9=%9
set C0=%*
goto :eof

:library_str_replace_vbs <textKey> //ʹ��bat�Ļ��������ܹ���ȷ������vbs������
set return=none
if defined %~1 (
	set "%~1=!%~1:(=^(!"
	set "%~1=!%~1:)=^)!"
	set "%~1=!%~1:&=`?`&Chr(38)&`?`!"
	set "%~1=!%~1: =`?`&Chr(32)&`?`!"
	set "%~1=!%~1:,=`?`&Chr(44)&`?`!"
)
goto :eof

::::::::::::::::::::�����û�::::::::::::::::::::
::������Ϊֹ��Gardens�����л���������ɣ����ο������Խ�����ŵ����档

:ultra_boot_ready //������תλ��

::��ʾ������Ϣ�����Կ������Ժ�����ģ���Ƿ�����
call :library_draw_blank
echo, system information:
call :library_draw_blank
echo, 	version:	%gardens.version%
echo, 	language:	%gardens.language.name%
%gardens.dir.components%TCurS /crv 0
%gardens.dir.components%tsleep 1500
cls

:sub_choseSub //ʾ���������
cls
::��Demo��ϸ���������ʹ��Gardens��һЩ���ÿ����ﵽ�򻯱�̵�Ч����
call :library_draw_blank 1
echo,    Please choose the project you want to test��
call :library_draw_blank 1
echo,	 ���������������������������������������������������������������������������������������� 
echo,	 �� ���������Demo���� Tmouse test���� ���������ԩ� 
echo,	 ���������������������������������������������������������������������������������������� 
if "%gardens.switch.debug%" == "true" (
	echo,
	echo,	Warning^^! Gardens runs in Debug mode, which loses some of its performance.
	call :library_draw_blank 30
) else (
	call :library_draw_blank 32
)
echo,	Note: This is just an example program. Please open the source code of the file for details.
call :gardens_tmouse -get
set gardens.do=
for %%A in (
	10}25}3}5}sub_drawAPI}
	27}39}3}5}sub_1}
	41}52}3}5}sub_0}
) do for /f "tokens=1-5 delims=}" %%a in ("%%A") do (
	if defined gardens.tmouse.x (
		if defined gardens.tmouse.y (
			if %gardens.tmouse.x% GEQ %%~a (
				if %gardens.tmouse.x% LEQ %%~b (
					if %gardens.tmouse.y% GEQ %%~c (
						if %gardens.tmouse.y% LEQ %%~d (
							set "gardens.do=%%~e"
						)
					)
				)
			)
		)
	)
)
if defined gardens.do (
	goto %gardens.do%
)
goto sub_choseSub

:sub_drawAPI //����Tmouse�����������Demo
cls
::��Ⱦ��ͷ������һƬ����
call :library_draw_blank 10 & set "return=None"

::��һ�δ�ʱ������������е�����
if not defined gardens.echo.pwd (set "gardens.echo.pwd=^��^�� !gardens.txt.inputpwd!		      ^��^�� ")

::һ�����������
echo,						���������������������������������������������������������������� 
echo,						�� %gardens.txt.loginpwd%	       �� 
echo,						�� 			       �� 
echo,						���������������������������������������������������������������� 
echo,						%gardens.echo.pwd%
echo,						���������������������������������������������������������������� 
echo,						���������������������������������������������������������������� 
echo,						����    1   ����    2   ����    3   ���� 
echo,						���������������������������������������������������������������� 
echo,						���������������������������������������������������������������� 
echo,						����    4   ����    5   ����    6   ���� 
echo,						���������������������������������������������������������������� 
echo,						���������������������������������������������������������������� 
echo,						����    7   ����    8   ����    9   ���� 
echo,						���������������������������������������������������������������� 
echo,						���������������������������������������������������������������� 
echo,						����   ^<��   ����    0   ����   ^<����  ���� 
echo,						���������������������������������������������������������������� 
echo,						���������������������������������������������������������������� 

::��ȡ�����Ϣ
call :gardens_tmouse -get

::��ȡ�����Ϊ��Ϣ
set gardens.do=
for %%A in (
	50}58}16}18}key.1}
	60}68}16}18}key.2}
	70}78}16}18}key.3}
	50}58}19}21}key.4}
	60}68}19}21}key.5}
	70}78}19}21}key.6}
	50}58}22}24}key.7}
	60}68}22}24}key.8}
	70}78}22}24}key.9}
	50}58}25}27}key.back}
	60}68}25}27}key.0}
	70}78}25}27}key.enter}
) do for /f "tokens=1-5 delims=}" %%a in ("%%A") do (
	if defined gardens.tmouse.x (
		if defined gardens.tmouse.y (
			if %gardens.tmouse.x% GEQ %%~a (
				if %gardens.tmouse.x% LEQ %%~b (
					if %gardens.tmouse.y% GEQ %%~c (
						if %gardens.tmouse.y% LEQ %%~d (
							set "gardens.do=%%~e"
						)
					)
				)
			)
		)
	)
)

::ִ�������Ϊ
if /i "%gardens.do%" equ "key.1" set "gardens.pwd=!gardens.pwd!1"
if /i "%gardens.do%" equ "key.2" set "gardens.pwd=!gardens.pwd!2"
if /i "%gardens.do%" equ "key.3" set "gardens.pwd=!gardens.pwd!3"
if /i "%gardens.do%" equ "key.4" set "gardens.pwd=!gardens.pwd!4"
if /i "%gardens.do%" equ "key.5" set "gardens.pwd=!gardens.pwd!5"
if /i "%gardens.do%" equ "key.6" set "gardens.pwd=!gardens.pwd!6"
if /i "%gardens.do%" equ "key.7" set "gardens.pwd=!gardens.pwd!7"
if /i "%gardens.do%" equ "key.8" set "gardens.pwd=!gardens.pwd!8"
if /i "%gardens.do%" equ "key.9" set "gardens.pwd=!gardens.pwd!9"
if /i "%gardens.do%" equ "key.0" set "gardens.pwd=!gardens.pwd!0"

::�����볤�ȵ����ƴ�����˸���Ĵ���
call :library_str_long gardens.pwd
if /i "%return%" == "0" (
	set "gardens.echo.pwd=^��^�� !gardens.txt.inputpwd!		      ^��^�� "
	goto sub_drawAPI
) else (
	if /i "!gardens.do!" equ "key.back" (
		set "gardens.pwd=!gardens.pwd:~0,-1!"
	)
	if !return! geq 27 (
		set "gardens.echo.pwd=...!gardens.pwd:~-24,24!"
	)
	if !return! lss 27 (
		set "gardens.echo.pwd=!gardens.pwd!"
	)
)

::��������ʾ��Ĵ���
set return=
call :library_str_long gardens.echo.pwd
if %return% leq 4 (
	set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%			      ^��^�� "
) else (
	if !return! leq 12 (
		set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%		      ^��^�� "
	) else (
		if !return! leq 19 (
			set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%	      ^��^�� "
		) else (
			if !return! leq 20 (
				set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%       ^��^�� "
			) else (
			if !return! leq 21 (
				set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%      ^��^�� "
				) else (
					if !return! leq 22 (
						set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%     ^��^�� "
					) else (
						if !return! leq 23 (
							set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%    ^��^�� "
						) else (
							if !return! leq 24 (
								set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%   ^��^�� "
							) else (
								if !return! leq 25 (
									set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%  ^��^�� "
								) else (
									if !return! leq 26 (
										set "gardens.echo.pwd=^��^�� %gardens.echo.pwd% ^��^�� "
									) else (
										if !return! leq 27 (
											set "gardens.echo.pwd=^��^�� %gardens.echo.pwd%^��^�� "
										)
									)
								)
							)
						)
					)
				)
			)
		)
	)
)
set return=

goto sub_drawAPI

:sub_1 //Tmouse�������
set /a bl=gardens.video.lines-2
!gardens.path.tmouse! /d 0 -1 1
>nul 2>nul (
	set "gardens.tmouse=!errorlevel!"
	if "!gardens.tmouse:~0,1!"=="0" set "gardens.tmouse=!gardens.tmouse:~1!"
	set /a "gardens.tmouse.x=!gardens.tmouse:~0,-3!"
	set /a "gardens.tmouse.y=!gardens.tmouse!-1000*!gardens.tmouse.x!"
)
cls
call :library_draw_blank %bl%
echo;  latest click: [!gardens.tmouse.x!,!gardens.tmouse.y!]    	RawInf: !gardens.tmouse!		time: !time!	date: !date!		tmouse OK
goto sub_1

:sub_0 //����һЩTinyLibrary
library\tcurs /crv 0
library\cido /full /top
for /l %%i in (1,1,60) do (
	echo ================================================================================================================================================================================================
)
goto sub_0
