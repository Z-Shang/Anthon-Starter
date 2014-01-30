@REM  Anthon-Starter: Installation helper for :Next Linux distribution series. Version 0.1.2
@REM  Copyright (C) 2014 Anthon Open Source Community - Junde Studio. 
@REM  Tencent QQ Group: 292606292
@REM
@REM  This software is under GNU Genereal Public License 3 and WITHOUT ANY WARRANTY.
@REM  So you know it...            


@echo off
cls
title Anthon Open Source Community - Junde Studio

if not exist %systemdrive%\ast_strt\info.ast (
 echo 警告：找不到配置文件。将缺少部分功能。
 echo Warning: Can't load the settings. Some features will be missing.
 ping 127.0.0.1 >nul
 goto en_main
)

echo Loading...
for /f "tokens=1* delims=:" %%a in ('findstr /n .* %systemdrive%\ast_strt\info.ast^|findstr "^1:"') do set lang=%%b
for /f "tokens=1* delims=:" %%a in ('findstr /n .* %systemdrive%\ast_strt\info.ast^|findstr "^2:"') do set location=%%b
 if "%lang%"==""1" " goto cn_main
 if "%lang%"==""2" " goto en_main



:cn_main
cls
title 安同开始程序 0.1.2
echo ====================＞＞＞欢迎使用安同开始程序＜＜＜====================
echo.
echo 感谢您安装安同 GNU/Linux，在此全体开发人员祝您能够愉快地使用安同 GNU/Linux。
echo 现在安同开始程序已经准备好了对安装后系统残留文件的清扫。
echo.
echo 请按任意键执行操作，或者您可以关掉此窗口。
pause > nul
goto run

:en_main
cls
title Anthon-Starter 0.1.2
echo =========================＞＞＞Welcome!＜＜＜=========================
echo.
echo Thank you for choosing Anthon GNU/Linux.
echo Here all the developers wish you have a pleasant trip with Anthon GNU/Linux.
echo.
echo Now Anthon-Starter is ready for trash cleaning.
echo.
echo Press any key to execute, or you can close the window.
pause > nul
goto run



:run
if "%lang%"==""1" " echo 请稍候，安同开始程序正在执行任务……
if "%lang%"==""2" " echo Please wait while Anthon-Starter is cleaning files...

if exist %systemdrive%\ast_bkup\boot.ini (
	attrib -s -h -r %systemdrive%\boot.ini
	del /f %systemdrive%\boot.ini
	copy %systemdrive%\ast_bkup\boot.ini %systemdrive%\
	attrib +s +h +r %systemdrive%\boot.ini
)
if exist %systemdrive%\ast_bkup\BCDbckup (
	bcdedit /import %systemdrive%\ast_bkup\BCDbckup
)

rd /s /q %systemdrive%\ast_bkup
del /f %systemdrive%\g2ldr
if exist %location%squash del /f %location%squash
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Anthon-Starter /f
pause
if "%lang%"=="1 " goto finish1
if "%lang%"=="2 " goto finish2
goto finish3

:finish1
cls
echo 操作已完成！感谢您对中国青少年开源事业的支持！
echo.
echo 请按任意键结束本程序。
pause>nul
rd /s /q %systemdrive%\ast_strt
exit

:finish2
cls
echo Cleaning has already Finished! Thanks for your support!
echo.
echo Press any key to finish.
pause>nul
rd /s /q %systemdrive%\ast_strt
exit

