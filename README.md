Тестовое задание для получения навыка сборки собственного Docker-образа содержащего определенный набор программ

Тестовое задание включает:

- сборку  набора  утилит [SAMtools](https://github.com/samtools) для обработки коротких фрагментов секвенированной ДНК в формате BAM [htslib](https://github.com/samtools/htslib).
- сборка утилы [SAMtools](https://github.com/samtools)  с библиотекой для быстрого сжатия и распаковки всего буфера на основе DEFLATE [libdeflate](https://github.com/ebiggers/libdeflate)
- сборка расширения [biobambam](https://github.com/gt1/biobambam) для ранней стадии обработки файла выравнивания NGS, включающего быструю сортировку и маркировку дубликатов

## Сборка

```
docker build --tag task .
```

## Проверка работоспособности

```
docker run --rm task samtools --version
samtools 1.12
Using htslib 1.12
Copyright (C) 2021 Genome Research Ltd.

Samtools compilation details:
    Features:       build=configure curses=yes
    CC:             gcc
    CPPFLAGS:
    CFLAGS:         -Wall -g -O2
    LDFLAGS:
    HTSDIR:         htslib-1.12
    LIBS:
    CURSES_LIB:     -lncurses

HTSlib compilation details:
    Features:       build=configure plugins=no libcurl=yes S3=yes GCS=yes libdeflate=yes lzma=yes bzip2=yes htscodecs=1.0
    CC:             gcc
    CPPFLAGS:
    CFLAGS:         -Wall -g -O2 -fvisibility=hidden
    LDFLAGS:        -fvisibility=hidden

HTSlib URL scheme handlers present:
    built-in:	 preload, data, file
    S3 Multipart Upload:	 s3w, s3w+https, s3w+http
    Amazon S3:	 s3+https, s3+http, s3
    Google Cloud Storage:	 gs+http, gs+https, gs
    libcurl:	 imaps, pop3, http, smb, gopher, ftps, imap, smtp, smtps, rtsp, ftp, telnet, rtmp, ldap, https, ldaps, tftp, pop3s, smbs, dict
    crypt4gh-needed:	 crypt4gh
    mem:	 mem
```
