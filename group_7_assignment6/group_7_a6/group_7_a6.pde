//random x values
//random generation of graphic
//random - y value

//bottom of screen recall initial x and y

snowflake [] snowflakes = new snowflake[50];

void setup(){
  size (800, 700);
  reset();
  
}

void draw(){
  background(0);
  for (snowflake flake : snowflakes){
    PVector gravity = new PVector(0,0.1*flake.m);
    //Apply gravvity
    flake.applyForce(gravity);
    
    //update and display
    flake.update();
    flake.display();
    flake.checkEdges();
  }
  fill(255);
  text("drag cursor to disturb snowflakes", 10, 30);
}

void mousePressed(){
  ///////////////////////disturb snowflakes
}

/**
 * Forces (Gravity) with Vectors 
 * by Daniel Shiffman.  
 * 
 * Bodies experience gravity continuously
 */