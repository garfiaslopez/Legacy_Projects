#include "HC_SR04/HC_SR04.h"

Servo Door;

int bucket_Tg = A0;
int bucket_Ec = A1;
int dish_Tg = A2;
int dish_Ec = A3;


void setup()
{
    Serial.begin(9600);
    Door.attach(D0);
}


void loop()
{
    serveFood(10,180,1,5);
}

void serveFood(int speed, int toPosition, int steps, int feedingSec) {

    //open door
    int position = 0;
    for(position = 0; position < toPosition; position += steps) {
        Door.write(position);
        delay(speed);
    }
    Serial.println(position);

    delay((feedingSec * 1000));
    // close door
    for(position = toPosition; position > 0; position -= steps){
        Door.write(position);
        delay(speed);
    }
    Serial.println(position);
    delay((feedingSec * 1000));

}
