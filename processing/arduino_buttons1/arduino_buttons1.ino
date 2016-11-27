int x = 0;
int xold = 0;

void setup() {
  // put your setup code here, to run once:
 Serial.begin(115200);

}

void loop() {

  x = analogRead(A0);
  if(x > 200 && x < 300 && xold < 10){
    Serial.println("0330");  
  }
  if(x > 400 && x < 600 && xold < 10){
    Serial.println("0331");  
  }
  if(x > 700 && x < 800 && xold < 10){
    Serial.println("0332");  
  }
  if(x > 900 && x < 1024 && xold < 10){
    Serial.println("0333");  
  }

  
//  Serial.println(x);

  xold = x;
  delay(1);
}
