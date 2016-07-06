
class Ball {

  PVector location, velocity, noiseVec;
  float rad = 2;
  float noiseFloat, lifeTime, age;
  boolean isDead;

  Ball(PVector _loc ) {
    location = _loc;
    velocity = new PVector();
    noiseVec = new PVector();
    age = 0;
    isDead = false;
  } 

  void run() {
    display();
    move();
    bounce();
  }
  void display() {

    strokeWeight(0.1);
    fill(80);
    ellipse(location.x, location.y, rad*2, rad*2);
  }

  void move() {
    noiseFloat = noise(location.x * 0.0025, location.y * 0.0025, elapsedFrames * 0.001);
    noiseVec.x = cos(((noiseFloat -0.3) * TWO_PI) * 10);
    noiseVec.y = sin(((noiseFloat - 0.3) * TWO_PI) * 10);

    velocity.add(noiseVec);
    velocity.div(2);


    location.add(velocity);
  }

  void bounce() {
    if (location.x>width) {
      velocity.x = velocity.x * -1;
      noiseVec.x = noiseVec.x *-1;
      location.x = width;
    }
    if (location.x<0) {
      velocity.x = velocity.x * -1;
    noiseVec.x = noiseVec.x *-1;
      location.x=0;
    }

    if (location.y>height) {
      velocity.y = velocity.y * -1;
    noiseVec.y = noiseVec.y *-1;
      location.y=height;
    }
    if (location.y<0) {
      velocity.y = velocity.y * -1;
    noiseVec.y = noiseVec.y *-1;
      location.y=0;
    }
  }
}

