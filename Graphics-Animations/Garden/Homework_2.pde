PImage cloud;

void setup() {
  size(500, 500);
  cloud = loadImage("cloud.png");
  for (int i = 0; i< flowers.length; i++ )
  {
    flowers[i] = new Garden();
  }
}

Garden[] flowers = new Garden[40];

void draw()
{

  noStroke();

  background(#83d475);
  rect(0, 0, width, 200);

  for (int i = 0; i< flowers.length; i++ )
  {
    if (pollination(i)) {
      flowers[i].drawDeadFlower();
    } else {
      flowers[i].drawFlower();
    }
    fill(#bcd9ea);
  }

  image(cloud, 50, 20);
  image(cloud, 350, 80);
}

Boolean pollination(int i) {

  boolean pollinated = false;

  for (int k = 0; k < flowers.length; k++) {
    if (i == k) {
      i++;
    } else {
      for (int j = 0; j < flowers[i].pollen.length; j++) {
        if ((flowers[i].pollen[j].x * flowers[i].pollen[j].x) +
          (flowers[i].pollen[j].y * flowers[i].pollen[j].y) <
          (flowers[k].ratio * flowers[k].ratio)) {
          pollinated = true;
        }
      }
    }
  }
  return pollinated;
}
