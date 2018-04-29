class MapElement{
  PlayerObject player;
  Enemy enemy1;
  PVector player_pos;
  PVector atk_dir;

  PImage bkgd;
  PImage [] turtleup; 
  PImage [] turtledown; 
  PImage [] turtleleft; 
  PImage [] turtleright;
  PImage [] turtle;
  Enemy [] enemies;
  int imgCt;
  int frame;
  int direction;
  
  
  MapElement(PlayerObject p, int num_enemies){
    bkgd = loadImage("sand_bkgd.jpg");
    imgCt = 6;
    turtle = new PImage[imgCt];
    turtleup = new PImage[imgCt];
    turtleleft = new PImage[imgCt];
    turtleright = new PImage[imgCt];
    turtledown = new PImage[imgCt];
    enemies = new Enemy[num_enemies];
    
    for (int i = 0; i < imgCt; i ++){
        String file = "turtleup_0"+ nf(i,1)+ ".png";
        PImage newImage = loadImage(file);
        newImage.resize(70,70);
        turtleup[i] = newImage;
        
        file = "turtleleft_0"+ nf(i,1)+ ".png";
        newImage = loadImage(file);
        newImage.resize(70,70);
        turtleleft[i] = newImage;
        
        file = "turtledown_0"+ nf(i,1)+ ".png";
        newImage = loadImage(file);
        newImage.resize(70,70);
        turtledown[i] = newImage;
        
        file = "turtleright_0"+ nf(i,1)+ ".png";
        newImage = loadImage(file);
        newImage.resize(70,70);
        turtleright[i] = newImage;
    }
    
    for(int i=0;i<num_enemies;i++){
      enemies[i] = new Enemy(50, 300, i*60+50, 100);
    }
    player = p;
    player_pos = player.return_position();
  }
  
  void display(){
    //rectMode(CORNER);
    //rect(0,0,1000,800);
    image(bkgd,0,0); 
    image(bkgd,280,0); 
    image(bkgd,560,0); 
    image(bkgd,840,0); 
    image(bkgd,0,280); 
    image(bkgd,280,280); 
    image(bkgd,560,280); 
    image(bkgd,840,280); 
    image(bkgd,0,560); 
    image(bkgd,280,560); 
    image(bkgd,560,560); 
    image(bkgd,840,560); 
    
    //move enemies in the map
   
    for(Enemy enemy1 : enemies){
      direction = enemy1.return_direction();
      switch(direction){
        case 0:
          turtle = turtleup;
          break;
        case 1:
          turtle = turtleleft;
          break;
        case 2:
          turtle = turtledown;
          break;
        case 3:
          turtle = turtleright;
          break;
        default:
          break;
      }
      enemy1.animate(player_pos, turtle);
      
      //check if any enemies touched the player
      if( check_player_enemy_collision(enemy1.return_position()) ){
        player.damage(enemy1.return_damage());
        player.recoil(enemy1.return_position(), 15);
      }   
    }
  }
  
  void attacked(){
    atk_dir = player.attack();
    for(Enemy enemy1 : enemies){
      if( check_atk_enemy(enemy1.return_position()) ){
        enemy1.damage(25);
        enemy1.recoil(player_pos, 15);
      }
    }
  }
  
  int return_num_enemies(){
    num_enemies = 0;
    for(Enemy enemy1 : enemies){
      if(enemy1.is_alive()){
        num_enemies++;
      }
    }
    return num_enemies;
  }
  
  boolean check_atk_enemy(PVector pos){
    return atk_dir.x < pos.x + 25 && 
           atk_dir.x > pos.x - 25 && 
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
