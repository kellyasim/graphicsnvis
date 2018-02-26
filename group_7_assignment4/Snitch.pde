class Snitch {
  float x, y, initialx, initialy;
  color c;
  PVector speed;
  int wingAngle = -15;
  int angleChange = 35; //rate of wings flapping
  final int ANGLE_LIMIT = 30;
  
  Snitch (float x, float y, color c, PVector speed){
   this.x = x;
   this.y = y;
   this.c = c;
   this.initialx = x;
   this.initialy = y;
   this.speed = speed;    
  }
    
  void display(){
    
    pushMatrix();
    drawSnitch();
    wingAngle += angleChange;
    if (wingAngle > ANGLE_LIMIT || wingAngle < -20){
      angleChange = -angleChange;
      wingAngle += angleChange;
    }
    popMatrix();
  }
  
  void drawSnitch(){
    pushMatrix();
    translate(x, y);
    drawLWing();
    drawRWing();
    fill (c);
    strokeWeight(1);
    stroke(245, 235, 0, 255); //gold
    ellipseMode(CENTER);
    ellipse(0, 0, 20, 20); //ball
    popMatrix();
}
  void drawLWing(){
    pushMatrix();
    rotate(radians(wingAngle));
    fill(255);
    stroke(0); //black
    bezier(-53,-33,-53,-3,-23,-17,-3, -3); 
    line(-53, -33, -3, -3); 
    popMatrix();
  }
  void drawRWing(){
    pushMatrix();
    rotate(radians(-wingAngle));
    bezier(0, -3, 20, -17, 50, -3, 50, -33);
    line(0, -3, 50, -33); 
    popMatrix();
  }
  
  void move(){
    if (this.x > (this.initialx+100) || this.x < this.initialx){
      this.speed.x = -this.speed.x;
      x += this.speed.x;
    } else{
      x += this.speed.x;

    }
      
    if (this.y > (this.initialy+100) || this.y < this.initialy){
      this.speed.y = -this.speed.y;      
      y += this.speed.y; 
    } else{
      y += this.speed.y;
    }
  }
}