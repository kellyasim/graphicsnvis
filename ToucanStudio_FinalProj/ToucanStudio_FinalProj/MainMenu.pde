class MainMenu{
  boolean active = true;
  PShape blue;
  
  MainMenu(){}
  
  void display(){
    fill(#A7CFFF);
    rect(0,0,1000,1000);
    
    fill(0,0,0,190);
    PImage toucan = loadImage("Sprites/toucan.png");
    toucan.resize(70,70);
    image(toucan,60,168);
    
    textSize(48);
    text("ToucanStudios Presents:", 100,250);
  
    textSize(120);
    text("Turtlepond", 80,420);
    text("Adventures",230,520);
    
    textSize(100);
    noFill();
    strokeWeight(4);
    rect(280,700,350,150);
    fill(255);
    text("START",300,800);
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