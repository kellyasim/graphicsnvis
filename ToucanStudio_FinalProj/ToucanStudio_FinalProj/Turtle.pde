class Turtle {
  PShape turtle;
  TurtleHead h;
  TurtleFlipper fl;
  TurtleFlipper fr;
  TurtleFlipper rl;
  TurtleFlipper rr;
  PVector location;
  public Turtle(int x, int y) {
    h = new TurtleHead();
    fl = new TurtleFlipper("Sprites/turtle_front_left.svg");
    fr = new TurtleFlipper("Sprites/turtle_front_right.svg");
    rl = new TurtleFlipper("Sprites/turtle_rear_left.svg");
    rr = new TurtleFlipper("Sprites/turtle_rear_right.svg");
    turtle = loadShape("Sprites/turtle_body.svg");
    location = new PVector(x,y);
  }
  
  public void animate() {
    if(frameCount % 8 == 0) {
      location.x += ((int(random(2.0))) % 2 == 0 )? 1 : -1;
      location.y += ((int(random(2.0))) % 2 == 0 )? 1 : -1;
      location.x --;
      location.y --;
      fl.animate(location);
      fr.animate(location);
      rl.animate(location);
      rr.animate(location);
      h.animate(location);
      shape(turtle, location.x, location.y);
    } else {
      fl.animate(location);
      fr.animate(location);
      rl.animate(location);
      rr.animate(location);
      h.animate(location);
      shape(turtle, location.x, location.y);
    }
  }
}
