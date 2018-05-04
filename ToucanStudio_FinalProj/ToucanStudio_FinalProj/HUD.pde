class HUD{
  PlayerObject player;
  int hp, num_enemies;
  
  HUD(PlayerObject p, int n){
    player = p;
    num_enemies = n;
  }
  
  void display(int num_enemies, int level, int time){
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
    text("hp  "+ hp,35,850);
    fill(0,0,255);
    text("level  "+(level+1), 500, 850); 
    text("time  "+time/1000+" sec", 500,900);
    text("lives  ",35, 950);
    text("enemies left  "+num_enemies, 35, 900);
    fill(255, 0, 0);
    ellipseMode(CORNER);
    PImage heart = loadImage("Sprites/heart.png");
    heart.resize(50,50);
    for(int i=0;i<player.return_lives();i++){
      image(heart, 55*i+170,910);      
    }
    
    fill(255);
    ellipseMode(CENTER);
  }
}