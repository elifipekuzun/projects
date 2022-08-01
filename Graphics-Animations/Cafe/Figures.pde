class Figures {
 int angle;
 int dir;
 int timer,h;
 public Figures(){
   angle=-66;
   dir=-6;
   timer =0;
 }
  void drawHead(){
    
    pushMatrix();
    fill(234,216,140);
    translate(-120,20,12);
    sphere(20);
    popMatrix();
  }
  
  void drawBody(){
    
    pushMatrix();
    translate(-120,70,12);
    fill(0);
    scale(10);
    beginShape(QUADS);
    
    //Z+
    vertex(-1,-3,1);
    vertex(1,-3,1);
    vertex(1,3,1);
    vertex(-1,3,1);
    
    //Z-
    vertex(-1,-3,-1);
    vertex(1,-3,-1);
    vertex(1,3,-1);
    vertex(-1,3,-1);
    
    //X+
    vertex(1,-3,1);
    vertex(1,-3,-1);
    vertex(1,3,-1);
    vertex(1,3,1);
    
    //X-
    vertex(-1,-3,-1);
    vertex(-1,-3,1);
    vertex(-1,3,1);
    vertex(-1,3,-1);
    
    //Y+
    vertex(-1,3,-1);
    vertex(1,3,-1);
    vertex(1,3,1);
    vertex(-1,3,1);
    
    //Y-
    vertex(-1,-3,-1);
    vertex(1,-3,-1);
    vertex(1,-3,1);
    vertex(-1,-3,1);
    endShape();
    popMatrix();
    
    pushMatrix();
    translate(-100,55,14);
    scale(4);
    rotate(radians(-65));
    //Z+
    vertex(-1,-4,1);
    vertex(1,-4,1);
    vertex(1,0,1);
    vertex(-1,0,1);
    
    //Z-
    vertex(-1,-4,-1);
    vertex(1,-4,-1);
    vertex(1,0,-1);
    vertex(-1,0,-1);
    
    //X+
    vertex(1,-4,1);
    vertex(1,-4,-1);
    vertex(1,0,-1);
    vertex(1,0,1);
    
    //X-
    vertex(-1,-4,-1);
    vertex(-1,-4,1);
    vertex(-1,0,1);
    vertex(-1,0,-1);
    
    //Y+
    vertex(-1,0,-1);
    vertex(1,0,-1);
    vertex(1,0,1);
    vertex(-1,0,1);
    
    //Y-
    vertex(-1,-4,-1);
    vertex(1,-4,-1);
    vertex(1,-4,1);
    vertex(-1,-4,1);
    endShape();
    popMatrix();
    
    pushMatrix();
    translate(-97,73,6);
    scale(4);
    rotate(radians(-35));
    beginShape(QUADS);
    vertex(-1,-7,1);
    vertex(1,-7,1);
    vertex(1,7,1);
    vertex(-1,7,1);
    
    //Z-
    vertex(-1,-7,-1);
    vertex(1,-7,-1);
    vertex(1,7,-1);
    vertex(-1,7,-1);
    
    //X+
    vertex(1,-7,1);
    vertex(1,-7,-1);
    vertex(1,7,-1);
    vertex(1,7,1);
    
    //X-
    vertex(-1,-7,-1);
    vertex(-1,-7,1);
    vertex(-1,7,1);
    vertex(-1,7,-1);
    
    //Y+
    vertex(-1,7,-1);
    vertex(1,7,-1);
    vertex(1,7,1);
    vertex(-1,7,1);
    
    //Y-
    vertex(-1,-7,-1);
    vertex(1,-7,-1);
    vertex(1,-7,1);
    vertex(-1,-7,1);
    endShape();
    popMatrix();
    
    pushMatrix();
    translate(-113,100,14);
    scale(6);
    rotate(radians(-90));
    beginShape(QUADS);
    
    //Z+
    vertex(-1,-3,1);
    vertex(1,-3,1);
    vertex(1,3,1);
    vertex(-1,3,1);
    
    //Z-
    vertex(-1,-3,-1);
    vertex(1,-3,-1);
    vertex(1,3,-1);
    vertex(-1,3,-1);
    
    //X+
    vertex(1,-3,1);
    vertex(1,-3,-1);
    vertex(1,3,-1);
    vertex(1,3,1);
    
    //X-
    vertex(-1,-3,-1);
    vertex(-1,-3,1);
    vertex(-1,3,1);
    vertex(-1,3,-1);
    
    //Y+
    vertex(-1,3,-1);
    vertex(1,3,-1);
    vertex(1,3,1);
    vertex(-1,3,1);
    
    //Y-
    vertex(-1,-3,-1);
    vertex(1,-3,-1);
    vertex(1,-3,1);
    vertex(-1,-3,1);
    endShape();
    popMatrix();
    
    pushMatrix();
    translate(-93,125,16);
    scale(3);
    beginShape(QUADS);
    
    //Z+
    vertex(-1,-10,1);
    vertex(1,-10,1);
    vertex(1,10,1);
    vertex(-1,10,1);
    
    //Z-
    vertex(-1,-10,-1);
    vertex(1,-10,-1);
    vertex(1,10,-1);
    vertex(-1,10,-1);
    
    //X+
    vertex(1,-10,1);
    vertex(1,-10,-1);
    vertex(1,10,-1);
    vertex(1,10,1);
    
    //X-
    vertex(-1,-10,-1);
    vertex(-1,-10,1);
    vertex(-1,10,1);
    vertex(-1,10,-1);
    
    //Y+
    vertex(-1,10,-1);
    vertex(1,10,-1);
    vertex(1,10,1);
    vertex(-1,10,1);
    
    //Y-
    vertex(-1,-10,-1);
    vertex(1,-10,-1);
    vertex(1,-10,1);
    vertex(-1,-10,1);
    endShape();
    popMatrix();
    
    pushMatrix();
    translate(-85,125,9);
    scale(3);
    rotate(radians(-20));
    beginShape(QUADS);
    
    //Z+
    vertex(-1,-10,1);
    vertex(1,-10,1);
    vertex(1,10,1);
    vertex(-1,10,1);
    
    //Z-
    vertex(-1,-10,-1);
    vertex(1,-10,-1);
    vertex(1,10,-1);
    vertex(-1,10,-1);
    
    //X+
    vertex(1,-10,1);
    vertex(1,-10,-1);
    vertex(1,10,-1);
    vertex(1,10,1);
    
    //X-
    vertex(-1,-10,-1);
    vertex(-1,-10,1);
    vertex(-1,10,1);
    vertex(-1,10,-1);
    
    //Y+
    vertex(-1,10,-1);
    vertex(1,10,-1);
    vertex(1,10,1);
    vertex(-1,10,1);
    
    //Y-
    vertex(-1,-10,-1);
    vertex(1,-10,-1);
    vertex(1,-10,1);
    vertex(-1,-10,1);
    endShape();
    popMatrix();
    
  }
  
  void moveArm(){
    
    pushMatrix();
    translate(-90,60,14);
    scale(4);
    
    
    angle+=dir;
    if(angle==-168)
    dir*=-1;
    else if (angle==-66) 
    dir=0;
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
   if(timer == 60||timer==120 || timer == 180 || timer == 260){
     dir=-6;
   } 
   timer++;
  
  }
 }
