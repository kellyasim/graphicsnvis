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
	another_dict = {}
	for word, count in wordfrequency.items():
		if count not in another_dict:
			another_dict[count] = 1
		else:
			another_dict[count] += 1

	#Write number of appearances:frequncy to wordfrequency.txt
	for count, freq in another_dict.items():
		wordfrequencyfile.write(str(count) + ":"+ str(freq) + '\n')

	#close all files
	allwordsfile.close()
	uniquewordsfile.close()
	wordfrequencyfile.close()

main()