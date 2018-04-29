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
        isMoving = false;
        row = 192;
        w = 64;
        h = 64;
        sX = 64;
        sY = 64;
        s = 0;
        sprite = loadImage("sprite_boy.png");
        speed = 5;
        lives = 3;
        swing_direction = new PVector(0, 0);
        swing_render = swing_direction;
        weapon = new PImage[4];
        for (int i = 0; i < 4; i++) {
            String file = "bolt_" + nf(i, 1) + ".png";
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
    
    if(isUp){
      swing_direction.x = position.x;
          swing_direction.y = position.y - 70;
          swing_render = swing_direction;
          direction = 0;
    }
    if(isLeft){
          swing_direction.x = position.x - 70;
          swing_direction.y = position.y;
          swing_render = swing_direction;
          direction = 1;
    }
    if(isDown){
          swing_direction.x = position.x;
          swing_direction.y = position.y + 70;
          swing_render = position;
          direction = 2;
    }
    if(isRight){
          swing_direction.x = position.x + 70;
          swing_direction.y = position.y;
          swing_render = position;
          direction = 3;
    }
    
    image(weapon[direction], swing_render.x, swing_render.y);
    return(swing_direction);

    }

    void move() {
        int r = 50 >> 1;
        position.x = constrain(position.x + speed * (int(isRight) - int(isLeft)), r, width - r);
        position.y = constrain(position.y + speed * (int(isDown) - int(isUp)), r, height - r);
    }

    int animate(int val, int location) {
        sX = val;
        sY = location;
        if (sX > 192) {
            sX = 0;
        }
        copy(this.sprite, sX, sY, w, h, int(position.x), int(position.y), 64, 64);
        if(isMoving) {
          return 0;
        }
        if (frameCount % 10 == 0) {
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
                return isUp = b;

            case 'S':
            case DOWN:
                row = 0;
                return isDown = b;

            case 'A':
            case LEFT:
                row = 64;
                return isLeft = b;

            case 'D':
            case RIGHT:
                row = 128;
                return isRight = b;

            default:
                row = (isDown)? 0 : 192;
                isMoving = b;
                return b;
        }
    }
}