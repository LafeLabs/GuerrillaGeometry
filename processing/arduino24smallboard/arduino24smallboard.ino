int x = 0;
int xold = 0;

int buttonValueArray[] = {365,324,282,242,194,146,78,20,413,456,497,539,581,622,665,700,975,940,906,871,837,803,768,735};
String addressArray[] = {"0303","0304","0305","0306","0350","0351","0352","0353","0310","0311","0312","0313","0336","0336","0334","0335","0330","0331","0332","0333","0340","0341","0342","0343"};
int delta = 10;


void setup() {
 Serial.begin(115200);

}

void loop() {
  x = 0;
  for(int index = 0;index < 100;index++){
    x += analogRead(A0);
    delay(1);
  }
  x = x/100.;
  
  Serial.println(x);

  for(int index = 0;index < 24; index++){
    if(xold < 10 && abs(x-buttonValueArray[index]) < delta){
      //Serial.println(addressArray[index]);  
    }
  }

  xold = x;
}
