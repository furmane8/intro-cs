String text = "Hello"; //text variable
int n = 0; //integer variable
float f = 0.0; //decimal variable
boolean flag; //stores only true or false variable

void draw () {
 
  
  textSize(50);
  text(text, 700, 300);
  fill(#000000);
  square(0,0,n);
  fill(#21f832);
  circle(200,300,f);
    if (flag) {
  n = n + 1;
  f = f + 0.5; }
  
}

void keyPressed () {
  
  if (keyCode == ' ') {
    text = "Goodbye"; 
    flag = false; }
  else {
    text = "oops"; 
    flag = true; }
  
}
