Snowflake[] snowflakes = new Snowflake[100];

void setup(){
  size (800, 700);
  PImage[] patterns = {loadImage("blueflake.png"),
                       loadImage("hexflake.png"),
                       loadImage("simpleflake.png"),
                       loadImage("snowflake.png")};
  for(int i=0; i<snowflakes.length; i++){
    int randx = int(random(801));
    int randy = int(random(-3000, -200));
    snowflakes[i] = new Snowflake(1, randx, randy, patterns[int(random(4))]);
  } 
}

void draw(){
  background(100);
  for (Snowflake flake : snowflakes){
    PVector gravity = new PVector(0,0.01);
    //Apply gravity
    flake.applyForce(gravity);
    /**
    * Forces (Gravity) with Vectors 
    * by Daniel Shiffman.  
    * 
    * Bodies experience gravity continuously
    */
    
    //update and display
    flake.update();
    flake.display();
    flake.checkEdges();
  }
  fill(255);
  text("click to disturb snowflakes", width/2-50, 30);
  
  //saveFrame();
}



void mousePressed(){
  /* "hitbox" of disturbance for debugging
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,150,150);
  */
  
  //change r to change area affected by the disturbance 
  int r = 75;
  //change mag to change the magnitude of the disturbance
  int mag = 2;
  
  for(Snowflake flake : snowflakes){
    //get distance
    float distx = flake.position.x + 25 - mouseX;
    float disty = flake.position.y + 25 - mouseY;

    if(sqrt(sq(distx) + sq(disty)) < r){   
      if(distx < 0) {
        flake.applyForce(new PVector(-mag,0));
      } 
      else {
        flake.applyForce(new PVector(mag,0));
      }
      if(disty > 0){
        flake.applyForce(new PVector(0,mag));
      }
      else{
        flake.applyForce(new PVector(0,-mag));
      }
    }    
  }
}