@REM  Anthon-Starter: Installation helper for :Next Linux distribution series. Version 0.1.2
@REM  Copyright (C) 2014 Anthon Open Source Community - Junde Studio. 
@REM  Tencent QQ Group: 292606292
@REM
@REM  This software is under GNU Genereal Public License 3 and WITHOUT ANY WARRANTY.
@REM  So you know it...            


@echo off

REM Check the parameters(%1 is language; %2 is loader type)
REM Parameters will be added "" in Windows, so you see """".
if "%1"=="" exit
if "%2"=="" exit

if "%1"==""1"" goto cn_main
if "%2"==""2"" goto en_main

REM //////////SimplifiedChinese
:cn_main
cls
title 安同开始程序 0.1.2
echo ====================＞＞＞欢迎使用安同开始程序＜＜＜====================
echo.
echo 本程序将引导您轻松地从硬盘安装安同GNU/Linux桌面版
echo （或是社区合作项目IcenowyLinux）
echo.
echo * 要马上开始安装，请直接敲击回车键；
echo * 要查看本程序的版权信息请键入 license 然后回车；
echo * 关于本程序请键入 about 然后回车；
echo * 退出本程序请键入 exit 然后回车。
echo.
set /p cho=选择一个选项：
if "%cho%"=="" (
	set cho=
	goto cn_check
)
if "%cho%"=="license" (
	set cho=
	start notepad.exe %systemdrive%\ast_temp\LICENSE
	goto cn_main
)
if "%cho%"=="about" (
	set cho=
	goto cn_about
)
if "%cho%"=="exit" (
	set cho=
	goto self_del
)
set cho=
goto cn_main





:cn_check
cls
echo =====================＞＞＞第 1 步  检查计算机＜＜＜====================
echo.
if "%2"==""nt5"" echo * 探测到您的系统类型为Windows NT5系列（Windows 2k, XP等）
if "%2"==""nt6"" echo * 探测到您的系统类型为Windows NT6系列（Windows Vista, 7, 8等）
echo.
echo 在安装系统之前，请您注意以下注意事项：
echo   1. 请务必把安装所需文件装入本地硬盘（而不是U盘、移动硬盘、MP3等设备）；
echo   2. 安同开源社区所有发行版均只运行在x86_64架构的中央处理器上，请自行查询您的
echo        计算机是否符合要求，安同开始程序暂时不提供自动检查功能；
echo   3. 安同开源社区所有发行版要求计算机带有不少于2GB内存的计算机来运行，否则可能
echo        出现运行缓慢、卡顿的情况；
echo   4. 本程序遵循GNU GPL许可证发布，安同开源社区发行版则均遵循GNU LGPL发布。
echo.
echo 确认无误后，请键入 y 继续安装，直接按下回车或输入其他字符退出安同开始程序。
set /p chkcho=→
if "%chkcho%"=="y" goto cn_image
REM Delete the temp files
goto self_del




:cn_image
cls
echo =====================＞＞＞第 2 步  选择文件＜＜＜======================
echo.
echo 请键入您所获取的光盘映像文件的所在位置。
echo   【注意】键入各种非法字符和路径将导致操作失败！
echo 右键粘贴功能可用；键入 EXIT 可以退出本程序。
set /p file=→
if "%file%"=="^" goto cn_err1
if "%file%"=="." goto cn_err1
if "%file%"=="*" goto cn_err1
if "%file%"=="/" goto cn_err1
if "%file%"=="\" goto cn_err1
if "%file%"=="," goto cn_err1
if "%file%"=="=" goto cn_err1
if "%file%"=="" goto cn_err1
if not exist %file% goto cn_err1
if "%file%"=="EXIT" goto self_del
goto cn_target


:cn_target
cls

echo =====================＞＞＞第 3 步  解压位置＜＜＜======================
echo.
echo 请输入一个解压位置以确保安装程序可以正常释放文件。
echo   直接按下回车键将设定解压位置为%systemdrive%\
echo.
echo   * 输入方式示例：%systemdrive%\  键入 EXIT 可以退出本程序。
set /p location=→
if "%location%"=="EXIT" goto self_del
if "%location%"=="" (
	set location=%systemdrive%\
	goto cn_way
)
if not exist %location% goto cn_err2
goto cn_way


:cn_way
cls
echo =====================＞＞＞第 4 步  安装方式＜＜＜======================
echo.
echo 请指定引导到安装程序所使用的启动方式。
echo   【注意】除非您拥有专业知识，否则请使用默认设置“通过NT引导器嵌套引导”！
echo.
echo   * 直接按下回车键设定安装方式为“通过NT引导器嵌套引导”；
echo   * 输入 write_mbr 并按下回车键设定安装方式为“通过主引导记录启动”；
echo   * 键入 EXIT 并按下回车键可以退出本程序。
set /p instway=→
if "%instway%"=="EXIT" goto self_del
if "%instway%"=="" (
	set instway=edit_present
	goto cn_run
)
if "%instwat%"=="write_mbr" goto cn_run
set instway=
goto cn_way



:cn_run
cls
echo ====================＞＞＞第 5 步  准备安装程序＜＜＜====================
echo.
echo 请确认您的设置是否正确：
echo * 您设定的文件为：%file%
echo * 您设定的解压路径为：%location%
if "%instway%"=="edit_present" echo * 您将通过NT引导器嵌套引导安装程序（默认设置）
if "%instway%"=="write_mbr" echo * 您将通过修改主引导记录引导安装程序
echo.
echo 按下回车键开始准备安装程序，否则请键入 no 然后回车。
echo   键入 EXIT 然后按下回车可以退出本程序。
set /p yesno=→
if "%yesno%"=="no" (
	set file=
	set location=
	set instway=
	set yesno=
	goto cn_image
)
if "%yesno%"=="EXIT" goto self_del

cls
echo ========================＞＞＞准备安装程序中＜＜＜========================
echo 安同开始程序正在努力准备好安装程序。
echo 这个过程需要一些时候。请耐心等待。
echo.
echo  00％ 备份系统重要位置...
if "%instway%"=="edit_present" (
	if "%2"==""nt5"" (
		attrib -s -h -r %systemdrive%\boot.ini
		copy %systemdrive%\boot.ini %systemdrive%\ast_bkup
		)
	if "%2"==""nt6"" bcdedit /export %systemdrive%\ast_bkup\BCDbckup
)

dd if=\\?\Device\Harddisk0\Partition1 of=%systemdrive%\ast_bkup\MBRbckup bs=512 count=1

echo  10％　校验安装文件...
wget http://mirror.anthonos.org/junde-studio/sha_image_aosc.txt
sha256sum --check sha_image_aosc.txt > nul
if not "%errorlevel%"=="0" (
	echo        *** 映像文件校验失败！继续进行安装可能导致安装失败...
	echo            继续安装请输入 y 然后按下回车，输入其它字符或回车退出程序。
	set /p vercho=           →
	if not "%vercho%"=="y" goto self_del
)

echo  30％ 解压预安装环境内核...
REM While extracting the files in [image_file]/boot/ , the new folder 'boot' will be added too.
REM For some users will install some recovery software (like One-key Ghost, it'll create a folder named 'boot' too),
REM   we first extract them into the %temp% and then copy them into the ast_strt.
7z x %file% -o%temp%\ boot\vmlinuz -y >nul
echo  45％ 解压预安装环境内存盘...
7z x %file% -o%temp%\ boot\initrd -y >nul

move %temp%\boot\vmlinuz %systemdrive%\ast_strt
move %temp%\boot\initrd %systemdrive%\ast_strt

echo  55％ 解压操作系统安装文件...
echo         * 本过程耗时较长，请耐心等待。
7z x %file% -o%location% squash -y >nul

echo  85％ 开始部署启动...

if "%instway%"=="edit_present" (
	if "%2"==""nt5"" (
		echo [boot loader] > %systemdrive%\boot.ini
		echo timeout=10 >> %systemdrive%\boot.ini
		echo default=%systemdrive%\g2ldr >> %systemdrive%\boot.ini
		echo [operating systems] >> %systemdrive%\boot.ini

		if "%1"==""1"" (
			echo %systemdrive%\WINDOWS="启动原来的Windows操作系统" >> %systemdrive%\boot.ini
			echo %systemdrive%\g2ldr="启动安同 GNU/Linux安装程序" >> %systemdrive%\boot.ini
			echo. >> %systemdrive%\boot.ini
			)
		if "%1"==""2"" (
			echo %systemdrive%\WINDOWS="启动原来的Windows操作系统" >> %systemdrive%\boot.ini
			echo %systemdrive%\g2ldr="启动安同 GNU/Linux安装程序" >> %systemdrive%\boot.ini
			echo. >> %systemdrive%\boot.ini
		)
	)

	if "%2"==""nt6"" (
		if "%1"==""1"" (
			bcdedit /timeout 10
			for /f "delims=" %%i in ('bcdedit /create /d "启动安同 GNU/Linux安装程序" /application bootsector') do set uid=%%i
			bcdedit /set %uid:~2,38% device partition=%systemdrive%
			bcdedit /set %uid:~2,38% path \g2ldr
			bcdedit /displayorder %uid:~2,38% /addlast
			bcdedit /default %uid:~2,38%
		)
		if "%1"==""2"" (
			bcdedit /timeout 10
			for /f "delims=" %%i in ('bcdedit /create /d "Start Anthon GNU/Linux Installer" /application bootsector') do set uid=%%i
			bcdedit /set %uid:~2,38% device partition=%systemdrive%
			bcdedit /set %uid:~2,38% path \g2ldr
			bcdedit /displayorder %uid:~2,38% /addlast
			bcdedit /default %uid:~2,38%
		)
	)
)

if "%instway%"=="write_mbr" grubinst --grub2 (hd0)

echo  90％ 正在部署启动...已完成第一步，共三步

if "%1"==""1"" (
	echo # Grub.cfg generated by Anthon-Starter 0.1.2 > %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
	echo set default="1" >> %systemdrive%\ast_strt\grub.cfg
	echo set gfxmode=1024x768 >> %systemdrive%\ast_strt\grub.cfg
	echo terminal_output gfxterm >> %systemdrive%\ast_strt\grub.cfg
	echo set timeout="10" >> %systemdrive%\ast_strt\grub.cfg
	echo loadfont /ast_strt/fonts/unicode.pf2 >> %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
	echo menuentry "启动原来的 Windows 操作系统" { >> %systemdrive%\ast_strt\grub.cfg
	echo   search --set=root --no-floppy /ntldr >> %systemdrive%\ast_strt\grub.cfg
	echo   chainloader /ntldr >> %systemdrive%\ast_strt\grub.cfg
	echo   boot >> %systemdrive%\ast_strt\grub.cfg
	echo } >> %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
	echo menuentry "启动安同 GNU/Linux 安装程序" { >> %systemdrive%\ast_strt\grub.cfg
	echo   search --set=root --no-floppy /ast_strt/vmlinuz >> %systemdrive%\ast_strt\grub.cfg
	echo   linux /ast_strt/vmlinuz quiet >> %systemdrive%\ast_strt\grub.cfg
	echo   initd /ast_strt/initrd >> %systemdrive%\ast_strt\grub.cfg
	echo   boot >> %systemdrive%\ast_strt\grub.cfg
	echo } >> %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
)
if "%2"==""2"" (
	echo # Grub.cfg generated by Anthon-Starter 0.1.2 > %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
	echo set default="1" >> %systemdrive%\ast_strt\grub.cfg
	echo set gfxmode=1024x768 >> %systemdrive%\ast_strt\grub.cfg
	echo terminal_output gfxterm >> %systemdrive%\ast_strt\grub.cfg
	echo set timeout="10" >> %systemdrive%\ast_strt\grub.cfg
	echo loadfont /ast_strt/fonts/unicode.pf2 >> %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
	echo menuentry "Start Windows Operating System" { >> %systemdrive%\ast_strt\grub.cfg
	echo   search --set=root --no-floppy /ntldr >> %systemdrive%\ast_strt\grub.cfg
	echo   chainloader /ntldr >> %systemdrive%\ast_strt\grub.cfg
	echo   boot >> %systemdrive%\ast_strt\grub.cfg
	echo } >> %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
	echo menuentry "Start Anthon GNU/Linux Installer" { >> %systemdrive%\ast_strt\grub.cfg
	echo   search --set=root --no-floppy /ast_strt/vmlinuz >> %systemdrive%\ast_strt\grub.cfg
	echo   linux /ast_strt/vmlinuz quiet >> %systemdrive%\ast_strt\grub.cfg
	echo   initd /ast_strt/initrd >> %systemdrive%\ast_strt\grub.cfg
	echo   boot >> %systemdrive%\ast_strt\grub.cfg
	echo } >> %systemdrive%\ast_strt\grub.cfg
	echo. >> %systemdrive%\ast_strt\grub.cfg
)
echo  95％ 正在部署启动...已完成第二步，共三步

copy %systemdrive%\ast_temp\g2ldr %systemdrive%\
echo 100％ 正在部署启动...已完成第三步，共三步



:cn_finish
cls
echo =======================＞＞＞就绪啦＜＜＜=======================
echo.
echo 安同开始程序已经准备好了操作系统的安装部署，即将重新启动到安装程序。
echo 请保存好您的工作，按下任意键重新启动您的电脑。
pause>nul
goto before_reboot


:cn_err1
cls
echo =======================＞＞＞出错啦＜＜＜=======================
echo.
echo 您输入的这个文件并不存在！请确认路径是否错误...
echo.
echo 按下任意键返回上一步！
pause>nul
set file=
goto cn_image

:cn_err2
cls
echo =======================＞＞＞出错啦＜＜＜=======================
echo.
echo 您输入的这个盘符并不存在！请确认盘符是否错误...
echo.
echo 按下任意键返回上一步！
pause>nul
set location=
goto cn_target












:en_main
cls
title Anthon-Starter 0.1.2
echo =========================＞＞＞Welcome!＜＜＜=========================
echo.
echo We haven't finished it yet!
pause > nul
exit









:cn_about
cls
title 关于安同开始程序 0.1.1
echo                                   AS 安同 Do.
echo.
echo                               安同开始程序0.1.2
echo                          安同开源社区-俊德工作室 出品
echo.
echo 本程序为自由软件；您可依据自由软件基金会所发表的GNU通用公共授权条款规定，就本程序再为发布与／或修改；无论您依据的是本授权的第二版或（您自行选择的）任一日后发行的版本。
echo.
echo 感谢以下参与编写本程序的人员：
echo 以俊德 [lmy441900@gmail.com]
echo ruojiner [ruojiner@163.com]
echo.
echo 获取更多信息，请登录安同开源社区 http://forum.anthonos.org/
echo.
echo 按下任意键返回主屏幕。
pause >nul
set cho=
goto cn_main

:en_about
cls
title About Anthon-Starter 0.1.2
echo                                    AS Anthon Do.
echo.
echo                               AnthonOS-Starter 0.1.2
echo                    By Junde Studio - Anthon Open Source Community
echo.
echo This program is free software; you can redistribute it and/ormodify it under the terms of the GNU General Public Licenseas published by the Free Software Foundation; either version 2of the License, or (at your option) any later version.
echo.
echo Thanks for the following people involved in the preparation of the program:
echo Junde Yi [lmy441900@gmail.com]
echo ruojiner [ruojiner@163.com]
echo.
echo For any information, please visit http://forum.anthonos.org/
echo.
echo Press any key to return.
pause >nul
set cho=
goto en_main


:before_reboot
echo %1 > %systemdrive%\ast_strt\info.ast
echo %location% >> %systemdrive%\ast_strt\info.ast
copy %systemdrive%\ast_temp\startup.bat %systemdrive%\ast_strt\
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Anthon-Starter /t REG_SZ /d %systemdrive%\ast_strt\startup.bat /f
rd /s /q %systemdrive%\ast_temp
REM shutdown -s -t 00


:self_del
set ptable=
set loader=
set file=
set location=
set instway=
set freesize=
set cho=
set chkcho=
set yesno=
set vercho=

REM ***Here we have a problem, which cannot let the program delete itself.

rd /s /q %systemdrive%\ast_bkup
rd /s /q %systemdrive%\ast_strt
rd /s /q %systemdrive%\ast_temp
exit