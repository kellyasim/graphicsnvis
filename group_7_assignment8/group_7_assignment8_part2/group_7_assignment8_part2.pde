Table table;
pillars[] trees;
int treeHeight, volume, girth, id;

void setup() {
  size(800,500,P3D);
  
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
  int focusy = -mouseY;
  camera(-50, 200, -150, //camera position
         focusx, focusy, 100, //focus point
         0, -1, 0); //up
         
  line( 0, 0, 0, 0, 1000, 0); //y axis
  line( 0, 0, 0, 1000, 0, 0); //x axis
  line( 0, 0, 0, 0, 0, 1000); //z axis
  
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