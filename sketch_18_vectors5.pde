
Ball bump;
int elapsedFrames = 0;

void setup(){
  size(600,400);
  bump = new Ball(new PVector(width/2,height/2));
  background(255);
}


void draw(){
  
  bump.run();
  fill(255,40);
  noStroke();
rect(0,0,width,height);
    elapsedFrames++;
}
