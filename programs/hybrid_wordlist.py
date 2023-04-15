

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
    
    if password[0].isalpha() == True:
        password = password[0].upper() + password[1:]
    
    return password

def main():
    # read words until end of file into list from ./wordlist/common_wordlist.txt into hybrid_wordlist.txt
    f = open('./wordlist/common_wordlist.txt', 'r')
    f1 = open('./wordlist/hybrid_wordlist.txt', 'w')
    listL = f.readlines()
    for i in range(len(listL)):
        f1.write(replace_char(listL[i]))
    f.close()
    f1.close()

main()