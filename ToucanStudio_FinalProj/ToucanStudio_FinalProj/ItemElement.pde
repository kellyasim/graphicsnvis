class ItemElement{
  int type; //0 is damage, 1 is health, 2 is life
  int boost;
  int screentime = 100;
  PImage img;
  PVector position;
  
  ItemElement(int t, int b, PImage i){
    type = t;
    boost = b;
    img = i;
    position = new PVector(-100,-100);
  }
  
  void display(){
    if(screentime > 0){
      image(img, position.x, position.y);
      screentime-=1;
    }
    else{
      image(img, -100,-100);
    }
    
  }
  
  PVector return_pos(){
    return position;
  }
  
  void set_pos(int x, int y){
    position.x = x;
    position.y = y;
    screentime = 100;
  }
  
  void go_away(){
    screentime = 0;
  }
}