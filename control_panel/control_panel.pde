//LCD init
#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
#define   CONTRAST_PIN   9
#define   BACKLIGHT_PIN  7
#define   CONTRAST       210

//7Segment init
#include "SevSeg.h"
SevSeg sevseg;
int CentSec=10000;

//Create global variables
unsigned long timer;

void setup() {
  timer=millis();
  randomSeed(analogRead(0));

  // Seven-Segment display setup
  sevseg.Begin(false,11,12,9,8,7,6,5,4,3,2,1,0);
  
  // LCD setup
  pinMode(CONTRAST_PIN, OUTPUT);
  pinMode(BACKLIGHT_PIN, OUTPUT);
  digitalWrite(BACKLIGHT_PIN, HIGH);
  analogWrite (CONTRAST_PIN, CONTRAST);
  lcd.begin(16,2);               // initialize the lcd 
  lcd.home ();                   // go home
  lcd.autoscroll();
}

void loop() {
  sevseg.PrintOutput();

  //Check if 100ms has elapsed
  unsigned long mils=millis();
  if (mils-timer>=100) {
    timer=mils;
    CentSec--;
    lcd.print(char(random(255)));
    if (CentSec==0) { // Reset to 0 after counting for 100 seconds.
      CentSec=10000;
    }
    //Update the number to be displayed, with a decimal
    //place in the correct position.
    sevseg.NewNum(CentSec,(byte) 1);
  }
}
