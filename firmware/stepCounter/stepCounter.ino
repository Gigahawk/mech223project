const int maxval = 500;
const int minval = 450;
int photopin = A0;
int lastread=0;
int currread=0;

bool ishigh=false;

int rungs = 0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  //Serial.println(analogRead(photopin));
  waitForHigh();
  waitForLow();
  rungs++;
  Serial.println(rungs);

} 

void waitForHigh(){
  while(analogRead(photopin)<maxval);
}
void waitForLow(){
  while(analogRead(photopin)>minval);

}


