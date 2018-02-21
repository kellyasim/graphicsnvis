class Snitch {
  float x, y;
  PVector speed;
  int wingAngle = 0;
  int angleChange = 15;
  final int ANGLE_LIMIT = 20;
  
  Snitch (float x, float y, PVector speed){
   this.x = x;
   this.y = y;
   this.speed = speed;    
  }
    
  void display(){
    
    pushMatrix();

    drawSnitch();
    wingAngle += angleChange;
    if (wingAngle > ANGLE_LIMIT || wingAngle < 0){
      angleChange = -angleChange;
      wingAngle += angleChange;
    }
    popMatrix();
  }
  
  void drawSnitch(){
    pushMatrix();
    rotate(radians(wingAngle));

    fill(255, 255, 0);//yellow
    strokeWeight(1);
    stroke(245, 235, 0, 255); //gold
    ellipse(x, y, 20, 20); //ball

    fill(255);
    stroke(0); //black
    //bezier(0, 40, 0, 70, 30, 56, 50, 70); //left wing
    bezier(x-55,y-37,x-55,y-7,x-25,y-21,x-5,y-7);
    line(x-55, y-37, x-5, y-7);

    //bezier(50, 70, 70, 56, 100, 70, 100, 40); //right wing
    bezier(x+5, y-7, x+20, y-21, x+50, y-7, x+50, y-37);
    line(x+5, y-7, x+50, y-37);
    popMatrix();
  }
  
  void move(){
    if (this.x < 300){
      x += this.speed.x*2;
    }else{
     this.x = 200; 
    }
      
      
    if (this.y < 300){
      y += this.speed.y*2; 
    } else{
      this.y = 200;
    }
  }
}