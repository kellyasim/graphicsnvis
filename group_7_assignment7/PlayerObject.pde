class PlayerObject extends EntityObject{
  PlayerObject(int health, int xpos, int ypos){
    super(health, xpos, ypos);
  }

  void control(char input){
    if(check_collision()){
      if(input == 'w' || input == 'W'){ position.y -= 5; }
      if(input == 'a' || input == 'A'){ position.x -= 5; }
      if(input == 's' || input == 'S'){ position.y += 5; }
      if(input == 'd' || input == 'D'){ position.x += 5; }
    }
  }
  
  void display(){
    ellipse(position.x, position.y, 50,50);
  }

}