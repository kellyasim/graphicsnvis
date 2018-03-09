class AbelMobile extends Frame{
  Frame f1;
  int len;
  AbelMobile(int x, int y, int z, int hanging_length, float speed){
    f1 = new Frame(x, y, z, hanging_length, speed);
    len = hanging_length;
  }
  
  void animate(){
    f1.animate();
    
    //item 1
    pushMatrix();
    translate(len/2,len,0);
    rotate(rotate*100);
    fill(0);
    box(30);
    popMatrix();
    
    //item 2
    pushMatrix();
    translate(len/2,-len,0);
    fill(50);
    box(40);
    popMatrix();
    
    //item 3
    pushMatrix();
    translate(len/2,0,len);
    fill(100);
    box(50);
    popMatrix();
    
    //item 4
    pushMatrix();
    translate(len/2,0,-len);
    fill(150);
    box(60);
    popMatrix();
  
    popMatrix();
  }
}