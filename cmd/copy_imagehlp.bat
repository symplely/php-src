@echo off
if %ARCH% == "x64" (
	copy /Y "C:\Windows\SysWOW64\imagehlp.dll" ..\deps\bin\
) else (
	copy /Y "C:\Windows\System32\imagehlp.dll" ..\deps\bin\
)
