
#include "SevSeg.h"

//Create an instance of the object.
SevSeg sevseg;

//Create global variables
unsigned long timer;
int CentSec=0;

void setup() {
  // put your setup code here, to run once:
  sevseg.Begin(1,2,3,4,5,6,7,8,9,10,11,12,13);
  timer=millis();
}

void loop() {
  // put your main code here, to run repeatedly: 
    //Produce an output on the display
  sevseg.PrintOutput();

  //Check if 10ms has elapsed
  unsigned long mils=millis();
  if (mils-timer>=10) {
    timer=mils;
    CentSec++;
    if (CentSec==10000) { // Reset to 0 after counting for 100 seconds.
      CentSec=0;
    }
    //Update the number to be displayed, with a decimal
    //place in the correct position.
    sevseg.NewNum(CentSec,(byte) 2);
  }
}
