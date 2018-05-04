class MainMenu{
  boolean active = true;
  PShape blue; //background
  boolean rectOver = false;
  int rectX,rectY;
  color rectHighlight = 210;
  int tailY = 0;
  float yChange = 1;
  
  MainMenu(){}
  
  void animate(){
    fill(#A7CFFF);
    rect(-50,-50,1100,1100);
    update(mouseX,mouseY);
    fill(50);
    PImage toucan = loadImage("Sprites/toucan.png");
    toucan.resize(70,70);
    image(toucan,58, 168);
  
    textSize(48);
    text("ToucanStudios Presents:", 100,250);

    textSize(120);
    text("Turtlepond", 80,420);
    text("Adventures",230,520);
              
    if (rectOver){
      stroke(4);
      strokeWeight(4);
      fill(rectHighlight);
    } else{
      noFill();
      noStroke();
    }
    
    rectX = 280;
    rectY = 690;
    rect(rectX,rectY,350,150);

    fill(255);
    textSize(100);
    text("START",300,800);
    noFill();
    pushMatrix();
    drawFish();
    scale(0.5);
    drawFish();
    scale(0.8);
    drawFish();
    tailY += yChange;
    if (tailY > 1 || tailY < 0){
      yChange = -yChange;
      tailY += yChange;
      println(tailY);
    }
    popMatrix();
  }
  
  void drawFish(){
    pushMatrix();
    translate(mouseX,mouseY);
    drawTail();
    fill(#FFA83E);
    strokeWeight(2);
    stroke(#FF9F29);
    triangle(0,0,40,40,40,-40);
    stroke(0);
    ellipse(20,0,5,5);
    popMatrix();
  }
  
  void drawTail(){
    pushMatrix();
    translate(0,tailY);
    fill(#FFA83E);
    strokeWeight(2);
    stroke(#FF9F29);
    triangle(40,tailY,50,tailY+10,50,tailY-10); 
    popMatrix();
  }
  
  void update (int x, int y ){
    if (overRect(rectX,rectY,350,150)){
      rectOver = true;
    }else{
      rectOver = false; 
    }
  }
  
  boolean overRect(int x, int y, int width, int height){
    if (mouseX >=x && mouseX <= x+width &&
        mouseY >=y && mouseY <= y+height){
          return true;
        } else{
          return false; 
        }
    
  }
  
  boolean is_active(){
    return active;
  }
  
  void change_state(){
    if(active && rectOver){
      active = !active;
    }
  }
}