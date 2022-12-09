String userChoice = "NotChosen";
int computerChoice;
int userScore = 0;
int computerScore = 0;

void setup () {
  
 size(700,700); 
 background(#00cccc);
 textSize(40);
  
}

void draw () {
  
  text("VS", 330,375);
  text("Player Score",100,600);
  text("Computer Score",350,600);
  
  rectMode(CENTER);
  
  if (userChoice == "Rock") {
    fill(#00cccc);
    noStroke();
    rect(233,350,120,120);
    fill(#ff0000);
    circle(233,350,50);
  } else {
    fill(#ffffff); }
  
  rect(width/4, 100, 150, 75);
  
    if (userChoice == "Paper") {
    fill(#00cccc);
    noStroke();
    rect(233,350,120,120);
    fill(#ff0000);
    rect(233,350,50,100);
  } else {
    fill(#ffffff); }
  
  rect(width/2, 100, 150, 75);
  
    if (userChoice == "Scissors") {
    fill(#00cccc);
    noStroke();
    rect(233,350,120,120);
    fill(#000000);
    stroke(5);
    line(173,290,293,410);
    line(173,410,293,290);
    line(173+233,290,293+233,410);
    line(173+233,410,293+233,290);
    noStroke();
    fill(#ff0000);
  } else {
    fill(#ffffff); }
  
  rect(3*(width)/4, 100, 150, 75);
  
  fill(0);
  text("Rock", width/4 - 40, 115);
  text("Paper", width/2 - 50, 115);
  text("Scissors", 3*width/4 - 66, 115);
  
  if (computerChoice == 1) {
    fill(#00cccc);
    rect(466,350,120,120);
    rect(350,250,700,100);
    fill(#000000);
    text("Computer Chose Rock", 150,250);
    circle(466,350,50);
  } else if (computerChoice == 2) {
    fill(#00cccc);
    rect(466,350,120,120);
    rect(350,250,700,100);
    fill(#000000);
    text("Computer Chose Paper", 150,250);
    rect(466,350,50,100);
  } else if (computerChoice == 3) {
    fill(#00cccc);
    rect(466,350,120,120);
    rect(350,250,700,100);
    fill(#000000);
    text("Computer Chose Scissors", 150,250);
    fill(#000000);
    stroke(5);
    line(173+233,290,293+233,410);
    line(173+233,410,293+233,290);
    noStroke();
  }
  
}

void mousePressed () {
  
  if (mouseX > width/4 - 75 && mouseX < width/4 + 75
  && mouseY > 100 && mouseY < 175) {
    userChoice = "Rock";
    computerChoice = (int) random(1,4);
  } else if (mouseX > width/2 - 75 && mouseX < width/2 + 75
  && mouseY > 100 && mouseY < 175) {
    userChoice = "Paper";
    computerChoice = (int) random(1,4);
  } else if (mouseX > 3*width/4 - 75 && mouseX < 3*width/4 + 75
  && mouseY > 100 && mouseY < 175) {
    userChoice = "Scissors";
    computerChoice = (int) random(1,4);
  } else {
    userChoice = "NotChosen";}
  
  noStroke();
  
   if ((userChoice == "Rock" && computerChoice == 2) || (userChoice == "Paper" && computerChoice == 3) || (userChoice == "Scissors" && computerChoice == 1)) {
    computerScore = computerScore + 1; 
    fill(#00cccc);
    rect(425,650,200,60);
    rect(350,500,400,100);
    fill(0);
    text("Computer Won!",225,500);
    text(computerScore, 425, 650);
  }
  
  if ((userChoice == "Rock" && computerChoice == 3) || (userChoice == "Paper" && computerChoice == 1) || (userChoice == "Scissors" && computerChoice == 2)) {
    userScore = userScore + 1; 
    fill(#00cccc);
    rect(150,650,200,60);
    rect(350,500,400,100);
    fill(0);
    text("You Won!", 275,500);
    text(userScore, 150, 650);
  }
  
  if ((userChoice == "Rock" && computerChoice == 1) || (userChoice == "Paper" && computerChoice == 2) || (userChoice == "Scissors" && computerChoice == 3)) {
  fill(#00cccc);
    rect(350,500,400,100);
    fill(0);
    text("Draw", 300,500);
  }
  
}
