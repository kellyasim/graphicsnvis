class Arm {
  int x;
  int y;
  PShape arm;
  float angle;
  boolean direction;
  int speed;
  Arm(int x, int y) {
    
    this.arm = loadShape("arm.svg");
    this.x = x ;
    this.y = y ;
    shape(this.arm, this.x, this.y);
    angle = 0;
    direction = true;
    speed = 360;
  }

  
  
  void animate(int x, int y) {
    
    this.x = x + speed;
    this.y = y;
    if(frameCount % 20 == 0) {
      direction = !direction;
    }
    if(direction) {  
      angle = .02;
    } else {
      angle = -0.02;
    }
    arm.rotate(angle);
    shape(arm, this.x, this.y);
  }
}