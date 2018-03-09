class Frame{
  //poles necessary for 8 hanging items
  Cylinder[] wires = new Cylinder[19];
  float rotate;
  
  //coordinates for top of first pole
  int xpos, ypos, zpos;
  float cyl_height;
  
  Frame(int x, int y, int z, int hanging_length){
    xpos = x;
    ypos = y;
    zpos = z;
    cyl_height = hanging_length;
    wires[0] = new Cylinder(5, 5, hanging_length, 10);
    wires[1] = new Cylinder(5, 5, hanging_length*2.5, 10);
    wires[2] = new Cylinder(5, 5, hanging_length*2.5, 10);
  }
  
  void animate(){
    pushMatrix();
    translate(xpos, ypos, zpos);
    rotateY(rotate);
    wires[0].display();
    popMatrix();
    
    pushMatrix();
    translate(xpos, ypos+cyl_height/2, zpos);
    rotateZ(PI/2);
    rotateX(rotate);
    wires[1].display();
    popMatrix();
    
    pushMatrix();
    translate(xpos, ypos+cyl_height/2, zpos);
    rotateZ(PI/2);
    rotateX(rotate+PI/2);
    wires[1].display();
    popMatrix();
    rotate += 2*PI/96;
  }
  
}