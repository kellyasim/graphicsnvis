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
    boolean isMoving;
    
    PlayerObject(int health, int xpos, int ypos) {
        super(health, xpos, ypos);
        row = 192;
        w = 64;
        h = 64;
        sX = 64;
        sY = 64;
        s = 0;
        sprite = loadImage("Sprites/sprite_boy.png");
        speed = 5;
        lives = 3;
        damage = 25;
        swing_direction = new PVector(0, 0);
        swing_render = swing_direction;
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

    void display() {
        if (alive) {
            s = animate(s, row);
        } else {
            fill(255, 0, 0);
            textSize(100);
            text("Game Over", 200, 400);
            text("'R' to restart", 200, 500);
            fill(255);
        }
    }

    PVector attack(){
    
      switch(direction){
        case 0:
          swing_direction.x = position.x;
              swing_direction.y = position.y - 70;
              swing_render = swing_direction;

              break;
        case 1:
              swing_direction.x = position.x - 70;
              swing_direction.y = position.y;
              swing_render = swing_direction;

              break;
        case 2:
              swing_direction.x = position.x;
              swing_direction.y = position.y + 70;
              swing_render = position;

              break;
        case 3:
              swing_direction.x = position.x + 70;
              swing_direction.y = position.y;
              swing_render = position;

              break;
        default:
          break;
    }
      
      image(weapon[direction], swing_render.x, swing_render.y);
      return(swing_direction);

    }

    void move() {
        int r = 50 >> 1;
        position.x = constrain(position.x + speed * (int(isRight) - int(isLeft)), 0, 936);
        position.y = constrain(position.y + speed * (int(isDown) - int(isUp)), 0, 736);
    }

    int animate(int val, int location) {
      //hitbox check
      rect(position.x, position.y, 64, 64);
      
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
                row = (isDown)? 0 : 192;
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