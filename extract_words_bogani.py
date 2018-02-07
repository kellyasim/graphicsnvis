import re 

# opens novel file
f = open("novel.txt", 'r') 

allwordsfile = open("allwords.txt","w+" )
uniquewordsfile = open("uniquewords.txt", "w+")
wordfrequency = open("wordfrequency.txt", "w+")

allwords = []
uniquewords = []
wordfrequency = {}

def add_word(word):
	allwords.append(word)
	if word not in uniquewords:
		uniquewords.append(word)
		wordfrequency[word] = 1
	else:
		wordfrequency[word] += 1
	
for line in f:
	for word in re.findall('[a-z]+', line.lower()):  
		add_word(word)



