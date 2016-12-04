int x = 0;
int y = 0;
int z = 0;
int xold = 0;
int yold =0;
int zold = 0;
int buttonValueArray[] = {40,83,125,168,211,253,296,337,380,421,464,508,550,592,635,678,720,764,807,850,893,937,980,1023};
int buttonValueArray3[] = {125,250,375,501,628,756,888,1023};
String addressArray[] = {"0330","0331","0332","0333","0334","0335","0336","0337","0340","0341","0342","0343","0344","0345","0346","0347","0350","0351","0352","0353","0354","0355","0356","0357","0310","0311","0312","0313","0314","0315","0316","0317","0303","0304","0305","0306","0307"};
int xArray[] = {41,83,126,168,210,253,295,338,380,422,465,507,550,593,635,678,720,764,807,850,893,936,980,1023,0,0,0,0,0,0,0,0,35,70,113,150};
int yArray[] = {7,15,25,35,45,56,68,77,88,98,108,119,130,141,151,161,172,183,192,204,215,225,236,246,125,250,375,501,627,756,888,1023,0,2,5,7};
int zArray[] = {0,0,0,0,0,1,1,2,3,4,5,5,6,6,7,7,8,9,10,10,10,12,12,13,27,58,91,125,158,192,226,260,203,408,613,818};


int delta = 4;

void setup() {
 Serial.begin(115200);
}

void loop() {
  x = analogRead(A1);//0330 - 0357
  y = analogRead(A3);//scale factors
  z = analogRead(A0);//symmetry groups

  Serial.print(x);
  Serial.print(',');
  Serial.print(y);
  Serial.print(',');  
  Serial.println(z);
  if(z > buttonValueArray3[0] - delta && z < buttonValueArray3[0] + delta && zold < 100){
    Serial.println("0310");  
  }
  if(z > buttonValueArray3[1] - delta && z < buttonValueArray3[1] + delta && zold < 100){
    Serial.println("0311");  
  }
  if(z > buttonValueArray3[2] - delta && z < buttonValueArray3[2] + delta && zold < 100){
    Serial.println("0312");  
  }
  if(z > buttonValueArray3[3] - delta && z < buttonValueArray3[3] + delta && zold < 100){
    Serial.println("0313");  
  }
  if(z > buttonValueArray3[4] - delta && z < buttonValueArray3[4] + delta && zold < 100){
    Serial.println("0314");  
  }
  if(z > buttonValueArray3[5] - delta && z < buttonValueArray3[5] + delta && zold < 100){
    Serial.println("0315");  
  }
  if(z > buttonValueArray3[6] - delta && z < buttonValueArray3[6] + delta && zold < 100){
    Serial.println("0316");  
  }
  if(z > buttonValueArray3[7] - delta && z < buttonValueArray3[7] + delta && zold < 100){
    Serial.println("0317"); 
  }
  
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
  zold = z;
  yold = y;
  delay(1);

}
