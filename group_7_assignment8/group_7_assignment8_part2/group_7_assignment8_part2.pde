Table table;
pillars[] trees;
int treeHeight, volume, girth, id;
Boolean birdEye = false;
int camx,camy,camz,focusx,focusy,focusz;

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
  if (birdEye==false){
    focusx = mouseX - 100;
    focusy = -mouseY + 100;
  }

  camera(camx, camy, camz, //camera position
         focusx, focusy, focusz, //focus point
         0, -1, 0); //up
  
  pushMatrix();  //creating floor of graph
  rotateX(PI/2);
  fill(#FCDEB5);         
  rect(0,0,800,800);
  noFill();
  popMatrix();
  
  fill(0);
  line( 0, 0, 0, 0, 500, 0); //x axis
  pushMatrix();
  rotateX(3*PI/2);
  text("Volume of timber in cubic feet", 35,0,-40);
  rotateX(-3*PI/2);
  popMatrix();
  
  line( 0, 0, 0, 500, 0, 0); //y axis
  pushMatrix();
  rotateX(PI);
  text("Tree Diameter in inches", 20,-20,0);
  rotateX(-PI);
  popMatrix();
  
  line( 0, 0, 0, 0, 0, 500); //z axis
  pushMatrix();
  rotateX(3*PI/2);
  rotateZ(PI/2);
  text("Tree Height in feet", -175,10,-50);
  rotateX(-3*PI/2);
  rotateZ(-PI/2);
  popMatrix();
  
  for (pillars tree: trees){
   tree.display(); 
  }

}
void mouseClicked(){
  println("boop");
  if (birdEye == false){
    println("pls work");
    camx=400; camy=1000; camz=400;
    focusx=400; focusy=0; focusz=400;
    birdEye = true;
    
  } else{
    camx=-50; camy=150; camz=-100;
    focusz=150;
    birdEye = false;
  }
}