#!/usr/bin/env bash
# bash get_mapped_device_id.sh /Users/cherylchiu/Desktop/target_data/target_device_id /Users/cherylchiu/Desktop/target_tmp /Users/cherylchiu/Desktop/target_result /Users/cherylchiu/Desktop/mapper/salt_hashed_device_id_tags
function get_mapped_device_id {
	target_device_id=$1
	target_tmp_path=$2
	target_result_path=$3
	mapper=$4

	echo ""
	#[salt_hashed_device_id]
	SECONDS=0
	echo 'select distinct salt_hashed_device_id from target_device_id order by salt_hashed_device_id'
	cat ${target_device_id} | sort -k 1 -t, | uniq > ${target_tmp_path}/sorted_target_device_id
	duration=$SECONDS
	echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

  input_file=`cat  ${target_tmp_path}/sorted_target_device_id | wc -l`
	echo "input ${input_file} unique device_ids".

	echo ""
	SECONDS=0
	echo 'select distinct device_id '
	echo 'from sorted_salt_hashed_device_id_tags as A, sorted_target_device_id as B'
	echo 'where A.salt_hashed_device_id = B.salt_hashed_device_id'
	echo 'order by salt_hashed_device_id'

  mapper_id=0
	for filename in $mapper/*;
   do
     echo "Map with $filename";
     join -t ',' -1 1 -2 1 $filename  ${target_tmp_path}/sorted_target_device_id | sort | uniq  > ${target_result_path}/mapped_device_id_tags_$mapper_id
	   output_file=`cat  ${target_result_path}/mapped_device_id_tags_$mapper_id | wc -l`
     echo "output ${output_file} mapped unique device_ids".
     mapper_id=$((mapper_id + 1))
   done

	duration=$SECONDS
	echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

	echo ""
	echo "target mapped device ids are in "${target_result_path}

}


