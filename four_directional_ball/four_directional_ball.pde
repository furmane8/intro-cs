int x = 20;
int dx = 0;
int y = 20;
int dy = 0;
int speed = 5;

void draw () {
  
  background(#111111);
  circle(x,y,20);
  
  x = x + dx;
  y = y + dy;
  
     //go down IF x = 20, y < 480
  if (x == 20 && y<=480) {
    dx = 0;
    dy = speed;}
    
     //go right IF y = 480 and x < 20
  if (y == 480 && x <= 20) {
    dy = 0;
    dx = speed;}
    
    //go up if x = 480 and y > 480
  if (x == 480 && y >= 480) {
    dx = 0;
    dy = -speed; }
    
    //go left if y = 20 and x > 480
  if (y == 20 && x >= 480) {
    dy = 0;
    dx = -speed; }
  
}
