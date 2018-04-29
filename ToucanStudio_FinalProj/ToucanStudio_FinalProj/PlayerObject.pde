class PlayerObject extends EntityObject{
  //0 = north, 1 = east, 2 = south, 3 = west
  int direction;
  PVector swing_direction;
  PVector swing_render;
  PImage [] weapon;
  boolean isLeft, isRight, isUp, isDown;
  int x, y;
  
  PlayerObject(int health, int xpos, int ypos){
    super(health, xpos, ypos);
    speed = 5;
    lives = 3;
    swing_direction = new PVector(0, 0);
    weapon = new PImage[4];
    for (int i = 0; i < 4; i ++){
        String file = "bolt_"+ nf(i,1)+ ".png";
        PImage newImage = loadImage(file);
        switch(i){
          case 0:
            newImage.resize(30,70);
            break;
          case 1:
            newImage.resize(70,30);
            break;
          case 2:
            newImage.resize(30,70);
            break;
          case 3:
            newImage.resize(70,30);
            break;
          default:
            break;
        }
        weapon[i] = newImage;
    }
  }
  
  int return_lives(){
    return lives;
  }

  void display(){
    if(alive){
      fill(#DF52FF);
      ellipse(position.x, position.y, 50,50);
      fill(255);
    }
    else{
      fill(255,0,0);
      textSize(100);
      text("Game Over", 200,400);
      text("'R' to restart", 200, 500);
      fill(255);
    }
  }

  PVector attack(){
    switch(direction){
      case 0:
        swing_direction.x = position.x;
        swing_direction.y = position.y - 70;
        swing_render = swing_direction;
        break;
      case 1:
        swing_direction.x = position.x - 70;
        swing_direction.y = position.y;
        swing_render = swing_direction;
        break;
      case 2:
        swing_direction.x = position.x;
        swing_direction.y = position.y + 70;
        swing_render = position;
        break;
      case 3:
        swing_direction.x = position.x + 70;
        swing_direction.y = position.y;
        swing_render = position;
        break;
      default:
        break;
    }
    
    image(weapon[direction], swing_render.x, swing_render.y);
    return(swing_direction);
  }
  
   void move() {
    int r = 50>>1;
    position.x = constrain(position.x + speed*(int(isRight) - int(isLeft)), r, width  - r);
    position.y = constrain(position.y + speed*(int(isDown)  - int(isUp)),   r, height - r);
  }
 
  boolean setMove(int k, boolean b) {
    switch (k) {
    case 'W':
    case UP:
      return isUp = b;
 
    case 'S':
    case DOWN:
      return isDown = b;
 
    case 'A':
    case LEFT:
      return isLeft = b;
 
    case 'D':
    case RIGHT:
      return isRight = b;
 
    default:
      return b;
    }
  }
}