class Cloud{
  float x_pos, y_pos, z_pos, vel, x_sun, y_sun, z_sun;
  int dir = -1;
  int sunRadius;
  float sun_dir = 0.1;
  float sunAngle, r, g, b;
  public Cloud(){
    initialize();
  }
  
  void initialize(){
    x_pos = random(100,width+50);
    y_pos = random(0,height/2);
    z_pos = random(50,100);
    vel = random(0.1,0.8);
    sunRadius = 100;
    x_sun = 0;
    y_sun = 500;
    sunAngle=0;
    z_sun = -300;
  }
  void update(){
    x_pos += vel*dir;
    if (x_pos<-50 || x_pos>width+50)
      dir *= -1;
  }
  
  void drawCloud(){
    pushMatrix();
    translate(0,0,z_pos);
    fill(255);
    ellipse(x_pos, y_pos, 126, 97);
    ellipse(x_pos+62, y_pos, 70, 60);
    ellipse(x_pos-62, y_pos, 70, 60);
    popMatrix();
  }
  
  void drawSun(){
    int r=200;
    fill(#F8FC7F);
    pushMatrix();
    translate(x_sun-100, 200+r*sin(radians(-sunAngle)) ,z_sun);
    sphere(50);
    x_sun += 0.2;
    sunAngle += 0.04;
    z_sun+=sun_dir;
    if (z_sun>100)
      sun_dir *= -1;
    popMatrix();
  }
  
  Boolean is_sunSet(){
    return x_sun>1660;
  }

}
