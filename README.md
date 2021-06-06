Тестовое задание для получения навыка сборки собственного Docker-образа содержащего определенный набор программ

Тестовое задание включает:

- сборку  набора  утилит [SAMtools](https://github.com/samtools) для обработки коротких фрагментов секвенированной ДНК в формате BAM [htslib](https://github.com/samtools/htslib).
- сборка утилы [SAMtools](https://github.com/samtools)  с библиотекой для быстрого сжатия и распаковки всего буфера на основе DEFLATE [libdeflate](https://github.com/ebiggers/libdeflate)
- сборка расширения [biobambam](https://github.com/gt1/biobambam) для ранней стадии обработки файла выравнивания NGS, включающего быструю сортировку и маркировку дубликатов

## Сборка

```
docker build --tag task .
```
