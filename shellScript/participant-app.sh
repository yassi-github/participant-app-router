#!/bin/bash

# POST show-participants-data.sh data to server.

#SERVERADDR='192.0.2.10:xxxx'
SERVERADDR=$1

# loop till **:00
while [[ "$(date +%S)" != "00" ]]; do

# POST
wget --post-data="$(<ProjectHome>/shellScript/show-participants-data.sh)" "${SERVERADDR}/participants"

# wait a few seconds
sleep 5s

done
