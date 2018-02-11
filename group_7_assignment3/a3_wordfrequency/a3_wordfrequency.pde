String[] lines;
PFont courier;

void setup(){
  lines = loadStrings("wordfrequency.txt");
  surface.setResizable(true);
  int xlen = 20+int((lines[0].split(":"))[1])*2;
  int ylen = lines.length*10;
  surface.setSize(xlen, ylen);
  background(255);
  courier = createFont("Courier", 13);
  textFont(courier);
}

void draw(){
  int x = (int((lines[0].split(":"))[1])*2)/2;
  int y = lines.length*10 - 5;
  String freq, number_of_app = "";
  rectMode(CENTER);
  for(String line : lines){
    freq = (line.split(":"))[0];
    number_of_app = (line.split(":"))[1];
    rect(x,y,int(number_of_app)*2,10);
    fill(0);
    text(freq, x+int(number_of_app)+2, y+4);
    y -= 10;
    fill(255);
  }
  noLoop();
}