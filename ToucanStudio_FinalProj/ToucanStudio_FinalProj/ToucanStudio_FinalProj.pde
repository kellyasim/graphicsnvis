import processing.sound.*;
SoundFile bkgdSound;
boolean sound;
PlayerObject player;
HUD hud;
boolean pause;
int num_enemies, level;
MapElement [] levels;
MainMenu mm;
NameMenu nm;
int starttime, endtime;
// CODE TO RECORD
// boolean isRecording = false;
PFont font;

int clicked;

void setup(){
  clicked = 0;
  bkgdSound = new SoundFile(this, "PkmonCave.wav");
  bkgdSound.play();
  size(1000,1000);
  frameRate(30);
  player = new PlayerObject(100,500,500);
  level = 0;
  levels = new MapElement[3];
  for(int i=0;i<3;i++){
    levels[i] = new MapElement(player,(1+i)*3);
  }
  hud = new HUD(player, 10);
  new_frame();
  sound = true;
  pause = false;
    background(#A7CFFF);
  mm = new MainMenu();
  nm = new NameMenu();
  mm.animate();
  nm.active = false;
  

}

void draw(){
  if(mm.is_active()){
    mm.animate();
  }
  
  if(nm.is_active()) {
    nm.animate();
  }
  
  
  
  else if(!mm.active && !nm.active && !pause && player.return_lives() > 0){
    new_frame();
    player.move();
    //player.display();
  }
  //sound();
  // CODE TO RECORD
  //if(isRecording) {
  //  saveFrame();
  //}
}

void  saveTime(int time, int level) {

  Table table = new Table();
  
  table.addColumn("time");
  table.addColumn("level");
  
  TableRow newRow = table.addRow();
  newRow.setInt("time", time);
  newRow.setInt("time", level);
  
  saveTable(table, "data/scores.csv");
}


void new_frame(){
  levels[level].display();
  num_enemies = levels[level].return_num_enemies();
  endtime = millis();
  hud.display(num_enemies, level, endtime-starttime);
  if(num_enemies == 0){
    if(level == 2){
      endtime = millis();
      text("YOU WIN", 100,100);
      text("R to restart", 100, 150);
      pause = true;
      saveTime(endtime - starttime,3);
      println("***************end time*****************");
      println(endtime - starttime);
    }
    level++;
    player.reset_pos();
  }
  println(this.level);
  player.display( endtime - starttime, this.level + 1);
}

void pause(){
    fill(#A7CFFF);
  rectMode(CENTER);
  rect(500,500,1000,1000);
  fill(230);
  noStroke();
  font = createFont("8-BITWONDER.TTF", 24);
  textFont(font);
  textSize(24);

  PImage toucan = loadImage("Sprites/title.png");
  //toucan.resize(70,70);
  image(toucan,60,168);
  
  //text("ToucanStudios Presents", 100,250);

  font = createFont("8-BITWONDER.TTF", 24);
  textFont(font);
  textSize(24);
  //text("Turtlepond", 80,420);
  //text("Adventures",230,520);
  
  font = createFont("8-BITWONDER.TTF", 24);
  textFont(font);
  textSize(24);
  PImage wasd = loadImage ("Sprites/wasd.png");
  wasd.resize(200,140);
  image(wasd,70,600);
  text("Move", 130, 780);
  
  PImage j = loadImage("Sprites/j.png");
  j.resize(65,65);
  image(j,380,675);
  text("Attack", 365, 780);
  
  PImage p = loadImage("Sprites/p.png");
  p.resize(65,65);
  image(p, 580, 675);
  text("Pause", 570, 780);
  
  PImage r = loadImage("Sprites/r.png");
  r.resize(65,65);
  image(r,780,675);
  text("Restart", 760, 780);
  
  
  // CODE TO RECORDS
  //text("'R' to start/stop recording", 100, 650);
  pause = !pause;
  fill(255);
}

void sound(){
  PImage mute = loadImage ("Sprites/mute.png");
  mute.resize(70,50);
  PImage soundOn = loadImage ("Sprites/soundOn.png");
  soundOn.resize(70,50);
  if (sound){
    image(soundOn, 900,930);
    bkgdSound.play();
  }else{
    image(mute, 900,930);
    bkgdSound.stop();
  }
}

void keyPressed(){
  if(key == 'p' || key == 'P'){
    pause();
  }
  if( (key == 'j' || key == 'J') && !pause ){
    levels[level].attacked();
  }
  
  if(key == 'r' || key =='R'){
    bkgdSound.stop();
    setup();
  }
  
  if (key == 'm' || key == 'M'){
    sound = !sound;
    sound();
  }
   
   if (key == 'h' || key == 'H'){
    link("http://processing.com");
  }
   
  // CODE TO RECORD
  //if(key == 'r' || key == 'R'){
  //  isRecording = !isRecording;
  //}
  player.setMove(keyCode, true);
}



void mouseClicked(){
    mm.change_state();
    if(!mm.is_active() && clicked < 1) {
      clicked++;
      nm.active = !nm.active;
      println("dddddd");
    }
    nm.change_state();
    if(!nm.is_active() && !mm.is_active() && clicked < 2) {
      player.sprite = nm.chosen;
      clicked++;
      starttime = millis();
    }
}


void keyReleased() {
  player.setMove(keyCode, false);
}
