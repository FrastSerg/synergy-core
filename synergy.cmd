@ECHO OFF
SET SYNERGY_EXE=%~dp0\bincbe\synergy-core-w64m-MT.exe
SET SYNERGY_CONF=%~dp0\synergy.conf
C:\cygwin64\bin\flock.exe -w 1 -E 100 -F -x %SYNERGY_EXE% %SYNERGY_EXE% server -c %SYNERGY_CONF% -d DEBUG -n sergeyu-pc -1 --no-tray -f
rem -a 192.168.1.34
