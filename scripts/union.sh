#!/bin/sh
#bash union.sh /Users/cherylchiu/Desktop/target_result
function get_distict_union_email_phone_mapped_device_id {
	target_result_path=$1
	cat ${target_result_path}/email_mapped_device_id ${target_result_path}/phone_mapped_device_id | sort | uniq > ${target_result_path}/mapped_device_id
	echo "go check final result in "${target_result_path}/mapped_device_id
}