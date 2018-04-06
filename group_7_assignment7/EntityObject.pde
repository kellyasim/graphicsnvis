class EntityObject{
  int hp;
  PVector position;

  EntityObject(){}
  EntityObject(int health, int xpos, int ypos){
    hp = health;
    position = new PVector(xpos,ypos);
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
}