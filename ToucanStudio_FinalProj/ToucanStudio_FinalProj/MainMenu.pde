class MainMenu{
  boolean active = true;
  PShape blue; //background
  boolean rectOver = false;
  int rectX,rectY;
  color rectHighlight = 210;
  
  MainMenu(){}
  
  void animate(){
    fill(#A7CFFF);
    rect(-50,-50,1100,1100);
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
           
    rectX = 280;
    rectY = 690;
    
    if (rectOver){
      stroke(4);
      strokeWeight(4);
      fill(rectHighlight);  // COLOR NOT CHANGING EVEN THOUGH LINE PRINTED
    } else{
      noFill();
      noStroke();
    }

    rect(rectX,rectY,350,150);

    fill(255);
    textSize(100);
    text("START",300,800);
    noFill();
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