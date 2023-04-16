# powershell code to check if a directory is there or not and creating it if not
# check ./hashes directory
if (!(Test-Path -Path "./hashes")) {
    New-Item -ItemType Directory -Path "./hashes"
}

# check for ./passwords directory
if (!(Test-Path -Path "./passwords")) {
    New-Item -ItemType Directory -Path "./passwords"
}

# check for ./outputFiles directory
if (!(Test-Path -Path "./outputFiles")) {
    New-Item -ItemType Directory -Path "./outputFiles"
    New-Item -ItemType File -Path "./outputFiles/straight_output.txt"
    New-Item -ItemType File -Path "./outputFiles/bruteforce_output.txt"
    New-Item -ItemType File -Path "./outputFiles/hybrid_wordlist_mask_output.txt"
    New-Item -ItemType File -Path "./outputFiles/hybrid_mask_wordlist_output.txt"
    New-Item -ItemType File -Path "./outputFiles/association_output.txt"
    New-Item -ItemType File -Path "./outputFiles/combination_output_hybrid.txt"
    New-Item -ItemType File -Path "./outputFiles/hybrid_wordlist_mask_output_hybrid.txt"
    New-Item -ItemType File -Path "./outputFiles/hybrid_mask_wordlist_output_hybrid.txt"
    New-Item -ItemType File -Path "./outputFiles/combination_output.txt"

}

# execute the python script ./programs/password.py
python ./programs/password.py

# execute generate_password.py
python ./programs/generate_password.py

# if mask.txt is not present or wordlist.txt, uncomment the following line
# python ./programs/wordlist.py 

# Execute hashcat with straight attack
# with normal wordlist
hashcat.exe -m 100 -a 0 ./hashes/hash.txt ./wordlist/wordlist.txt -r rules.rules -o ./outputFiles/straight_output.txt
# the above command is equivalent to the following command
# hashcat.exe -m 100 -a 0 ./hashes/hash.txt ./wordlist/hybrid_wordlist.txt -o ./outputFiles/straight_output.txt 
# or
# hashcat.exe -m 100 -a 0 ./hashes/hash.txt ./wordlist/hybrid_wordlist.txt -r rules.rules -o ./outputFiles/straight_output.txt -O


# Execute hashcat with combination attack
# with normal wordlist and mask
hashcat.exe -m 100 -a 1 ./hashes/hash.txt ./wordlist/wordlist.txt ./wordlist/mask.txt -w 4 -o ./outputFiles/combination_output.txt -O
# with hybrid wordlist + mask
# hashcat.exe -m 100 -a 1 ./hashes/hash.txt ./wordlist/hybrid_wordlist.txt ./wordlist/mask.txt -o ./outputFiles/combination_output_hybrid.txt -O


# execute hashcat with brute force attack 
# hashcat.exe -m 100 -a 3 ./hashes/hash.txt ?u?a?a?a?a?a?a?a?a?a?a?a?a?a -o ./outputFiles/bruteforce_output.txt
# due to the key space of brute force attack is too large, hashcat won't process
# estimated passwords to check = 4 * 10^27 approx.
# average hashrate = 10^9 With high workload (-w 3)
# estimated time to crack = 4 * 10^27 / 10^9 = 4 * 10^18 seconds = 7 * 10^12 years approx.


# Execute hashcat with hybrid wordlist + mask attack
hashcat.exe -m 100 -a 6 ./hashes/hash.txt ./wordlist/wordlist.txt ?a?a?a -w 4 -o ./outputFiles/hybrid_wordlist_mask_output.txt -O
# Execute hashcat with hybrid_wordlist + mask attack
hashcat.exe -m 100 -a 6 ./hashes/hash.txt ./wordlist/hybrid_wordlist.txt ?a?a?a -w 4 -o ./outputFiles/hybrid_wordlist_mask_output_hybrid.txt -O


# Execute hashcat with hybrid mask + wordlist attack
hashcat.exe -m 100 -a 7 ./hashes/hash.txt ?u?a?a ./wordlist/wordlist.txt -w 4 -o ./outputFiles/hybrid_mask_wordlist_output.txt -O
# Execute hashcat with hybrid mask + wordlist attack
hashcat.exe -m 100 -a 7 ./hashes/hash.txt ?u?a?a ./wordlist/hybrid_wordlist.txt -w 4 -o ./outputFiles/hybrid_mask_wordlist_output_hybrid.txt -O


# Execute hashcat with association attack
# hashcat.exe -m 100 -a 9 hash.txt ./wordlist/wordlist.txt -r rules.rules -o ./outputFiles/association_output.txt
# We don't use this attack unless we have a wordlist file which is 
# equal in length with hash file and we already know some component of password


# Execute the program check.py
python ./programs/check.py
