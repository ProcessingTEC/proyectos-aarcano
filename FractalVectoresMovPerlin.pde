//By Esteban Castro
//A partir de fractales de curso de Tomás de Camino


float perlinFloat;
int elapsedFrames = 0;
PVector noiseBranch, vel; 

void setup() {
  size(600, 600); 
  noiseBranch = new PVector();
  vel = new PVector();
}

void draw() {
  background(255);

  translate(width/2, height);
  float len=150;
  branch(len);
  elapsedFrames++;
}


void branch(float len) {
  float angulo = map(mouseX, 0, width, 0, HALF_PI);
  float i = 0;
  float f = -len;
  PVector in = new PVector (i, i);
  PVector fin = new PVector (i, f);

  PVector offset = PVector.random2D();

  offset.mult(0.2);
  //fin.add(offset);

  //funcion perlin tomada de otro sketch:
  perlinFloat = noise(in.x * 0.0025, fin.y * 0.0025, elapsedFrames * 0.001);
  noiseBranch.y = cos(((perlinFloat - 0.3) * TWO_PI) * 10);
  noiseBranch.x = sin(((perlinFloat - 0.3)* TWO_PI) * 10);
  vel.add(noiseBranch);
  vel.div(2);
  fin.add(vel);

  float ancho = map(len, 0, height, 0.2, 20);
  strokeWeight(ancho); 
  line(in.x, in.y, fin.x, fin.y); 

  if (len>5) {
    
    pushMatrix();
    translate(fin.x, fin.y);
    rotate(angulo);
    branch(len*0.7);
    popMatrix();

    pushMatrix();
    translate(fin.x, fin.y);
    rotate(-angulo);
    branch(len*0.7);
    popMatrix();
  }
}