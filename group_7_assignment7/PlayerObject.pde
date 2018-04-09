class PlayerObject extends EntityObject{
  //0 = north, 1 = east, 2 = south, 3 = west
  int direction;
  PVector swing_direction;
  
  PlayerObject(int health, int xpos, int ypos){
    super(health, xpos, ypos);
    speed = 5;
    lives = 3;
    swing_direction = new PVector(0, 0);
  }

  void control(char input){
    if(check_collision()){
      if(input == 'w' || input == 'W'){ position.y -= speed; direction = 0; }
      if(input == 'a' || input == 'A'){ position.x -= speed; direction = 1; }
      if(input == 's' || input == 'S'){ position.y += speed; direction = 2; }
      if(input == 'd' || input == 'D'){ position.x += speed; direction = 3; }
    }
  }
  
  int return_lives(){
    return lives;
  }
  

  
  void display(){
    if(alive){
      ellipse(position.x, position.y, 50,50);
    }
    else{
      fill(255,0,0);
      textSize(100);
      text("Game Over", 200,400);
      
      fill(255);
    }
  }

  PVector attack(){
    switch(direction){
      case 0:
        swing_direction.x = position.x;
        swing_direction.y = position.y - 70;
        break;
      case 1:
        swing_direction.x = position.x - 70;
        swing_direction.y = position.y;
        break;
      case 2:
        swing_direction.x = position.x;
        swing_direction.y = position.y + 70;
        break;
      case 3:
        swing_direction.x = position.x + 70;
        swing_direction.y = position.y;
        break;
      default:
        break;
    }
    line(position.x, position.y, swing_direction.x, swing_direction.y);
    return(swing_direction);
  }
}