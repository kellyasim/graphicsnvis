PlayerObject player;
MapElement map;
void setup(){
  size(1000,1000);
  player = new PlayerObject(100,500,500);
  map = new MapElement(player);
}

void draw(){
  map.display();
  player.display();
  
}

void keyPressed(){
  player.control(key);
}