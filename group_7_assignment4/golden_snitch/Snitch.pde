class Snitch {
  float x, y;
  PVector speed;
  
  Snitch (float x, float y, PVector speed){
   this.x = x;
   this.y = y;
   this.speed = speed;    
  }
    
  void display(){
    fill(255, 255, 0);//yellow
    strokeWeight(1);
    stroke(245, 235, 0, 255); //gold
    ellipse(x, y, 20, 20); //ball
    noFill();
    
    //80x20
    //50 x 77
    
    fill(255);
    stroke(0); //black
    //bezier(0, 40, 0, 70, 30, 56, 50, 70); //left wing
    bezier(x-55,y-37,x-55,y-7,x-25,y-21,x-5,y-7);
    line(x-55, y-37, x-5, y-7);
    //bezier(50, 70, 70, 56, 100, 70, 100, 40); //right wing
    bezier(x+5, y-7, x+20, y-21, x+50, y-7, x+50, y-37);
    line(x+5, y-7, x+50, y-37);
  }
  
  void move(){
    if (this.x < width && this.y < height){
      x += this.speed.x /2;
      y += this.speed.y /2;
    }  
  }
}