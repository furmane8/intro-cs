float x = 50;
float y = 50;
float dx = 3;
float dy = 4;
color h = color(#ffffff);

void draw () {
  
  background(color(h));
  
  fill(#ffffff);
  circle(x,y,50);

  x = x + dx;
  if (x >= width || x <= 0) {
    dx = -dx;
  }
  
  y = y + dy;
  if (y >= height || y <= 0) {
    dy = -dy;
  }
  
  if (x >= width) {
    h = color(#34d156);
  }
  
  if (x <= 0) {
    h = color(#7773f5);
  }
  
  if (y >= height) {
    h = color(#000000);
  }
 
  if (y <= 0) {
    h = color(#FF69B4);
  }
  
}
