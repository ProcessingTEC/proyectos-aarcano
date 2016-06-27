
//Tomas de Camino Beck

import processing.serial.*;
Serial port;
//2 variables, de los puertos sólo vienen strings:
String data;
float[] val = new float[2];


void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista igual al de arduino y poner nombre entre las comillas
  port = new Serial(this, "COM6", 9600); //9600 es la velocidad igual a processing
  port.bufferUntil('\n');  //clear the buffer, ponerlo siempre para que vaya sincronizado
  size(600, 600);

}

void draw() {
    background(255);
  fill(200);
  ellipse(width/2, height/2, map(val[0],0,300,300,0), map(val[1],0,300,300,0));
}

//esto es una programacion por evento, cada vez que reciba informacion ejecuta esto:

void serialEvent(Serial port) {
  data = port.readString(); //lee el string la almacena en data
  String[] list = split(data, ','); 
  val[0]=float(list[0]);
  val[1]=float(list[1]);
  
}