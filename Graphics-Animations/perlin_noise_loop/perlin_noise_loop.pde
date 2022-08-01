float angle=0;
int totalFrames=120;
int counter=0;
boolean record =true;
void setup(){
  size(600,600);
}

void draw(){
  float percent =0;
  if (record){
    percent = float(counter)/totalFrames;
  }else{
    percent = float(counter%totalFrames)/totalFrames;
  }
  render(percent);
  counter++;
}

void render(float percent){
  background(0);
  angle = percent*TWO_PI;
  float noiseMax=10;
  float xoff=map(cos(radians(angle)),-1,1,0,noiseMax);
  float yoff=map(sin(radians(angle)),-1,1,0,noiseMax);
  float r=noise(xoff,yoff);
  float x=map(r,0,1,0,width);
  fill(255,100);
  circle(x,height/2,100);
  
  translate(width/2,height/2);
  stroke(255);
  float radius = 100;
  float x1= radius *cos(radians(angle));
  float y1 = radius*sin(radians(angle));
  line(0,0,x1,y1);
  circle(x1,y1,10);
}
