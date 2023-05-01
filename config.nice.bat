@echo off
cscript /nologo /e:jscript configure.js  "--enable-cli" "--with-ffi" "--with-iconv" "--enable-phar" "--enable-filter" "--with-openssl" "--enable-sockets" "--enable-mbstring" "--with-libxml" "--enable-fileinfo" "--enable-xmlwriter" "--enable-tokenizer" "--disable-phpdbg" "--enable-embed" %*
