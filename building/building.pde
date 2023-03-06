void setup () {

  size(800, 800);

  //there are 2 less windows than the number put into the function

  for (int i = 0; i <= 3; i++) {
    for (int b = 0; b <= 7; b++) {
      int high = (int) random(2, 5);
      int window = (int) random(2, 6);
      int doorBoolean = (int) random(0, 2);
      int wide = (int) random(80, 120);
      boolean door;

      if (doorBoolean == 0) {
        door = true;
      } else {
        door = false;
      }

      build(b * 100, height - 200 * i, wide, window, high, door);
    }
  }
}

void build (int x, int yBottom, int w,
  int numWindows, int numFloors,
  boolean doubleDoors) {

  fill(130);
  rect(x, yBottom - (numFloors * 50), w, (numFloors) * 50);

  if (doubleDoors == false) {
    fill(50);
    rect(x + w/2 - 12.5, yBottom - 50, 25, 50);
    fill(255, 255, 0);
    circle(x + w/2 - 6.5, yBottom - 25, 5);
  } else {
    fill(50);
    rect(x + w/2 - 12.5 - 13, yBottom - 50, 25, 50);
    rect(x + w/2 - 12.5 + 13, yBottom - 50, 25, 50);
    fill(255, 255, 0);
    circle(x + w/2 + 19.5 - 13, yBottom - 25, 5);
    circle(x + w/2 + 19.5 - 27, yBottom - 25, 5);
  }

  int windowstep = w / (numWindows + 1);

  push();
  fill(255);
  rectMode(CENTER);
  for (int floorOn = 1; floorOn < numFloors; floorOn = floorOn + 1) {
    for (int windowOn = 1; windowOn <= numWindows; windowOn = windowOn + 1) {
      rect(x + windowOn * windowstep,
        yBottom - numFloors * 50 + floorOn * 50 - 25,
        100/numWindows, 30);
    }
  }
  pop();
}
