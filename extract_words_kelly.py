# Removes punctuation marks from a string
def parseString (st):
  #st = st.lower()
  #filter string of punctuation
  s = ""
  for ch in st:
    if (ch.isalpha() or ch.isspace() or ch == "'"):
      s += ch
    else:
      s += " "
  #filters 's from other contractions
  #s = s.replace("' ", " ")
  #return (s.replace("'s", ""))


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
    line = line.lower()
    for word in line.split(' '):  
      add_word(word)

  print (uniquewords)
  book.close()    


  #allwords.write()  


  print (dictfreq.keys())
  #uniquewords.write()
  

  
  # Compare the relative frequency of uncommon words used
  # by the two authors
  #wordComparison (author1, wordFreq1)
  

  allwords.close()  
  uniquewords.close()
  wordfreq.close()

main()

