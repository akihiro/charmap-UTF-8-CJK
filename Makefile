.PHONY: build clean distclean

GLIBC_VER=2.23
GLIBC_URL=https://sourceware.org/git/?p=glibc.git;a=blob_plain;hb=glibc-$(GLIBC_VER);f=localedata/unicode-gen
UNICODE_URL=http://ftp.unicode.org/Public/UNIDATA
LOCALE=UTF-8-CJK

build: $(LOCALE) $(LOCALE).gz

$(LOCALE).gz: $(LOCALE)
	gzip < $< > $@

$(LOCALE): utf8_gen.py.mod unicode_utils.py UnicodeData.txt EastAsianWidth.txt
	python3 utf8_gen.py.mod UnicodeData.txt EastAsianWidth.txt
	mv UTF-8 $@

utf8_gen.py.mod: utf8_gen.py utf8_gen.py.patch
	cp $< $@
	patch $@ utf8_gen.py.patch

utf8_gen.py:
	curl -L -o $@ "$(GLIBC_URL)/$@"

unicode_utils.py:
	curl -L -o $@ "$(GLIBC_URL)/$@"

UnicodeData.txt:
	curl -L -o $@ "$(UNICODE_URL)/$@"

EastAsianWidth.txt:
	curl -L -o $@ "$(UNICODE_URL)/$@"


clean:
	$(RM) $(LOCALE).gz $(LOCALE) utf8_gen.py.mod
distclean: clean
	$(RM) utf8_gen.py unicode_utils.py UnicodeData.txt EastAsianWidth.txt
