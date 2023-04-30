$(srcdir)/var_unserializer.c: $(srcdir)/var_unserializer.re
	@(cd $(top_srcdir); $(RE2C) $(RE2C_FLAGS) --no-generation-date -b -o src/ext/standard/var_unserializer.c src/ext/standard/var_unserializer.re)

$(srcdir)/url_scanner_ex.c: $(srcdir)/url_scanner_ex.re
	@(cd $(top_srcdir); $(RE2C) $(RE2C_FLAGS) --no-generation-date -b -o src/ext/standard/url_scanner_ex.c	src/ext/standard/url_scanner_ex.re)

$(builddir)/info.lo: $(builddir)/../../main/build-defs.h

$(builddir)/basic_functions.lo: $(top_srcdir)/Zend/zend_language_parser.h
