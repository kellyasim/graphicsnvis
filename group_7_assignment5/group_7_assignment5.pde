AbelMobile m1;
BirdMobile m2;
BagelMobile m3;

void setup() {
  size(1500, 1000, P3D);
  //___Mobile(int x, int y, int z, int hanging_length, float speed){

  m1 = new AbelMobile(-230,-400,-20, 80, 2*PI/200);
  
  m2 = new BirdMobile(250,-380,-20, 110, 2*PI/200);
  
  m3 = new BagelMobile(-100, -350, -60, 170, -2*PI/400);
}

void draw() {
  camera(400, 50, 300,
         400, 90, 100,
         0, 1, 0);
  draw_background();
  m1.animate();
  m2.animate();
  m3.animate();
}
 
void draw_background(){
  fill(#F0EAD6);
  translate(400,300,-200);
  box(1000);
  translate(0,0,0);
}