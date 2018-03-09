class AbelMobile extends Frame{
  Frame f1;
  int len;
  float spin_speed, rotate;
  AbelMobile(int x, int y, int z, int hanging_length, float speed){
    f1 = new Frame(x, y, z, hanging_length, speed);
    len = hanging_length;
    spin_speed = speed;
  }
  
  void animate(){
    f1.animate();
    
    //item 1
    pushMatrix();
    translate(len/2,len,0);
    rotateX(rotate/2);
    fill(0);
    box(30);
    popMatrix();
    
    //item 2
    pushMatrix();
    translate(len/2,-len,0);
    rotateX(rotate);
    fill(50);
    box(40);
    popMatrix();
    
    //item 3
    pushMatrix();
    translate(len/2,0,len);
    rotateX(rotate*2);
    fill(100);
    box(50);
    popMatrix();
    
    //item 4
    pushMatrix();
    translate(len/2,0,-len);
    rotateX(rotate*1.5);
    fill(150);
    box(60);
    popMatrix();
  
    popMatrix();
    
    rotate += spin_speed;
  }
}