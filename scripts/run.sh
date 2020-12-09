#!/usr/bin/env bash
source get_mapped_device_id.sh

#FIX ME
target_device_id='/Users/cherylchiu/Desktop/target_data/target_device_id'
target_tmp_path='/Users/cherylchiu/Desktop/target_tmp'
target_result_path='/Users/cherylchiu/Desktop/target_result'
mapper='../mapper'
get_mapped_device_id $target_device_id $target_tmp_path $target_result_path $mapper