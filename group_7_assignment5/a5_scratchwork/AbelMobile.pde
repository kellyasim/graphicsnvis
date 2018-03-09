class AbelMobile extends Frame{
  Frame f1;
  AbelMobile(int x, int y, int z, int hanging_length, float speed){
    f1 = new Frame(x, y, z, hanging_length, speed);
  }
  
  void animate(){
    f1.animate();
    
    //item 1
    pushMatrix();
    translate(50,100,0);
    rotate(rotate*100);
    fill(0);
    box(30);
    popMatrix();
    
    //item 2
    pushMatrix();
    translate(50,-100,0);
    fill(50);
    box(40);
    popMatrix();
    
    //item 3
    pushMatrix();
    translate(50,0,100);
    fill(100);
    box(50);
    popMatrix();
    
    //item 4
    pushMatrix();
    translate(50,0,-100);
    fill(150);
    box(60);
    popMatrix();
  
    popMatrix();
  }
}