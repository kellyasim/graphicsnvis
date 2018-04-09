class Enemy extends EntityObject{
  int radius;
  int turn = 0;
  int direction = int(random(4));
  int damage = 20;
  Enemy(int health, int r, int xpos, int ypos){
    super(health, xpos, ypos);
    radius = r;
    speed = 3;
    lives = 1;
  }
  
  void display(float x, float y){
    if(alive){
      //radius debugging
      ellipseMode(CENTER);
      ellipse(position.x, position.y, radius, radius);
      
      //graphical representation of monster
      frame = (frame + 1) % imgCt;
      image(turtle[frame], x, y);
      //rectMode(CENTER);
      //rect(position.x, position.y, 50,50);
    }
    else{
      position.x = -100;
      position.y = -100;
    }
  }
  
  int return_damage(){
    return damage;
  }
  
  void animate(PVector pp){ //pp stands for "player position"
    float distx = pp.x - position.x;
    float disty = pp.y - position.y;
    
    //idle movement
    if(check_collision()){
      if(turn == 15){
        turn = -50;
        direction = int(random(4));
      }
      //Enemy just stands around for a couple of frames
      if(turn < 0){
        turn++;
        display();
        return;
      }
      switch(direction){      
        case 0:
          position.y -= speed; 
          turn++;
          break;
        case 1:
          position.x -= speed;
          turn++;
          break;
        case 2:
          position.y += speed;
          turn++;
          break;
        case 3:
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
    display();
  }
}