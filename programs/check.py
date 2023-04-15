def main():

    f1 = open('./outputFiles/association_output.txt','r')
    f2 = open('./outputFiles/straight_output.txt','r')
    f3 = open('./outputFiles/combination_output.txt','r')
    f4 = open('./outputFiles/bruteforce_output.txt','r')
    f5 = open('./outputFiles/hybrid_wordlist_mask_output.txt','r')
    f6 = open('./outputFiles/hybrid_mask_wordlist_output.txt','r')
    f7 = open('./outputFiles/combination_output_hybrid.txt','r')
    f8 = open('./outputFiles/hybrid_wordlist_mask_output_hybrid.txt','r')
    f9 = open('./outputFiles/hybrid_mask_wordlist_output_hybrid.txt','r')

    hash_count = 100
    association_count = 0
    straight_count = 0
    combination_count = 0
    bruteforce_count = 0
    hybrid_wordlist_mask_count = 0
    hybrid_mask_wordlist_count = 0
    combination_hybrid_count = 0
    hybrid_wordlist_mask_hybrid_count = 0
    hybrid_mask_wordlist_hybrid_count = 0

    # calculate number of hashes in each file
    for line in f1:
        if line != '':
            association_count += 1
    for line in f2:
        if line != '':
            straight_count += 1
    for line in f3:
        if line != '':
            combination_count += 1
    for line in f4:
        if line != '':
            bruteforce_count += 1
    for line in f5:
        if line != '':
            hybrid_wordlist_mask_count += 1
    for line in f6:
        if line != '':
            hybrid_mask_wordlist_count += 1
    for line in f7:
        if line != '':
            combination_hybrid_count += 1
    for line in f8:
        if line != '':
            hybrid_wordlist_mask_hybrid_count += 1
    for line in f9:
        if line != '':
            hybrid_mask_wordlist_hybrid_count += 1

    f1.close()
    f2.close()
    f3.close()
    f4.close()
    f5.close()
    f6.close()
    f7.close()
    f8.close()
    f9.close()
    
    # calculate percentage of hashes cracked
    association_percentage = association_count / hash_count 
    straight_percentage = straight_count / hash_count 
    combination_percentage = combination_count / hash_count
    bruteforce_percentage = bruteforce_count / hash_count
    hybrid_wordlist_mask_percentage = hybrid_wordlist_mask_count / hash_count
    hybrid_mask_wordlist_percentage = hybrid_mask_wordlist_count / hash_count
    combination_hybrid_percentage = combination_hybrid_count / hash_count
    hybrid_wordlist_mask_hybrid_percentage = hybrid_wordlist_mask_hybrid_count / hash_count
    hybrid_mask_wordlist_hybrid_percentage = hybrid_mask_wordlist_hybrid_count / hash_count

    # print results
    print('Association: ' + str(association_percentage) + '%')
    print('Straight: ' + str(straight_percentage) + '%')
    print('Combination: ' + str(combination_percentage) + '%')
    print('combination_hybrid: ' + str(combination_hybrid_percentage) + '%')
    print('Bruteforce: ' + str(bruteforce_percentage) + '%')
    print('Hybrid Wordlist Mask: ' + str(hybrid_wordlist_mask_percentage) + '%')
    print('Hybrid Wordlist Mask Hybrid: ' + str(hybrid_wordlist_mask_hybrid_percentage) + '%')
    print('Hybrid Mask Wordlist: ' + str(hybrid_mask_wordlist_percentage) + '%')
    print('Hybrid Mask Wordlist Hybrid: ' + str(hybrid_mask_wordlist_hybrid_percentage) + '%')


main()