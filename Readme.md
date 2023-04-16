Password Generator
==================
- This is a password generator which generates passwords of length 14

- Password contains Uppercase letters, Lowercase, Numbers and special characters

- Length of password is 14

- First character will always be a Uppercase letter

- A total of 10000 passwords are generated
     - Out  of which 5000 passwords are generated randomly
     - Remaining 5000 are passwords picked from commonly used words for passwords which are then modified

**Algorithm**
----------

- Words from popular password wordlists are picked
    - Pick 5000 words randomly from the wordlist
        - Substitute the characters with other characters according the character map
     - Check if first character is a Alphabet or not
        - If an alphabet, change it to Uppercase
        - else append a random Uppercase alphabet to the beginning of the word

- Generate 5000 passwords randomly
    - generate a random number between 8 and 10
    - Pick a random character from the list of characters and append it to the end of the word
    - remove that particular character from the list of available characters
    - Repeat the above step until the length of the word is equal to the random number generated

- Store the above generated 10000 passwords in a file

- Check the length of the word
    - If length is less than 14, append characters from the list of characters to the end of the word until the length is 14
    - else if length is greater than 14, remove a character from the end of the word until the length is 14

**File Descriptions**
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
    - common_wordlist.txt: This file contains the wordlist which will be used for generating passwords
    - wordlist.txt: This file contains the wordlist which will be used for cracking the hashes.
    This is the same wordlist as common_wordlist.txt but with additional 25000 randomly generated passwords using the same algorithm
    - hybrid_wordlist.txt: This file contains the wordlist which will be used for cracking the hashes

**How to run**
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

**Requirements**
------------
- Python 3.*
- hashcat

**Observations**
----------------------------
### **Attack modes**
- Straight mode: This mode is used to crack the hashes using a wordlist
- Combination mode: This mode is used to crack the hashes using wordlists
- Brute force mode: This mode is used to crack the hashes using a mask until wordspace is exhausted
- Hybrid mode: This mode is used to crack the hashes using a wordlist and a mask

### **Straight mode**
Straight mode take hashes as input and tries to crack them using a input wordlist

We can also give a rules file which contains rules that can be used to modify the words in the wordlist during the execution of the hashcat

This attack is by far less effective than the other attacks because the words in the wordlist should exactly match the words in the password else the password will not be cracked

But if we use the rules file and some hybrid wordlists which are modified and added masks, we can increase the success rate of the attack

### **Combination mode**
Combination mode takes hashes as input and tries to crack them using two wordlists

It simply append the words from the two wordlists and tries to crack the hashes

This attack is also less effective than the other attacks because the words in the wordlist should exactly match the words in the password else the password will not be cracked

### **Brute force mode**
Brute force mode takes hashes as input and tries to crack them using a charset

It simply generates all the possible combinations of the charset and tries to crack the hashes

Simply Exhaustive search

Once the wordspace reaches a certain limit, the attack becomes very slow. Hashcat won't process over 10-12 characters with all charset **?a**

If the keyspace is a little less, hashcat will process the keyspace and we might crack all the hashes

### **Hybrid mode**
Hybrid mode takes hashes as input and tries to crack them using a wordlist and a mask

It appends words from wordlist with the mask and tries to crack the hashes

Hybrid mode **6** appends words from wordlist with the mask and tries to crack the hashes

Hybrid mode **7** prepends words from wordlist with the mask and tries to crack the hashes

We can say this is a mix of comination mode, instead of appending words from two wordlists, we append words from a wordlist with a mask

**Conclusion**
----------------

|Mode Number| Attack mode | Success rate |
|-----------|-------------|--------------|
|0| Straight mode | 0.0% |
|1| Combination mode(normal wordlist) | 0.0% |
|1| Combination mode(hybrid wordlist) | 0.90% |
|6| Wordlist + mask | 0.0% |
|6| Hybrid wordlist + mask | 0.61% |
|7| Mask + wordlist | 0.0% |
|7| Mask + hybrid wordlist | 0.0% |

You can see detailed results <a href='https://docs.google.com/document/d/1TQJsvLmkjIu2d4uzXtxorM4aBCyAWsi0UFutn3HiMYg/edit?usp=sharing' target='_blank'>here </a>