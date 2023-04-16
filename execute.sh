#!/usr/bin/bash

# Uncomment the following lines if you want to run the program for the first time
# mkdir hashes
# mkdir passwords
# mkdir outputFiles
# cd outputFiles
# touch straight_output.txt
# touch combination_output.txt
# touch bruteforce_output.txt
# touch hybrid_wordlist_mask_output.txt
# touch hybrid_mask_wordlist_output.txt
# touch association_output.txt
# touch combination_output_hybrid.txt
# touch hybrid_wordlist_mask_output_hybrid.txt
# touch hybrid_mask_wordlist_output_hybrid.txt
# cd ..


# Execute the program password.py
python ./programs/password.py


# Execute the program generate_password.py
python ./programs/generate_password.py


# We can append -w 3 which is high workload factor and speed up the process


# Everytime hashcat is run, it'll store the result in .pot file
# which is stored in /home/<user>/.local/share/hashcat/hashcat.potfile



# Execute hashcat with straight attack
# with normal wordlist
hashcat -m 100 -a 0 ./hashes/hash.txt ./wordlist/wordlist.txt -r rules.rules -o ./outputFiles/straight_output.txt


# Execute hashcat with combination attack
# with normal wordlist and mask
hashcat -m 100 -a 1 ./hashes/hash.txt ./wordlist/wordlist.txt ./wordlist/mask.txt -w 3 -o ./outputFiles/combination_output.txt -O
# with hybrid wordlist + mask
# hashcat -m 100 -a 1 ./hashes/hash.txt ./wordlist/hybrid_wordlist.txt ./wordlist/mask.txt -o ./outputFiles/combination_output_hybrid.txt -O


# execute hashcat with brute force attack 
# hashcat -m 100 -a 3 ./hashes/hash.txt ?u?a?a?a?a?a?a?a?a?a?a?a?a?a -o ./outputFiles/bruteforce_output.txt
# due to the key space of brute force attack is too large, hashcat won't process
# estimated passwords to check = 4 * 10^27 approx.
# average hashrate = 10^9 With high workload (-w 3)
# estimated time to crack = 4 * 10^27 / 10^9 = 4 * 10^18 seconds = 7 * 10^12 years approx.


# Execute hashcat with hybrid wordlist + mask attack
hashcat -m 100 -a 6 ./hashes/hash.txt ./wordlist/wordlist.txt ?a?a?a -w 4 -o ./outputFiles/hybrid_wordlist_mask_output.txt -O
# Execute hashcat with hybrid_wordlist + mask attack
hashcat -m 100 -a 6 ./hashes/hash.txt ./wordlist/hybrid_wordlist.txt ?a?a?a -w 4 -o ./outputFiles/hybrid_wordlist_mask_output_hybrid.txt -O


# Execute hashcat with hybrid mask + wordlist attack
hashcat -m 100 -a 7 ./hashes/hash.txt ?u?a?a ./wordlist/wordlist.txt -w 4 -o ./outputFiles/hybrid_mask_wordlist_output.txt -O
# Execute hashcat with hybrid mask + wordlist attack
hashcat -m 100 -a 7 ./hashes/hash.txt ?u?a?a ./wordlist/hybrid_wordlist.txt -w 4 -o ./outputFiles/hybrid_mask_wordlist_output_hybrid.txt -O


# Execute hashcat with association attack
# hashcat -m 100 -a 9 hash.txt ./wordlist/wordlist.txt -r rules.rules -o ./outputFiles/association_output.txt
# We don't use this attack unless we have a wordlist file which is 
# equal in length with hash file and we already know some component of password


# Execute the program check.py
python ./programs/check.py
