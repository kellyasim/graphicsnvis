class PlayerObject extends EntityObject {
    //0 = north, 1 = east, 2 = south, 3 = west
    int direction;
    PVector swing_direction;
    PVector swing_render;
    PImage[] weapon;
    boolean isLeft, isRight, isUp, isDown;
    int x, y;
    PImage sprite;

    int w;
    int h;
    int sX;
    int sY;
    int s;
    int row;
  int highTime;
  int highLevel;
    boolean isMoving;
    
    
    
    
    PlayerObject(int health, int xpos, int ypos) {
        super(health, xpos, ypos);
        row = 192;
    highTime = 999999;
    highLevel = 0;
        w = 64;
        h = 64;
        sX = 64;
        sY = 64;
        s = 0;
        sprite = loadImage("Sprites/sprite_girl.png");
        speed = 5;
        lives = 3;
        damage = 25;
        swing_direction = new PVector(0, 0);
        swing_render = new PVector(0,0);
        weapon = new PImage[4];
        for (int i = 0; i < 4; i++) {
            String file = "Sprites/bolt_" + nf(i, 1) + ".png";
            PImage newImage = loadImage(file);
            switch (i) {
                case 0:
                    newImage.resize(30, 70);
                    break;
                case 1:
                    newImage.resize(70, 30);
                    break;
                case 2:
                    newImage.resize(30, 70);
                    break;
                case 3:
                    newImage.resize(70, 30);
                    break;
                default:
                    break;
            }
            weapon[i] = newImage;
        }
    }

    int return_lives() {
        return lives;
    }

    void  saveTime(int time, int level) {
      loadTime();
      Table table = new Table();
      
      table.addColumn("time");
      table.addColumn("level");
      if((highLevel < level)) {
        highTime = time;
      } else if (highLevel == level) {
      
       highTime = (highTime <= time)? time : highLevel;
      }
      highLevel = (highLevel <= level)? level : highLevel;
      TableRow newRow = table.addRow();
      newRow.setInt("time", highTime);
      newRow.setInt("level", highLevel);
      
      saveTable(table, "data/scores.csv");
    }

    void loadTime() {
  
    try{
      Table table = loadTable("data/scores.csv", "header");
  
    println(table.getRowCount() + " total rows in table"); 
  
    if(table.getRowCount() > 0) {
      for (TableRow row : table.rows()) {
      
      int time = row.getInt("time");
      int level = row.getInt("level");
      
      if((highLevel < level)) {
        highTime = time;
      } else if (highLevel == level) {
      
       highTime = (highTime <= time)? time : highLevel;
      }
      highLevel = (highLevel <= level)? level : highLevel;
      
      println("Time " + time + "  LEVEL " + level);
    }
    }
    } catch(Exception e) {
      println("Nothing");
    }
    
  }


    void display(int time, int level) {
        if (alive) {
            s = animate(s, row);
        } else {
            fill(255, 0, 0);
            textSize(65);
            text("Game Over", 200, 400);
            textSize(45);
            text("Press R to restart", 100, 500);
            saveTime(time, level);
              
        }
      
            
            fill(255);
        }
   

    PVector attack(){
    
      switch(direction){
        case 0:
              swing_direction.x = position.x;
              swing_direction.y = position.y - 70;
              swing_render.x = swing_direction.x;
              swing_render.y = swing_direction.y;

              break;
        case 1:
              swing_direction.x = position.x - 70;
              swing_direction.y = position.y;
              swing_render.x = swing_direction.x;
              swing_render.y = swing_direction.y;

              break;
        case 2:
              swing_direction.x = position.x;
              swing_direction.y = position.y + 140;
              swing_render.x = position.x;
              swing_render.y = position.y + 70;

              break;
        case 3:
              swing_direction.x = position.x + 140;
              swing_direction.y = position.y;
              swing_render.x = position.x + 70;
              swing_render.y = position.y;

              break;
        default:
          break;
    }
      
      image(weapon[direction], swing_render.x, swing_render.y);
      println("**************attacked************");
      println(position.x, " ", position.y);
      println(swing_render.x, " ", swing_render.y);
      println(swing_direction.x, " ", swing_direction.y);
      return(swing_direction);

    }

    void move() {
        int r = 50 >> 1;
        position.x = constrain(position.x + speed * (int(isRight) - int(isLeft)), 0, 936);
        position.y = constrain(position.y + speed * (int(isDown) - int(isUp)), 0, 736);
    }

    int animate(int val, int location) {
      //hitbox check
      //rect(position.x, position.y, 64, 64);
      
        sX = val;
        sY = location;
        if (sX > 192) {
            sX = 0;
        }
        copy(this.sprite, sX, sY, w, h, int(position.x), int(position.y), 64, 64);
        if(!keyPressed) {
          return 0;
        }
        if (frameCount % 2 == 0) {
            return sX + 64;
        } else {
            return sX;
        }
        
    }


    boolean setMove(int k, boolean b) {
        switch (k) {
            case 'W':
            case UP:
                row = 192;
                direction = 0;
                return isUp = b;

                  
            case 'S':
            case DOWN:
                row = 0;
                direction = 2;
                return isDown = b;

            case 'A':
            case LEFT:
                row = 64;
                direction = 1;
                return isLeft = b;

            case 'D':
            case RIGHT:
                row = 128;
                direction = 3;
                return isRight = b;

            default:
                //row = (isDown)? 0 : 192;
                return b;
        }
    }
    
    void upgrade(int type, int boost){
      switch(type){
        case 0:
          damage += boost;
          break;
        case 1:
          hp += boost;
          break;
        case 2:
          lives += boost;
          break;
        default:
          break;
      } 
    }
    
    void reset_pos(){
      position.x = 500;
      position.y = 500;
    
    }
}
