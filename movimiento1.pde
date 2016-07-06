int grilla=20;
float x, y;


void setup() {
  size(700, 500);
  x= random(10, 690);
  y=random(10, 490);
  noCursor();
}

void draw() {
  background(255);

  bola();
  fill(0,200,0);
  noStroke();
  ellipse(mouseX, mouseY, 10,10);
  for (int i=0; i<width; i=grilla+i) {
    for (int j=0; j<height; j=j+grilla) {

      float tama= dist(i, j, x, y);
      float num = map(tama, 0, 600, 0, 20);
      fill( 13*num, 13*num, 255-13*num, 150);
      strokeWeight(0.5);
      stroke(0,200);
      rect(i, j, num, num);
      if (tama<70) {
        stroke(tama*2,0,255-tama*2);
        strokeWeight(0.5);
        line(i, j, x, y);
      }
    }
  }
}


void bola() {
  fill(0, 150);
  ellipse(x, y, 10, 10); 
  x+=(mouseX-x)/50;
  y+=(mouseY-y)/50;

}