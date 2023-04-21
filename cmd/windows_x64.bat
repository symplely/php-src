@echo off
if not defined PHP_VER set PHP_VER=7.4.33

if "%PHP_VER%" == "7.4.33" (
    set CRT=vc15
) else (
    set CRT=vs16
)

IF NOT EXIST php-sdk (
  curl -L https://github.com/php/php-sdk-binary-tools/archive/refs/tags/php-sdk-2.2.0.tar.gz | tar xzf - && ren php-sdk-binary-tools-php-sdk-2.2.0 php-sdk
)

IF NOT EXIST php-sdk\phpdev\%CRT%\x64 (mkdir php-sdk\phpdev\%CRT%\x64)
IF NOT EXIST php-sdk\phpdev\%CRT%\x64\pecl (mkdir php-sdk\phpdev\%CRT%\x64\pecl)
IF NOT EXIST php-sdk\phpdev\%CRT%\x64\php-%PHP_VER% (
	mklink /j "php-sdk\phpdev\%CRT%\x64\php-%PHP_VER%" .
)

cd php-sdk
set "VSCMD_START_DIR=%CD%"
set "__VSCMD_ARG_NO_LOGO=yes"
set PHP_SDK_ROOT_PATH=%~dp0
set PHP_SDK_ROOT_PATH=%PHP_SDK_ROOT_PATH:~0,-1%

set PHP_SDK_RUN_FROM_ROOT=.\php-sdk
set ARCH=x64
copy /Y ..\cmd\phpsdk_setshell.bat bin\phpsdk_setshell.bat
bin\phpsdk_setshell.bat %CRT% x64 && bin\phpsdk_setvars.bat && bin\phpsdk_dumpenv.bat && bin\phpsdk_buildtree.bat phpdev && cd php-%PHP_VER% && ..\..\..\..\bin\phpsdk_deps -u --no-backup && IF EXIST config.nice.bat (
  config.nice.bat && nmake %SNAP% && cd ..\..\..\..\..
) else (
  buildconf --add-modules-dir=..\pecl\ && configure --enable-cli --with-ffi --with-iconv --enable-phar --enable-json --enable-filter --with-openssl --enable-sockets --enable-mbstring --with-libxml --enable-fileinfo --enable-xmlwriter --enable-tokenizer --enable-embed --disable-phpdbg --disable-cgi %OPTIONS% && nmake %SNAP% && cd ..\..\..\..\..
)
