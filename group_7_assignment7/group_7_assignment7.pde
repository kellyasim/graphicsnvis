PlayerObject player;
HUD hud;
boolean pause;
int num_enemies, level;
MapElement [] levels;

// CODE TO RECORD
//boolean isRecording = false;

void setup(){
  size(1000,1000);
  frameRate(20);
  player = new PlayerObject(100,500,500);
  level = 0;
  levels = new MapElement[3];
  for(int i=0;i<3;i++){
    levels[i] = new MapElement(player,(1+i)*3);
  }
  hud = new HUD(player, 10);
  new_frame();
  pause = false;
  pause();
}

void draw(){
  if(!pause && player.return_lives() > 0){
    new_frame();
  }
  // CODE TO RECORD
  //if(isRecording) {
  //  saveFrame();
  //}
}

void new_frame(){
  levels[level].display();
  num_enemies = levels[level].return_num_enemies();
  hud.display(num_enemies, level);
  if(num_enemies == 0){
    if(level == 2){
      text("YOU WIN", 100,100);
      text("'R' to restart", 100, 150);
      pause = true;
    }
    level++;
  }
  
  player.display();
}

void pause(){
  fill(0, 102, 153);
  //textSize(48);
  //text("-PAUSE-", 100,430);
  textSize(20);
  text ("As a lone jellyfish, ", 100, 430); 
  text ("defeat as many turtles to gain your freedom", 100, 460);
  textSize(32);
  text("Use 'WASD' to move", 100, 500);
  text("'J' to attack", 100, 550);
  text("'P' to pause/unpause", 100, 600);
  text("'R' to restart", 100, 650);
  // CODE TO RECORDS
  //text("'R' to start/stop recording", 100, 650);
  pause = !pause;
  fill(255);
}

void keyPressed(){
  if(key == 'p' || key == 'P'){
    pause();
  }
  if( (key == 'j' || key == 'J') && !pause ){
    levels[level].attacked();
  }
  
  if(key == 'r' || key =='R'){
    setup();
  }
  
  // CODE TO RECORD
  //if(key == 'r' || key == 'R'){
  //  isRecording = !isRecording;
  //}
  player.control(key);
}