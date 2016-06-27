float x=300;
float y = 600;
float noiseScale = 0.2;
float r;
float xoff = 200;
float n2= 300;
void setup() {
  size(600, 600);
  noiseSeed(300);
}

void draw() {
  background(255);
  xoff = xoff + .006;
  float n = noise(xoff) * width;
  
  //line(n, 0, n, height);
  fill(0);
  textSize(15);
  text("valor noise: "+ n, 10, 20);
  if (y>10) {
    y--;
  }
  r = noise(x);
  x=x+r;
  println(r);
  fill(255);
  ellipse(n, y, 20, 20);
  n2+=(n-n2)/5;
  line(n,y+10,n2,y+30);
}