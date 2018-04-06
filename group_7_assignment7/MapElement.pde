class MapElement{
  PlayerObject player;
  Enemy enemy1;
  MapElement(PlayerObject p){
    enemy1 = new Enemy(50,300,700,200);
    player = p;
  }
  
  void display(){
    rectMode(CORNER);
    rect(0,0,1000,800);
    
    //wall
    rect(50,50, 50, 300);
    enemy1.animate(player.position);
  }
}