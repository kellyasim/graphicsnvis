class BagelMobile extends Frame{
  Frame f1;
  int len;
  PShape b1;
  PShape b2;
  float spin_speed, rotate;
  BagelMobile(int x, int y, int z, int hanging_length, float speed){
    f1 = new Frame(x, y, z, hanging_length, speed);
    len = hanging_length;
    spin_speed = speed;
    b1 = loadShape("donut.obj");
    b1.scale(.1,.1,.1);
    b2 = loadShape("donut.obj");
    b2.scale(.2,.2,.2);
  }
  
  void animate(){
    f1.animate();
    
    
    pushMatrix();
    b2.rotateX(.05);
    //shape(shape,floatx,floaty,width,height)
    shape(b2, len/2+35,len, b2.width, b2.height);
    popMatrix();

    // item 2
    pushMatrix();
    b1.rotateX(.08);
    shape(b1, len/2+20,-len, b1.width, b1.height);
    popMatrix();
    
    //item 3
    pushMatrix();
    translate(len/2,0,len);
    rotateX(rotate*2);
    fill(150);
    box(50);
    popMatrix();
    
    //item 4
    pushMatrix();
    translate(len/2,0,-len);
    rotateX(rotate*1.5);
    fill(250);
    sphere(60);
    popMatrix();
  
    popMatrix();
    
    rotate += spin_speed;
  }
}