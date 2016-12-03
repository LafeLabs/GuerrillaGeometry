import processing.serial.*;
float x = 250;
float y = 250;
float side = 30;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
String myString;
void setup() 
{
  size(500, 500);
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 115200);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    myString = myPort.readString();         // read it and store it in val
    myString = trim(myString);
    //print(myString);
  if(myString.equals("0330")){
    x += side;
  }
  if(myString.equals("0331")){
    x -= side; 
  }
  if(myString.equals("0332")){
    y += side;
  }
  if(myString.equals("0333")){
    y -= side; 
  }

 }
  else{
    myString = "";
  }
  
  background(255);
  
  rect(x,y,side,side);

}

void printports(){  
    String portNameArray[] = Serial.list();
    for(int index = 0;index < portNameArray.length;index++){
       println(portNameArray[index]); 
    }
}