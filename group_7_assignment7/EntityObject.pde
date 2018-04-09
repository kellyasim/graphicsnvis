class EntityObject{
  int hp;
  int speed;
  int lives;
  boolean alive = true;
  PVector position;

  EntityObject(){}
  EntityObject(int health, int xpos, int ypos){
    hp = health;
    position = new PVector(xpos,ypos);
  }
  
  void recoil(PVector enemy_position, int magnitude){
    fill(255,0,0);
    float distx = position.x - enemy_position.x;
    float disty = position.y - enemy_position.y;
    
    if(distx < 0){
      position.x -= magnitude*speed;
    }
    else{
      position.x += magnitude*speed;
    }
    if(disty < 0){
      position.y -= magnitude*speed;
    }
    else{
      position.y += magnitude*speed;
    }
    ellipse(position.x, position.y, 50,50);
    fill(255);
  }
  
  Boolean check_collision(){
    //check collision with border
    if(position.x-25<0){
      position.x = 25;
      return false;
    }
    if(position.x+25>1000){
      position.x = 975;
      return false;
    }
    if(position.y-25<0){
      position.y = 25;
      return false;
    }
    if(position.y+25>800){
      position.y = 775;
      return false;
    }
    
    return true;
  }
  
  void damage(int d){
    hp -= d;
    if(hp == 0){
      death();
    }
  }
  
  void death(){
    lives -= 1;
    if(lives == 0){
      alive = false;
      return;
    }
    hp = 100;
  }
  
  int return_hp(){
    return hp;
  }
  
  PVector return_position(){
    return position;
  }
}