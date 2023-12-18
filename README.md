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

## CONFIGURATION

### LOCATION 

```bash
/root/.config/alpine-linux-pdc/config.yaml
```

### VALUES

```yaml
system:
  drivers:
    amd: (true/false) [default: false]
    intel: (true/false) [default: false]
  nfs:
    enabled: (true/false) [default: false]
    address: (ip_address) [default: ""]
    mounts:
      backup: (true/false) [default: false]
      media: (true/false) [default: false]
docker:
  enabled: (true/false) [default: false]
  containers:
    portainer: (true/false) [default: false]
  ingress: (true/false) [default: false]
  user: (string) [default: ""]
neofetch:
  enabled: (true/false) [default: false]
ufw:
  enabled: (true/false) [default: false]
```