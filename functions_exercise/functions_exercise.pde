void setup () {

  size(800, 800);
  background(180);
}

void draw () {

  if (mousePressed) {
    println(mouseX, mouseY);
  }

  shield();

  translate(300, 0);
  shield();

  translate(0, 300);
  shield();

  translate(-300, 0);
  shield();
  
  translate(150,-150);
  shield();
  
  translate(0,-300);
  shield();
  
  translate(0,600);
  shield();
  
  translate(-300,-300);
  shield();
  
  translate(600,0);
  shield();
  
}

void shield () {

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
  vertex(265,255);
  vertex(275,285);
  vertex(250,265);
  vertex(225,285);
  vertex(235,255);
  endShape();
}
