Table table;
pillars[] trees;
int treeHeight, volume, girth, id;

void setup() {
  size(800,700,P3D);
  
  table = loadTable("trees.csv", "header");
  
  int rownumber = table.getRowCount();
  trees = new pillars[rownumber];
  for (TableRow row : table.rows()) {
    id = row.getInt("id");
    girth = row.getInt("Girth");
    treeHeight = row.getInt("Height");
    volume = row.getInt("Volume");
    trees[id-1] = new pillars(volume, girth, treeHeight);
    println("#" + id + " (" + girth, treeHeight, volume + ")");
  }
}

void draw(){
  background (110);
  int focusx = mouseX - 100;
  int focusy = -mouseY + 100;
  camera(-50, 200, -150, //camera position
         focusx, focusy, 150, //focus point
         0, -1, 0); //up
         
  line( 0, 0, 0, 0, 1000, 0); //x axis
  pushMatrix();
  rotateX(3*PI/2);
  text("Volume of timber in cubic feet", 10,0,-20);
  rotateX(-3*PI/2);
  popMatrix();
  
  line( 0, 0, 0, 1000, 0, 0); //y axis
  pushMatrix();
  rotateX(PI);
  text("Tree Diameter in inches", 5,-10,0);
  rotateX(-PI);
  popMatrix();
  
  line( 0, 0, 0, 0, 0, 1000); //z axis
  pushMatrix();
  rotateX(3*PI/2);
  rotateZ(PI/2);
  text("Tree Height in feet", -175,0,-50);
  rotateX(-3*PI/2);
  rotateZ(-PI/2);
  popMatrix();
  
  for (pillars tree: trees){
   tree.display(); 
  }

}
//void draw_background(){
//  fill(#F0EAD6);
//  translate(400,200,-200);
//  box(1000);
//  translate(0,0,0);
//}