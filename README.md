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