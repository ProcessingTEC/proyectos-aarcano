//codigo para controlar un servo en relacion al mouse

import processing.serial.*;
Serial port;

void setup(){
  size(600,600);
  port = new Serial(this, "COM6", 9600);
}

void draw(){
  int mX=mouseX;
  int mY=mouseY;
  port.write(nf(mX)+","+nf(mY)+"/n");
  println(nf(mX)+","+nf(mY)+"/n");
}