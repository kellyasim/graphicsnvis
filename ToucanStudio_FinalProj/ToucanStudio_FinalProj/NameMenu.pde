class NameMenu{
  boolean rectOver = false;
  boolean active;
  NameMenu(){
    active = false;
  }
  
  void animate() {
    update(mouseX,mouseY);
    background(#A7CFFF);
    PImage toucan = loadImage("Sprites/title.png");
    image(toucan,58, 168);
    PImage start = (rectOver)? loadImage("Sprites/start_hover.png") : loadImage("Sprites/start_normal.png") ;
    image(start,300, 700);
  }

  void change_state(){
    if(active && rectOver){
      active = !active;
    }
  }
  
  void update (int x, int y ){
    if (overRect(280,690,350,150)){
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

}
