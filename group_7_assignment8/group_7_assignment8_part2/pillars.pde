class pillars{
  float xpos, zpos;
  float pill_height;
  
  pillars(){  }
  
  pillars(float x, float y, float z){
    xpos = (x-5)*10;
    pill_height = y*10;
    zpos = (z-60)*20 ;
  }
  
  void display (){
    pushMatrix();
    fill(255);
    translate(xpos,pill_height/2, zpos);
    box(10,pill_height,10);
    noFill();
    popMatrix();
  }
  
}