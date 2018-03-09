class AbelMobile extends Frame{
  Frame f1;
  AbelMobile(int x, int y, int z, int hanging_length, float speed){
    f1 = new Frame(x, y, z, hanging_length, speed);
  }
  
  void animate(){
    f1.animate();
    translate(50,100,0);
    //rotateZ(rotation_speed);
    fill(0);
    box(30);
    
    translate(0,100,50);
    fill(50);
    box(40);
  
    //popMatrix();
    popMatrix();
  }
}