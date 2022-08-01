


class Furnitures {
  
  PImage imgSideWall_1, imgMenu, imgSideWall_2, imgFloor, imgChair,
  imgLampshade,imgFlower, imgMug, imgElif, imgCover;
  int w_width, w_height, c_width, c_height, w2_width, w2_height, f_width, f_height;
  float mugAngle;
  float dir;
  int timer, h;
 
  public Furnitures() {
    mugAngle=0.0;
    dir=-4;
    timer=0;
    h=1;
    imgCover = loadImage("chairCover.jpg");
    imgElif = loadImage("elif.jpg");
    imgSideWall_1 = loadImage("sideWall_1.png");
    imgSideWall_2 = loadImage("sideWall2.jpg");
    imgMenu = loadImage("CoffeeMenu.png");
    imgMug = loadImage("mug.png");
    imgFloor = loadImage("floor.jpg");
    imgChair = loadImage("chair1.png");
    imgLampshade= loadImage("lampshade.png");
    imgFlower = loadImage("flower.png");
    imgFlower.loadPixels();
    imgLampshade.loadPixels();
    imgChair.loadPixels();
    imgMug.loadPixels();
    
    c_width = imgMenu.width;
    c_height = imgMenu.height;
    
    w_width = imgSideWall_1.width;
    w_height = imgSideWall_1.height;

    w2_width = imgSideWall_2.width;
    w2_height = imgSideWall_2.height;
    
    f_width = imgFloor.width;
    f_height = imgFloor.height;
    
    
  }

  void drawTable(float topRadius, float bottomRadius, float tall, int sides) {
    pushMatrix();
    translate(0,1.05,0);
    fill(124, 86, 51);
    float angle = 0;
    float angleIncrement = TWO_PI / sides;
    
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; ++i) {
      vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
      vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
      angle += angleIncrement;
    }
    endShape();

    // If it is not a cone, draw the circular top cap
    if (topRadius != 0) {
      angle = 0;
      beginShape(TRIANGLE_FAN);

      // Center point
      vertex(0, 0, 0);
      for (int i = 0; i < sides + 1; i++) {
        vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
        angle += angleIncrement;
      }
      endShape();
    }

