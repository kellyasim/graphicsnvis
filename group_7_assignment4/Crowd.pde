//350 width
class Crowd{
  int xpos;
  int ypos;
  int initial_xpos;
  CrowdMember temp;
  CrowdMember[] population = new CrowdMember[50];
  //red yellow blue green
  color blue = color(#7171e1);
  color red = color(#cb3030);
  color green = color(#359c35);
  color yellow = color(#e1e34d);
  color orange = color(#e3aa3a);
  color[] colors = {blue, red, green, yellow, orange};
  
  Crowd(int start){
    xpos = initial_xpos = start;
    ypos = 400;
    this.populate();
  }
  
  void populate(){
    int idx = 0;
    int rand_idx = 0;
    for(int i=ypos+34;i<ypos+204;i+=34){
      for(int j=xpos+32;j<xpos+352;j+=32){
        rand_idx = int(random(5));
        temp = new CrowdMember(j, i, colors[rand_idx], initial_xpos);
        temp.display();
        population[idx] = temp;
        idx++;
      }
    }
  }
  
  void update(){
    xpos -= 10;
    if(xpos < -400){
      xpos = 1100;
    }
    for(int i=0;i<50;i++){
      population[i].update();
    }
    this.display();
  }
  
  void display(){
    fill(#AA7E2B);
    noStroke();
    rect(xpos+120,ypos-200,86,220);
    triangle(xpos+120,ypos-200,xpos+163,ypos-250,xpos+206,ypos-200);
    stroke(1);
    line(xpos+163,ypos-250,xpos+163,ypos-270);    
    rect(xpos, ypos, 352, 204);
    fill(red);
    triangle(xpos+163,ypos-260,xpos+163,ypos-270,xpos+180,ypos-260);
    fill(0);
    for(int i=0;i<50;i++){
      population[i].display();
    }
  }
}