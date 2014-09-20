#!/usr/bin/env bash
#
# To use this file, rename it to settings.sh
#
# sabnzbd settings
export SABPORT=8080

# Usenet settings
export USENETSERVER= #Example: us.news.astraweb.com
export USENETPORT= #Example: 119
export USENETUSER=
export USENETPASS=
export USENETCONS=20

# INDEXER SETTINGS

export INDEXER_NAME= #Example: sabnzbd
export INDEXER_URL= #Example: "https://api.nzb.su/"
export INDEXER_APIKEY=

# Don't change these settings unless you have a reason
export SABAPIKEY=$(dbus-uuidgen)
export SABRATINGAPI=$(dbus-uuidgen)


