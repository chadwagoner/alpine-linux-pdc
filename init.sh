#!/bin/bash

### VARIABLES

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

### ADD PDC TO CRONTAB HOURLY

### ADD PDC-UPDATER TO CRONTAB EVERY 15M