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
    player.move();
    //player.display();
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
  //background(0);
  fill(0,0,0,180);
  rectMode(CENTER);
  rect(500,500,1000,1000);
  fill(230);
  textSize(48);
  text("-PAUSED-", 400,350);
  textSize(32);
  PImage wasd = loadImage ("wasd.png");
  wasd.resize(200,140);
  image(wasd,70,400);
  text("To move", 100, 580);
  
  PImage j = loadImage("j.png");
  j.resize(65,65);
  image(j,380,475);
  text("To attack", 340, 580);
  
  PImage p = loadImage("p.png");
  p.resize(65,65);
  image(p, 580, 475);
  text("Pause", 570, 580);
  
  PImage r = loadImage("r.png");
  r.resize(65,65);
  image(r,780,475);
  text("Restart", 760, 580);
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
  player.setMove(keyCode, true);
}

void keyReleased() {
  player.setMove(keyCode, false);
}