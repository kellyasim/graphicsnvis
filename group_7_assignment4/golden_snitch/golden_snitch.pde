Snitch gs;

void setup(){
  size(500, 500);
  smooth();
  frameRate(30);
  PVector p = new PVector (5, 4);
  
  gs = new Snitch (150, 150, p);
}


void draw(){
 background (152, 235, 235);
 gs.display();
 gs.move(); //move randomly in a box, wings flutter
}