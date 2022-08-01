
class SmokeParticles{
  float locX, locY,locZ,size, velX, velY, alpha,velZ;
  int dirMug,timerMug,mugAngle;
  int dirIpek,timerIpek,mugAngleIpek;
  public SmokeParticles(){
    
    locX=random(-3,3);
    locZ=0;
    locY=0;
    size=2;
    velX=random(-1,1);
    velY=random(-2,0);
    velZ=random(-1,1);
    alpha=160;
    mugAngle=0;
    dirMug=0;
    timerMug=0;
    dirIpek=-4;
    timerIpek=0;
    mugAngleIpek=0;
  
  }
  
  Boolean dead(){
    return alpha<0;
  }
  
  void update(){
    locX +=velX;
    locY +=velY;
    locZ +=velZ;
    alpha -=20 ;
     
  }
  void showForTwin(){
    pushMatrix();
    noStroke();
    fill(255,alpha);
    translate(-65,66,12);
    beginShape();
    mugAngle+=dirMug;
  if (mugAngle==-72)
     dirMug*=-1; 
  else if (mugAngle==0) //mugAngle=0
    dirMug=0;
    for(int i=0; i<36; i++){
      vertex(size*cos(radians(i*10))+locX+10*cos(radians(mugAngle)),size*sin(radians(i*10))+locY+10*sin(radians(mugAngle)),locZ);
    }
    endShape(CLOSE);
    popMatrix();

  }
  
  void showForIpek(){
    pushMatrix();
    noStroke();
    fill(255,alpha);
    translate(-65,66,12);
    beginShape();
   mugAngleIpek+=dirIpek;
  if (mugAngle==-72)
     dirMug*=-1; 
  else if (mugAngle==0) 
    dirMug=0;
    for(int i=0; i<36; i++){
      vertex(size*cos(radians(i*10))+locX+10*cos(radians(mugAngle)),size*sin(radians(i*10))+locY+10*sin(radians(mugAngle)),locZ);
    }
    endShape(CLOSE);
    popMatrix();
    if (timerMug==60 || timerMug==120 || timerMug==180 || timerMug == 240)
    dirMug=-4;
    
   timerMug++;
  }
}
