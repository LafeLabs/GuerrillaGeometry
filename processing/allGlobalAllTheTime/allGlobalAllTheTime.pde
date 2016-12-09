//EVERYTHING IS PHYSICAL
//EVERYTHING IS GLOBAL
//EVERYTHING IS ALWAYS RECURSIVE
//NO LAWS NO PROPERTY NO MINING NO NUMBERS NO MINERALS
//THE SOLE PURPOSE OF THE EXISTING SOFTWARE INDUSTRY IS TO CREATE AND MAINTAIN STRUCTURAL VIOLENCE, ALL COMPUTER "SCIENCE" IS EVIL
//ALL "TECH" COMPANIES ARE BASED ON FRAUD AND LIES
//SMASH THE TECHNOCRATIC PRIESTHOOD


float x,y,x0,y0;
float side, scaleFactor,unit;
float theta,theta0,thetaStep;
float phi, E,theta_magic;
color currentColor;
color black,white,red,orange,yellow,green,blue,violet;
int[] currentGlyph = {};
int[] firstStoredGlyph = {};
int[] glyphStack = {};
int[] currentGlyphGlyph = {};
color[] colorArray = {};
int cursorIndex = 0;
boolean cursorOn = false;
int glyphIndex  = 0;
int glyphTableIndex = 0;
int currentCommand = 0;
char currentChar;
String currentString;
String[] glyphArray0300s = new String[48];
String[] currentGlyphTable = {};
String[] currentShapeTable = {};
String[] currentFontTable = {};
String[] currentManuscript = {};

int[] recursionTest = {0304,0313,0337,0101,0141,0330,0330,0330,0205,0330,0330,0341,0332,0332,0336,0336,0304,0313,0102,0122,0101,0113};

char[] keyArray = {'1','2','3','4','5','6','7','8','q','w','e','r','t','y','u','i','a','s','d','f','g','h','j','k','o'};
int[] key2commandArray = {0303,0304,0305,0306,0350,0351,0352,0353,0310,0311,0312,0313,0336,0337,0334,0335,0330,0331,0332,0333,0340,0341,0342,0343,0313};

char[] shapeKeyArray = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p'};
int[] key2shapeArray = {0200,0201,0202,0203,0204,0205,0206,0207,0210,0211,0212,0213,0214,0215,0216,0217};

void setup(){
  black = color(0,0,0);
  white = color(255);
  red = color(255,0,0);
  orange = color(255,160,0);
  yellow = color(255,255,0);
  green = color(0,255,0);
  blue  = color(0,0,255);
  violet = color(255,0,255);
  size(800,600);
  background(255);
  noFill();
  stroke(2);
  textSize(8);
  x0 = 0;
  y0 = 350;
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
  glyphArray0300s = loadStrings("currentGlyphTable0300s.txt");
  currentGlyphTable = loadStrings("currentGlyphTable.txt");  
  currentFontTable = loadStrings("ASCIItable_space2tilde.txt");
  currentShapeTable  = currentGlyphTable;
  currentString = currentGlyphTable[glyphTableIndex];
  commandString2glyph();
  cursorIndex = currentGlyph.length; 
    x=0;
  y =height/2;
}

void draw(){
  
  currentGlyph = recursionTest;
  drawCurrentGlyph();
  noLoop();
}

void commandString2glyph(){
  int[] localIntArray = {};
  String[] localStringArray  = split(currentString,',');
  for(int index = 0;index < localStringArray.length;index++){
     currentString = localStringArray[index];
     string2command();
     localIntArray = append(localIntArray,currentCommand);  
  }
  currentGlyph = localIntArray;
}

void glyph2commandString(){
  String localString = "";
  for(int index = 0;index < currentGlyph.length;index++){
      currentCommand = currentGlyph[index];
      command2string();
      localString += currentString;
      localString += ',';
  }
  if(localString.length() > 2 ){
     localString = localString.substring(0,localString.length()-1); 
  }
  currentString = localString;
}


void string2command(){
  String localString = trim(currentString);
  int sixtyfours = int(localString.charAt(1)) - 060; 
  int eights = int(localString.charAt(2)) - 060; 
  int ones = int(localString.charAt(3)) - 060; 
  currentCommand =  ones + 8*eights + 64*sixtyfours;
}

