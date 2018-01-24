#include "I2Cdev.h"
#include "MPU6050.h"

// Number of entries to do turn detection over 
#define BUFFER_SIZE 8

// Higher number is less sensitive
#define THRESHHOLD 20
#define TURNTHRESH 6000
// Arduino Wire library is required if I2Cdev I2CDEV_ARDUINO_WIRE implementation
// is used in I2Cdev.h
#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    #include "Wire.h"
#endif

MPU6050 accelgyro;

int16_t gx=1000;

long buffer[BUFFER_SIZE] = {0};

long rotX = 0;
int count = 0;
int zerocount = 0;
int turns = 0;

void setup() {
  // put your setup code here, to run once:
    // join I2C bus (I2Cdev library doesn't do this automatically)
    #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
        Wire.begin();
    #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
        Fastwire::setup(400, true);
    #endif

    // initialize serial communication
    // (38400 chosen because it works as well at 8MHz as it does at 16MHz, but
    // it's really up to you depending on your project)
    Serial.begin(38400);

    // initialize device
    Serial.println("Initializing I2C devices...");
    accelgyro.initialize();

    // verify connection
    Serial.println("Testing device connections...");
    Serial.println(accelgyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
    Serial.println("Waiting for gyro to zero out");
//    while(gx !=0){
//      accelgyro.getRotation(&gx,NULL,NULL);
//      Serial.println(gx);
//    }
    Serial.println("Starting");
//    for(int i = 0; i < 100; i++){
//      accelgyro.getRotation(NULL,NULL,NULL);
//      delay(50);
//    }
}

void loop() {
  // put your main code here, to run repeatedly:

  count++;
  accelgyro.getRotation(&gx,NULL,NULL);
  // It overflows or smth
//  gx/=10000;

  rotX = rotX/(count)*(count-1) + gx/count;
  
  //Serial.println(count);
  Serial.print(gx);
  Serial.print("\t");
  Serial.print(rotX);

  addToBuffer(rotX);

  if(detectTurn()){
    turns++;
    flushBuffer();
  }
    

  Serial.print("\t");
  Serial.print(turns);
  Serial.print("\t");
  Serial.print(abs(rotX));
  Serial.print("\t");
  Serial.println(abs(gx) > TURNTHRESH? "Turning":"Not Turning");

//  if(rotX == 0)
//    zerocount++;
//
//  if(zerocount > 100){
//    count = 0;
//    rotX = 0;
//  }

  delay(100);
}

bool detectTurn(){
  long minval = 2147483647;
  long maxval = -2147483648;
  for(int i = 0; i < BUFFER_SIZE; i++){
    if(buffer[i] < minval)
      minval = buffer[i];
    if(buffer[i] > maxval)
      maxval = buffer[i];
  }
  if(maxval - minval > THRESHHOLD && maxval > 0 && minval < 0)
//  if(maxval - minval > THRESHHOLD)
    return true;
  else
    return false;
    
}

void addToBuffer(long value){
  for(int i = 0; i < BUFFER_SIZE - 1; i++)
    buffer[i] = buffer[i+1];
    
  buffer[BUFFER_SIZE -1] = value;
}
void flushBuffer(){
  for(int i = 0; i < BUFFER_SIZE; i++)
    buffer[i] = 0;
}

