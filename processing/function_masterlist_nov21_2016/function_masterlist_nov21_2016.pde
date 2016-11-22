float x,y,x0,y0;
float side, scaleFactor,unit;
float theta,theta0,thetaStep;
float phi, E,theta_magic;
color currentColor;
color black,white,red,orange,yellow,green,blue,violet;
float buttonSide = 40;
int[] currentGlyph = {};

//String[] shapeAddressArray = {};
//String[] shapeKeyArray = {};
//String[] shapeGlyphArray = {};
String[] shapeGlyphArray = new String[32];
String[] shapeKeyArray = new String[32];
String[] shapeAddressArray = new String[32];
String keyTable = "12345678qwertyuiasdfghjkzxcvbnm,";
String keySaveTable = "!@#$%^&*QWERTYUIASDFGHJKZXCVBNM<";

void setup(){
  black = color(0,0,0);
  white = color(255);
  red = color(255,0,0);
  orange = color(127,127,0);
  yellow = color(255,255,0);
  green = color(0,255,0);
  blue  = color(0,0,255);
  violet = color(255,0,255);
  size(800,600);
  background(255);
  noFill();
  stroke(2);
  textSize(8);
  x0 = 600;
  y0 = 300;
  x = x0;
  y = y0;
  unit = 50;
  side = unit;
  theta  = 0;
  theta0 = 0;
  phi  = 1.6;
  E = 2.7;
  theta_magic = radians(54.7);
  scaleFactor = 2;
  thetaStep  = PI/3;  
  writeCode();
}

void draw(){
  background(255);
  doTheThing(0300);
  drawButtons();
  drawCurrentGlyph();
  drawCursor();
  println(saveKey2index('R'));
//  noLoop();
}

void drawGlyph(int[] localGlyph){
  for(int index = 0;index < localGlyph.length;index++){
    stroke(currentColor); 
    doTheThing(localGlyph[index]);  
  }  
}
void drawCurrentGlyph(){
  for(int bullshitIndex = 0;bullshitIndex < currentGlyph.length;bullshitIndex++){
    stroke(currentColor); 
    doTheThing(currentGlyph[bullshitIndex]);  
  }
}

void drawCursor(){
  strokeWeight(2);
  stroke(color(255,0,0));
  line(x,y,x + scaleFactor*side*cos(theta),y+scaleFactor*side*sin(theta));
  stroke(0);
  strokeWeight(3);
  line(x,y,x + side*cos(theta),y+side*sin(theta));
  stroke(color(0,0,255));
  strokeWeight(4);
  line(x,y,x + (side/scaleFactor)*cos(theta),y+(side/scaleFactor)*sin(theta));
  strokeWeight(1);
  stroke(0);
  line(x,y,x + side*cos(theta + thetaStep),y+side*sin(theta + thetaStep));
  line(x,y,x + side*cos(theta - thetaStep),y+side*sin(theta - thetaStep));
  strokeWeight(2);
}

void drawButtons(){
    String[] code0300 = loadStrings("0300s2.txt"); 
    String[] labelArray = {};
    for(int index =0;index < code0300.length;index++){
      if(code0300[index].length() >=4){
        String thisLine = code0300[index];
        String[] thisLineSplit = split(thisLine,"//");
        thisLine = thisLineSplit[1];
        //println(thisLine);
        labelArray = append(labelArray,thisLine);             
      }
   }
   for(int row = 0;row < 6;row++){
   for(int column = 0;column < 8;column++){
     rect(column*buttonSide,row*buttonSide,buttonSide,buttonSide);
     fill(0);
     text(labelArray[column + 8*row],(column + 0.1)*buttonSide,(row + 0.4)*buttonSide);
     noFill();
   }
  }
}

String[] buttonLabels(){
    String[] code0300 = loadStrings("0300s2.txt"); 
    String[] labelArray = {};
    for(int index =0;index < code0300.length;index++){
      if(code0300[index].length() >=4){
        String thisLine = code0300[index].substring(4,code0300[index].length());
        String[] thisLineSplit = split(thisLine,"//");
        thisLine = thisLineSplit[1];
        //println(thisLine);
        labelArray = append(labelArray,thisLine);             
      }
     }
    return labelArray;
}

