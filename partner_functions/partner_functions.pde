void setup () {

  size(800, 800);
  background(180);
}

void draw () {

  push();
  translate(150, 425);
  shield();
  pop();

  push();
  translate(-50,-100);
  shield();
  pop();
  
  push();
  translate(350,-100);
  shield();
  pop();

  push();
  translate(-300, -225);
  fill(000000);
  star();
  translate(140, 120);
  scale(.8);
  fill(#FFFFFF);
  star();
  translate (280, 240);
  scale(.6);
  fill(#ff0000);
  star();
  pop();
}

void shield () { //this is Ethan's function

  fill(#ff0000);
  circle(250, 250, 200);
  fill(#ffffff);
  circle(250, 250, 175);
  fill(#ff0000);
  circle(250, 250, 145);
  fill(#0000ff);
  circle(250, 250, 110);
  fill(255);
  beginShape();
  vertex(215, 240);
  vertex(240, 240);
  vertex(250, 210);
  vertex(260, 240);
  vertex(285, 240);
  vertex(265, 255);
  vertex(275, 285);
  vertex(250, 265);
  vertex(225, 285);
  vertex(235, 255);
  endShape();
}

void star() { //this is Francesca's function
  beginShape();
  vertex(700, 700);
  vertex(900, 900);
  vertex(800, 650);
  vertex(1000, 550);
  vertex(800, 555);
  vertex(700, 350);
  vertex(600, 555);
  vertex(400, 550);
  vertex(600, 650);
  vertex(500, 900);
  vertex(700, 700);
  endShape();
}
