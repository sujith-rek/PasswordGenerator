import string

def main():

        # leave as it is to generate wordlist and mask

        # code to generate wordlist
        f1 = open('/usr/share/wordlists/rockyou.txt', 'r')
        f2 = open('/usr/share/wordlists/john.lst', 'r')
        f3 = open('/usr/share/wordlists/nmap.lst', 'r')
        f4 = open('/usr/share/wordlists/wifite.txt', 'r')
        f5 = open('./wordlist/wordlist.txt', 'w')

        #listL to store words
        listL = []

        #read words from rockyou.txt
        for i in range(17000):
                word = f1.readline()
                word = word.strip()
                listL.append(word)
        
        #read words from john.lst
        for i in range(3550):
                word = f2.readline()
                word = word.strip()
                listL.append(word)

        #read words from nmap.lst
        for i in range(5000):
                word = f3.readline()
                word = word.strip()
                listL.append(word)
        
        #read words from wifite.txt
        for i in range(17000):
                word = f4.readline()
                word = word.strip()
                listL.append(word)
        
        listL2 = []
        for i in range(len(listL)):
                if listL[i] not in listL2:
                        listL2.append(listL[i])

        
        for i in range(len(listL2)):
                f5.write(listL2[i] + '\n')
        
        f1.close()
        f2.close()
        f3.close()
        f4.close()
        f5.close()

        # comment out all code above to generate mask
        f6 = open('./wordlist/mask.txt', 'w')
        # characterset
        charSet = string.ascii_letters + string.digits + string.punctuation

        #1 character mask
        for i in range(len(charSet)):
                f6.write(charSet[i] + '\n')
        #2 character mask
        for i in range(len(charSet)):
                for j in range(len(charSet)):
                        f6.write(charSet[i] + charSet[j] + '\n')
        
        #3 character mask
        for i in range(len(charSet)):
                for j in range(len(charSet)):
                        for k in range(len(charSet)):
                                f6.write(charSet[i] + charSet[j] + charSet[k] + '\n')

        f6.close()

main()
