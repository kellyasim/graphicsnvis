# opens novel file
f = open("novel.txt", 'r') 

allwordsfile = open("allwords.txt","r+" )
uniquewordsfile = open("uniquewords.txt", "r+")
wordfrequency = open("wordfrequency.txt", "r+")

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
	for word in line.split(' '):  
		add_word(word)



