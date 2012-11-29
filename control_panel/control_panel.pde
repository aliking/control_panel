
#include "SevSeg.h"

//Create an instance of the object.
SevSeg sevseg;

//Create global variables
unsigned long timer;
int CentSec=10000;

void setup() {
  // put your setup code here, to run once:
  sevseg.Begin(false,11,12,9,8,7,6,5,4,3,2,1,0);
  timer=millis();
}

void loop() {
  // put your main code here, to run repeatedly: 
    //Produce an output on the display
  sevseg.PrintOutput();

  //Check if 100ms has elapsed
  unsigned long mils=millis();
  if (mils-timer>=100) {
    timer=mils;
    CentSec--;
    if (CentSec==0) { // Reset to 0 after counting for 100 seconds.
      CentSec=10000;
    }
    //Update the number to be displayed, with a decimal
    //place in the correct position.
    sevseg.NewNum(CentSec,(byte) 1);
  }
}
