class Garden {

  float r, g, b, size, ratio, angle, speed, x, y;
  int petals, z;
  Pollens[] pollen;

  public Garden() {
    initializeRandoms();
    z = 0;
    petals = 6;
  }

  void initializeRandoms() {
    x = random(width);
    y = random(200, 480);
    r = random(256);
    g = random(256);
    b = random(256);
    size = random(10, 30);
    ratio = random(5, 15);
    angle = 0;
    speed = random(.5, 4);
    pollen = new Pollens[int(random(50, 100))];
    for (int i = 0; i < pollen.length; i++) {
      pollen[i] = new Pollens();
      pollen[i].x = x;
      pollen[i].y = y;
    }
  }

  void drawFlower() {
    stroke(#006a4e);
    strokeWeight(3);
    line(x, y, x, 500);
    noStroke();
    pushMatrix();
    translate(x, y);
    fill(r, g, b); 
    rotate(radians(angle));
    angle += speed;
    scale(1.5);

    for (int i = 0; i < 5; i++) {
      ellipse(8, 0, 2 * ratio, 2 * ratio);
      rotate(radians(72));
    }

    fill(#fff9bb); 
    ellipse(0, 0, 13, 13);
    popMatrix();

    for (int i=0; i < pollen.length; i++) {
      pollen[i].drawPollen();
      pollen[i].scatter();
    }
  }

  void drawDeadFlower() {
    noStroke();
    pushMatrix();
    translate(x, y);
    fill(144, 144, 144);
    deadPetals();
    popMatrix();
    stroke(144, 144, 144);
    ellipse(x, y, 13, 13);
    strokeWeight(3);
    line(x, y, x, 500);
  }

  void deadPetals() {

    noStroke();
    for (int i = 0; i < petals; i++) {
      rotate(radians(72));
      ellipse (8, 0, 2 * ratio, 2 * ratio);
    }

    z++;
    if (z == 100||z == 200||z == 300||z == 400||z == 500||z == 600) {
      petals--;
    }

    if (y <= 550 && petals == 0 ) { 
      y++;
    }
  }
}
