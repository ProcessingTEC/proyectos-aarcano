//modificacion data 
//Esteban Castro

import controlP5.*;
ControlP5 cp5;
int TextSize=10;

BufferedReader reader;
String line;
int R=1;//6371;//radio de la tierra en km
PFont font;

void setup() {
  cp5 = new ControlP5(this);
  cp5.addSlider("TextSize")
    .setPosition(10, height-15)
    .setRange(3, 16)
    .setValue(9)
    ;
  font = loadFont("CordiaNew-48.vlw");
  textSize(9);
  textAlign(RIGHT);
  // Open the file from the createWriter() example
  reader = createReader("Qdata.txt"); 
  size(600, 600); 
  background(255);
  smooth(8);
}

void draw() {
textFont(font, TextSize);
  fill(0);
  line = getLine(reader);
  if (line == null) {
    // detiene el loop
    noLoop();
  } else {
    //divide la linea en elementos separados por coma
    String[] pieces = split(line, ',');
    float x = float(pieces[0]);
    float y = float(pieces[1]);
    float speed =float(pieces[2]);
    float air= float(pieces[3]);



    float pX = (width-toX(x, y)*width-250);
    float pY = toY(x, y)*height;
    float posX = map(pX, -30, -95, width-20, 40);

    float posY= map(pY, 280, 370, 0, height-80);
    println(air);
    noStroke();

    float airMap=map(air, 100, 600, 0, 255);
    //line(20,20,posX,20);




    pushMatrix(); 
    translate(posX, posY);
    strokeWeight(1);
    point(0, 0);
    stroke(56, 88, 181, 50);
    line(0, 0, 0, speed);
    if (speed>55) {
      fill(0);
      noStroke();
      ellipse(0, speed, 2, 2); 
      strokeWeight(0.5);
      stroke(0,70);
      line(0, speed, -60, speed);
      fill(70,90,250,100);
      text(speed, -60, speed);
    }
    popMatrix();

    stroke(20, 20);
    strokeWeight(0.5);
    fill(air, 255-airMap, 255-airMap, airMap);
    ellipse(posX, posY, air/5, air/5);
  }
} //fin de draw

//geographic to cartessian
float toX(float lat, float lon) {
  float x = R * cos(lat) * cos(lon);
  return x;
}

float toY(float lat, float lon) {
  float y = R * cos(lat) * sin(lon);
  return y;
}

//get each file line
String getLine(BufferedReader r) {
  String l;
  try {
    l = r.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    l = null;
  } 
  return l;
}