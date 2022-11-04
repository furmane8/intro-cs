float x = 50;
float y = 50;
float dx = 6;
float dy = 10;

void draw () {
  
  background(#cdcdcd);
  
  fill(#323232);
  circle(x,y,50);

  x = x + dx;
  if (x >= width || x <= 0) {
    dx = -dx;
  }
  
   y = y + dy;
    if (y >= height || y <= 0) {
    dy = -dy;
  }
  
}
