@echo off
set SNAP=
set OPTIONS=
:parse
if "%~1" == "" goto endparse
if "%~1" == "--php" set PHP_VER=%2
if "%~1" == "--option" set OPTIONS=%2 %OPTIONS%
if "%~1" == "--snap" set SNAP=snap

shift
goto parse
:endparse
if not defined PHP_VER (
    set PHP_VER=7.4.33
)
