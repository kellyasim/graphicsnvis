Table table;
pillars[] trees;
int treeHeight, volume, girth, id;
Boolean birdEye = true;
int camx,camy,camz,focusx,focusy,focusz,i,j;

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
         
  if (birdEye==true) {
    translate(700,0,100);
    rotateY(3*PI/2); 
    //text();
    for (i=00;i<800;i+=50){
      line(i,0,0,i,0,800); 
    }
    for (j = 0;j<800;j+=50){
      line(0,0,j,800,0,j);
    }
  }
  pushMatrix();  //creating floor of graph
  rotateX(PI/2);
  fill(#FCDEB5);         
  rect(0,0,800,800);
  noFill();
  popMatrix();
  
  textAlign(CENTER,TOP); //axis label
  
  fill(0);
  line( 0, 0, 0, 0, 500, 0); //x axis
  pushMatrix();
  
  rotateX(3*PI/2);
  textSize(20);
  text("10.2",5,0,-10);
  textSize(50);  
  text("Volume of Timber in cubic feet", 400,0,0);
  rotateX(-3*PI/2);
  popMatrix();
  
  line( 0, 0, 0, 500, 0, 0); //y axis
  pushMatrix();
  rotateX(PI);
  textSize(20);
  text("8.3",25,-20,-10);
  textSize(30); 
  text("Tree Diameter in inches", 200,-50,-10);
  rotateX(-PI);
  popMatrix();
  
  line( 0, 0, 0, 0, 0, 500); //z axis
  pushMatrix();
  rotateX(3*PI/2);
  rotateZ(PI/2);
  textSize(20);
  text("63",-10,0,0);
  textSize(50);
  text("Tree Height in feet", -300,10,0);
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
    pushMatrix();
    camx=400; camy=1100; camz=400;
    focusx=370; focusy=0; focusz=400;
    popMatrix();
    birdEye = true;
    
  } else{
    camx=-50; camy=150; camz=-100;
    focusz=150;
    birdEye = false;
  }
}