PFont font; PFont titleFont; PFont dropFont;
String[] lines;

color black = #000000;
color blacka = #74DBD0;
color orange = #F4BEAB;

int width = 850;
int height = 750;
int fSize = 20;
int titleSize = 30;
int dropSize = 200;

boolean isThereRoom = true;

void setup(){
  size(1000,750);
  background(#FFFFFF);
  
  //different fonts
  font = createFont("FFScala", fSize);
  titleFont = createFont("Alice_in_Wonderland_3.ttf", titleSize);
  dropFont = createFont("Alice_in_Wonderland_3.ttf", dropSize);
  
  //load file
  lines = loadStrings("novel.txt");
}

void task(){
  float spaceTakenWidth = 7;
  float spaceTakenHeight = 40;
  int linenumber = 0;
  int counter = 0;

  
  //Check if theres room on the canvas to print a line 
  while (isThereRoom){
    for (String line : lines){
      String[] words = split(line, ' ');
      //each word is placed on its own
      for (String word : words){
        float tWidth = textWidth(word) + 5;



        //reset for every new line
        if (!(spaceTakenWidth + tWidth <= width )){
          spaceTakenWidth = 10;
          spaceTakenHeight += fSize +5;
          counter = 0;
          linenumber += 1;
        }
          
        //check to see if canvas height is reached
        if (spaceTakenHeight <= height){
          
          //Title
          if (linenumber == 0 && counter <= 4){
            fill (black);
            textFont(titleFont);
            text(word, spaceTakenWidth, spaceTakenHeight);
            spaceTakenWidth += tWidth +55;
          //Chapter1            
          } else if(linenumber == 1 && counter >= 6 && counter <= 10){
            fill (black);
            textFont(titleFont);
            //spaceTakenHeight += fSize;
            text(word,spaceTakenWidth,spaceTakenHeight);
            spaceTakenWidth += tWidth + 10;

          //DropCap
          } else if (linenumber == 2 && counter == 0){
            fill (black);
            spaceTakenHeight += titleSize + 120;
            textFont(dropFont);
            String first = word.substring(0,1);
            text(first, spaceTakenWidth + 10, spaceTakenHeight);
            
          //rest of Alice  
            fill(orange);
            textFont(font);
            String restOfLine = word.substring(1);
            text(restOfLine, spaceTakenWidth + 165, spaceTakenHeight - 100);
            spaceTakenWidth += tWidth + 3;
            counter += 1;
            
          //around Dropcap
          } else if (linenumber >= 2 && linenumber <= 6 && counter >= 0){
            fill(orange);
            textFont(font);
            text(word, spaceTakenWidth + 165, spaceTakenHeight- 100);
            spaceTakenWidth += tWidth + 5;
          
          //All other text
          } else if (linenumber >= 7){
            fill(black);
            textFont(font);
            text(word, spaceTakenWidth, spaceTakenHeight - 100);
            spaceTakenWidth += tWidth + 5;            
            
            
          //other heading text
          }else{
            fill(orange);
            textFont(font);
            text(word, spaceTakenWidth, spaceTakenHeight);
            spaceTakenWidth += tWidth;
          }
          println(word, spaceTakenWidth, spaceTakenHeight);
          counter += 1;
        } else{
          isThereRoom = false;
        }

      }
    //linenumber += 1;
  }
}
}


void draw(){
  task();
  noLoop();
}
  
  