//load in 4 snowflake vectors
class Snowflake(){
  PVector position;
  PVector velocity;
  PVector acceleration;
  PShape[] snowflakes;
  float mass;
  //snowflakes;
  
  Snowflake(float m, float x, float y){
    mass = m;
    position = new PVector(x, y);
    velocity= new PVector(0,0);
    acceleration = new PVector(0,0);
    snowflaskes[0] = loadShape("blueflake.png");
    snowflaskes[1] = loadShape("hexflake.png");
    snowflaskes[2] = loadShape("simpleflake.png");
    snowflaskes[4] = loadShape("snowflake.png");
        
  }
  
  Pshape create() {
    return snowflakes[int(random(4));
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
    shape(snowflake1, );
  }
}