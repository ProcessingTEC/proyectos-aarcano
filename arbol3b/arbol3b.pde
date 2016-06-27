float x, y;

void setup() {
  size(600, 600);
   background(255);
   x=300;
   y=600;
}

void draw() {
  background(255);
  translate(width/2,height);
  float largo= map(mouseY,0,height,height,0);
  branch(largo, 0.7);

}

void branch(float len, float p) {
  float angulo= map(mouseX,0,width,0,PI);
  float ancho = map(len,0,height,01,30);
  strokeWeight(ancho);
  line(0, 0, 0, -len);
  if(len >5){
    pushMatrix();
  translate(0,-len);
  rotate(angulo);
  branch(len*p,0.7);
  popMatrix();
  pushMatrix();
    translate(0,-len);
  rotate(-angulo);
  branch(len*p,0.7);
  popMatrix();

  }

}