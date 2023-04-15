import random
import string

#password generator function/Algorithm
def password_generator():

    # list of characters to be used in password
    characters = string.ascii_letters + string.digits + string.punctuation

    # password length
    password_length = random.randint(8, 10)

    # random password, once a character is chosen it is not chosen again
    # remove the character from the list
    password = ''
    for i in range(password_length):
        password += random.choice(characters)
        characters = characters.replace(password[i], '')
    

    return password

def replace_char(password):

    # a map mapping the mostly replaced characters
    charMap = {
        'a': '@',
        'e': '3',
        'i': '!',
        '0': 'O',
        'S': '$',
        't': '7',
        'l': '1',
        's': '5',
        'B': '8',
        '9' : 'g',
    }

    # replace characters
    for i in range(len(password)):
        if password[i] in charMap:
            password = password[:i] + charMap[password[i]] + password[i+1:]
    
    return password

def main():

    # open file to store passwords
    f = open('./passwords/passwords.txt', 'w')
    f1 = open('./wordlist/common_wordlist.txt', 'r')

    # generate 5000 passwords which are entirely random
    for i in range(5000):

        # generate password
        password = password_generator()

        # write password to file
        f.write(password + '\n')
    
    # we pick 5000 passwords in random from the common_wordlist.txt file
    # and write them to passwords.txt file
    #read words until end of file into list
    listL = f1.readlines()

    # list to keep track of words already used
    used = []
    #pick 5000 passwords in random from the list
    for i in range(5000):
        index = random.randint(0, len(listL)-1)
        if index not in used:
            if listL[index] != '\n' and listL[index] != '': 
                used.append(index)
                f.write(replace_char(listL[index]))
            else:
                i -= 1
        else :
            i -= 1


    f.close()
    f1.close()
    


main()