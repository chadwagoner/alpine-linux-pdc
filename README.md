# alpine-linux-pdc

## INSTALLATION

Since Alpine Linux doesn't come preinstalled with bash and curl, that will need to be installed first

```bash
apk add -U bash curl
```

Once curl is installed, simply run the following command to create the required directories/files for cron based pdc

```bash
curl -sL -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/chadwagoner/alpine-linux-pdc/main/init | bash
```

## CONFIGURATION

### LOCATION 

```bash
/root/.config/alpine-linux-pdc/config.yaml
```

### VALUES

```yaml
services:
  adguard:
    enabled: (true/false)             [default: false]
  traefik:
    enabled: (true/false)             [default: false]
    custom_config:
    required_env:
      ADMIN_CREDS: (string)           [default: ""]
      DO_AUTH_TOKEN: (string)         [default: ""]
      DOMAIN: (string)                [default: ""]
      EMAIL: (string)                 [default: ""]
      SUBDOMAIN: (string)             [default: ""]
system:
  docker:
    enabled: (true/false)             [default: false]
    ingress: (true/false)             [default: false]
    user: (string)                    [default: ""]
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
    tailnet: (string)                 [default: ""]
  ufw:
    enabled: (true/false)             [default: false]
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

## MISC

### DEVELOPMENT

#### MAC

```
brew install macpine
```

Create, Update, and fix Grub

```
alpine launch --name dev --mount $(pwd) && \
alpine exec dev 'echo -e "### CONTROLLED BY PDC\n\nhttp://dl-cdn.alpinelinux.org/alpine/v3.20/main\nhttp://dl-cdn.alpinelinux.org/alpine/v3.20/community" > /etc/apk/repositories && apk upgrade -U && apk add -U bash chrony curl && rc-update add chronyd && service chronyd start && grub-install --target=arm64-efi --efi-directory=/boot/efi --bootloader-id=alpine --boot-directory=/boot --no-nvram && install -D /boot/efi/EFI/alpine/grubaa64.efi /boot/efi/EFI/boot/bootaa64.efi && reboot' && \
sleep 10 && \
alpine ssh dev
```

Issues with mounting directory? Run this...

```
alpine exec dev 'mount -t 9p -o trans=virtio,version=9p2000.L,msize=104857600 host0 /mnt/alpine-linux-pdc'
```

Cleanup

```
alpine delete dev
```

#### REFERENCES
* [GITHUB](https://github.com/beringresearch/macpine)
* [GRUB FIX](https://wiki.alpinelinux.org/wiki/Release_Notes_for_Alpine_3.20.0#grub_2.12)

### GIT COMMIT MESSAGE TYPES [[REFERENCE]](https://www.conventionalcommits.org/en/v1.0.0/)

* build: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
* ci: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
* docs: Documentation only changes
* feat: A new feature
* fix: A bug fix
* perf: A code change that improves performance
* refactor: A code change that neither fixes a bug nor adds a feature
* style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
* test: Adding missing tests or correcting existing tests

#### EXAMPLE

* `<type>[optional scope]: <description>`

apk update; apk add chrony
service chronyd start