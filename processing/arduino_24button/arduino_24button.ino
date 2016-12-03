int x = 0;
int xold = 0;
int buttonValueArray[] = {40,83,125,168,211,253,296,337,380,421,464,508,550,592,635,678,720,764,807,850,893,937,980,1023};
int delta = 4;

void setup() {
 Serial.begin(115200);
}

void loop() {
  x = analogRead(A1);
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
    if(x > buttonValueArray[8] - delta && x < buttonValueArray[8] + delta && xold < 10){
    Serial.println("0340");  
  }
  if(x > buttonValueArray[9] - delta && x < buttonValueArray[9] + delta && xold < 10){
    Serial.println("0341");  
  }
  if(x > buttonValueArray[10] - delta && x < buttonValueArray[10] + delta && xold < 10){
    Serial.println("0342");  
  }
  if(x > buttonValueArray[11] - delta && x < buttonValueArray[11] + delta && xold < 10){
    Serial.println("0343");  
  }
  if(x > buttonValueArray[12] - delta && x < buttonValueArray[12] + delta && xold < 10){
    Serial.println("0344");  
  }
  if(x > buttonValueArray[13] - delta && x < buttonValueArray[13] + delta && xold < 10){
    Serial.println("0345");  
  }
  if(x > buttonValueArray[14] - delta && x < buttonValueArray[14] + delta && xold < 10){
    Serial.println("0346");  
  }
  if(x > buttonValueArray[15] - delta && x < buttonValueArray[15] + delta && xold < 10){
    Serial.println("0347");  
  }
  if(x > buttonValueArray[16] - delta && x < buttonValueArray[16] + delta && xold < 10){
    Serial.println("0350");  
  }
  if(x > buttonValueArray[17] - delta && x < buttonValueArray[17] + delta && xold < 10){
    Serial.println("0351");  
  }
  if(x > buttonValueArray[18] - delta && x < buttonValueArray[18] + delta && xold < 10){
    Serial.println("0352");  
  }
  if(x > buttonValueArray[19] - delta && x < buttonValueArray[19] + delta && xold < 10){
    Serial.println("0353");  
  }
  if(x > buttonValueArray[20] - delta && x < buttonValueArray[20] + delta && xold < 10){
    Serial.println("0354");  
  }
  if(x > buttonValueArray[21] - delta && x < buttonValueArray[21] + delta && xold < 10){
    Serial.println("0355");  
  }
  if(x > buttonValueArray[22] - delta && x < buttonValueArray[22] + delta && xold < 10){
    Serial.println("0356");  
  }
  if(x > buttonValueArray[23] - delta && x < buttonValueArray[23] + delta && xold < 10){
    Serial.println("0357");  
  }
  
//  Serial.println(x);
  xold = x;
  delay(1);

}
