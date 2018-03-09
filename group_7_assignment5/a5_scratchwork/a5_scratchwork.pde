AbelMobile m1;

void setup() {
  size(1000, 1000, P3D);
  m1 = new AbelMobile(0,-400,-20, 100, 2*PI/80);
}

void draw() {
  camera(400, 50, 300,
         mouseX, mouseY, 0,
         0, 1, 0);
  
  draw_background();
  m1.animate();
}
 
void draw_background(){
  fill(#F0EAD6);
  translate(400,300,-200);
  box(900);
  translate(0,0,0);
}