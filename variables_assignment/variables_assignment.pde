int n = 0;

void draw () {
  
  background(#023020);
  
  fill(#00dddd);
  stroke(#ffffff);
  strokeWeight(4);
  rect(n,0,50,50);
  rect(0,n,50,50);
  
  n = n + 2;
  
}
