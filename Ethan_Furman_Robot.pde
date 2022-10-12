void setup() {
  
  //sizing and background color
size(800,850);
background(#ADD8E6);

}

void draw() {
  
  //shows the coordinatrs when mouse is clicked (covered in class)
if (mousePressed) {
  System.out.println(mouseX + "," + mouseY);
}

  //settings and stroke weight
strokeWeight(2);
noFill ();

  //right leg
fill(#878787);
rect(250,575,80,150);
rect(250,725,140,40);
arc(360,725,60,50,PI,TWO_PI,PIE);
  
  //left leg
rect(425,575,80,150);
rect(425,725,140,40);
arc(535,725,60,50,PI,TWO_PI,PIE);

  //top body
noFill();
arc(220,110,50,40,PI,TWO_PI);
arc(280,110,50,40,PI,TWO_PI);
arc(340,110,50,40,PI,TWO_PI);
arc(400,110,50,40,PI,TWO_PI);
strokeWeight(7);
line(520,200,450,25);
line(530,200,590,25);
strokeWeight(2);
fill(#5A5A5A);
quad(150,110,350,100,375,300,125,300);
quad(350,100,650,110,675,300,375,300);
fill(#232326);
rect(115,300,260,20);
rect(375,300,310,20);
ellipse(245,210,80,120);
fill(#eb4034);
circle(245,210,50);
  
  //left arm
fill(#999999);
quad(653,448,625,480,675,525,705,490);
fill(#eb4034);
arc(715,530,100,100,-PI-HALF_PI, 0, PIE);
  
  //bottom body 
fill(#656565);
quad(125,320,375,320,375,600,150,575);
quad(375,320,675,320,650,575,375,600);

  //right arm
fill(#999999);
quad(275,415,275,335,175,445,215,480);
quad(243,448,215,480,265,525,295,490);
fill(#333333);
circle(275,375,80);
fill(#eb4034);
arc(305,530,100,100,-PI-HALF_PI, 0, PIE);

  //buttons
strokeWeight(5);
fill(#acacac);
quad(435,365,625,363,605,530,435,545);
fill(#0fa60f);
circle(535,400,35);
fill(#a80202);
circle(585,400,35);
fill(#000000);
rect(455,380,15,100);
rect(480,380,15,100);
fill(#ffff00);
triangle(560,425,540,455,580,455);
triangle(560,495,540,465,580,465);
fill(#051cb3);
ellipse(495,510,80,30);
noFill();
strokeWeight(2);
circle(495,510,15);
fill(#000000);
circle(560,515,15);
circle(585,515,15);
circle(598,435,15);
circle(598,460,15);
circle(598,485,15);

  //face
fill(#acacac);
quad(425,125,625,130,645,280,445,280);
fill(#FFFF00);
strokeWeight(6);
rect(487,150,20,20);
rect(562,150,20,20);
rect(527,175,20,20);
rect(462,200,20,20);
rect(482,220,20,20);
rect(502,240,70,20);
rect(572,220,20,20);
rect(592,200,20,20);

}
