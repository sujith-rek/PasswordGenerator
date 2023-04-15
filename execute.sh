#!/usr/bin/bash

# There are 6 attack modes in hashcat
# 0 - Straight
# 1 - Combination
# 3 - Brute Force
# 6 - Hybrid Wordlist + Mask
# 7 - Hybrid Mask + Wordlist
# 9 - Association

# Execute the program password.py
python ./programs/password.py

# Execute the program generate_password.py
python ./programs/generate_password.py

# Execute hashcat with straight attack
# possibilty of breaking hashes is less
# Because we are modifying the wordlist words
hashcat -m 100 -a 0 hash.txt ./wordlist/wordlist.txt -o ./outputFiles/straight_output.txt

# Execute hashcat with combination attack
hashcat -m 100 -a 1 ./hashes/hash.txt ./wordlist/wordlist.txt -o ./outputFiles/combination_output.txt

# execute hashcat with brute force attack 
hashcat -m 100 -a 3 ./hashes/hash.txt ?u?a?a?a?a?a?a?a?a?a?a?a?a?a --bitmap-max=32 -o ./outputFiles/bruteforce_output.txt

# Execute hashcat with hybrid wordlist + mask attack
hashcat -m 100 -a 6 ./hashes/hash.txt ./wordlist/wordlist.txt ?a?a -o ./outputFiles/hybrid_wordlist_mask_output.txt

# Execute hashcat with hybrid mask + wordlist attack
hashcat -m 100 -a 7 ./hashes/hash.txt ?a?a ./wordlist/wordlist.txt -o ./outputFiles/hybrid_mask_wordlist_output.txt

# Execute hashcat with association attack
# hashcat -m 100 -a 9 hash.txt ./wordlist/wordlist.txt -r rules.rules -o ./outputFiles/association_output.txt
# We don't use this attack unless we have a wordlist file which is 
# equal in length with hash file and we already know some component of password

# Execute the program check.py
python ./programs/check.py