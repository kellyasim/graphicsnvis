class CrowdMember{
  int xpos;
  int ypos;
  int initial_xpos;
  boolean up = false;
  color shirt_color;
  
  CrowdMember(int x, int y, color c, int start){
    xpos = x;
    ypos = y;
    initial_xpos = start;
    shirt_color = c;
    int up_or_down = int(random(2));
    if(up_or_down == 1){
      up = true;
    }
  }
  
  void update(){
    xpos -= 10;
    if(xpos < -400){
      xpos = 1100;
    }
    if(frameCount % 6 <= 2){
      if(up){
        ypos+=5;
        up = false;
      }
      else{
        ypos-=5;
        up = true;
      }
    }
  }
  
  void display(){
    fill(255);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 10, 10);
    fill(shirt_color);
    rect(xpos-5, ypos+5, 10, 15);
  }
}