    // If it is not a cone, draw the circular bottom cap
    if (bottomRadius != 0) {
      angle = 0;
      beginShape(TRIANGLE_FAN);

      // Center point
      vertex(0, tall, 0);
      for (int i = 0; i < sides + 1; i++) {
        vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
        angle += angleIncrement;
      }
      endShape();
    }
    popMatrix();
  }

  void drawBox() {

    
    noStroke();
    
    //scale(4.5);
    noFill();

    beginShape(QUADS);
    texture(imgMenu);
    textureMode(IMAGE);
    
    //Z- 
    vertex(4, -2, -2, 0, 0);
    vertex(-4, -2, -2, c_width, 0);
    vertex(-4, 2, -2, c_width, c_height);
    vertex(4, 2, -2, 0, c_height);
    endShape();
    
    beginShape(QUADS);
    texture(imgSideWall_2);
    textureMode(IMAGE);
    
    //Z- 
    vertex(4, -2, -2.001, 0, 0);
    vertex(-4, -2, -2.001, c_width, 0);
    vertex(-4, 2, -2.001, c_width, c_height);
    vertex(4, 2, -2.001, 0, c_height);
    endShape();
    
    //X+
    beginShape(QUADS);
    texture(imgSideWall_2);
    vertex(4, -2, -2, w2_width, 0);
    vertex(4, 2, -2, w2_width, w2_height);
    vertex(4, 2, 2, 0, w2_height);
    vertex(4, -2, 2, 0, 0);
    endShape();
    
    pushMatrix();
    translate(-0.001,0,-0.5);
    beginShape();
    texture(imgElif);
    vertex(4, -0.2, 0, 0, 0);
    vertex(4, -0.2, 0.5,imgElif.width, 0);
    vertex(4, 0.5, 0.5,imgElif.width, imgElif.height);
    vertex(4, 0.5, 0, 0,imgElif.height);
    endShape(CLOSE);
    popMatrix();
    
    //X-
    beginShape(QUADS);
    texture(imgSideWall_1);
    vertex(-4, 2, -2, w_width, w_height);
    vertex(-4, 2, 2, 0, w_height);
    vertex(-4, -2, 2, 0,0);
    vertex(-4, -2, -2, w_width, 0);
    endShape();
    
    //Y+
    beginShape(QUADS);
    texture(imgFloor);
    vertex(4, 2, -2, f_width, f_height);
    vertex(-4, 2, -2, 0, f_height);
    vertex(-4, 2, 2, 0, 0);
    vertex(4, 2, 2, f_width, 0);
    endShape();
    
    //Y-
    beginShape(QUADS);
    vertex(-4, -2, -2);
    vertex(4, -2, -2);
    vertex(4, -2, 2);
    vertex(-4, -2, 2);
    endShape();
  }

  void drawChair() {
    pushMatrix();
    noStroke();
    translate(-135,115,7);
    scale(10);
    beginShape(QUADS);
    texture(imgCover);
    //Z-
    vertex(-2, -1, -2,0,0);
    vertex(2, -1, -2,imgCover.width,0);
    vertex(2, 1, -2,imgCover.width,imgCover.height);
    vertex(-2, 1, -2,0,imgCover.height);
    //Z+
    vertex(-2,-1,2,0,0);
    vertex(2,-1,2,imgCover.width,0);
    vertex(2,1,2,imgCover.width,imgCover.height);
    vertex(-2,1,2,0,imgCover.height);
    //X-
    vertex(-2,-1,2,0,0);
    vertex(-2,-1,-2,imgCover.width,0);
    vertex(-2,1,-2,imgCover.width,imgCover.height);
    vertex(-2,1,2,0,imgCover.height);
    //X+
    vertex(2,-1,-2,0,0);
    vertex(2,-1,2,imgCover.width,0);
    vertex(2,1,2,imgCover.width,imgCover.height);
    vertex(2,1,-2,0,imgCover.height);
    //Y-
    vertex(-2,-1,-2,0,0);
    vertex(2,-1,-2,imgCover.width,0);
    vertex(2,-1,2,imgCover.width,imgCover.height);
    vertex(-2,-1,2,0,imgCover.height);
    //Y+
    vertex(-2,1,-2,0,0);
    vertex(2,1,-2,imgCover.width,0);
    vertex(2,1,2,imgCover.width,imgCover.height);
    vertex(-2,1,2,0,imgCover.height);
    endShape();
    popMatrix();
    
    pushMatrix();
    noStroke();
    translate(-150,67,7);
    scale(10);
    beginShape(QUADS);
     texture(imgCover);
    //Z-
    vertex(-0.5, -4, -2,0,0);
    vertex(0.5, -4, -2,imgCover.width,0);
    vertex(0.5, 4, -2,imgCover.width,imgCover.height);
    vertex(-0.5, 4, -2,0,imgCover.height);
    //Z+
    vertex(-0.5,-4,2,0,0);
    vertex(0.5,-4,2,imgCover.width,0);
    vertex(0.5,4,2,imgCover.width,imgCover.height);
    vertex(-0.5,4,2,0,imgCover.height);
    //X-
    vertex(-0.5,-4,2,0,0);
    vertex(-0.5,-4,-2,imgCover.width,0);
    vertex(-0.5,4,-2,imgCover.width,imgCover.height);
    vertex(-0.5,4,2,0,imgCover.height);
    //X+
    vertex(0.5,-4,-2,0,0);
    vertex(0.5,-4,2,imgCover.width,0);
    vertex(0.5,4,2,imgCover.width,imgCover.height);
    vertex(0.5,4,-2,0,imgCover.height);
    //Y-
    vertex(-0.5,-4,-2,0,0);
    vertex(0.5,-4,-2,imgCover.width,0);
    vertex(0.5,-4,2,imgCover.width,imgCover.height);
    vertex(-0.5,-4,2,0,imgCover.height);
    //Y+
    vertex(-0.5,4,-2,0,0);
    vertex(0.5,4,-2,imgCover.width,0);
    vertex(0.5,4,2,imgCover.width,imgCover.height);
    vertex(-0.5,4,2,0,imgCover.height);
    endShape();
    popMatrix();
    pushMatrix();
    fill(0);
    translate(-150,150,22);
     scale(5);
    
    drawChairLegs();
    
    popMatrix();

  }
  
  void drawChairLegs(){
    for(int i=0; i<4; i++){
     translate(6,-0.05,0); 
    rotateY(radians(90));
    beginShape(QUADS);
    //Z-
    vertex(-0.5, -7, -0.5);
    vertex(0.5, -7, -0.5);
    vertex(0.5, 7, -0.5);
    vertex(-0.5, 7, -0.5);
    //Z+
    vertex(-0.5,-7,0.5);
    vertex(0.5,-7,0.5);
    vertex(0.5,7,0.5);
    vertex(-0.5,7,0.5);
    //X-
    vertex(-0.5,-7,0.5);
    vertex(-0.5,-7,-0.5);
    vertex(-0.5,7,-0.5);
    vertex(-0.5,7,0.5);
    //X+
    vertex(0.5,-7,-0.5);
    vertex(0.5,-7,0.5);
    vertex(0.5,7,0.5);
    vertex(0.5,7,-0.5);
    //Y-
    vertex(-0.5,-7,-0.5);
    vertex(0.5,-7,-0.5);
    vertex(0.5,-7,0.5);
    vertex(-0.5,-7,0.5);
    //Y+
    vertex(-0.5,7,-0.5);
    vertex(0.5,7,-0.5);
    vertex(0.5,7,0.5);
    vertex(-0.5,7,0.5);
    endShape();
    }
  }

  void drawLampshade(){
    
    pushMatrix();
    scale(2.1);
    translate(70,-10,-30);
    for (int x=0; x<100; x++) {
      for (int y=0; y<100; y++) {
        int lampX = (int)map(x, 0, 100, 0, imgLampshade.width);
        int lampY = (int)map(y, 0, 100, 0, imgLampshade.height);
        float b = brightness(imgLampshade.get(lampX, lampY));
        if(lampY<120){
        noStroke();
        pushMatrix();
        translate(x, y);
        fill(209,185,67);
        box(b/160);
        popMatrix();
      }else{
        stroke(124,104,6);
        pushMatrix();
        translate(x, y);
        box(b/170);
        popMatrix();
      }
       
      }
    }
  popMatrix();
  }

  void drawFlower(){
    
    pushMatrix();
    translate(-30,50);
     for (float x=0; x<60; x++) {
      for (float y=0; y<60; y++) {
        int floX = (int)map(x, 0, 60, 0, imgFlower.width);
        int floY = (int)map(y, 0, 60, 0, imgFlower.height);
        float b = brightness(imgFlower.get(floX, floY));
        if(floY<148){
        noStroke();
        pushMatrix();
        translate(x, y);
        fill(219,127,139);
        box(b/200.0);
        popMatrix();
      }else{
        stroke(234,228,166);
        pushMatrix();
        translate(x, y);
        box(b/256.0);
        popMatrix();
      }
       
      }
    }
  popMatrix();
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
   mugAngle+=dir;
  if (mugAngle==-72)
     dir*=-1; 
  else if (mugAngle==0) //mugAngle=0
    dir=0;
  for(int i = 0; i<pieces; i++){
    vertex(r*cos(radians(i*increasingAngle))+10*cos(radians(mugAngle)), 10*sin(radians(mugAngle)), r*sin(radians(i*increasingAngle)));
    vertex(r*cos(radians((i+1)*increasingAngle))+10*cos(radians(mugAngle)), 10*sin(radians(mugAngle)), r*sin(radians((i+1)*increasingAngle)));
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
  if (timer==60 || timer==120 || timer==180 || timer == 260)
    dir=-4;
    
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
  
   mugAngle+=dir;
  if (mugAngle==-72){
     h++; 
     dir*=-1; 
  }else if (mugAngle==0){
    dir=0;
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
  if (timer==60 || timer==120 || timer==180 || timer==260){
    dir=-4;
  }
  timer++;
  
 }
}
