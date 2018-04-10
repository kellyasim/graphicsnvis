class HUD{
  PlayerObject player;
  int hp, num_enemies;
  
  HUD(PlayerObject p, int n){
    player = p;
    num_enemies = n;
  }
  
  void display(int num_enemies){
    hp = player.return_hp();
    fill(150);
    rectMode(CORNER);
    rect(0,800,1000,200);
    fill(0,0,255);
    if(hp<=40){
      fill(255,0,0);
    }
    textSize (30);
    
    textSize(50);
    text("hp : "+ hp,25,850);
    text("lives: ",25, 900);
    text("enemies: ", 25, 960);
    fill(255, 0, 0);
    ellipseMode(CORNER);
    for(int i=0;i<player.return_lives();i++){
      ellipse(60*i+160, 860, 50,50);
      
    }
    
    fill(0,255,0);
    for(int i=0;i<num_enemies;i++){
      ellipse(60*i+250, 920, 50,50); 
    }
    
    fill(255);
    ellipseMode(CENTER);
  }
}