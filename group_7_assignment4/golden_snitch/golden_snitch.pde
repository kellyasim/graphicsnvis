Snitch gs;

void setup(){
  size(700, 700);
  PVector p = new PVector (5, 4);
  
  gs = new Snitch (400, 100, p);
}


void draw(){
 background (152, 235, 235);
 gs.display();
 gs.move(); //move randomly in a box, wings flutter
}