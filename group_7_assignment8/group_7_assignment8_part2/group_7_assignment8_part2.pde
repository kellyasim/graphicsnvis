Table table;
pillars[] trees;

void setup() {
  size (500,500,P3D);
  
  table = loadTable("trees.csv", "header");
  int rownumber = table.getRowCount();
  for (TableRow row : table.rows()) {
    int id = row.getInt("id");
    int girth = row.getInt("Girth");
    int treeHeight = row.getInt("Height");
    int volume = row.getInt("Volume");
  }
  for (int i = 0; i < rownumber; i++){ //////////////////how to call data in the table
    trees[i] = new pillars(treeHeight, volume, girth);
    println("#" + id + " (" + girth, treeHeight, volume + ")");
  }
  
  camera(-100, 100, -100, //camera position
          50, 50, 10, //focus point
          0, -1, 0); //up
  line( 0, 0, 0, 0, 1000, 0); //y axis
  line( 0, 0, 0, 1000, 0, 0); //x axis
  line( 0, 0, 0, 0, 0, 1000); //z axis
}

void draw(){
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