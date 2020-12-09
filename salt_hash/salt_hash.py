import hashlib
import datetime
# Establish sha256

def salt_hash(salt, data):
    s = hashlib.sha256()
    data = salt+data
    s.update(data.encode("utf-8"))
    return s.hexdigest()

def single_confirm():
    salt = "SINOPAC-"
    data = "f89601d2-b000-4000-a555-cd7a750cf000"
    verifydata = "ca702fca4c293464758e99720ca42101e01ec3fefed69f59f0945f2e9cb663f3"
    h = salt_hash(salt, data)
    if h == verifydata:
        print("Salted sha-256 successfully\n")
    else:
        print("Expected:{}\n".format(verifydata))
        print("Actually:{}\n".format(h))

def file_hash(src_path, dest_path, salt):
    with open(src_path) as f:
        with open(dest_path, "w") as f1:
            for line in f:
                line = str.strip(line)
                f1.write(line+","+salt_hash(salt,line)+"\n")

def gen_test_data():
    salt = "SINOPAC-"
    did = [  '00000000-0000-0000-0000-000000000000', 
             '11111111-1111-1111-1111-111111111111',
             '22222222-2222-2222-2222-222222222222',
             '33333333-3333-3333-3333-333333333333']
    tags = [',tag1,tag2,,',',,tag2,tag3,',',tag1,,tag3,',',tag1,tag2,tag3,']
    i=0

    salt_hashed_mapper=[]
    while (i < len(did)):
        salt_hashed_mapper.append(salt_hash(salt,did[i])+tags[i]+"\n")
        i += 1
    salt_hashed_mapper = sorted(salt_hashed_mapper)
    i = 0
    with open('../mapper/salt_hashed_device_id_tags_0', "w") as f:
        while (i< len(did)):
            f.write(salt_hashed_mapper[i])
            i = i + 1
    
if __name__ == "__main__":
    # single_confirm()
    # gen_test_data()
    file_hash("../customer_data/all_aaid.csv", "../customer_data/outputids_all.csv", "SINOPAC-")

        
# Result 
# $ python salt_hash.py
# Salted sha-256 successfully     