import random
import string
import hashlib

# function to process password according to the rules
def process_password(password):
    choiceList = string.ascii_letters + string.digits + string.punctuation
    newPass = ''
    if password[0].isupper() == False:
        if password[0].isalpha() == True:
            newPass = password[0].upper() + password[1:]
        else:
            newPass= random.choice(string.ascii_uppercase) + password
    else:
        newPass = password

    if len(newPass) < 14:
        while len(newPass) < 14:
            newPass += random.choice(choiceList)
            choiceList = choiceList.replace(newPass[-1], '')

    else:
        newPass = newPass[:14]

    return newPass

def main():
    f = open('./passwords/passwords.txt', 'r')
    f1 = open('./passwords/generated_password.txt', 'w')
    f2 = open('./hashes/hash.txt', 'w')
    f3 = open('./hashes/dictionary.txt', 'w')

    listL = f.readlines()
    list1 = []

    # process each password
    for i in range(len(listL)):
        newPwd = process_password(listL[i].strip())
        list1.append(newPwd)
        f1.write(list1[i]+ '\n')
        gen_hash = hashlib.sha1(list1[i].strip().encode('utf-8')).hexdigest()
        f2.write(gen_hash + '\n')
        f3.write(list1[i] + ' ' + gen_hash + '\n')
    
    f.close()
    f1.close()
    f2.close()
    f3.close()


main()
