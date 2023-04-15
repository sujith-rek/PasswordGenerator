Password Generator
==================
- This is a password generator which generates passwords of length 14

- Password contains Uppercase letters, Lowercase, Numbers and special characters

- Length of password is 14

- First character will always be a Uppercase letter

- A total of 10000 passwords are generated
     - Out  of which 5000 passwords are generated randomly
     - Remaining 5000 are passwords picked from commonly used words for passwords which are then modified

Algorithm
----------

- Words from popular password wordlists are picked
    - Pick 5000 words randomly from the wordlist
        - Substitute the characters with other characters according the character map
     - Check if first character is a Alphabet or not
        - If an alphabet, change it to Uppercase
        - else append a random Uppercase alphabet to the beginning of the word
    
    - Check the length of the word
        - If length is less than 14, append characters from the list of characters to the end of the word until the length is 14
        - else if length is greater than 14, remove a character from the end of the word until the length is 14

How to run
-----------
You can find all the commands that could be used in the file execute.sh

Comment out the commands that you don't want to run (Only the hashcat commands, python commands need to be run)

Open terminal from the root directory of this folder
and run the following command
```
./execute.sh
```
In case you get an error saying permission denied, run the following command
```
chmod +x execute.sh
```
and then run the above command again
incase the python script doesn't run, run the following command
```
chmod +x *.py
```

File Descriptions
------------------
- execute.sh: This file contains all the commands that need to be run to generate the passwords and crack them using hashcat
- rules.rules: This file contains the rules that can be used in straight mode of hashcat
- /programs: This folder contains all the programs that are used to generate the passwords, wordlists
    - wordlist.py: This file contains the code to generate the wordlist from linux wordlists
    - password.py: This program generates 10000 raw passwords
    - generate_passwords.py: This program takes the raw passwords and generates the final passwords
    - check.py: This program outputs the success rate of the hashes cracked by hashcat
    - hybrid_wordlist.py: This program generates the hybrid wordlist which follows the rules of the passwords generated
- /hashes: This folder contains all the hashes generated
    - hash.txt: This file contains the hashes of the passwords generated
    - dictionary.txt: This file contains passwords and hashes stored as key value pairs
- /outputFiles: Thisfolder contain files which will store cracked password which are generated with hashcat
- /wordlist: This folder contains wordlists which will be used for password generation and cracking
    - wordlist.txt: This file contains the wordlist which will be used for password generation
    - common_wordlist.txt: This file contains the wordlist which will be used for generating passwords
    - hybrid_wordlist.txt: This file contains the wordlist which will be used for cracking the hashes