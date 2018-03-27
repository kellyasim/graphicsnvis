//random x values for snowflakes
//random generation of graphic
//random - y value for snowflakes to fall at staggered positions

//bottom of screen recall initial x and y

//initializing all 50 snowflakes, randomly choose one of the 4 patterns
Snowflake[] snowflakes = new Snowflake[100];


void setup(){
  size (800, 700);
  PImage[] patterns = {loadImage("blueflake.png"),
                       loadImage("hexflake.png"),
                       loadImage("simpleflake.png"),
                       loadImage("snowflake.png")};
  //int randy = int((Math.random() * 700));
  for(int i=0; i<snowflakes.length; i++){
    int randx = int(random(801));
    int randy = int(random(-3000, -200));
    //random mass?
    //float randm = random(5);
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
}



void mousePressed(){
  //delete ellipse code before submittion
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,150,150);
  
  for(Snowflake flake : snowflakes){
    //get distance
    float distx = flake.position.x + 25 - mouseX;
    float disty = flake.position.y + 25 - mouseY;
    if(sqrt(sq(distx) + sq(disty)) < 75){   
      if(distx < 0) {
        flake.applyForce(new PVector(-50,0));
      } else {
        flake.applyForce(new PVector(50,0));
      }
    }
    
  }
}