```bash
apk list -I | cut -f1 -d' ' | sed -e 's/-r\d\+$//'| sed -e 's/\(.*\)-/\1 /'
```

```bash
apk add coreutils
```