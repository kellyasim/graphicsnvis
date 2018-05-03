class MainMenu{
  boolean active = true;
  PShape blue; //background
  boolean rectOver = false;
  int rectX,rectY;
  color rectHighlight = 210;
  
  MainMenu(){}
  
  void animate(){
    fill(#A7CFFF);
    rect(0,0,1000,1000);
    update(mouseX,mouseY);
        
    fill(50);
    PImage toucan = loadImage("Sprites/toucan.png");
    toucan.resize(70,70);
    image(toucan,60,168);
    
    textSize(48);
    text("ToucanStudios Presents:", 100,250);
  
    textSize(120);
    text("Turtlepond", 80,420);
    text("Adventures",230,520);
    
    if (rectOver){
      fill(rectHighlight);                // COLOR NOT CHANGING EVEN THOUGH LINE PRINTED
    }
    
    textSize(100);
    stroke(4);
    strokeWeight(4);
    rectX = 280;
    rectY = 700;
    rect(rectX,rectY,350,150);
    noStroke();
    fill(255);
    text("START",300,800);
    noFill();
  }
  
  void update (int x, int y ){
    if (overRect(rectX,rectY,350,150)){
      rectOver = true;
    }
  }
  
  boolean overRect(int x, int y, int width, int height){
    if (mouseX >=x && mouseX <= x+width &&
        mouseY >=y && mouseY <= y+height){
          println("overRect");
          return true;
        } else{
          return false; 
        }
    
  }
  
  boolean is_active(){
    return active;
  }
  
  void change_state(){
    if(active){
      active = !active;
    }
  }
}