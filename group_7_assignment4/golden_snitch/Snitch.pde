class Snitch {
  float x, y, initialx, initialy;
  PVector speed;
  int wingAngle = -15;
  int angleChange = 3; //rate of wings flapping
  final int ANGLE_LIMIT = 40;
  
  Snitch (float x, float y, PVector speed){
   this.x = x;
   this.y = y;
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
    drawLWing();
    drawRWing();
    fill(255, 255, 0);//yellow
    strokeWeight(1);
    stroke(245, 235, 0, 255); //gold
    ellipse(x, y, 20, 20); //ball
}
  void drawLWing(){
    pushMatrix();
    translate(x-3, y);
    rotate(radians(wingAngle));
    fill(255);
    stroke(0); //black
    //bezier(0, 40, 0, 70, 30, 56, 50, 70); //left wing
    bezier(x-155,y-137,x-155,y-107,x-125,y-121,x-105,y-107);
    line(x-155, y-137, x-105, y-107);
    popMatrix();
  }
  void drawRWing(){
    pushMatrix();
    translate(x+3,y);
    rotate(radians(-wingAngle));
    //bezier(50, 70, 70, 56, 100, 70, 100, 40); //right wing
    bezier(x-95, y-107, x-80, y-121, x-50, y-107, x-50, y-137);
    line(x-95, y-107, x-50, y-137);
    popMatrix();
  }
  
  void move(){
    //if (this.x < 300){
    //  x += this.speed.x;
    //} else{
    //  this.x = this.initialx; 
    //}
      
    //if (this.y < 300){
    //  y += this.y; 
    //} else{
    //  this.y = this.initialy;
    //}
  }
}