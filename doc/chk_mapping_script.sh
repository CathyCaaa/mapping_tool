#!/usr/bin/env bash
File='../scripts/get_mapped_device_id.sh'
Size=1506
MD5SUM=07e1316e4988d8372b0fdffb64c898c8
ActualMD5SUM=` md5 ${File} | awk -F'=' '{printf $2}' | tr -d ' '`
if [ "${MD5SUM}" != "${ActualMD5SUM}" ]
then
    echo "Expect md5 ${MD5SUM}"
    echo "Actual md5 ${ActualMD5SUM}"
else
    echo "Please proceed to mapping."
fi

