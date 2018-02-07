# Removes punctuation marks from a string
def parseString (st):
  st = st.lower()
  #filter string of punctuation
  s = ""
  for ch in st:
    if (ch.isalpha() or ch.isspace() or ch == "'"):
      s += ch
    else:
      s += " "

#creates the 2 lists and dictionary to be called and written
def add_word(word):
  allwords.append(word)
  if word not in uniquewords:
    uniquewords.append(word)
    wordfrequency[word] = 1
  else:
    wordfrequency[word] += 1
  

def main():
# Returns a dictionary of words and their frequencies
  book = open("novel", "r")
  allwordsfile = open("allwords.txt", "w+")
  uniquewordsfile = open("uniquewords.txt", "w+")
  wordfreqency = open("wordfrequency.txt", "w+")

  allwords = []
  uniquewords = []
  wordfrequency = {}
  
  for line in book:
    #filter punctuation
    line = parseString(line)
    for word in line.split(' '):
      add_word(word)

  #print (uniquewords)
  book.close()    


  #allwords.write()  
  #uniquewords.write()
  

  
  allwords.close()  
  uniquewords.close()
  wordfreq.close()

main()

