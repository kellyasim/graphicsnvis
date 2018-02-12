PFont font;
String[] words;

color bg = #264653;
color c1 = #E9C46A;
color c2 = #F4A261;
color c3 = #E76F51;

color[] colors = {c1, c2, c3};

int width = 700;
int height = 600;
int fSize = 32;

int cIndex = 0;

boolean isThereRoom = true;

void setup(){
  size(700, 600);
  background(bg);
  font = createFont("AbrilFatface-Regular.ttf", fSize);
  textFont(font);
  words = loadStrings("uniquewords.txt");
}

color cPicker(){
  if(cIndex < 2) {
    cIndex++;
  } else {
    cIndex = 0;
  }
  
  return colors[cIndex];
}

void task(){
  float spaceTakenWidth = 5;
  float spaceTakenHeight = fSize;
  while(isThereRoom){
    
    // get random word
    int index = int(random(0, words.length));
    String word = words[index];
    
    // get word size
    float tWidth = textWidth(word) + 10;
    if(!(spaceTakenWidth + tWidth <= width)) {
        spaceTakenWidth = 5;
        spaceTakenHeight += fSize + 10;
      }
      
    if( spaceTakenHeight <= height){
      
      fill(cPicker());
      text(word, spaceTakenWidth, spaceTakenHeight);
      
      spaceTakenWidth += tWidth;
      
    } else {
      isThereRoom = false;
    }
  }
}

void mouseClicked() {
  background(bg);  
 isThereRoom = true;
}
  
void draw() {
  task();
}