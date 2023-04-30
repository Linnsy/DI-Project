//sound
import processing.sound.*;
SinOsc sine;

//serial - for communicating with andruino
import processing.serial.*;

Serial mySerial; //create local serial object from Serial class
String serial_data_string; // Variable for storing data received
Float serial_data_float; // Variable for converting data received

void setup(){
  size(600, 400);
  
  String portName= Serial.list()[3]; //change to 0,1,2 etc to match your port
  mySerial = new Serial(this, portName, 9600);
  
  //create the sine oscillator
  sine = new SinOsc(this);
  sine.play();
  sine.amp(1.0);
  
}


void draw(){
  
  if(mySerial.available()>0){
    serial_data_string = mySerial.readStringUntil('\n');
    //println(serial_data_string);
  }
  if(serial_data_string != null){
    serial_data_float = float(serial_data_string);
    sine.freq(serial_data_float);
  }
}
