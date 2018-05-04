class NameMenu{
  boolean rectOver = false;
  boolean active;
  PImage sprite1;
  PImage sprite2;
  
  
    int w;
    int h;
    int sX;
    int sY;
    int c;
    boolean flip;
    
  NameMenu(){
    active = false;
    sprite1 = loadImage("Sprites/sprite_girl.png");
    sprite2 = loadImage("Sprites/sprite_boy.png");
    flip = true;
        c =0 ;
        w = 64;
        h = 64;
        sX = 0;
        sY = 64;
  }
  
  void animate() {
     if(frameCount % 5 == 0){
      if(c > 3 || c < 0) {
        flip = !flip;
      }
      c = (flip)? (c+1) : (c-1);
      if(c == 4) {
        c = 3;
        flip = !flip;
      }
      
      if(c == -1) {
        c =0;
        flip = !flip;
      }
      println(c);
      
    }
    
    update(mouseX,mouseY);
    background(#A7CFFF);
    PImage toucan = loadImage("Sprites/title.png");
    image(toucan,58, 168);
    
    copy(this.sprite1, sX, sY * c, w, h, 300, 450, 128, 128);
    copy(this.sprite2, sX, sY * 0, w, h, 500, 450 , 128, 128);
   
    PImage start = (rectOver)? loadImage("Sprites/start_hover.png") : loadImage("Sprites/start_normal.png") ;
    image(start,300, 700);
  }
  
  hover(){
   if(mouseX > 128 + 300 && )
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
