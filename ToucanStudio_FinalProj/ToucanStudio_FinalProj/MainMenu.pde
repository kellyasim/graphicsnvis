class MainMenu{
  boolean active = true;
  
  MainMenu(){}
  
  void display(){
    fill(255);
    rect(0,0,1000,1000);
    
    fill(0,0,0,190);
    PImage toucan = loadImage("Sprites/toucan.png");
    toucan.resize(70,70);
    image(toucan,60,168);
    
    text("ToucanStudios Presents:", 100,250);
  
    textSize(120);
    text("Turtlepond", 80,420);
    text("Adventures",230,520);
     
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