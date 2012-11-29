#include <LiquidCrystal.h>

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
#define   CONTRAST_PIN   9
#define   BACKLIGHT_PIN  7
#define  CONTRAST       210

void setup()
{
  // Switch on the backlight and LCD contrast levels
  pinMode(CONTRAST_PIN, OUTPUT);
  pinMode(BACKLIGHT_PIN, OUTPUT);

  digitalWrite(BACKLIGHT_PIN, HIGH);
  analogWrite (CONTRAST_PIN, CONTRAST);
    
  lcd.begin(16,2);               // initialize the lcd 

  lcd.home ();                   // go home
  lcd.autoscroll();
  randomSeed(analogRead(0));
}

void loop()
{
  lcd.print(char(random(255)));
  delay(1000);
  /*
  // Scrolling text LEFT
  lcd.setCursor(0, 0);
  lcd.print("This landing is gonna get pretty interesting");
  delay(500);
  for(int i=0; i<43; i++) {
    lcd.scrollDisplayLeft();
    delay(200);
  }
  lcd.clear();   // Clear the display
  lcd.setCursor(0, 1);
  lcd.print("Define 'interesting'.");
  delay(500);
  for(int i=0; i<16; i++) {
    lcd.scrollDisplayLeft();
    delay(200);
  }
  lcd.clear();   // Clear the display
  lcd.setCursor(0, 0);
  lcd.print("Oh God, oh God, we're all going to die?");
  delay(500);
  for(int i=0; i<24; i++) {
    lcd.scrollDisplayLeft();
    delay(200);
  }
  lcd.clear();   // Clear the display
  lcd.clear();*/
}


