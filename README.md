# alpine-linux-pdc

## INSTALLATION

Since Alpine Linux doesn't come preinstalled with curl, that will need to be installed first.

```bash
apk add -U curl
```

Once curl is installed, simply run the following command to create the required directories/files for cron based pdc.

```bash
curl -L -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/chadwagoner/alpine-linux-pdc/main/init.sh | bash
```