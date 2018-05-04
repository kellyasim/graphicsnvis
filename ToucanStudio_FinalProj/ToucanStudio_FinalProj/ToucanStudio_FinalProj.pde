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
//boolean isRecording = false;
PFont font;


void setup(){
  
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
  mm = new MainMenu();
  nm = new NameMenu();
  mm.animate();
  

}

void draw(){
  if(mm.is_active()){
    mm.animate();
    println(mm.is_active());
  }
  
  else if(nm.active) {
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
      println("***************end time*****************");
      println(endtime - starttime);
    }
    level++;
    player.reset_pos();
  }

  player.display();
}

void pause(){
  fill(0,0,0,190);
  rectMode(CENTER);
  rect(500,500,1000,1000);
  fill(230);
  noStroke();
  font = createFont("8-BITWONDER.TTF", 24);
  textFont(font);
  textSize(24);

  PImage toucan = loadImage("Sprites/toucan.png");
  toucan.resize(70,70);
  image(toucan,60,168);
  
  text("ToucanStudios Presents:", 100,250);

  font = createFont("8-BITWONDER.TTF", 24);
  textFont(font);
  textSize(24);
  text("Turtlepond", 80,420);
  text("Adventures",230,520);
  
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
  println(key);
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
   
  // CODE TO RECORD
  //if(key == 'r' || key == 'R'){
  //  isRecording = !isRecording;
  //}
  player.setMove(keyCode, true);
}
void mouseClicked(){
    mm.change_state();
    if(!mm.is_active()) {
      nm.active = !nm.active;
    }
    nm.change_state();
    starttime = millis();
}


void keyReleased() {
  player.setMove(keyCode, false);
}