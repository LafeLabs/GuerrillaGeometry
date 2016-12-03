import processing.serial.*;
float x = 250;
float y = 250;
float side = 30;
Serial myPort;  // Create object from Serial class
String myString;
int currentCommand = 0;

int dimness = 125;

void setup() 
{
  size(500, 500);
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 115200);
}

void draw()
{

  background(dimness);
  currentCommand = getGeometronButton();
  if(currentCommand != -1){  
    if(currentCommand == 0330){
      
       dimness+=10; 
    }
    if(currentCommand == 0331){
       dimness-=10; 
    }
  }
}

int getGeometronButton(){
   int currentCommandLocal = -1;
   if (myPort.available() > 0) {  // If data is available,
    String myStringLocal = myPort.readString();         // read it and store it in val
    myStringLocal = trim(myStringLocal);
    //print(myString);
    if(myStringLocal.length() == 4){
       int ones,eights,sixtyfours;
       sixtyfours = int(myStringLocal.charAt(1)) - 060;
       eights = int(myStringLocal.charAt(2)) - 060;
       ones = int(myStringLocal.charAt(3)) - 060;
       print(sixtyfours);
       print(eights);
       println(ones);
       currentCommandLocal = 64*sixtyfours + 8*eights + ones;
    }

   }
   else{
      currentCommandLocal = -1;
   } 
   return currentCommandLocal;
}


void printports(){  
    String portNameArray[] = Serial.list();
    for(int index = 0;index < portNameArray.length;index++){
       println(portNameArray[index]); 
    }
}