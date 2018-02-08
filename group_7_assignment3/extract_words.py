import re 
# opens novel file
f = open("novel.txt", 'r') 

#open all three files for writing
allwordsfile = open("allwords.txt","w+" )
uniquewordsfile = open("uniquewords.txt", "w+")
wordfrequencyfile = open("wordfrequency.txt", "w+")

allwords = []
wordfrequency = {}

#function that adds a word to the appropriate lists/dictionary
def add_word(word):
	allwords.append(word)
	if word not in wordfrequency.keys():
		wordfrequency[word] = 1
	else:
		wordfrequency[word] += 1

def main():

	#loop through the novel line by line
	for line in f:
		for word in re.findall("[a-z]+", line.lower()):  
			add_word(word)

	#Write every word to the allwords.txt
	for word in allwords:
		allwordsfile.write(word + '\n')

	#Write every key in the wordfrequency dictionary to uniquewords.txt
	for word in wordfrequency.keys():
		uniquewordsfile.write(word + '\n')

	#This code processes every word in the dictionary to determine 
	#the number of words with the same frequency
	#Also create a list of sorted keys for writing purposes
	another_dict = {}
	keys_list = []
	for word, count in wordfrequency.items():
		if count not in another_dict:
			another_dict[count] = 1
			keys_list.append(count)
		else:
			another_dict[count] += 1
	keys_list.sort()

	#Write number of appearances:frequency to wordfrequency.txt 
	#ordered by number of appearances
	for elt in keys_list:
		wordfrequencyfile.write(str(elt) + ":"+ str(another_dict[elt]) + '\n')

	#close all files
	allwordsfile.close()
	uniquewordsfile.close()
	wordfrequencyfile.close()

main()