class Frame{
  //poles necessary for 8 hanging items
  Cylinder[] wires = new Cylinder[19];
  float rotate;
  float rotation_speed;
  
  //coordinates for top of first pole
  int xpos, ypos, zpos;
  float cyl_height;
  
  Frame(){  }
  
  Frame(int x, int y, int z, int hanging_length, float speed){
    xpos = x;
    ypos = y;
    zpos = z;
    cyl_height = hanging_length;
    rotation_speed = speed;
    wires[0] = new Cylinder(2, 2, hanging_length, 10);
    wires[1] = new Cylinder(2, 2, hanging_length*2, 10);
    wires[2] = new Cylinder(2, 2, hanging_length*2, 10);
    wires[3] = new Cylinder(2, 2, hanging_length/2, 10); 
    wires[4] = new Cylinder(2, 2, hanging_length/2, 10); 
    wires[5] = new Cylinder(2, 2, hanging_length/2, 10); 
    wires[6] = new Cylinder(2, 2, hanging_length/2, 10); 
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
    
    //arm 1
    pushMatrix();
    translate(cyl_height/4, cyl_height, 0);
    rotateZ(PI/2);
    wires[3].display();
    rotateX(rotate);
    popMatrix();
    
    //arm 2
    pushMatrix();
    translate(cyl_height/4, -cyl_height, 0);
    rotateZ(PI/2);
    wires[4].display();
    rotateX(rotate);
    popMatrix();
    
    //arm 3
    pushMatrix();
    translate(cyl_height/4, 0, cyl_height);
    rotateZ(PI/2);
    wires[5].display();
    rotateX(rotate);
    popMatrix();
    
    //arm 4
    pushMatrix();
    translate(cyl_height/4, 0, -cyl_height);
    rotateZ(PI/2);
    wires[6].display();
    rotateX(rotate);
    popMatrix();
    
    //popMatrix();
    
    rotate += rotation_speed;
  }
  
}