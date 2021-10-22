#!/bin/bash

while read YEAR MONTH DAY HOUR MINUTE SECOND NANOSECOND
do
#  echo "[year]${YEAR} [month]${MONTH} [day]${DAY} [hour]${HOUR} [minute]${MINUTE} [second]${SECOND} [nanosecond]${NANOSECOND}"

  printf '{
    "year": "%s",
    "month": "%s",
    "day": "%s",
    "hour": "%s",
    "minute": "%s",
    "second": "%s",
    "macaddresses": [
' ${YEAR} ${MONTH} ${DAY} ${HOUR} ${MINUTE} ${SECOND} ${NANOSECOND}

  # ENUMERATE MAC ADDRESS
  printf '        "%s",
' $(ip -4 n | grep -e 'lladdr' -e 'REACHABLE' | cut -d' ' -f 5)

  printf '    ]
}
'

done <<< $(date +"%Y %m %d %H %m %S %N")

