PImage imgWall;
PImage imgDoor;
void setup()
{
  size(500, 500, P3D);
  camZ = (height/2) / tan((PI*60.0)/360.0);
  imgWall = loadImage("wall.jpg");
  imgDoor = loadImage("door.jpg");
  noStroke();
}
float camZ = 0;


void draw()
{
  background(0);
  //translate(width/2, height/2);
  camera(0,0,camZ,
         0,0,-500,
         0,1,0);
  rotateX(rotX + distY);
  rotateY(rotY + distX);
  
  scale(100);
  drawHouse();
  drawDoor();
  
  if(keyPressed){
    if(keyCode == UP)
      camZ -= 10;
    if(keyCode == DOWN)
      camZ += 10;
  }
}

void drawDoor(){
  fill(255);
  int w = imgDoor.width;
  int h = imgDoor.height;
  beginShape(QUADS);
  texture(imgDoor);
  vertex(-0.5,-0.25,1.0001,0,0);
  vertex(0.5,-0.25,1.0001,w,0);
  vertex(0.5,1,1.0001,w,h);
  vertex(-0.5,1,1.0001,0,h);
  endShape();
}

void drawHouse()
{
  int w = imgWall.width;
  int h = imgWall.height;
  
  beginShape(QUADS);
  texture(imgWall);
  //+Z face
  vertex(-1, -1, 1, 0, 0); //upper left corner
  vertex(1, -1, 1, w, 0); //upper right corner
  vertex(1, 1, 1, w, h); //bottom right corner
  vertex(-1, 1, 1, 0, h); //bottom left corner
  
  //-Z face
  vertex(-1, -1, -1, 0, 0); //upper left corner
  vertex(1, -1, -1, w, 0); //upper right corner
  vertex(1, 1, -1, w, h); //bottom right corner
  vertex(-1, 1, -1, 0, h); //bottom left corner
  
  //+X face
  vertex(1, -1, 1, 0, 0); //upper left corner
  vertex(1, -1, -1, w, 0);
  vertex(1, 1, -1, w, h);
  vertex(1, 1, 1, 0, h);
  
  //-X face
  vertex(-1, -1, 1, 0, 0); //upper left corner
  vertex(-1, -1, -1, w, 0);
  vertex(-1, 1, -1, w, h);
  vertex(-1, 1, 1, 0, h);
  
  //-Y face
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, w, 0);
  vertex(1, -1, -1, w, h);
  vertex(-1, -1, -1, 0, h);
  
  //+Y face
  vertex(-1, 1, 1, 0, 0);
  vertex(1, 1, 1, w, 0);
  vertex(1, 1, -1, w, h);
  vertex(-1, 1, -1, 0, h);
  endShape();
}

float rotX = 0, rotY = 0;
float lastX, lastY;
float distX, distY;

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
