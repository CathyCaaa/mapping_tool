
# 1. Find your mapping_tool directory

```
cd [path-to-mapping-tool]/mapping_tool
```

# 2. Move target_data to desktop and create 2 folders, target_tmp and target_result, on Desktop

```
mv target_data ~/Desktop
mkdir ~/Desktop/target_result
mkdir ~/Desktop/target_tmp
```

# 3. Modify Config

```
cd scripts
vi scripts/run.sh
REPLACE target_device_id, target_tmp_path, target_result_path
```

# 4. Run Mapper
```
cd scripts
bash run.sh
```

# 5. Check Result

```
$ tree ~/Desktop/target_result/
/Users/cherylchiu/Desktop/target_result/
├── mapped_device_id_tags_0 [distinct mapped device_id and tags, mapped by salt_hashed_device_id_tags_0]
└── mapped_device_id_tags_1 [distinct mapped device_id and tags, mapped by salt_hashed_device_id_tags_1]


0 directories, 1 file

$ cat ~/Desktop/target_result/mapped_device_id_tags/*
18fe85b3fa1792cdc3db4b6b1d6011389cd410f74b5cfe0cbb660f302e7ba326,,tag2,tag3,
b34f3e417c16551fb0dd6e1fc5d83cba3fadffb5a261fec79975c39fc9caa340,tag1,,tag3,
```

[Note] 1. The device_ids in mapper must be sorted.
