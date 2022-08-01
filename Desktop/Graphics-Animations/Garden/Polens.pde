class Pollens {

  float x, y, dirX, dirY;

  void drawPollen() {

    strokeWeight(5);
    stroke(#FFF380, 90); 
    point(x, y);
  }

  void scatter() {
    dirX = random(-5, 5);
    dirY = random(-5, 5);
    x += dirX;
    y += dirY;
  }
}
