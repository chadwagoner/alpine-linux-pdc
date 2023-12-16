#!/bin/bash

### VARIABLES
REPOSITORY_URL=https://raw.githubusercontent.com/chadwagoner/alpine-linux-pdc/main

### INSTALL REQUIRED BASE PACKAGES
echo -e "INSTALLING BASE PACKAGES"
apk add -U curl jq lm-sensors ncurses pciutils yq
echo -e ""

### CREATE CONFIG DIRECTORY (IF DOESN'T EXIST)
if [[ ! -d /root/.config/alpine-linux-pdc ]]; then
  echo -e "CONFIG DIRECTORY MISSING, CREATING..."
  mkdir -p /root/.config/alpine-linux-pdc
  echo -e ""
fi

### SET CONFIG DIRECTORY PERMISSIONS
if [[ "$(stat -c '%a' /root/.config/alpine-linux-pdc)" != 600 ]]; then
  echo -e "DIRECTORY PERMISSIONS ARE WRONG, CHANGING..."
  chown -R /root/.config/alpine-linux-pdc
  echo -e ""
fi

### CREATE EMPTY CONFIG FILE (IF DOESN'T EXIST)
if [[ ! -f /root/.config/alpine-linux-pdc/config.yaml ]]; then
  echo -e "CONFIG FILE MISSING, CREATING..."
  touch /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
fi

### SET CONFIG FILE PERMISSIONS
if [[ "$(stat -c '%a' /root/.config/alpine-linux-pdc/config.yaml)" != 600 ]]; then
  echo -e "FILE PERMISSIONS ARE WRONG, CHANGING..."
  chown -R /root/.config/alpine-linux-pdc
  echo -e ""
fi

### ADD OS-UPDATER TO CRON (/etc/periodic/monthly)
curl -L -o /etc/periodic/monthly/os-updater $REPOSITORY_URL/os-updater

### ADD PDC TO CRON (/etc/periodic/hourly)
curl -L -o /etc/periodic/hourly/pdc $REPOSITORY_URL/pdc

### ADD PDC-UPDATER TO CRON (15min)
curl -L -o /etc/periodic/15min/pdc-updater $REPOSITORY_URL/pdc-updater
