String[] lines;

void setup(){
  lines = loadStrings("../wordfrequency.txt");
  surface.setResizable(true);
  int xlen = int((lines[0].split(":"))[1])*2;
  int ylen = lines.length*10;
  surface.setSize(xlen, ylen);
  background(255);
}

void draw(){
  int x = (int((lines[0].split(":"))[1])*2)/2;
  int y = lines.length*10 - 5;
  rectMode(CENTER);
  for(String line : lines){
    rect(x,y,int((line.split(":"))[1])*2,10);
    y -= 10;
  }
  noLoop();
}