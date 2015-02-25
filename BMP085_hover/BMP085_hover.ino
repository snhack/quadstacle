#include <Wire.h>
#include <Adafruit_BMP085.h>
#include <Adafruit_NeoPixel.h>
#include <avr/power.h>

#define LEDPIN 6

Adafruit_NeoPixel strip = Adafruit_NeoPixel(1, LEDPIN, NEO_GRB + NEO_KHZ800);

#define PIEZO 9

// Connect VCC of the BMP085 sensor to 3.3V (NOT 5.0V!)
// Connect GND to Ground
// Connect SCL to i2c clock - on '168/'328 Arduino Uno/Duemilanove/etc thats Analog 5
// Connect SDA to i2c data - on '168/'328 Arduino Uno/Duemilanove/etc thats Analog 4
// EOC is not used, it signifies an end of conversion
// XCLR is a reset pin, also not used here

Adafruit_BMP085 bmp;
  
long pmin, pmax, c, hover;
uint8_t c1 = 0;

void setup() {
  pinMode(13, OUTPUT);
  
  pmin = bmp.readPressure();
  pmax = pmin;
  c = 0;
  hover = 0;
  
  strip.begin();
  strip.show();
  
  pinMode(PIEZO, OUTPUT);
}
  
void loop() {
    long p = bmp.readPressure();
    
    if (c < 20) {
       if (p > pmax) pmax = p;
       if (p < pmin) pmin = p;
    } else {
       if (c == 20) {
          pmax += 10;
          pmin -= 10; 
       }
       digitalWrite(13,  HIGH);
       
       if (p > pmax || p < pmin) {
           hover++;
           if (c1 < 240) {
              c1 += 10;
           } else {
              c1 = 255;
              
              // boom!
              boom();
           }
       } else {
          if (c1 > 10) {
              c1 -= 5;
          } else {
             c1 = 0; 
          }
          
          if (p > pmax) pmax = p;
          if (p < pmin) pmin = p;
 
       }
        strip.setPixelColor(0, strip.Color(c1,c1,c1));
        strip.show();
        
    }
  
    if (c < 30) c++;
    
    delay(50);
}


void boom() {
  int i;
  for (i=0; i<5; i++) {
     strip.setPixelColor(0, strip.Color(255,0,0));
     strip.show();
     
     beep(100);
  
     strip.setPixelColor(0, strip.Color(0,0,0));
     strip.show();
     
     delay(100);   
  }  
  c1 = 0;
  hover = 0;
        
}

void beep(unsigned char delayms){
  analogWrite(PIEZO, 25);      // Almost any value can be used except 0 and 255
                           // experiment to get the best tone
  delay(delayms);          // wait for a delayms ms
  analogWrite(PIEZO, 0);       // 0 turns it off
  //delay(delayms);          // wait for a delayms ms   
} 
