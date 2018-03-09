Frame test;
Cylinder c1;
void setup() {
  size(1000, 1000, P3D);
  test = new Frame(0,-400,-20, 100);
}

void draw() {
  camera(400, 150, 300,
         mouseX, mouseY, 0,
         0, 1, 0);
  
  draw_background();
  test.animate();
}
 
void draw_background(){
  fill(#F0EAD6);
  translate(400,300,-200);
  box(900);
  translate(0,0,0);
  //sphere(50);
}