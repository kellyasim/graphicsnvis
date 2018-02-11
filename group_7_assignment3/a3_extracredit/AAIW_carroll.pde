PFont font; PFont titleFont; PFont subtitleFont; PFont dropFont;
String[] lines;

color black = #000000;
color aqua = #74DBD0;
color orange = #F4BEAB;

int width = 800;
int height = 900;
int fSize = 20;
int titleSize = 60;


boolean isThereRoom = true;

void setup(){
  size(800,750);
  background(black);
  font = createFont("FFScala", fSize);
  titleFont = createFont("Alice_in_Wonderland_3.ttf", titleSize);
  subtitleFont = createFont("Alice_in_Wonderland_3.ttf", 50);
  dropFont = createFont("Alice_in_Wonderland_3.ttf", 200);
  //load file
  lines = loadStrings("novel.txt");
}


void task(){
  float spaceTakenWidth = 5;
  float spaceTakenHeight = 0;
  int index = 0;
  int space = 20;
  
  //Check if theres room on the canvas to print a line 
  while (isThereRoom){
    for (String line : lines){
      float tWidth = textWidth(line) + 10;

      //get the height of the line
      if (spaceTakenHeight <= height){

        //get the width of the line
        if (!(spaceTakenWidth + tWidth <= width )){
          spaceTakenWidth = 10;
        
          if (index == 0 ){
            fill(orange);
            textFont(titleFont);
            spaceTakenHeight += titleSize;
            String chapter = line.substring(0,10);
            text(chapter, spaceTakenWidth, spaceTakenHeight);
            //chapter name
            textFont(subtitleFont);
            String name = line.substring(10);
            text(name, spaceTakenWidth + 275, spaceTakenHeight + 5);
            
            index += 1;
          //Dropcap
          } else if (index == 1){
            fill(orange);
            spaceTakenHeight += titleSize + 120;
            textFont(dropFont);
            String first = line.substring(0,1);
            text(first, spaceTakenWidth + 10, spaceTakenHeight);
            
            //rest of line
            fill(aqua);
            textFont(font);
            String restOfLine = line.substring(1);
            text(restOfLine, spaceTakenWidth + 155, spaceTakenHeight - 80);
            index += 1;
            
          }else if (index == 2 || index == 3 || index == 4 || index == 5){
            //rest of lines
            //fill(orange);
            textFont(font);
            spaceTakenWidth += 10;
            text(line, spaceTakenWidth + 145, spaceTakenHeight+ space - 80);
            space += 20;
            index += 1;
            
          } else{
            fill(aqua);
            textFont(font);
            spaceTakenHeight += fSize;
            text(line, spaceTakenWidth, spaceTakenHeight);
            index += 1;
          }
        println(line, spaceTakenWidth, spaceTakenHeight);

        }
        spaceTakenWidth += tWidth;
          
      } else{
        isThereRoom = false;
      }
    }
  }
}

void draw(){
  task();
  noLoop();
}