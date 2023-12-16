#!/bin/bash

### VARIABLES
REPOSITORY_URL="https://raw.githubusercontent.com/chadwagoner/alpine-linux-pdc/main"
HEADER_NO_CACHE="Cache-Control: no-cache, no-store"

### INSTALL REQUIRED BASE PACKAGES
echo -e "INSTALLING BASE PACKAGES"
apk add -U curl jq lm-sensors ncurses pciutils yq --quiet
echo -e ""

### CREATE CONFIG DIRECTORY (IF DOESN'T EXIST)
if [[ ! -d /root/.config/alpine-linux-pdc ]]; then
  echo -e "CONFIG DIRECTORY MISSING, CREATING..."
  mkdir -p /root/.config/alpine-linux-pdc
  echo -e ""
else
  echo -e "CONFIG DIRECTORY EXISTS, SKIPPING..."
  echo -e ""
fi

### SET CONFIG DIRECTORY OWNERSHIP
if [[ "$(stat -c '%U:%G' /root/.config/alpine-linux-pdc)" != "root:root" ]]; then
  echo -e "CONFIG DIRECTORY OWNERSHIP IS WRONG, CHANGING..."
  chown root:root /root/.config/alpine-linux-pdc
  echo -e ""
else
  echo -e "CONFIG DIRECTORY OWNERSHIP IS CORRECT, SKIPPING..."
  echo -e ""
fi

### SET CONFIG DIRECTORY PERMISSIONS
if [[ "$(stat -c '%a' /root/.config/alpine-linux-pdc)" != 600 ]]; then
  echo -e "CONFIG DIRECTORY PERMISSIONS ARE WRONG, CHANGING..."
  chmod 600 /root/.config/alpine-linux-pdc
  echo -e ""
else
  echo -e "CONFIG DIRECTORY PERMISSIONS ARE CORRECT, SKIPPING..."
  echo -e ""
fi

### CREATE EMPTY CONFIG FILE (IF DOESN'T EXIST)
if [[ ! -f /root/.config/alpine-linux-pdc/config.yaml ]]; then
  echo -e "CONFIG FILE MISSING, CREATING..."
  touch /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
else
  echo -e "CONFIG FILE EXISTS, SKIPPING..."
  echo -e ""
fi

### SET CONFIG FILE OWNERSHIP
if [[ "$(stat -c '%U:%G' /root/.config/alpine-linux-pdc/config.yaml)" != "root:root" ]]; then
  echo -e "CONFIG FILE OWNERSHIP IS WRONG, CHANGING..."
  chown root:root /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
else
  echo -e "CONFIG FILE OWNERSHIP IS CORRECT, SKIPPING..."
  echo -e ""
fi

### SET CONFIG FILE PERMISSIONS
if [[ "$(stat -c '%a' /root/.config/alpine-linux-pdc/config.yaml)" != 600 ]]; then
  echo -e "CONFIG FILE PERMISSIONS ARE WRONG, CHANGING..."
  chmod 600 /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
else
  echo -e "CONFIG FILE PERMISSIONS ARE CORRECT, SKIPPING..."
  echo -e ""
fi

### INSTALL OS-UPDATER TO CRON (/etc/periodic/monthly)
echo -e "INSTALLING OS-UPDATER (/etc/periodic/monthly)"
curl -L -o /etc/periodic/monthly/os-updater -H '$HEADER_NO_CACHE' $REPOSITORY_URL/os-updater --silent
echo -e ""

### SET OS-UPDATER OWNERSHIP
if [[ "$(stat -c '%U:%G' /etc/periodic/monthly/os-updater)" != "root:root" ]]; then
  echo -e "OS-UPDATER OWNERSHIP IS WRONG, CHANGING..."
  chown root:root /etc/periodic/monthly/os-updater
  echo -e ""
else
  echo -e "OS-UPDATER OWNERSHIP IS CORRECT, SKIPPING..."
  echo -e ""
fi

### SET OS-UPDATER PERMISSIONS
if [[ "$(stat -c '%a' /etc/periodic/monthly/os-updater)" != 700 ]]; then
  echo -e "OS-UPDATER PERMISSIONS ARE WRONG, CHANGING..."
  chmod 700 /etc/periodic/monthly/os-updater
  echo -e ""
else
  echo -e "OS-UPDATER PERMISSIONS ARE CORRECT, SKIPPING..."
  echo -e ""
fi

### INSTALL PDC TO CRON (/etc/periodic/hourly)
echo -e "INSTALLING PDC (/etc/periodic/hourly)"
curl -L -o /etc/periodic/hourly/pdc -H '$HEADER_NO_CACHE' $REPOSITORY_URL/pdc --silent
echo -e ""

### SET PDC OWNERSHIP
if [[ "$(stat -c '%U:%G' /etc/periodic/hourly/pdc)" != "root:root" ]]; then
  echo -e "PDC OWNERSHIP IS WRONG, CHANGING..."
  chown root:root /etc/periodic/hourly/pdc
  echo -e ""
else
  echo -e "PDC OWNERSHIP IS CORRECT, SKIPPING..."
  echo -e ""
fi

### SET PDC PERMISSIONS
if [[ "$(stat -c '%a' /etc/periodic/hourly/pdc)" != 700 ]]; then
  echo -e "PDC PERMISSIONS ARE WRONG, CHANGING..."
  chmod 700 /etc/periodic/hourly/pdc
  echo -e ""
else
  echo -e "PDC PERMISSIONS ARE CORRECT, SKIPPING..."
  echo -e ""
fi

### INSTALL PDC-UPDATER TO CRON (/etc/periodic/15min)
echo -e "INSTALLING PDC-UPDATER (/etc/periodic/15min)"
curl -L -o /etc/periodic/15min/pdc-updater -H '$HEADER_NO_CACHE' $REPOSITORY_URL/pdc-updater --silent
echo -e ""

### SET PDC-UPDATER OWNERSHIP
if [[ "$(stat -c '%U:%G' /etc/periodic/15min/pdc-updater)" != "root:root" ]]; then
  echo -e "PDC-UPDATER OWNERSHIP IS WRONG, CHANGING..."
  chown root:root /etc/periodic/15min/pdc-updater
  echo -e ""
else
  echo -e "PDC-UPDATER OWNERSHIP IS CORRECT, SKIPPING..."
  echo -e ""
fi

### SET PDC-UPDATER PERMISSIONS
if [[ "$(stat -c '%a' /etc/periodic/15min/pdc-updater)" != 700 ]]; then
  echo -e "PDC-UPDATER PERMISSIONS ARE WRONG, CHANGING..."
  chmod 700 /etc/periodic/15min/pdc-updater
  echo -e ""
else
  echo -e "PDC-UPDATER PERMISSIONS ARE CORRECT, SKIPPING..."
  echo -e ""
fi