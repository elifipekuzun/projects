
class Twin{
 int angle;
 int dirArm,dirMug;
 int timer,h;
 int mugAngle;
 
 public Twin(){
   angle=-66;
   dirArm=0;
   dirMug=0;
   timer =0;
   mugAngle=0;
   h=1;
 }
 
 void moveArm(){
    
    pushMatrix();
    translate(-90,60,14);
    scale(4);
    angle+=dirArm;
    if(angle==-168)
    dirArm*=-1;
    else if (angle==-66) 
    dirArm=0;
    rotate(radians(angle));
    beginShape(QUADS);
    vertex(-1,0,1);
    vertex(1,0,1);
    vertex(1,7,1);
    vertex(-1,7,1);
    
    //Z-
    vertex(-1,0,-1);
    vertex(1,0,-1);
    vertex(1,7,-1);
    vertex(-1,7,-1);
    
    //X+
    vertex(1,0,1);
    vertex(1,0,-1);
    vertex(1,7,-1);
    vertex(1,7,1);
    
    //X-
    vertex(-1,0,-1);
    vertex(-1,0,1);
    vertex(-1,7,1);
    vertex(-1,7,-1);
    
    //Y+
    vertex(-1,7,-1);
    vertex(1,7,-1);
    vertex(1,7,1);
    vertex(-1,7,1);
    
    //Y-
    vertex(-1,0,-1);
    vertex(1,0,-1);
    vertex(1,0,1);
    vertex(-1,0,1);
    endShape();
    popMatrix();
   if(timer==30||timer==90 || timer == 150 || timer == 210){
     dirArm=-6;
   } 
   timer++;
  
  }
    void drawMug(PImage img){
  int r = 2;
  int pieces = 36;
  int increasingAngle = 360/pieces;
  int textureAngle = 180/18;
  
  pushMatrix();
  noStroke();
  fill(255,255,255,50);
  translate(-106,65,12);
  scale(5);
  beginShape(QUADS);
   mugAngle+=dirMug;
  if (mugAngle==-72)
     dirMug*=-1; 
  else if (mugAngle==0) 
    dirMug=0;
  for(int i = 0; i<pieces; i++){
    vertex(r*cos(radians(i*increasingAngle))+10*cos(radians(mugAngle)), 0+10*sin(radians(mugAngle)), r*sin(radians(i*increasingAngle)));
    vertex(r*cos(radians((i+1)*increasingAngle))+10*cos(radians(mugAngle)), 0+10*sin(radians(mugAngle)), r*sin(radians((i+1)*increasingAngle)));
    vertex(r*cos(radians((i+1)*increasingAngle))+10*cos(radians(mugAngle)), 5+10*sin(radians(mugAngle)), r*sin(radians((i+1)*increasingAngle)));
    vertex(r*cos(radians(i*increasingAngle))+10*cos(radians(mugAngle)), 5+10*sin(radians(mugAngle)), r*sin(radians(i*increasingAngle)));
  } 
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(-106,85,12);
  scale(5);
  beginShape();
  for(int i=0; i<pieces; i++){
    vertex(r*cos(radians(i*increasingAngle))+10*cos(radians(mugAngle)),0+10*sin(radians(mugAngle)),r*sin(radians(i*increasingAngle)));
  }
  endShape(CLOSE);
  popMatrix();
  
  pushMatrix();
  translate(-106,65,12.1);
  scale(5);
  beginShape(QUADS);
  texture(img);
  for(int i = 0; i<18; i++){
    vertex(r*cos(radians(i*textureAngle))+10*cos(radians(mugAngle)), 10*sin(radians(mugAngle)), r*sin(radians(i*textureAngle)),i*img.width/18,0);
    vertex(r*cos(radians((i+1)*textureAngle))+10*cos(radians(mugAngle)), 10*sin(radians(mugAngle)), r*sin(radians(i+1)*textureAngle),(i+1)*img.width/18,0);
    vertex(r*cos(radians((i+1)*textureAngle))+10*cos(radians(mugAngle)), 5+10*sin(radians(mugAngle)), r*sin(radians((i+1)*textureAngle)),(i+1)*img.width/18,img.height);
    vertex(r*cos(radians(i*textureAngle))+10*cos(radians(mugAngle)), 5+10*sin(radians(mugAngle)), r*sin(radians(i*textureAngle)),i*img.width/18,img.height);
  }
  endShape();
  popMatrix();
  if (timer==30 || timer==90 || timer==150 || timer == 210)
    dirMug=-4;
    
  timer++;
 }
 
  void sipCoffee(){
  float c_r= 2.001;
  int pieces = 36;
  int increasingAngle = 360/pieces;
  pushMatrix();
  noStroke();
  fill(#89500A);
  translate(-106,65,12);
  scale(5);
  
   mugAngle+=dirMug;
  if (mugAngle==-72){
     h++; 
     dirMug*=-1; 
  }else if (mugAngle==0){
    dirMug=0;
  }
  beginShape(QUADS);
  for(int i = 0; i<pieces; i++){
    vertex(c_r*cos(radians(i*increasingAngle))+10*cos(radians(mugAngle)), h+10*sin(radians(mugAngle)), c_r*sin(radians(i*increasingAngle)));
    vertex(c_r*cos(radians((i+1)*increasingAngle))+10*cos(radians(mugAngle)), h+10*sin(radians(mugAngle)), c_r*sin(radians((i+1)*increasingAngle)));
    vertex(c_r*cos(radians((i+1)*increasingAngle))+10*cos(radians(mugAngle)), 5+10*sin(radians(mugAngle)), c_r*sin(radians((i+1)*increasingAngle)));
    vertex(c_r*cos(radians(i*increasingAngle))+10*cos(radians(mugAngle)), 5+10*sin(radians(mugAngle)), c_r*sin(radians(i*increasingAngle)));
  } 
  endShape();
  beginShape();
  for(int i=0; i<pieces; i++){
    vertex(c_r*cos(radians(i*increasingAngle))+10*cos(radians(mugAngle)),h+10*sin(radians(mugAngle)),c_r*sin(radians(i*increasingAngle)));
  }
  endShape(CLOSE);
  
  popMatrix();
  if (timer==30 || timer==90 || timer==150 || timer==210){
    dirMug=-4;
  }

  timer++;
  
 }
}
