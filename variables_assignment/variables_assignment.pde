int n = 0;
int m = 450;

void draw () {
  
  background(#023020);
  
  fill(#00dddd);
  stroke(#ffffff);
  strokeWeight(4);
  rect(n,0,50,50);
  rect(0,m,50,50);
  
  n = n + 2;
  m = m - 2;
  
}
