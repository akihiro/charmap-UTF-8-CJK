# charmap-UTF-8-CJK
chamap UTF-8-CJK for glibc

# how to use

build UTF-8-CJK and UTF-8-CJK.gz

```console
$ make
curl -L -o utf8_gen.py "https://sourceware.org/git/?p=glibc.git;a=blob_plain;hb=glibc-2.23;f=localedata/unicode-gen/utf8_gen.py"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11722    0 11722    0     0  11532      0 --:--:--  0:00:01 --:--:-- 11537
cp utf8_gen.py utf8_gen.py.mod
patch utf8_gen.py.mod utf8_gen.py.patch
patching file utf8_gen.py.mod
curl -L -o unicode_utils.py "https://sourceware.org/git/?p=glibc.git;a=blob_plain;hb=glibc-2.23;f=localedata/unicode-gen/unicode_utils.py"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 21964    0 21964    0     0  21711      0 --:--:--  0:00:01 --:--:-- 21725
curl -L -o UnicodeData.txt http://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1646k  100 1646k    0     0   967k      0  0:00:01  0:00:01 --:--:--  967k
curl -L -o EastAsianWidth.txt http://ftp.unicode.org/Public/UNIDATA/EastAsianWidth.txt
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  161k  100  161k    0     0   142k      0  0:00:01  0:00:01 --:--:--  142k
python3 utf8_gen.py.mod UnicodeData.txt EastAsianWidth.txt
mv UTF-8 UTF-8-CJK
gzip < UTF-8-CJK > UTF-8-CJK.gz
```

copy UTF-8-CJK.gz or UTF-8-CJK

```console
$ sudo UTF-8-CJK.gz /usr/share/i18n/charmap/
```

generate locate

``` console
$ sudoedit /etc/locale-gen
-ja_JP.UTF-8 UTF-8
+ja_JP.UTF-8 UTF-8-CJK
$ sudo locate-gen
```



# See also

- http://d.hatena.ne.jp/silenvx/20160411/1460306382
- https://github.com/wacky612/utf8-cjk-charmap
