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