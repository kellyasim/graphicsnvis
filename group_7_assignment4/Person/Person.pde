PersonObject person;

void setup(){
 size(1024, 700);
 person = new PersonObject();
}

void draw() {
 background(204);
  person.animate();
}