int number = 10;
float puddle = 0;
float[] yPos = new float[number];
float[] speed = new float[number];
float[] xPos = new float[number];

void setup() {
  size(1000, 600);
  for (int x = 0; x < number; x ++) {
    speed[x] = random(3, 6);
  }
}

void draw() {
  background(20);
  for (int x = 0; x < number; x ++) {
    if (mousePressed) {
      yPos[x] = mouseY;
      xPos[x] = mouseX;
      speed[x] = random(3, 6);
    }

    yPos[x] = yPos[x] + speed[x];
    raindrop(xPos[x] + 10 * x, yPos[x], 20, 20);

    if (yPos[x] > height + 20) {
      yPos[x] = 0;
      puddle = puddle + 0.5;
    }
  }

  fill(100, 100, 244);
  ellipse(500, 600, 1000, puddle);
  textSize(50);
  text(puddle/2, 400, 300);
}


void raindrop(float xCenter, float yCenter,
  float w, float h) {
  noStroke();
  fill(218, 237, 244);
  triangle(xCenter - w/2, yCenter, xCenter + w/2, yCenter, xCenter, yCenter - h);
  arc(xCenter, yCenter, w, h, 0, PI);
}
