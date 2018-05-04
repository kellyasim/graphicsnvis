class EntityObject{
  int hp;
  int speed;
  int lives;
  int damage = 20;
  boolean alive = true;
  PVector position;

  EntityObject(){}
  EntityObject(int health, int xpos, int ypos){
    hp = health;
    position = new PVector(xpos,ypos);
  }
  
  void recoil(PVector enemy_position, int magnitude){
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
      position.y = 770;
      return false;
    }
    
    return true;
  }
  
  void damage(int d){
    hp -= d;
    if(hp <= 0){
      death();
    }
  }
    
  int return_damage(){
    return damage;
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
  
  boolean is_alive(){
    return alive;
  }
}