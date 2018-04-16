Table table;
pillars[] trees;
int treeHeight, volume, girth, id;

void setup() {
  size (500,500,P3D);
  table = loadTable("trees.csv", "header");
  
  int rownumber = table.getRowCount();
  trees = new pillars[rownumber];
  for (TableRow row : table.rows()) {
    id = row.getInt("id");
    girth = row.getInt("Girth");
    treeHeight = row.getInt("Height");
    volume = row.getInt("Volume");
    trees[id-1] = new pillars(treeHeight, girth, volume);
    println("#" + id + " (" + girth, treeHeight, volume + ")");
  }
  
  line( 0, 0, 0, 0, 1000, 0); //y axis
  line( 0, 0, 0, 1000, 0, 0); //x axis
  line( 0, 0, 0, 0, 0, 1000); //z axis
}

void draw(){
  camera(-100, 100, -100, //camera position
         mouseX, mouseY, 10, //focus point
         0, -1, 0); //up
  fill(110);

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