// Round 1: Hill climb (using this as calibration)

#include <EEPROM.h>

//CHANGE THESE LATER
const int powerpin = 1;
const int dirpin = 2;
const int switchpin = 3;

#define FORWARD HIGH
#define BACKWARD LOW

//lmao dont change this
#define BUFFERLEN 4

byte values[BUFFERLEN];
int out;

int 

void setup() {
  Serial.begin(38400);
  pinMode(powerpin,OUTPUT);
  pinMode(dirpin,OUTPUT);
  pinMode(switchpin,INPUT_PULLUP); //Connect switch to ground, reads HIGH when open
  
  //Read data back from controller and present to user
  for(int i = 0; i < BUFFERLEN; i++){
    values[i]= EEPROM.read(i);
  }

  out = values[0] + values[1]*511 + values[2]*511*511 + values[3]*511*511*511;

  Serial.print("The last average recorded was: ");
  Serial.println(num);

  while(digitalRead(switchpin));

  //Clear data before writing
  for(int i = 0; i < BUFFERLEN; i++){
    EEPROM.write(i,0);
  }
  digitalWrite(dirpin,FORWARD);
  digitalWrite(powerpin,HIGH);
}

void loop() {
  // put your main code here, to run repeatedly:

}
