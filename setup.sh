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

scriptfile='shellScript/participant-app.sh'
cron_file='/etc/crontabs/root'

# Template Exexutable Path to Service Unit File
sed -i "s%<ProjectHome>%${PWD}%" ${scriptfile}

# Create cron dir
mkdir /etc/crontabs

# Add cronscript
# permission will be 0600
umask 0066
# add execute script per 1 minutes
echo "* * * * * ${PWD}/${scriptfile} ${destination}" >> ${cron_file}

# Restart cron
/etc/init.d/cron restart

echo 'Complete!'
echo -e "To Stop This Service, run:\n\n/etc/init.d/cron stop\nor\nDelete cronjob.\n"
