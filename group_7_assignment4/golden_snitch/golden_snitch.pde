PShape snitch = createShape(GROUP);

void setup(){
 background(155);
 size(500,500);
 PShape ball = createShape(
}

void draw(){
  color y = color(255, 255, 0); //yellow
  color gold = color(245, 235, 0, 255);
  
  
  fill(y);
  strokeWeight(5);
  stroke(gold);
  beginShape();
  ellipse(250, 385, 100, 100); //ball
  noFill();
  arc(295, 350, 70, 45, PI/2, PI+PI/6); //grooves
  arc(205, 350, 70, 45, -PI/6, PI/2);
  arc(205, 420, 70, 45, 3*(PI/2), 2*PI+(PI/6));
  arc(295, 420, 70, 45, PI-(PI/6), 3*(PI/2));
  endShape(CLOSE);
  
  strokeWeight(2);
  line(220, 420, 240, 420);//leftside
  line(210, 415, 240, 415);
  line(205, 410, 240, 410);
  line(260, 420, 280, 420);//rightside
  line(260, 415, 290, 415);
  line(260, 410, 295, 410);
  
  fill(255);
  stroke(0);
  bezier(0, 200, 0, 350, 150, 280, 250, 350); //left wing
  line(0, 200, 250, 350);
  bezier(250, 350, 350, 280, 500, 350, 500, 200); //right wing
  line(250, 350, 500, 200);
  
}