int x = 0;
int xold = 0;
int buttonValueArray[] = {111,225,338,452,566,680,795,909};
int delta = 10;

void setup() {
 Serial.begin(115200);
}

void loop() {
  x = analogRead(A0);
  if(x > buttonValueArray[0] - delta && x < buttonValueArray[0] + delta && xold < 10){
    Serial.println("0330");  
  }
  if(x > buttonValueArray[1] - delta && x < buttonValueArray[1] + delta && xold < 10){
    Serial.println("0331");  
  }
  if(x > buttonValueArray[2] - delta && x < buttonValueArray[2] + delta && xold < 10){
    Serial.println("0332");  
  }
  if(x > buttonValueArray[3] - delta && x < buttonValueArray[3] + delta && xold < 10){
    Serial.println("0333");  
  }
  if(x > buttonValueArray[4] - delta && x < buttonValueArray[4] + delta && xold < 10){
    Serial.println("0334");  
  }
  if(x > buttonValueArray[5] - delta && x < buttonValueArray[5] + delta && xold < 10){
    Serial.println("0335");  
  }
  if(x > buttonValueArray[6] - delta && x < buttonValueArray[6] + delta && xold < 10){
    Serial.println("0336");  
  }
  if(x > buttonValueArray[7] - delta && x < buttonValueArray[7] + delta && xold < 10){
    Serial.println("0337");  
  }

  
//  Serial.println(x);
  xold = x;
  delay(1);

}
