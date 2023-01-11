/*This is an animation of an ocean scene with one small fish and one bigger shark
 going in opposite direction with a random y position. There is also a small boat
 bouncing around the screen and waves that are drawn in random locations with a
 fluctuating number of waves generated per frame. I tried to make the boat follow where
 you dragged your mouse, but I decided against it because I thought that the bouncing
 boat looked nicer. It took me a while to figure the wave generation code because I had
 to figure out the for loop and coundown. I like swimming and fishing, so I was inspired
 by that to create this ocean scene. */

int fishx = 800; //x and y of small fish
int fishy;
int fish2x = 0; //x and y of big fish
int fish2y;
float boatx = 400; //x and y of boat
float boaty = 400;
float boatdx = 2; //change in x and y of boat
float boatdy = 3;
int wavex; //x and y of random waves
int wavey;
int waveCountdown = 199; //wave countdown for new wave generation
boolean newWaves; //shows whether or not the countdown has reached 0
int amountOfWaves = 5; //amount of waves generated each frame

void draw () {

  background(#2987ca);
  noStroke();

  //fish number one

  push();
  translate(fishx, fishy);
  fill(#ffaaaa);
  triangle(30, 0, 65, -25, 65, 25);
  ellipse(0, 0, 80, 50);
  fill(0);
  circle(-20, -10, 5);
  pop();
  fishx = fishx - 2;

  //fish number two (shark)

  push();
  translate(fish2x, fish2y);
  fill(#343434);
  triangle(-90, 0, -170, -40, -170, 40);
  triangle(70, -20, -70, -70, -20, -20);
  ellipse(0, 0, 240, 80);
  fill(255);
  ellipse(0, 19, 200, 40);
  fill(0);
  circle(80, -10, 8);

  pop();
  fish2x = fish2x + 3;

  //fish random position

  if (fishx < -80) {
    fishx = 880;
    fishy = (int) random(50, 751);
  } else if (fishx > -80) {
    fishx = fishx - 2;
  } else {
    fishx = 880;
    fishy = (int) random(50, 751);
  }

  //fish number two (shark) random position

  if (fish2x >= 880) {
    fish2x = -80;
    fish2y = (int) random(50, 751);
  } else if (fish2x > -80) {
    fish2x = fish2x + 3;
  } else {
    fish2x = -80;
    fish2y = (int) random(50, 751);
  }

  //blue tint over the fish
  
  fill(#00008b, 50);
  rect(-1, -1, 850, 850);

  //random waves countdown for a new number of waves

  waveCountdown = waveCountdown - 1;

  if (waveCountdown > 0) {
    newWaves = true;
  } else if (waveCountdown <= 0) {
    newWaves = false;
  }

  //wave generation + making a random number of waves per frame

  if (newWaves == true) {
    for (int i = 0; i < amountOfWaves; i = i+1) {
      wavex = (int) random(1, 801);
      wavey = (int) random(1, 801);
      push();
      translate(wavex, wavey);
      noFill();
      stroke(255);
      strokeWeight(4);
      arc(-20, 0, 40, 20, 0, PI);
      arc(20, 0, 40, 20, 0, PI);
      pop();
    }
  } else if (newWaves == false) {
    waveCountdown = 200;
    amountOfWaves = (int) random(3, 8);
  }

  //boat

  fill(0);
  push();
  translate(boatx, boaty);
  stroke(0);
  strokeWeight(5);
  line(0, 0, 0, -40);
  noStroke();
  fill(#ff0000);
  arc(0, 0, 90, 75, 0, PI, PIE);
  fill(255);
  triangle(0, -10, -25, -25, 0, -40);
  pop();

  //boat bouncing animation - this was borrowed from my own bouncing ball code

  boatx = boatx + boatdx;
  if (boatx >= width-20 || boatx <= 20) {
    boatdx = -boatdx;
  }

  boaty = boaty + boatdy;
  if (boaty >= height-20 || boaty <= 20) {
    boatdy = -boatdy;
  }
}
