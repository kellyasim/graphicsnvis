class pillars{
  float xpos, zpos;
  float pill_height;
  
  pillars(){  }
  
  pillars(float x, float y, float z){
    xpos = x*10;
    pill_height = y*10;
    zpos = z*10;
  }
  
  void display (){
    pushMatrix();
    translate(xpos,0, zpos);
    box(20,pill_height,20);
    popMatrix();
  }
  
}