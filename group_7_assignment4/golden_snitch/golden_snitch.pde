Snitch gs; Snitch gs2; 
import processing.sound.*;
AudioIn file;

void setup(){
  size(700, 700);
  smooth();
  frameRate(30);
  PVector p = new PVector (5, 4);
  PVector q = new PVector (-5, -10);
  color yellow = color(255, 255, 0);
  color blue = color (0, 150, 200);
  
  file = new Crowd(this, "soccer_stadium.wav");
  file.loop();
  
  gs = new Snitch (150, 150, yellow, p);
  gs2 = new Snitch (500, 200, blue, q);
}


void draw(){
 background (152, 235, 235);
 gs.display();
 gs.move(); //move randomly in a box, wings flutter
 gs2.display();
 gs2.move();
}