void setup(){
  size(500,500);
  stroke(255);
}
int angle=0;
void draw(){
  clear();
  
  strokeWeight(10);
  point(width/2,height/2);
  ellipse(250,350,30,150);
  
  translate(width/2,height/2);
  rotate(radians(angle++));
  translate(-width/2,-height/2);
  drawLeaves();
}

void drawLeaves(){
  for(int i=0; i<6; i++){
  translate(width/2,height/2);
  rotate(radians(60));
  translate(-width/2,-height/2);
  ellipse(325,250,100,10);
  }
}  
