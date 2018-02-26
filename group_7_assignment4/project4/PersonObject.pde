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
    direction = true;
    this.speed = 1.5;
  }
  
  
  void animate(){
    this.x+= speed;
    if(this.x > width || this.x < -67) {
      this.speed = -this.speed;
    }
    if(frameCount % 100 == 0) {
      direction = !direction;
    }
    
    if(frameCount % 20 == 0) {
      this.speed += 2.4;
    }
    if(direction) {  
      this.y += 2.3;
    } else {
      this.y -= 2.3;
    }
    arm.animate(this.x, this.y);
    shape(person, this.x, this.y);
  }
}