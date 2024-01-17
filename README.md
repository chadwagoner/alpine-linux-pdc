# alpine-linux-pdc

## INSTALLATION

Since Alpine Linux doesn't come preinstalled with curl, that will need to be installed first

```bash
apk add -U bash curl
```

Once curl is installed, simply run the following command to create the required directories/files for cron based pdc

```bash
curl -L -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/chadwagoner/alpine-linux-pdc/main/init | bash
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
    amd: (true/false)                 [default: false]
    intel: (true/false)               [default: false]
  nfs:
    enabled: (true/false)             [default: false]
    address: (string)                 [default: ""]
    mounts:
      backup: (true/false)            [default: false]
      media: (true/false)             [default: false]
  tailscale:
    enabled: (true/false)             [default: false]
    exit: (true/false)                [default: false]
    subnet: (true/false)              [default: false]
docker:
  enabled: (true/false)               [default: false]
  containers:
    portainer: (true/false)           [default: false]
  ingress: 
    enabled: (true/false)             [default: false]
    traefik: (true/false)             [default: false]
  user: (string)                      [default: ""]
neofetch:
  enabled: (true/false)               [default: false]
ufw:
  enabled: (true/false)               [default: false]
```

## APP SPECIFIC CONFIGURATION

### TAILSCALE

#### INSTALLATION

```yaml
system:
  tailscale:
    enabled: true
```

#### CONFIGURATION

Run the following command to start tailscale and follow instructions for authentication

```bash
tailscale up --qr
```

Add the following parameter for exit node

```bash
--advertise-exit-node
```

Add the following parameter for ssh ability

```bash
--ssh
```

Add the following parameter for subnet routing

```bash
--advertise-routes=<ip-address-range>
```