void command2string(){
   currentString = "";
   char ones = char((currentCommand%8)+060);
   char eights = char(((currentCommand >> 3)&7) + 060);
   char sixtyfours = char(((currentCommand >> 6)&7) + 060);
   currentString += '0';
   currentString += sixtyfours;
   currentString += eights;
   currentString += ones;
}

void glyph2glyphglyph(){
   int[] fooBar = {};
   for(int index = 0;index < cursorIndex;index++){
     currentString = glyphArray0300s[currentGlyph[index] - 0300];
     commandString2glyph();
     fooBar  = concat(fooBar,currentGlyph);
   }
   fooBar = append(fooBar,0330);
   for(int index = cursorIndex;index < currentGlyph.length;index++){
     currentString = glyphArray0300s[currentGlyph[index] - 0300];
     fooBar  = concat(fooBar,currentGlyph);
   }
   currentGlyphGlyph = fooBar;
}

void key2command(){
  int commandLocal = -1;
  char keyValue = currentChar;
  for(int index = 0;index < keyArray.length;index++){
    if(keyValue == keyArray[index]){
       commandLocal = key2commandArray[index]; 
    }
  }
  currentCommand = commandLocal;
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

void drawCurrentGlyph(){

  if(cursorOn){
    for(int index = 0;index < cursorIndex;index++){
      stroke(currentColor);
      currentCommand = currentGlyph[index];
      doTheThing();  
    }
      drawCursor();
    if(cursorIndex < currentGlyph.length){
      for(int index = cursorIndex;index < currentGlyph.length;index++){
        stroke(currentColor); 
        currentCommand = currentGlyph[index];
        doTheThing();  
      }
    }
  }
  else{
    for(int index = 0;index < currentGlyph.length;index++){
      stroke(currentColor);
      currentCommand = currentGlyph[index];
      doTheThing();  
    }
  }
}



void deleteGlyph(){ 
  int[] fooBar = {};
  int[] gazortBUtt = {};
  if(cursorIndex != 0){
    for(int index = 0;index < currentGlyph.length;index++){
      if(index != cursorIndex - 1){
        fooBar = append(fooBar,currentGlyph[index]);
      }
    }
    currentGlyph = fooBar;
    cursorIndex--;
  }
}

void pushGlyph(){
  if(cursorIndex != 0){
    glyphStack = append(glyphStack,currentGlyph[cursorIndex - 1]);
    deleteGlyph();
  }
}

void popGlyph(){
  if(glyphStack.length > 0){
    currentCommand = glyphStack[glyphStack.length - 1];
    int[] fooBar = {};
    for(int index = 0;index < cursorIndex;index++){
      fooBar = append(fooBar,currentGlyph[index]);
    }
    fooBar = append(fooBar,currentCommand);
    for(int index = cursorIndex;index < currentGlyph.length;index++){
      fooBar = append(fooBar,currentGlyph[index]);
    }
    currentGlyph = fooBar;
    glyphStack = shorten(glyphStack);
  }
}


void doTheThing(){
  int localByte = currentCommand;
if(localByte == 0300){
  scaleFactor = 2;theta = theta0;side = unit;x=x0;y=y0;currentColor = black; thetaStep = PI/3; //rst
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
  thetaStep = PI/4; //2*magic
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
  arc(x,y,2*side,2*side,theta - thetaStep,theta);//arc-
}
if(localByte == 0343){
  arc(x,y,2*side,2*side,theta,theta + thetaStep);//arc+
}
if(localByte == 0344){
  arc(x,y,2*side,2*side,theta - thetaStep,theta);theta -= thetaStep;//arcmov
}
if(localByte == 0345){
  arc(x,y,2*side,2*side,theta,theta + thetaStep);theta += thetaStep;//arcbak
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
if(localByte == 0357){
  thetaStep *= 60; //angle*60
}

if(localByte >= 0200 && localByte <= 0277){
  firstStoredGlyph = currentGlyph;
  if(localByte - 0200 < currentGlyphTable.length){
    currentString = currentShapeTable[localByte  - 0200];
    commandString2glyph();
    drawCurrentGlyph();
  }
  currentGlyph = firstStoredGlyph;
}

if(localByte >= 040 && localByte <= 0177){
   //print a letter based on ASCII and key from font table 
  firstStoredGlyph = currentGlyph;
  if(localByte - 040 < currentFontTable.length){
    currentString = currentFontTable[localByte  - 040];
    commandString2glyph();
    drawCurrentGlyph();
  }
  currentGlyph = firstStoredGlyph;

}

}