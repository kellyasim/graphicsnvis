Table table;
pillars datapt;

void setup() {
  size (500,500,P3D);
  
  table = loadTable("trees.csv", "header");
  //println(table.getRowCount() + " total rows in table"); 
  pillars [] columns = new pillars[table.getRowCount()+1];
  for (TableRow row : table.rows()) {
    
    int id = row.getInt("id");
    int girth = row.getInt("Girth");
    int treeHeight = row.getInt("Height");
    int volume = row.getInt("Volume");
    columns[id] = new pillars(treeHeight, volume, girth);
    println("#" + id + " (" + girth, treeHeight, volume + ")");
  }
}

void draw(){
  fill(110);
  camera(-100, 100, -100, //camera position
         50, 50, 10, //focus point
         0, -1, 0); //up
  line(0,0,0,0,1000,0); //y axis
  line(0,0,0,1000,0,0); //x axis
  line(0,0,0,0,0,1000); //z axis
  //draw_background();
  


}
//void draw_background(){
//  fill(#F0EAD6);
//  translate(400,200,-200);
//  box(1000);
//  translate(0,0,0);
//}