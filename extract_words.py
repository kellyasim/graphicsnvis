import re 
# opens novel file
f = open("novel.txt", 'r') 

allwordsfile = open("allwords.txt","w+" )
uniquewordsfile = open("uniquewords.txt", "w+")
wordfrequencyfile = open("wordfrequency.txt", "w+")

allwords = []
wordfrequency = {}

def add_word(word):
	allwords.append(word)
	if word not in wordfrequency.keys():
		wordfrequency[word] = 1
	else:
		wordfrequency[word] += 1
	
for line in f:
	for word in re.findall("[a-z']+", line.lower()):  
		add_word(word)


for word in allwords:
	allwordsfile.write(word + '\n')

for word in wordfrequency.keys():
	uniquewordsfile.write(word + '\n')

another_dict = {}

for word, count in wordfrequency.iteritems():
	if count not in another_dict:
		another_dict[count] = 1
	else:
		another_dict[count] += 1


for count, freq in another_dict.iteritems():
	wordfrequencyfile.write(str(count) + ":"+ str(freq) + '\n')


