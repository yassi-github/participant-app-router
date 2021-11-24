#!/bin/bash

set -e

# check privileged
if [[ ! ( $USER = "root" || ${SUDO_USER} ) ]]; then
    echo "Permission Denied."
    exit 1
fi

# server address
# e.g. '192.0.2.10:8080'
destination=$1
destport=$(echo ${destination} | cut -d':' -f 2)

# arg check
if [[ $# != 1 || ! ( ${destination} =~ ^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9]):[0-9]{1,6}$ ) ]]\
	|| (( 0 > ${destport} )) || (( ${destport} > 65535 )); then
    echo "Invalid Args."
    exit 1
fi

servicefile_dir='service'
unitfilename='send-participant-mac@.service'
timerfilename='send-participant-mac@.timer'
scriptfile='shellScript/participant-app.sh'
local_systemd_dir='/usr/local/lib/systemd/system'

# Template Exexutable Path to Service Unit File
sed -i "s%<ProjectHome>%${PWD}%" ${servicefile_dir}/${unitfilename} ${scriptfile}

# Copy Unit, Timer file to local systemd dir
mkdir -p ${local_systemd_dir}
cp ${servicefile_dir}/${unitfilename} ${local_systemd_dir}
cp ${servicefile_dir}/${timerfilename} ${local_systemd_dir}

# start service, timer
systemctl daemon-reload
#systemctl start ${unitfilename/@/@${destination}}
systemctl restart ${timerfilename/@/@${destination}}

echo 'Complete!'
echo "To Stop This Service, run:\n\nsystemctl stop ${timerfilename/@/@${destination}}"

