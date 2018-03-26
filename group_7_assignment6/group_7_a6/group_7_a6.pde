//random x values for snowflakes
//random generation of graphic
//random - y value for snowflakes to fall at staggered positions

//bottom of screen recall initial x and y

//initializing all 50 snowflakes, randomly choose one of the 4 patterns
Snowflake[] snowflakes = new Snowflake[50];


void setup(){
  size (800, 700);
  PImage[] patterns = {loadImage("blueflake.png"),
                       loadImage("hexflake.png"),
                       loadImage("simpleflake.png"),
                       loadImage("snowflake.png")};
  //int randy = int((Math.random() * 700));
  for(int i=0; i<snowflakes.length; i++){
    int randx = int(random(801));
    int randy = int(random(-1000, -200));
    //random mass?
    //float randm = random(5);
    snowflakes[i] = new Snowflake(1, randx, randy, patterns[int(random(4))]);
  } 
}

void draw(){
  background(100);
  for (Snowflake flake : snowflakes){
    PVector gravity = new PVector(0,0.1*flake.mass);
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
  for(Snowflake flake : snowflakes){
    
  }
}

/**
 * Forces (Gravity) with Vectors 
 * by Daniel Shiffman.  
 * 
 * Bodies experience gravity continuously
 */