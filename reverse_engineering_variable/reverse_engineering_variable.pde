int n = 500;
int x = 0;
int y = 0;
int m = 50;

void draw () {
  
  background(#000000);
  
  fill (#ff0000, x);
  circle(250,250,200);
  x = x + 1;
  
  fill(#ffffff);
  square(300,y,40);
  y = (y + 1)%500;
  
  fill(#ffffff);
  triangle(0,0,0,100,m,50);
  m = m + 1;
  
  fill(#ffffff);
  square(0,0,n);
  n = n - 4;
  
}
