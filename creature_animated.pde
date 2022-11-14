int y = 400; //up and down the screen
int a = 0; //left foot
int da = -2;
int b = -50; //right foot 
int db = -2;
int r = 90; //claw
int dr = 2;
int nr = 270;

void draw () {
  
  background(#00eeee);
  
  translate(250,y);
  scale(.4);

  //settings and stroke weight
strokeWeight(2);
noFill ();
  //right leg
push();
translate(0,b);
fill(#878787);
rect(250,575,80,150);
rect(250,725,140,40);
pop();
  //left leg
push();
translate(0,a);
fill(#878787);
rect(425,575,80,150);
rect(425,725,140,40);
pop();
  //top body
strokeWeight(2);
fill(#5A5A5A);
quad(150,110,350,100,375,300,125,300);
quad(350,100,650,110,675,300,375,300);
fill(#232326);
rect(115,300,260,20);
rect(375,300,310,20);
  //left arm
fill(#999999);
quad(653,448,625,480,675,525,705,490);
fill(#eb4034);
arc(715,530,100,100,radians(r), radians(nr), PIE);
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
arc(305,530,100,100,radians(r), radians(nr), PIE);
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

y = y - 3;

if (y <= -300) {
  y = 800;
}

a = a + da;
b = b + db;

if (a >= 0) {
  da = -(da);
} else if (a <= -50) {
  da = abs(da);
}

if (b >= 0) {
  db = -(db);
} else if (b <= -50) {
  db = abs(db);
}

r = r - dr;
nr = nr + dr;

if (r <= 0) {
  dr = -dr;
} else if (r >= 90) {
  dr = abs(dr);
}
  
}
