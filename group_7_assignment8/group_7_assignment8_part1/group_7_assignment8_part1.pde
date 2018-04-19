Table table;
Person[] people, men, women, working_copy;
boolean disp_w, disp_h, rm_outliers;
int sex, wght, hght, repwt, repht;
String sex_csv_value;

void setup() {
  size(800,800);

  table = loadTable("Davis.csv", "header");
  
  int idx = 0;
  int idx2 = 0;
  int idx3 = 0;
  
  people = new Person[183];
  men = new Person[82];
  women = new Person[101];
  for (TableRow row : table.rows()) {
    sex_csv_value = row.getString("sex").trim();
    wght = row.getInt("weight");
    hght = row.getInt("height");
    repwt = row.getInt("repwt");
    if(repwt == 0){ continue; }
    repht = row.getInt("repht");
    
    if(sex_csv_value.equals("M") == true){ 
      sex = 0; 
      men[idx2] = new Person(sex, wght, hght, repwt, repht);
      idx2++;
    }
    else{ 
      sex = 1; 
      women[idx3] = new Person(sex, wght, hght, repwt, repht);
      idx3++;  
    }
    people[idx] = new Person(sex, wght, hght, repwt, repht);
    
    working_copy = people;
    disp_w = true;
    disp_h = !disp_w;
    rm_outliers = false;
    
    idx++;
  }
}

void draw(){
   draw_graph(working_copy);

}

void keyPressed(){
  if(key == '0'){
    working_copy = people;
    disp_w = true;
    disp_h = !disp_w;
  }
  if(key == '1'){
    working_copy = people;
    disp_w = false;
    disp_h = !disp_w;
  }
  if(key == '2'){
    working_copy = men;
    disp_w = true;
    disp_h = !disp_w;
  }
  if(key == '3'){
    working_copy = men;
    disp_w = false;
    disp_h = !disp_w;
  }
  if(key == '4'){
    working_copy = women;
    disp_w = true;
    disp_h = !disp_w;
  }
  if(key == '5'){
    working_copy = women;
    disp_w = false;
    disp_h = !disp_w; 
  }
  if(key == '9'){
    rm_outliers = !rm_outliers;
  }
}

void draw_graph(Person[] p){
  background(255);
  stroke(0);
  line(100,400,700,400);
  line(100,700,100,100);
  int y=0;
  for(int i=0;i<10;i++){
    y = 400 + i * 30;
    line(100, y, 90, y);
    y = 400 - i * 30;
    line(100, y, 90, y);
  }
  
  int h = 600/p.length;
  int diff = 0;
  String s = "";
  String out = "Included";
  
  switch(p[0].sex){
    case 0:
      s = "Male";
      break;
    case 1:
      s = "Female";
      break;
    default:
      break;
  }
  if(p.length > 150){
    s = "Both";
  }

  fill(0);
  textSize(32);
  text("Actual minus Reported", 290, 30);
  text("For "+s, 290, 60);
  textSize(16);
  text("person", 710, 405);
  text("difference", 50,90);
  
  if(disp_w){
    
    for(int i=0;i<p.length;i++){
      diff = p[i].wght - p[i].repwt;
      if(rm_outliers && abs(diff)>15){ out = "Excluded"; continue; }
      rect( 100+(i*h), 400, h, -diff*30);
    }
  }
  else{
    
    for(int i=0;i<p.length;i++){
      diff = p[i].hght - p[i].repht;
      if(rm_outliers && abs(diff)>15){ out = "Excluded"; continue; }
      rect( 100+(i*h), 400, h, -diff*30);
    }
  }
  
  text("Outliers: "+out, 650, 770);
}