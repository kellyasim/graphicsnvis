class Cylinder{
  int end1, end2, center;
  float angle;
  float[] x;
  float[] z;
  float[] x2;
  float[] z2;
  float h;
  /**
  cylinder taken from http://wiki.processing.org/index.php/Cylinder
  @author matt ditton
  @modified by Abbas Noureddine, to draw a cone with specified width, dimeter of both
  top and bottom. (if top == bottom, then you have a cylinder)
  plus added a translation to draw the cone at the center of the bottom side
  */
  
  
  Cylinder(float bottom, float top, float cyl_height, int sides){
    
    pushMatrix();
    translate(0,h/2,0);
    
    h = cyl_height;
    x = new float[sides+1];
    z = new float[sides+1];
    x2 = new float[sides+1];
    z2 = new float[sides+1];
  
    //get the x and z position on a circle for all the sides
    for(int i=0; i < x.length; i++){
      angle = TWO_PI / (sides) * i;
      x[i] = sin(angle) * bottom;
      z[i] = cos(angle) * bottom;
    }
    for(int i=0; i < x.length; i++){
      angle = TWO_PI / (sides) * i;
      x2[i] = sin(angle) * top;
      z2[i] = cos(angle) * top;
    }
   
    //draw the bottom of the cylinder
    beginShape(TRIANGLE_FAN);
    vertex(0,   -h/2,    0);
    for(int i=0; i < x.length; i++){
      vertex(x[i], -h/2, z[i]);
    }
    endShape();
   
    //draw the center of the cylinder
    beginShape(QUAD_STRIP); 
    for(int i=0; i < x.length; i++){
      vertex(x[i], -h/2, z[i]);
      vertex(x2[i], h/2, z2[i]);
    }
    endShape();
   
    //draw the top of the cylinder
    beginShape(TRIANGLE_FAN); 
    vertex(0,   h/2,    0);
    for(int i=0; i < x.length; i++){
      vertex(x2[i], h/2, z2[i]);
    }
    endShape();
    
    popMatrix();
  }
  
  void display(){
    pushMatrix();    
    //draw the bottom of the cylinder
    beginShape(TRIANGLE_FAN);
    vertex(0,   -h/2,    0);
    for(int i=0; i < x.length; i++){
      vertex(x[i], -h/2, z[i]);
    }
    endShape();
   
    //draw the center of the cylinder
    beginShape(QUAD_STRIP); 
    for(int i=0; i < x.length; i++){
      vertex(x[i], -h/2, z[i]);
      vertex(x2[i], h/2, z2[i]);
    }
    endShape();
   
    //draw the top of the cylinder
    beginShape(TRIANGLE_FAN); 
    vertex(0,   h/2,    0);
    for(int i=0; i < x.length; i++){
      vertex(x2[i], h/2, z2[i]);
    }
    endShape();
    popMatrix();
  }
  
}