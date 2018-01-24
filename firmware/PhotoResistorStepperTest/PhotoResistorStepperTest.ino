/*     Simple Stepper Motor Control Exaple Code
 *      
 *  by Dejan Nedelkovski, www.HowToMechatronics.com
 *  
 */

// defines pins numbers
const int stepPin = 3; 
const int dirPin = 4; 
const int delaymic=100;
int startdelay=500;
 
void setup() {
  // Sets the two pins as Outputs
  Serial.begin(9600);
  pinMode(stepPin,OUTPUT); 
  pinMode(dirPin,OUTPUT);
  digitalWrite(dirPin,HIGH);
}
void loop() {
  digitalWrite(stepPin,HIGH);
  delayMicroseconds(startdelay);
  digitalWrite(stepPin,LOW);
  delayMicroseconds(startdelay);
  if(startdelay > delaymic)
    startdelay--;
}
