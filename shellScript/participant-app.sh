#!/bin/bash

# POST show-participants-data.sh data to server.

#SERVERADDR='192.0.2.10:xxxx'
SERVERADDR=$1

curl -X POST -d "$(<ProjectHome>/shellScript/show-participants-data.sh)" ${SERVERADDR}/save/

