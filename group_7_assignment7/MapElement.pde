class MapElement{
  PlayerObject player;
  Enemy enemy1;
  PVector player_pos;
  PVector atk_dir;
  PImage [] turtle;
  int imgCt;
  int frame;
  
  
  MapElement(PlayerObject p){
    imgCt = 6;
    turtle = new PImage[imgCt];
    enemy1 = new Enemy(50,300,700,200);
    
      for (int i = 0; i < imgCt; i ++){
        String file = "turtle_0"+ nf(i,1)+ ".png";
        PImage newImage = loadImage(file);
        newImage.resize(70,70);
        turtle[i] = newImage;
      }
    player = p;
    player_pos = player.return_position();
  }
  
  void display(){
    rectMode(CORNER);
    rect(0,0,1000,800);
    
    //wall
    rect(50,50, 50, 300);
    
    //move enemies in the map
    enemy1.animate(player_pos, turtle);
    
    //check if any enemies touched the player
    if( check_player_enemy_collision(enemy1.return_position()) ){
      player.damage(enemy1.return_damage());
      player.recoil(enemy1.return_position(), 15);
    }    
  }
  
  void attacked(){
    atk_dir = player.attack();
    if( check_player_enemy_collision(enemy1.return_position()) ){
      enemy1.damage(25);
      enemy1.recoil(player_pos, 15);
    };
  }
  
  boolean check_atk_enemy(PVector pos){
    return atk_dir.x < pos.x + 25 && 
           atk_dir.x > pos.x - 25&& 
           atk_dir.y < pos.y + 25 && 
           atk_dir.y > pos.y - 25;
  }

  boolean check_player_enemy_collision(PVector pos){
    return player_pos.x < pos.x + 25 && 
           player_pos.x + 25 > pos.x && 
           player_pos.y < pos.y + 25 && 
           player_pos.y + 25 > pos.y;
  }
}