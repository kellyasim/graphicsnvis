class HUD{
  PlayerObject player;
  int hp, num_enemies;
  
  HUD(PlayerObject p, int n){
    player = p;
    num_enemies = n;
  }
  
  void display(int num_enemies, int level){
    hp = player.return_hp();
    fill(150);
   // rectMode(CORNER);
    //rect(0,800,1000,200);
    fill(0,0,255);
    if(hp<=40){
      fill(255,0,0);
    }
    
    
  font = createFont("8-BITWONDER.TTF", 24);
  textFont(font);
    textSize (30);
    
    textSize(30);
    text("hp  "+ hp,25,850);
    fill(0,0,255);
    text("level  "+(level+1), 500, 850); 
    text("lives  ",25, 900);
    text("enemies  ", 25, 960);
    fill(255, 0, 0);
    ellipseMode(CORNER);
    PImage heart = loadImage("Sprites/heart.png");
    heart.resize(50,50);
    for(int i=0;i<player.return_lives();i++){
      image(heart, 60*i+160,860);      
    }
    
    fill(0,255,0);
    for(int i=0;i<num_enemies;i++){
      ellipse(60*i+250, 920, 50,50); 
    }
    
    fill(255);
    ellipseMode(CENTER);
  }
}