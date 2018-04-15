Table table;
pillars[] trees;

class Data{
  void setup(){
    table = loadTable("trees.csv", "header");
    pillars [] trees = new pillars[table.getRowCount()+1];
    for (TableRow row : table.rows()) {
      
      int id = row.getInt("id");
      int girth = row.getInt("Girth");
      int treeHeight = row.getInt("Height");
      int volume = row.getInt("Volume");
      trees[id] = new pillars(treeHeight, volume, girth);
      println("#" + id + " (" + girth, treeHeight, volume + ")");
    }
  }
  void draw(){
    //tree.display();
    
  }
}