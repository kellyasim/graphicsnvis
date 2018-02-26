// AnimateObject
class AnimateObject {

  void animate(){}
  
  
}




class PersonObject extends AnimateObject {
  PShape person;
  int x;
  int y;
  Arm arm;
  float speed;
  boolean direction;
  
  PersonObject() {
    person = loadShape("person.svg");
    this.x = 0;
    this.y = 0;
    arm = new Arm(345, 0);
    shape(person, this.x, this.y);
    direction = (random(0,100) % 2 == 0)? true : false;
    this.speed = random(1, 4);
  }
  
  PersonObject(int x, int y) {
    person = loadShape("person.svg");
    this.x = x;
    this.y = y;
    arm = new Arm(x + 345, y + 0);
    shape(person, this.x, this.y);
    direction = true;
    this.speed = random(1, 4);
  }
  
  
  void animate(){
    this.x+= speed;
    if(this.x > width ) {
      //this.speed = -this.speed;
      this.x = -300;
    this.speed = random(1, 4);
    }
    if(frameCount % 100 == 0) {
      direction = !direction;
    }
    
    if(frameCount % 20 == 0) {
      this.speed += random(1, 4);
    }
    if(direction) {  
      this.y += random(2, 5);
    } else {
      this.y -= random(2, 5);
    }
    arm.animate(this.x, this.y);
    shape(person, this.x, this.y);
  }
}