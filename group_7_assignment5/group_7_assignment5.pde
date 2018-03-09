AbelMobile m1;

void setup() {
  size(1000, 1000, P3D);
  m1 = new AbelMobile(-100,-400,-20, 110, 2*PI/200);
}

void draw() {
  camera(400, 50, 300,
         400, 90, 100,
         0, 1, 0);
  draw_background();
  m1.animate();
}
 
void draw_background(){
  fill(#F0EAD6);
  translate(400,300,-200);
  box(1000);
  translate(0,0,0);
}