void getShapes(String[] code0200local){
  for(int bullshit = 0;bullshit < code0200local.length;bullshit++){
    String[] fuckComputers = split(code0200local[bullshit],':');
   // println(fuckComputers[0]);
    shapeAddressArray = append(shapeAddressArray,fuckComputers[0]);
    shapeKeyArray = append(shapeKeyArray,fuckComputers[1]);
    shapeGlyphArray = append(shapeGlyphArray,fuckComputers[2]);
 /*   print(shapeKeyArray[bullshit]);
    print("    ");
    print(shapeAddressArray[bullshit]);
    print("    ");
    println(shapeGlyphArray[bullshit]);*/
  }
}


int[] commandString2glyph(String localString){
  int[] localIntArray = {};
  String[] localStringArray  = split(localString,',');
  for(int index = 0;index < localStringArray.length;index++){
     localIntArray = append(localIntArray,string2octal(localStringArray[index]));  
  }
  return localIntArray;
}

String glyph2commandString(int[] localGlyph){
  String localString = "";
  for(int index=0;index<localGlyph.length;index++){
      localString += intOctal(localGlyph[index]);
      localString += ',';
  }
  if(localString.length() > 2 ){
     localString = localString.substring(0,localString.length()-1); 
  }
  return localString;
}

String intOctal(int localByte){
 String bullshit = "";
 char ones = char((localByte%8)+060);
 char eights = char(((localByte >> 3)&7) + 060);
 char sixtyfours = char(((localByte >> 6)&7) + 060);
 bullshit += '0';
 bullshit += sixtyfours;
 bullshit += eights;
 bullshit += ones;
 return bullshit; 
}

int string2octal(String localString){
  localString = trim(localString);
  int sixtyfours = int(localString.charAt(1)) - 060; 
  int eights = int(localString.charAt(2)) - 060; 
  int ones = int(localString.charAt(3)) - 060; 
  return ones + 8*eights + 64*sixtyfours;
}

void writeCode(){
    String[] codeOutput = {};
    String[] code0300 = loadStrings("0300s2.txt"); 
    codeOutput = append(codeOutput,"void doTheThing(int localByte){");
    for(int index =0;index < code0300.length-1;index++){
      if(code0300[index].length() >=4){
        codeOutput = append(codeOutput,"if(localByte == " + intOctal(index + 0300) + "){");
        String thisLine = code0300[index].substring(4,code0300[index].length());
        codeOutput = append(codeOutput,thisLine);
        codeOutput = append(codeOutput,"}");
       // println(thisLine);
      }
    }
   codeOutput = append(codeOutput,"}");
   saveStrings("codeOutput.txt",codeOutput);  
}

void mouseClicked(){
  if((mouseX < 8*buttonSide) && (mouseY < 6*buttonSide)){ 
    int ones = int(mouseX/buttonSide);
    int eights = int(mouseY/buttonSide);
    int sixtyfours = 3;
    int localByte = sixtyfours*64 + ones + 8*eights; 
    if(localByte != 0301){ 
      doTheThing(localByte);
      currentGlyph = append(currentGlyph,localByte);
    }
    if(localByte == 0301 && currentGlyph.length != 0){
       currentGlyph = shorten(currentGlyph); 
    }
    println(intOctal(localByte));
  }  
}

void keyPressed(){
  if(key == ' '){
    String[] tempStringArray = {}; 
    tempStringArray = append(tempStringArray,glyph2commandString(currentGlyph));
    saveStrings("currentGlyph.txt",tempStringArray);
  }
  if(key == '`'){
    String[] tempStringArray = loadStrings("currentGlyph.txt");
    int[] tempGlyph = commandString2glyph(tempStringArray[0]);
    currentGlyph = concat(currentGlyph,tempGlyph);
  }
  if(saveKey2index(key) != -1){
    shapeGlyphArray[saveKey2index(key)] = glyph2commandString(currentGlyph);
  }
  if(key2index(key) != -1){
    currentGlyph = concat(currentGlyph,commandString2glyph(shapeGlyphArray[key2index(key)]));
  }

}

int key2index(char localChar){
 int keyIndex = -1;
 for(int stringIndex = 0;stringIndex < keyTable.length();stringIndex++){
      if(localChar == keyTable.charAt(stringIndex)){
         keyIndex = stringIndex; 
      }
 }
 return keyIndex;
}

int saveKey2index(char localChar){
 int keyIndex = -1;
 for(int stringIndex = 0;stringIndex < keySaveTable.length();stringIndex++){
      if(localChar == keySaveTable.charAt(stringIndex)){
         keyIndex = stringIndex; 
      }
 }
 return keyIndex;
}

