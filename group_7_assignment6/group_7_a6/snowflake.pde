//load in 4 snowflake vectors
class Snowflake{
  PVector position;
  PVector velocity;
  PVector acceleration;
  PImage snowflake_type;
  float mass;
  //snowflakes;
  
  Snowflake(float m, float x, float y, PImage snowflake){
    mass = m;
    position = new PVector(x, y);
    velocity= new PVector(0,0);
    acceleration = new PVector(0,0);
    snowflake_type = snowflake;
    snowflake_type.resize(50,50);
  }
  
  //class method to apply forces
  //Newton's 2nd law = F=MA or A=F/M
  void applyForce(PVector force){
    //divide by mass
    PVector f = PVector.div(force,mass);
    //accumulate force in acceleration
    acceleration.add(f);
  }
  
  /*void applyForces(float fx, float fy){
  ax = fx/m;
  ay=fy/m;
  vx +=ax;
  vy+=ay;
  x+=vx;
  y+=vy;
  }*/
  
  void update(){
    //velocity changes according to acceleration
    velocity.add(acceleration);
    //position changes by velocity
    position.add(velocity);
    //clear acceleration
    acceleration.mult(0);
  }
  
  //draw snowflake
  void display(){
    image(snowflake_type, position.x, position.y);
  }
}