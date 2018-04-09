PlayerObject player;
MapElement map;
HUD hud;

boolean pause = false;
void setup(){
  size(1000,1000);
  player = new PlayerObject(100,500,500);
  map = new MapElement(player);
  hud = new HUD(player);
}

void draw(){
  if(!pause && player.return_lives() > 0){
    map.display();
    hud.display();
    player.display();
  }
}

void keyPressed(){
  if(key == 'p'){
    fill(0, 102, 153);
    textSize(48);
    text("PAUSE", 100,450);
    textSize(32);
    text("Use 'WASD' to move", 100, 500);
    text("Press 'J' to attack", 100, 550);
    text("Press 'P' to unpause", 100, 600);
    pause = !pause;
    fill(255);
  }
  if(key == 'j' || key == 'J'){
    map.attacked();
  }
  player.control(key);
}