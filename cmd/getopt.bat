@echo off
:parse
if "%~1" == "" goto endparse
if "%~1" == "--php" set PHP_VER=%2

shift
goto parse
:endparse
if not defined PHP_VER (
    set PHP_VER=7.4.33
)
