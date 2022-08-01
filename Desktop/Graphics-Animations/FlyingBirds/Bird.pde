class Bird
{
  float bx, by, bz;
  PImage imgWing;
  float velX, velY, velZ;
  int dirX, dirY, dirZ;
  public Bird() 
  {
    bx = random(width);
    by = random(height);
    bz = random(-100, 100);
    imgWing = loadImage("wing.gif");
    velX = random(0.5,1);
    velY = random(0.5,1);
    velZ = random(0.5,1);
    dirX=1;
    dirY=1;
    dirZ=1;
  }
  
  void updateBird(){
    bx += velX*dirX;
    by += velY*dirY;
    bz += velZ*dirZ;
    if(bx>width || bx<0)
      dirX *= -1;
    if (by>height || by<0)
      dirY *= -1;
    if (bz>100 || bz<-100)
      dirZ *= -1;
      
  }
  
  void drawBird()
  {
    pushMatrix();
    rotateZ(radians(angle));
    angle += angleDir;
    if(angle > 45 || angle < -45)
      angleDir *= -1;
    drawOneWing();
    popMatrix();
    pushMatrix();
    scale(-1, 1, 1);
    rotateZ(radians(angle));
    angle += angleDir;
    if(angle > 45 || angle < -45)
      angleDir *= -1;
    drawOneWing();
    popMatrix();
  }
  int angle = 0;
  int angleDir = 1;
  void drawOneWing()
  {
    beginShape(QUADS);
    texture(imgWing);
    vertex(-1, 0, 0, 0, 0);
    vertex(0, 0, 0, 202, 0);
    vertex(0, 0, 1, imgWing.width, imgWing.height);
    vertex(-1, 0, 1, 0, 183);
    endShape();
  }
}
