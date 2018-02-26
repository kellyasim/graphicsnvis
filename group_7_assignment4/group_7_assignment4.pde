import processing.sound.*;
SoundFile cheer;
Crowd audience1;
Crowd audience2;
PersonObject person;
PersonObject otherPerson;
Snitch gs; Snitch gs2; 

void setup(){
  //cheer = new SoundFile(this, "soccer_stadium.wav");
  //cheer.play();
  audience1 = new Crowd(1100);
  audience2 = new Crowd(1500);
  person = new PersonObject();
  otherPerson = new PersonObject(125, 125 );
  size(1000,700);
  
  //kelly's code
  PVector p = new PVector (5, 4);
  PVector q = new PVector (-5, -10);
  color yellow = color(255, 255, 0);
  color blue = color (0, 150, 200);
  gs = new Snitch (150, 150, yellow, p);
  gs2 = new Snitch (500, 200, blue, q);
}

void draw(){
  background(#03ADFF);
  fill(#128109);
  rect(0,500,1000,200);
  fill(255);
  audience1.update();
  audience2.update();
  person.animate();
  otherPerson.animate();
  gs.display();
  gs.move(); //move randomly in a box, wings flutter
  gs2.display();
  gs2.move();
}