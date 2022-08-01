import java.util.*;
Cloud[] c = new Cloud[10];
ArrayList <Bird> b_list = new ArrayList <Bird>();
Bird b1;
Cloud sun;
PImage sea;

void setup()
{
  fullScreen(P3D);
  //size(1200, 700, P3D);
  sea=loadImage("sea.png");
  for (int i = 0; i < c.length; i++) {
    c[i] = new Cloud();
  }
  for (int i=0; i<5; i++) {
    Bird b = new Bird();
    b_list.add(b);
  }
  sun = new Cloud();
  noStroke();
}
void draw()
{
  background(184, 236, 255);
  showSea();
  hit_eachother();
  
  for (int i = 0; i < c.length; i++) {
    c[i].drawCloud();
    c[i].update();
  }
    lights();
  directionalLight(255,48,106,-1,-1,-1); 
  sun.drawSun();
  if (sun.is_sunSet()) {
    exit();
  }
  noLights();
  for (int i=0; i<b_list.size(); i++) {
    Bird n_bird = b_list.get(i);
    pushMatrix();
    translate(n_bird.bx, n_bird.by, n_bird.bz);
    scale(100);
    n_bird.drawBird();
    n_bird.updateBird();
    popMatrix();
  }

}

void showSea() {
  beginShape();
  texture(sea);
  vertex(-500, height, 0, 0, sea.height);
  vertex(-500, height, -300, 0, 0);
  vertex(width+500, height, -300, sea.width, 0);
  vertex(width+500, height, 0, sea.width, sea.height);
  endShape();
}

void hit_eachother() {
  for (int i=0; i<b_list.size(); i++) {
    Bird new_bird = b_list.get(i);
    for (int b=0; b<b_list.size(); b++) {
      Bird a_bird = b_list.get(b);
      if ( a_bird!= new_bird){
        if(abs(a_bird.bx-new_bird.bx)<30 && abs(a_bird.by-new_bird.by)<20 && abs(a_bird.bz-new_bird.bz)<30){
          b_list.remove(b);
          b_list.remove(i);
        }
      }
    }
  }
}
