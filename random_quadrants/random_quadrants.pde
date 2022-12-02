int x;
int y;
int r;
int g;
int b;

void draw () {
  
  x = (int) random(0,601);
  y = (int) random(0,601);
 
  if (x <= 300 && y <= 300) {
    r = 255;
    g = 0;
    b = 0; 
  } 
  if (x > 300 && y <= 300) {
    r = 255;
    g = 255;
    b = 0;
  }
    
    if (x <= 300 && y > 300) {
    r = 0;
    g = 0;
    b = 255; 
  } 
  if (x > 300 && y > 300) {
    r = 0;
    g = 175;
    b = 0;
  }
  
  fill(r, g, b);
  circle(x,y,20);
  
}
