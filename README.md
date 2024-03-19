![icann_czds](docs/czds-logo.svg)

[![License](https://img.shields.io/badge/license-GNU_GPLv3-blue.svg?style=for-the-badge)](https://choosealicense.com/licenses/gpl-3.0/)
[![Changelog](https://img.shields.io/badge/changelog-%20.svg?style=for-the-badge&logo=keepachangelog&color=pink)](https://github.com/redcloudvg/icann_czds/blob/main/CHANGELOG.md)

easy to use scripts for interacting with ICANN CZDS

```console
$ echo email@domain.tld password >config.txt
$ ./download.sh $(./login.sh)
downloaded zuerich to data/zuerich.zone
downloaded zone to data/zone.zone
downloaded zip to data/zip.zone
downloaded zero to data/zero.zone
downloaded zara to data/zara.zone
```

## Dependencies

* [curl](https://curl.se/)
* [jq](https://jqlang.github.io/jq/)
* [gunzip](https://www.linux.org/docs/man1/gzip.html)
