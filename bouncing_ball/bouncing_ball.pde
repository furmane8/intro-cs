int x = 50;
int y = 50;
int dx = 6;
int dy = 10;

void draw () {
  
  background(#cdcdcd);
  
  fill(#323232);
  circle(x,y,50);
 
  x = x + dx;
  if (x >= width) {
    dx = -dx;
  } else if (x <= 0) {
    dx = -dx;
  }
  
   y = y + dy;
    if (y >= height) {
    dy = -dy;
  } else if (y <= 0) {
    dy = -dy;
  }
  
}
