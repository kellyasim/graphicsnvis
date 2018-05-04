class TurtleFlipper {
  PShape s;
  PVector location;
  public TurtleFlipper(String image) {
    s = loadShape(image);
  }
  
  public void animate(PVector loc) {
    location = loc.copy();
    if(frameCount % 32 == 0) {
      location.x += ((int(random(2.0))) % 2 == 0 )? 2 : -2;
      location.y += ((int(random(2.0))) % 2 == 0 )? 2 : -2;
      location.x -=2;
      location.y -=2;
      shape(s, location.x, location.y);
    } else {
      shape(s, location.x, location.y);
    }
  }
}
