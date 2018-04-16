class pillars{
  float xpos, zpos;
  float pill_height;
  
  pillars(){  }
  
  pillars(float x, float y, float z){
    xpos = x;
    pill_height = y;
    zpos = z;
  }
  
  void display (){
    pushMatrix();
    translate(xpos,0, zpos);
    box(10,pill_height,10);
    popMatrix();
  }
  
}