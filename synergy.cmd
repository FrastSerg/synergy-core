@ECHO OFF
SET SYNERGY_EXE=%~dp0\cbeResults\synergy-core-w64m-MT.exe
SET SYNERGY_CONF=%~dp0\synergy.conf
C:\cygwin64\bin\flock.exe -w 1 -E 100 -F -x %SYNERGY_EXE% %SYNERGY_EXE% server -c %SYNERGY_CONF% -d DEBUG -1 --no-tray -f
