class BirdMobile extends Frame{
  Frame f1;
  int len;
  PShape b1;
  PShape b2;
  float spin_speed, rotate;
  BirdMobile(int x, int y, int z, int hanging_length, float speed){
    f1 = new Frame(x, y, z, hanging_length, speed);
    len = hanging_length;
    spin_speed = speed;
    b1 = loadShape("bird.obj");
    b1.rotateZ(1.5);
    b2 = loadShape("bird.obj");
    b2.rotateZ(1.5);
    float scale = 1;
    b1.scale(scale, scale, scale);
    b2.scale(scale, scale, scale);
  }
  
  void animate(){
    f1.animate();
    
    
    pushMatrix();
    b2.rotateX(.05);
    shape(b2, len/2,len, b2.width, b2.height);
    popMatrix();

    // item 2
    pushMatrix();
    b1.rotateX(.05);
    shape(b1, len/2,-len, b1.width, b1.height);
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