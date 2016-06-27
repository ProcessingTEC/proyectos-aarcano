
//Tomas de Camino Beck

import processing.serial.*;
Serial port;
//2 variables, de los puertos sólo vienen strings:
String data;
float[] val = new float[2];
float posX=0;

void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista igual al de arduino y poner nombre entre las comillas
  port = new Serial(this, "COM6", 9600); //9600 es la velocidad igual a processing
  port.bufferUntil('\n');  //clear the buffer, ponerlo siempre para que vaya sincronizado
  size(600, 600);
 background(255);
}

void draw() {
   
  fill(0);
  float datosArduino = map(val[0],0,900,500,200);
  posX++;
  if(posX>width){
   posX=0; 
  }
  ellipse(posX, datosArduino,2, 2);
  
  
}

//esto es una programacion por evento, cada vez que reciba informacion ejecuta esto:

void serialEvent(Serial port) {
  data = port.readString(); //lee el string la almacena en data
  String[] list = split(data, ','); 
  val[0]=float(list[0]);
  val[1]=float(list[1]);
}