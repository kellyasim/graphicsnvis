class MapElement{
  PlayerObject player;
  Enemy enemy1;
  PVector player_pos;
  PVector atk_dir;
 
  ItemElement [] power_ups;
  PImage newImage;
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
    bkgd = loadImage("Sprites/background.png");
    imgCt = 6;
    
    power_ups = new ItemElement[3];
    newImage = loadImage("Sprites/sword.png");
    newImage.resize(50,50);
    power_ups[0] = new ItemElement(0, 5, newImage);
    newImage = loadImage("Sprites/apple.png");
    newImage.resize(50,50);
    power_ups[1] = new ItemElement(1, 10, newImage);
    newImage = loadImage("Sprites/heart.png");
    newImage.resize(50,50);
    power_ups[2] = new ItemElement(2, 1, newImage);
    
    turtle = new PImage[imgCt];
    turtleup = new PImage[imgCt];
    turtleleft = new PImage[imgCt];
    turtleright = new PImage[imgCt];
    turtledown = new PImage[imgCt];
    enemies = new Enemy[num_enemies];
    
    for (int i = 0; i < imgCt; i ++){
        String file = "Sprites/turtleup_0"+ nf(i,1)+ ".png";
        newImage = loadImage(file);
        newImage.resize(70,70);
        turtleup[i] = newImage;
        
        file = "Sprites/turtleleft_0"+ nf(i,1)+ ".png";
        newImage = loadImage(file);
        newImage.resize(70,70);
        turtleleft[i] = newImage;
        
        file = "Sprites/turtledown_0"+ nf(i,1)+ ".png";
        newImage = loadImage(file);
        newImage.resize(70,70);
        turtledown[i] = newImage;
        
        file = "Sprites/turtleright_0"+ nf(i,1)+ ".png";
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
    
    if(frameCount % 500 == 0){
      spawn_powerup();
    }
    for(ItemElement elt : power_ups){
      elt.display();
      if( check_player_enemy_collision(elt.return_pos()) ){
        println("item collected");
        elt.go_away();
        player.upgrade(elt.type, elt.boost);
      }   
    }
    
    println("*******************");
    println(player.damage);
    println("**********************");
    
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
        enemy1.damage( player.return_damage() );
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
  
  void spawn_powerup(){
    int rand = int(random(3));
    int randx = int(random(100,900));
    int randy = int(random(100,700));
    power_ups[rand].set_pos(randx, randy);
  }
 
}