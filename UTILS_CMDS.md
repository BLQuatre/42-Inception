```bash
apk list -I | cut -f1 -d' ' | sed -e 's/-r\d\+$//'| sed -e 's/\(.*\)-/\1 /'
```

```bash
apk add coreutils
```

```bash
for i in $(docker images | grep "<none>" | awk '{print $3}'); do docker rmi $i; done
```
