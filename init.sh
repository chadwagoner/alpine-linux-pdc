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

### CREATE EMPTY CONFIG FILE (IF DOESN'T EXIST)
if [[ ! -f /root/.config/alpine-linux-pdc/config.yaml ]]; then
  echo -e "CONFIG FILE MISSING, CREATING..."
  touch /root/.config/alpine-linux-pdc/config.yaml
  echo -e ""
fi

### ADD OS-UPDATER TO CRON (/etc/periodic/monthly)
curl -L -o /etc/periodic/monthly/os-updater $REPOSITORY_URL/os-updater

### ADD PDC TO CRON (/etc/periodic/hourly)

### ADD PDC-UPDATER TO CRON (15min)