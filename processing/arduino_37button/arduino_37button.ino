int x = 0;
int y = 0;
int z = 0;
int xold = 0;
int yold =0;
int zold = 0;
int buttonValueArray[] = {40,83,125,168,211,253,296,337,380,421,464,508,550,592,635,678,720,764,807,850,893,937,980,1023};
int buttonValueArray3[] = {125,250,375,501,628,756,888,1023};
String addressArray[] = {"0330","0331","0332","0333","0334","0335","0336","0337","0340","0341","0342","0343","0344","0345","0346","0347","0350","0351","0352","0353","0354","0355","0356","0357","0310","0311","0312","0313","0314","0315","0316","0317","0303","0304","0305","0306","0307"};
int xArray[] = {41,83,126,168,210,253,295,338,380,422,465,507,550,593,635,678,720,764,807,850,893,936,980,1023,0,0,0,0,0,0,0,0,35,70,113,150,198};
int yArray[] = {7,15,25,35,45,56,68,77,88,98,108,119,130,141,151,161,172,183,192,204,215,225,236,246,125,250,375,501,627,756,888,1023,0,2,5,7,10};
int zArray[] = {0,0,0,0,0,1,1,2,3,4,5,5,6,6,7,7,8,9,10,10,10,12,12,13,27,58,91,125,158,192,226,260,203,408,613,818,1023};


int delta = 20;

void setup() {
 Serial.begin(115200);
}

void loop() {
  x = analogRead(A1);//0330 - 0357
  y = analogRead(A3);//scale factors
  z = analogRead(A0);//symmetry groups

/*  Serial.print(x);
  Serial.print(',');
  Serial.print(y);
  Serial.print(',');
  Serial.println(z);*/


  for(int index = 0;index < 37;index++){
    if(xold < 10 && yold < 10 && zold < 10  && abs(x-xArray[index]) < delta && abs(y-yArray[index]) < delta && abs(z-zArray[index]) < delta){
      Serial.println(addressArray[index]);  
    }
  }

  xold = x;
  zold = z;
  yold = y;
  delay(1);

}
