class TurtleHead {
  PShape turtle;
  PVector location;
  public TurtleHead() {
    turtle = loadShape("Sprites/turtle_head.svg");
  }
  
  public void animate(PVector loc) {
    location = loc.copy();
    if(frameCount % 8 == 0) {
      location.x += ((int(random(2.0))) % 2 == 0 )? 2 : -2;
      location.y += ((int(random(2.0))) % 2 == 0 )? 2 : -2;
      location.x -=2;
      location.y -=2;
      shape(turtle, location.x, location.y);
    } else {
      shape(turtle, location.x, location.y);
    }
  }
}
