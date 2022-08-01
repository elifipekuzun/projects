
float rotX = 0, rotY = 0;
int lastX, lastY;
float distX = 0, distY = 0;
float zoom;
Spring s;
void setup(){
  size(500,500,P3D);
  s= new Spring();
}

void draw(){
  background(255);
   zoom = (height/2)/tan(PI*60/360);
  camera(0, 0, zoom, 
    0, 0, 0, 
    0, 1, 0);
  rotateX(rotX + distY);
  rotateY(rotY + distX);
  
  s.drawSpring();
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
