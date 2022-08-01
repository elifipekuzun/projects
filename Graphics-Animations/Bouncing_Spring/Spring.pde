class Spring {
  float ratio = 20;
  float spring_number=15;
  float distance = height/spring_number;
  float bouncing_number = 500;
  float direction = -0.005;
  
  void drawSpring() {
    pushMatrix();
    translate(0,-250,0);
    beginShape();
    float y_pos=0;
    for (int j=0; j<spring_number; j++) {
      for (int i=0; i<36; i++) {
        vertex(ratio*cos(radians(i*10)), y_pos, ratio*sin(radians(i*10)));
        y_pos += bouncing_number/50;
        bouncing_number += direction;
        if (bouncing_number>500 || bouncing_number<50)
          direction *= -1;
      }
      endShape();
    }
    popMatrix();
  }
  
}
