import processing.sound.*;
import java.util.*;

 ArrayList smoke1 = new ArrayList();
 ArrayList smoke2= new ArrayList();
 SoundFile file;
 String audioName = "/Users/elif/Desktop/Cafe/data/Ainslie Wills - Two Strong Hearts (Official Video).mp3";
 String path;
 
void setup(){
  
  size(999,703,P3D);
  path = sketchPath(audioName);
  file = new SoundFile(this,path);
  //file.play();
  f = new Furnitures();
  lampshade = new Furnitures();
  table = new Furnitures();
  walls = new Furnitures();
  chair = new Furnitures();
  mug1 = new Furnitures();
  figure1 = new Figures();
  body = new Figures();
  actionArm1= new Figures();
  coffee1=new Furnitures();
  twinArm=new Twin();
  twinCoffee=new Twin();
  twinMug=new Twin();
  
  imgBack = loadImage("background.jpg");
  imgIpek = loadImage("ipek.jpg");
  imgIlayda = loadImage("ilayda.jpg");
  camZ = (height/2) / tan((PI*60.0)/360.0);
  for(int i=0; i<20; i++){
   SmokeParticles p1 = new SmokeParticles();
   smoke1.add(p1);
  }
  for(int i=0; i<20; i++){
    SmokeParticles p2= new SmokeParticles();
    smoke2.add(p2);
  }
}

PImage imgBack, imgIpek, imgIlayda;
Furnitures table;
int spinY = 0;
Furnitures walls;
Furnitures chair;
Furnitures lampshade;
Furnitures f;
Twin twinArm, twinMug, twinCoffee;
Furnitures mug1,coffee1;
float camZ = 0;
Figures figure1;
Figures body, actionArm1;
void draw(){
  
 background(imgBack);
 camera(0, 0, camZ, 0, 0, -500, 0, 1, 0);
 rotateX(rotX + distY);
 rotateY(rotY + distX);
 
 pushMatrix();
 scale(100);
 walls.drawBox();
 table.drawTable(0.8,0.5,0.92,20);
 popMatrix();
  lampshade.drawLampshade();
  f.drawFlower();
 pushMatrix();
 translate(0,15,0);
 figure1.drawHead();
 chair.drawChair();
 mug1.drawMug(imgIpek);
 coffee1.sipCoffee();
 body.drawBody();
 actionArm1.moveArm();
 
 for(int i=smoke1.size()-1; i >= 0; i--){
   SmokeParticles particle = (SmokeParticles)smoke1.get(i);
   particle.showForIpek();
   particle.update();
   if (particle.dead()){
     smoke1.remove(i);
   }
 }
 
 if (mug1.mugAngle==0 && coffee1.h != 5){
   for(int i=0; i<20; i++){
   SmokeParticles p = new SmokeParticles();
   smoke1.add(p);
  }
  
 }
 popMatrix();
 
 pushMatrix();
 translate(0,15,0);
 scale(1,-1);
 scale(-1,-1);
 chair.drawChair();
 twinMug.drawMug(imgIlayda);
 twinCoffee.sipCoffee();
 figure1.drawHead();
 body.drawBody();
 twinArm.moveArm();
 if (twinMug.mugAngle==0 && twinCoffee.h != 5){
   for(int i=0; i<20; i++){
   SmokeParticles p = new SmokeParticles();
   smoke2.add(p);
  }
 }
 
 for(int i=smoke2.size()-1; i >= 0; i--){
   SmokeParticles particle = (SmokeParticles)smoke2.get(i);
   particle.showForTwin();
   particle.update();
   if (particle.dead()){
     smoke2.remove(i);
   }
 }
 

 popMatrix();

 
 exitAnimation();
 
 if(keyPressed){
   
   if(keyCode == UP)
     camZ -= 10;
   if(keyCode == DOWN)
     camZ += 10;
 } 
 
}

float rotX = 0, rotY = 0;
float lastX, lastY;
float distX, distY;

void exitAnimation(){
  if (twinCoffee.timer== 250)
    //noLoop();
    exit();
}

void mousePressed()
{
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged()
{
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}

void mouseReleased()
{
  rotX += distY;
  rotY += distX;
  distX = distY = 0;
}
