class Snitch{
  PShape ball;
  PShape wings;
  
  Snitch(){
    ball = createShape(...);
    wings = createShape(...);
  }
  
  display(){
    shape(ball);
    shape wings;
    
  }
}