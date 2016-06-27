//los puertos A0 a  A5 son analagos
//las lecturas analogas son de 10 bits que son de 0 a 1023 que equivalen de 0 a 5 voltios

void setup() {
  // put your setup code here, to run once:
pinMode(A0, INPUT); //puerto de input
Serial.begin(9600); //la velocidad a que envia. 9600 es lo basico
}

void loop() {
  // put your main code here, to run repeatedly cada 4 micro segundos:
  
  //enviar lo que se quiera por el puerto A0:
Serial.print(analogRead(A0));
Serial.print(",");
Serial.println(analogRead(A0));
//delay(50);
}
//click en lupa para ver valores
//el puerto A0 se vuelve el input para casi cualquier sensor
//ver el diagrama en herramientas, Serial Plotter Ctrl + Mayus + L

