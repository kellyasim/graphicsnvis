import processing.sound.*;
SoundFile cheer;
Crowd audience1;
Crowd audience2;
PersonObject person;

void setup(){
  cheer = new SoundFile(this, "soccer_stadium.wav");
  cheer.play();
  audience1 = new Crowd(1100);
  audience2 = new Crowd(1500);
  person = new PersonObject();
  size(1000,700);
}

void draw(){
  background(#03ADFF);
  fill(#128109);
  rect(0,500,1000,200);
  fill(255);
  audience1.update();
  audience2.update();
  person.animate();
}