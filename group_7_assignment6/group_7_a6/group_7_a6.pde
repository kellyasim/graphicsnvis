//random x values for snowflakes
//random generation of graphic
//random - y value for snowflakes to fall at staggered positions

//bottom of screen recall initial x and y

//initializing all 50 snowflakes, randomly choose one of the 4 patterns
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