void doTheThing(int localByte){
if(localByte == 0300){
  theta = theta0;side = unit;x=x0;y=y0;  //rst
}
if(localByte == 0301){
  println("del"); //del
}
if(localByte == 0302){
  thetaStep = PI; //180deg
}
if(localByte == 0303){
  thetaStep = 2*PI/3; //120deg
}
if(localByte == 0304){
  thetaStep = PI/2;  //90deg
}
if(localByte == 0305){
  thetaStep = 2*PI/5;  //72deg
}
if(localByte == 0306){
  thetaStep = PI/3; //60deg
}
if(localByte == 0307){
  thetaStep = 2*theta_magic; //2*magic
}
if(localByte == 0310){
  scaleFactor = sqrt(2); //sqrt(2)x
}
if(localByte == 0311){
  scaleFactor = phi; //phix
}
if(localByte == 0312){
  scaleFactor = sqrt(3); //sqrt(3)x 
}
if(localByte == 0313){
  scaleFactor = 2;  //2x
}
if(localByte == 0314){
  scaleFactor = E;   //ex
}
if(localByte == 0315){
  scaleFactor = 3;   //3x
}
if(localByte == 0316){
  scaleFactor = PI;   //PIx
}
if(localByte == 0317){
  scaleFactor = 5;  //5x
}
if(localByte == 0320){
  currentColor = white;stroke(currentColor);//white
}
if(localByte == 0321){
  currentColor = black;stroke(currentColor);//black
}
if(localByte == 0322){
  currentColor = red;stroke(currentColor);//red
}
if(localByte == 0323){
  currentColor = orange;stroke(currentColor);//orange
}
if(localByte == 0324){
  currentColor = yellow;stroke(currentColor);//yellow
}
if(localByte == 0325){
  currentColor = green; stroke(currentColor);//green
}
if(localByte == 0326){
  currentColor = blue;stroke(currentColor);//blue
}
if(localByte == 0327){
  currentColor = violet;stroke(currentColor);//violet
}
if(localByte == 0330){
  x += side*cos(theta);y += side*sin(theta); //move
}
if(localByte == 0331){
  x -= side*cos(theta);y -= side*sin(theta);  //back
}
if(localByte == 0332){
    line(x,y,x + side*cos(theta),y + side*sin(theta));x += side*cos(theta);y += side*sin(theta);//linmov
}
if(localByte == 0333){
  line(x,y,x - side*cos(theta),y - side*sin(theta));x -= side*cos(theta);y -= side*sin(theta);//linbak
}
if(localByte == 0334){
  theta += thetaStep; // CW
}
if(localByte == 0335){
  theta -= thetaStep; // CCW
}
if(localByte == 0336){
  side *= scaleFactor;  //(+)
}
if(localByte == 0337){
  side /= scaleFactor;  //(-)
}
if(localByte == 0340){
   strokeWeight(5);point(x,y);strokeWeight(2);//point
}
if(localByte == 0341){
  ellipse(x,y,2*side,2*side);//circle
}
if(localByte == 0342){
  arc(x,y,2*side,2*side,theta,theta + thetaStep);//arc+
}
if(localByte == 0343){
  arc(x,y,2*side,2*side,theta - thetaStep,theta);//arc-
}
if(localByte == 0344){
  arc(x,y,2*side,2*side,theta,theta + thetaStep);theta += thetaStep;//arcmov
}
if(localByte == 0345){
  arc(x,y,2*side,2*side,theta - thetaStep,theta);theta -= thetaStep;//arcbak
}
if(localByte == 0346){
  fill(0);rect(x,y,side,side);noFill();//1rect
}
if(localByte == 0347){
  fill(255);rect(x,y,side,side);noFill();//0rect
}
if(localByte == 0350){
  thetaStep /= 2;  //angle/2
}
if(localByte == 0351){
  thetaStep *= 2;  //2angle
}
if(localByte == 0352){
  thetaStep /= 3; //angle/3
}
if(localByte == 0353){
  thetaStep *= 3; //3angle
}
if(localByte == 0354){
  thetaStep /= 5;  //angle/5
}
if(localByte == 0355){
  thetaStep *= 5; //5angle
}
if(localByte == 0356){
  thetaStep /= 60; //angle/60
}
}