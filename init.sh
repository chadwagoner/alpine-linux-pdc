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
elif
  echo -e "CONFIG DIRECTORY EXISTS, SKIPPING..."
  echo -e ""
fi

### SET CONFIG DIRECTORY OWNERSHIP
if [[ "$(stat -c '%U:%G' /root/.config/alpine-linux-pdc)" != "root:root" ]]; then
  echo -e "CONFIG DIRECTORY OWNERSHIP IS WRONG, CHANGING..."
  chown root:root /root/.config/alpine-linux-pdc
  echo -e ""
elif
  echo -e "CONFIG DIRECTORY OWNERSHIP IS CORRECT, SKIPPING..."
  echo -e ""
fi

### SET CONFIG DIRECTORY PERMISSIONS
if [[ "$(stat -c '%a' /root/.config/alpine-linux-pdc)" != 600 ]]; then
  echo -e "CONFIG DIRECTORY PERMISSIONS ARE WRONG, CHANGING..."
  chmod 600 /root/.config/alpine-linux-pdc
  echo -e ""
elif
  echo -e "CONFIG DIRECTORY PERMISSIONS ARE CORRECT, SKIPPING..."
  echo -e ""
fi

### CREATE EMPTY CONFIG FILE (IF DOESN'T EXIST)
if [[ ! -f /root/.config/alpine-linux-pdc/config.yaml ]]; then
  echo -e "CONFIG FILE MISSING, CREATING..."
  touch /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
elif
  echo -e "CONFIG FILE EXISTS, SKIPPING..."
  echo -e ""
fi

### SET CONFIG FILE OWNERSHIP
if [[ "$(stat -c '%U:%G' /root/.config/alpine-linux-pdc/config.yaml)" != "root:root" ]]; then
  echo -e "CONFIG FILE OWNERSHIP IS WRONG, CHANGING..."
  chown root:root /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
elif
  echo -e "CONFIG FILE OWNERSHIP IS CORRECT, SKIPPING..."
  echo -e ""
fi

### SET CONFIG FILE PERMISSIONS
if [[ "$(stat -c '%a' /root/.config/alpine-linux-pdc/config.yaml)" != 600 ]]; then
  echo -e "CONFIG FILE PERMISSIONS ARE WRONG, CHANGING..."
  chmod 600 /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
elif
  echo -e "CONFIG FILE PERMISSIONS ARE CORRECT, SKIPPING..."
  echo -e ""
fi

### ADD OS-UPDATER TO CRON (/etc/periodic/monthly)
curl -L -o /etc/periodic/monthly/os-updater -H '$HEADER_NO_CACHE' $REPOSITORY_URL/os-updater --silent

### ADD PDC TO CRON (/etc/periodic/hourly)
curl -L -o /etc/periodic/hourly/pdc -H '$HEADER_NO_CACHE' $REPOSITORY_URL/pdc --silent

### ADD PDC-UPDATER TO CRON (15min)
curl -L -o /etc/periodic/15min/pdc-updater -H '$HEADER_NO_CACHE' $REPOSITORY_URL/pdc-updater --silent
