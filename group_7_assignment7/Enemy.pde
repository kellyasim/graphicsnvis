class Enemy extends EntityObject{
  int radius;
  int turn = 0;
  int direction = int(random(4));
  int damage = 20;
  PImage frame;
  Enemy(int health, int r, int xpos, int ypos){
    super(health, xpos, ypos);
    radius = r;
    speed = 3;
    lives = 1;
  }
  
  void display(PImage frame){
    if(alive){
      //radius debugging
      ellipseMode(CENTER);
      ellipse(position.x, position.y, radius, radius);
      
      //graphical representation of monster
      rectMode(CENTER);
      rect(position.x, position.y, 50,50);
      image(frame, position.x-35, position.y-35);

    }
    else{
      position.x = -100;
      position.y = -100;
    }
  }
  
  int return_damage(){
    return damage;
  }
  
  void animate(PVector pp, PImage [] turtle){ //pp stands for "player position"
    float distx = pp.x - position.x;
    float disty = pp.y - position.y;
    frame = turtle[frameCount % 6];
    
    //idle movement
    if(check_collision()){
      if(turn == 15){
        turn = -50;
        direction = int(random(4));
      }
      //Enemy just stands around for a couple of frames
      if(turn < 0){
        turn++;
        frame = turtle[0];
        display(frame);
        return;
      }
      switch(direction){      
        case 0: //north
          position.y -= speed;          
          turn++;
          break;
        case 1: //east
          position.x -= speed;
          turn++;
          break;
        case 2: //south
          position.y += speed;
          turn++;
          break;
        case 3: //west
          position.x += speed;
          turn++;
          break;
        default:
          break;
      }
    }
    
    //movement towards player
    if(sqrt(sq(distx) + sq(disty)) < radius/2){
      if(distx < 0){
        position.x -= speed;
      }
      else{
        position.x += speed;
      }
      if(disty < 0){
        position.y -= speed;
      }
      else{
        position.y += speed;
      }
    }
    
    //display updated position
    display(frame);
  }
}