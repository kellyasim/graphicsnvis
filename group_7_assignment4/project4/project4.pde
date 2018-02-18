CrowdMember p1;
Crowd audience;



void setup(){
  //p1 = new CrowdMember(50,50);
  audience = new Crowd();
  audience.populate();
  size(700,700);
  frameRate(10);
}

void draw(){
  background(#03ADFF);
  fill(#128109);
  rect(0,500,700,200);
  fill(255);
  audience.display();
  //p1.display();
  audience.update();
  //p1.update(frameCount);
}