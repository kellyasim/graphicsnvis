class EntityObject{
  int hp;
  PVector position;

  EntityObject(){}
  EntityObject(int health, int xpos, int ypos){
    hp = health;
    position = new PVector(xpos,ypos);
  }
  
  void display(){
    ellipse(position.x, position.y, 50,50);
  }
  
  void check_collision(){
    
  }
}