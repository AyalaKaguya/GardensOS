@echo off
color 9f
:loop
echo ================================================================================
echo                        %date%  %time%
echo           制作：乄铞②乄啷噹   QQ：355453334   Email：lzwudi@163.com
echo ================================================================================
echo ================================================================================
echo             本软件的制作目的是为了方便大家查找蓝屏代码的错误原因
echo        以下需要输入的字母均为大写；另外：0X00000001 中的0为数字，X为字母
echo                错误代码的位置在您蓝屏的屏幕的下面，比如下面所示：
echo ================================================================================
echo.
echo.
echo *** STOP: 0X00000001 (0X00000000,0XF794F102,0X00000008,0X00000000)
echo.
echo.
echo 请输入STOP:后面、括号前面的数值,例：0X00000001  退出请输入 Q
set /p wudi=请输入：
if %wudi% == Q exit
echo ================================================================================
if %wudi% == 0X00000001 echo 大意为：不正确的函数。
if %wudi% == 0X00000002 echo 大意为：系统找不到指定的档案。
if %wudi% == 0X00000003 echo 大意为：系统找不到指定的路径。 
if %wudi% == 0X00000004 echo 大意为：系统无法开启档案。
if %wudi% == 0X00000005 echo 大意为：拒绝存取。 
if %wudi% == 0X00000006 echo 大意为：无效的代码。 
if %wudi% == 0X00000007 echo 大意为：储存体控制区块已毁。 
if %wudi% == 0X00000008 echo 大意为：储存体空间不足，无法处理这个指令。
if %wudi% == 0X00000009 echo 大意为：储存体控制区块地址无效。
if %wudi% == 0X0000000A echo 大意为：环境不正确。
if %wudi% == 0X0000000B echo 大意为：尝试加载一个格式错误的程序。
if %wudi% == 0X0000000C echo 大意为：存取码错误。
if %wudi% == 0X0000000D echo 大意为：资料错误。
if %wudi% == 0X0000000E echo 大意为：储存体空间不够，无法完成这项作业。
if %wudi% == 0X0000000F echo 大意为：系统找不到指定的磁盘驱动器。 
if %wudi% == 0X00000010 echo 大意为：无法移除目录。
if %wudi% == 0X00000011 echo 大意为：系统无法将档案移到 其它的磁盘驱动器。
if %wudi% == 0X00000012 echo 大意为：没有任何档案。
if %wudi% == 0X00000013 echo 大意为：储存媒体为写保护状态。
if %wudi% == 0X00000014 echo 大意为：系统找不到指定的装置。
if %wudi% == 0X00000015 echo 大意为：装置尚未就绪。
if %wudi% == 0X00000016 echo 大意为：装置无法识别指令。
if %wudi% == 0X00000017 echo 大意为：资料错误 (cyclic redundancy check) 
if %wudi% == 0X00000018 echo 大意为：程序发出一个长度错误的指令。 
if %wudi% == 0X00000019 echo 大意为：磁盘驱动器在磁盘找不到 持定的扇区或磁道。
if %wudi% == 0X0000001A echo 大意为：指定的磁盘或磁盘无法存取。
if %wudi% == 0X0000001B echo 大意为：磁盘驱动器找不到要求的扇区。 
if %wudi% == 0X0000001C echo 大意为：打印机没有纸。
if %wudi% == 0X0000001D echo 大意为：系统无法将资料写入指定的磁盘驱动器。
if %wudi% == 0X0000001E echo 大意为：系统无法读取指定的装置。 
if %wudi% == 0X0000001F echo 大意为：连接到系统的某个装置没有作用。 
if %wudi% == 0X00000020 echo 大意为：进程无法访问该文件，因为另一进程正在使用该文件。
if %wudi% == 0X00000021 echo 大意为：档案的一部份被锁定， 现在无法存取。
if %wudi% == 0X00000022 echo 大意为：磁盘驱动器的磁盘不正确。
if %wudi% == 0X00000024 echo 大意为：开启的分享档案数量太多。
if %wudi% == 0X00000026 echo 大意为：到达档案结尾。
if %wudi% == 0X00000027 echo 大意为：磁盘已满。
if %wudi% == 0X00000032 echo 大意为：不支持这种网络要求。
if %wudi% == 0X00000033 echo 大意为：远程计算机无法使用。
if %wudi% == 0X00000034 echo 大意为：网络名称重复。
if %wudi% == 0X00000035 echo 大意为：网络路径找不到。
if %wudi% == 0X00000036 echo 大意为：网络忙碌中。
if %wudi% == 0X00000037 echo 大意为：指定的网络资源或设备不再可用。
if %wudi% == 0X00000038 echo 大意为：已达到网络BIOS命令限制。
if %wudi% == 0X00000039 echo 大意为：网络配接卡发生问题。
if %wudi% == 0X0000003A echo 大意为：指定的服务器无法执行要求的作业。
if %wudi% == 0X0000003B echo 大意为：网络发生意外错误。
if %wudi% == 0X0000003C echo 大意为：远程配接卡不兼容。
if %wudi% == 0X0000003D echo 大意为：打印机队列已满。
if %wudi% == 0X0000003E echo 大意为：服务器的空间无法储存等候打印的档案。
if %wudi% == 0X0000003F echo 大意为：等候打印的档案已经删除。
if %wudi% == 0X00000040 echo 大意为：指定的网络名称无法使用。
if %wudi% == 0X00000041 echo 大意为：拒绝存取网络。
if %wudi% == 0X00000042 echo 大意为：网络资源类型错误。
if %wudi% == 0X00000043 echo 大意为：网络名称找不到。
if %wudi% == 0X00000044 echo 大意为：超过区域计算机网络配接卡的名称限制。
if %wudi% == 0X00000045 echo 大意为：超过网络 BIOS 作业阶段的限制。
if %wudi% == 0X00000046 echo 大意为：远程服务器已经暂停或者正在起始中。
if %wudi% == 0X00000047 echo 大意为：由于联机数目已达上限，此时无法再联机到这台远程计算机。
if %wudi% == 0X00000048 echo 大意为：指定的打印机或磁盘装置已经暂停作用。
if %wudi% == 0X00000050 echo 大意为：档案已经存在。
if %wudi% == 0X00000052 echo 大意为：无法建立目录或档案。
if %wudi% == 0X00000053 echo 大意为：INT 24 失败。
if %wudi% == 0X00000054 echo 大意为：处理这项要求的储存体无法使用。
if %wudi% == 0X00000055 echo 大意为：近端装置名称已经在使用中。
if %wudi% == 0X00000056 echo 大意为：指定的网络密码错误。
if %wudi% == 0X00000057 echo 大意为：参数错误。
if %wudi% == 0X00000058 echo 大意为：网络发生资料写入错误。
if %wudi% == 0X00000059 echo 大意为：此时系统无法执行其它行程。
if %wudi% == 0X00000064 echo 大意为：无法建立其它的系统 semaphore。
if %wudi% == 0X00000065 echo 大意为：属于其它行程专用的 semaphore。
if %wudi% == 0X00000066 echo 大意为：semaphore 已经设定，而且无法关闭。
if %wudi% == 0X00000067 echo 大意为：无法指定 semaphore 。
if %wudi% == 0X00000068 echo 大意为：在岔断时间无法要求专用的 semaphore 。
if %wudi% == 0X00000069 echo 大意为：此 semaphore 先前的拥有权已经结束。
if %wudi% == 0X0000006A echo 大意为：请将磁盘插入。
if %wudi% == 0X0000006B echo 大意为：因为代用的磁盘尚未插入，所以程序已经停止。
if %wudi% == 0X0000006C echo 大意为：磁盘正在使用中或被锁定。
if %wudi% == 0X0000006D echo 大意为：Pipe 已经中止。
if %wudi% == 0X0000006E echo 大意为：系统无法开启指定的装置或档案。
if %wudi% == 0X0000006F echo 大意为：档名太长。
if %wudi% == 0X00000070 echo 大意为：磁盘空间不足。
if %wudi% == 0X00000071 echo 大意为：没有可用的内部档案标识符。
if %wudi% == 0X00000072 echo 大意为：目标内部档案标识符不正确。
if %wudi% == 0X00000075 echo 大意为：由应用程序所执行的 IOCTL 呼叫不正确。
if %wudi% == 0X00000076 echo 大意为：写入验证参数值不正确。
if %wudi% == 0X00000077 echo 大意为：系统不支持所要求的指令。
if %wudi% == 0X00000078 echo 大意为：此项功能仅在 Win32 模式有效。
if %wudi% == 0X00000079 echo 大意为：semaphore 超过逾时期间。
if %wudi% == 0X0000007A echo 大意为：传到系统呼叫的资料区域太小。
if %wudi% == 0X0000007B echo 大意为：文件名、目录名称或储存体卷标语法错误。
if %wudi% == 0X0000007C echo 大意为：系统呼叫层次不正确。
if %wudi% == 0X0000007D echo 大意为：磁盘没有设定卷标。
if %wudi% == 0X0000007E echo 大意为：找不到指定的模块。
if %wudi% == 0X0000007F echo 大意为：找不到指定的程序。
if %wudi% == 0X00000080 echo 大意为：没有子行程可供等待。
if %wudi% == 0X00000081 echo 大意为：这个应用程序无法在 Win32 模式下执行。
if %wudi% == 0X00000082 echo 大意为：尝试将打开磁盘分区的文件句柄用于原始磁盘I/O以外的操作。
if %wudi% == 0X00000083 echo 大意为：尝试将档案指针移至档案开头之前。
if %wudi% == 0X00000084 echo 大意为：无法在指定的装置或档案，设定档案指针。
if %wudi% == 0X00000085 echo 大意为：JOIN 或 SUBST 指令无法用于内含事先结合过的磁盘驱动器。
if %wudi% == 0X00000086 echo 大意为：尝试在已经结合的磁盘驱动器，使用 JOIN 或 SUBST 指令。
if %wudi% == 0X00000087 echo 大意为：尝试在已经替换的磁盘驱动器，使用 JOIN 或 SUBST 指令。
if %wudi% == 0X00000088 echo 大意为：系统尝试删除未连结过的磁盘驱动器的连结关系。
if %wudi% == 0X00000089 echo 大意为：系统尝试删除未替换过的磁盘驱动器的替换关系。
if %wudi% == 0X0000008A echo 大意为：系统尝试将磁盘驱动器结合到已经结合过之磁盘驱动器的目录。
if %wudi% == 0X0000008B echo 大意为：系统尝试将磁盘驱动器替换成已经替换过之磁盘驱动器的目录。
if %wudi% == 0X0000008C echo 大意为：系统尝试将磁盘驱动器替换成已经替换过之磁盘驱动器的目录。
if %wudi% == 0X0000008D echo 大意为：系统尝试将磁盘驱动器 SUBST 成已结合的磁盘驱动器目录。
if %wudi% == 0X0000008E echo 大意为：系统此刻无法执行 JOIN 或 SUBST。
if %wudi% == 0X0000008F echo 大意为：系统无法将磁盘驱动器结合或替换同一磁盘驱动器下目录。
if %wudi% == 0X00000090 echo 大意为：这个目录不是根目录的子目录。
if %wudi% == 0X00000091 echo 大意为：目录仍有资料。
if %wudi% == 0X00000092 echo 大意为：指定的路径已经被替换过。
if %wudi% == 0X00000093 echo 大意为：资源不足，无法处理这项指令。
if %wudi% == 0X00000094 echo 大意为：指定的路径这时候无法使用。
if %wudi% == 0X00000095 echo 大意为：尝试要结合或替换的磁盘驱动器目录，是已经替换过的的目标。
if %wudi% == 0X00000096 echo 大意为：CONFIG.SYS 文件未指定系统追踪信息，或是追踪功能被取消。
if %wudi% == 0X00000097 echo 大意为：指定的 semaphore事件 DosMuxSemWait 数目不正确。
if %wudi% == 0X00000098 echo 大意为：DosMuxSemWait 没有执行；设定太多的 semaphore。
if %wudi% == 0X00000099 echo 大意为：DosMuxSemWait 清单不正确。
if %wudi% == 0X0000009A echo 大意为：您所输入的储存媒体标元长度限制。
if %wudi% == 0X0000009B echo 大意为：无法建立其它的执行绪。
if %wudi% == 0X0000009C echo 大意为：接收行程拒绝接受信号。
if %wudi% == 0X0000009D echo 大意为：区段已经被舍弃，无法被锁定。
if %wudi% == 0X0000009E echo 大意为：区段已经解除锁定。
if %wudi% == 0X0000009F echo 大意为：执行绪识别码的地址不正确。
if %wudi% == 0X000000A0 echo 大意为：传到 DosExecPgm 的自变量字符串不正确。
if %wudi% == 0X000000A1 echo 大意为：指定的路径不正确。
if %wudi% == 0X000000A2 echo 大意为：信号等候处理。
if %wudi% == 0X000000A4 echo 大意为：系统无法建立执行绪。
if %wudi% == 0X000000A7 echo 大意为：无法锁定档案的部份范围。
if %wudi% == 0X000000AA echo 大意为：所要求的资源正在使用中。
if %wudi% == 0X000000AD echo 大意为：取消范围的锁定要求不明显。
if %wudi% == 0X000000AE echo 大意为：档案系统不支持自动变更锁定类型。
if %wudi% == 0X000000B4 echo 大意为：系统发现不正确的区段号码。
if %wudi% == 0X000000B6 echo 大意为：操作系统无法执行。
if %wudi% == 0X000000B7 echo 大意为：档案已存在，无法建立同一档案。
if %wudi% == 0X000000BA echo 大意为：传送的旗号错误。
if %wudi% == 0X000000BB echo 大意为：指定的系统旗号找不到。
if %wudi% == 0X000000BC echo 大意为：操作系统无法执行。
if %wudi% == 0X000000BD echo 大意为：操作系统无法执行。
if %wudi% == 0X000000BE echo 大意为：操作系统无法执行。
if %wudi% == 0X000000BF echo 大意为：无法在 Win32 模式下执行。
if %wudi% == 0X000000C0 echo 大意为：操作系统无法执行。
if %wudi% == 0X000000C1 echo 大意为：不是正确的 Win32 应用程序。
if %wudi% == 0X000000C2 echo 大意为：操作系统无法执行。
if %wudi% == 0X000000C3 echo 大意为：操作系统无法执行。
if %wudi% == 0X000000C4 echo 大意为：操作系统无法执行这个应用程序。
if %wudi% == 0X000000C5 echo 大意为：操作系统无法执行这个应用程序。
if %wudi% == 0X000000C6 echo 大意为：操作系统无法执行。
if %wudi% == 0X000000C7 echo 大意为：操作系统无法执行 这个应用程序。
if %wudi% == 0X000000C8 echo 大意为：程序代码的区段不可以大于或等于 64KB。
if %wudi% == 0X000000C9 echo 大意为：操作系统无法执行。
if %wudi% == 0X000000CA echo 大意为：操作系统无法执行。
if %wudi% == 0X000000CB echo 大意为：系统找不到输入的环境选项。
if %wudi% == 0X000000CD echo 大意为：在指令子目录下，没有任何行程有信号副处理程序。
if %wudi% == 0X000000CE echo 大意为：文件名称或扩展名太长。
if %wudi% == 0X000000CF echo 大意为：ring 2 堆栈使用中。
if %wudi% == 0X000000D0 echo 大意为：输入的通用档名字元 * 或 ? 不正确， 或指定太多的通用档名字元。
if %wudi% == 0X000000D1 echo 大意为：所传送的信号不正确。
if %wudi% == 0X000000D2 echo 大意为：无法设定信号处理程序。
if %wudi% == 0X000000D4 echo 大意为：区段被锁定，而且无法重新配置。
if %wudi% == 0X000000D6 echo 大意为：附加到此程序或动态连结模块的动态连结模块太多。
if %wudi% == 0X000000D7 echo 大意为：无法嵌套对LoadModule的调用。
if %wudi% == 0X000000E6 echo 大意为：管道状态无效。
if %wudi% == 0X000000E7 echo 大意为：所有的 pipe instances 都在忙碌中。
if %wudi% == 0X000000E8 echo 大意为： 管道正在关闭。
if %wudi% == 0X000000E9 echo 大意为：管道的另一端没有流程。
if %wudi% == 0X000000EA echo 大意为：有更多可用的资料。
if %wudi% == 0X000000F0 echo 大意为：作业阶段被取消。
if %wudi% == 0X000000FE echo 大意为：指定的延伸属性名称无效。
if %wudi% == 0X000000FF echo 大意为：延伸的属性不一致。
if %wudi% == 0X00000103 echo 大意为：没有可用的资料。
if %wudi% == 0X0000010A echo 大意为：无法使用 Copy API。
if %wudi% == 0X0000010B echo 大意为：目录名称错误。
if %wudi% == 0X00000113 echo 大意为：延伸属性不适用于缓冲区。
if %wudi% == 0X00000114 echo 大意为：在外挂的档案系统上的延伸属性档案已经毁损。
if %wudi% == 0X00000115 echo 大意为：延伸属性表格文件满。
if %wudi% == 0X00000116 echo 大意为：指定的延伸属性代码无效。
if %wudi% == 0X0000011A echo 大意为：外挂的这个档案系统不支持延伸属性。
if %wudi% == 0X00000120 echo 大意为：意图释放不属于叫用者的 mutex。
if %wudi% == 0X0000012A echo 大意为：semaphore 传送次数过多。
if %wudi% == 0X0000012B echo 大意为：只完成 Read/WriteProcessMemory 的部份要求。
if %wudi% == 0X0000013D echo 大意为：系统找不到位于讯息文件中编号为 0X00001 的讯息。
echo ================================================================================
pause
goto :loop