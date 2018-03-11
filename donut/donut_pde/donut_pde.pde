PShape donut;
float rotation = 0;

void setup() {
  size(500, 500, P3D); 
  donut = loadShape("donut.obj");
  donut.scale(.5, .5, .5);

}
void draw() {
  background(0);
  lights();
  fill(100,200,50);
  pushMatrix();
  translate(width/2+25, height/2, 0);
  rotate(radians(90));
  rotateX(rotation);
  rotation += 2*PI/60;
  shape(donut, 0, 0, donut.width, donut.height);
  popMatrix();
}