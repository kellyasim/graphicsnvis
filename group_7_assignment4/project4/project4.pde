CrowdMember p1;
Crowd audience;
PersonObject person;


void setup(){
  //p1 = new CrowdMember(50,50);
  audience = new Crowd();
  person = new PersonObject();
  audience.populate();
  size(700,700);
  //frameRate(10);
}

void draw(){
  background(#03ADFF);
  fill(#128109);
  rect(0,500,700,200);
  fill(255);
  audience.display();
  //p1.display();
  audience.update();
  person.animate();
  //p1.update(frameCount);
}