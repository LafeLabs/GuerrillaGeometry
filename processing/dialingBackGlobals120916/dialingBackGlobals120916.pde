//EVERYTHING IS PHYSICAL
//EVERYTHING IS GLOBAL
//EVERYTHING IS ALWAYS RECURSIVE
//NO LAWS NO PROPERTY NO MINING NO NUMBERS NO MINERALS
//THE SOLE PURPOSE OF THE EXISTING SOFTWARE INDUSTRY IS TO CREATE AND MAINTAIN STRUCTURAL VIOLENCE, ALL COMPUTER "SCIENCE" IS EVIL
//ALL "TECH" COMPANIES ARE BASED ON FRAUD AND LIES
//SMASH THE TECHNOCRATIC PRIESTHOOD

//time to dial back this global thing, holy crap it got out of control I think I see how local variables have a role after the revolution after all
//so this is a dial back on globals and i'm going to make the keyboard thing work and also get all 3 stacks working
//and add the background, then I htink I can start to do real work. also today i need to at wordwrap(glyphwrap)


float x,y,x0,y0,spellX,spellY;
float side, scaleFactor,unit;
float theta,theta0,thetaStep;
float phi, E,theta_magic;
color currentColor;
color black,white,red,orange,yellow,green,blue,violet;
int[] currentGlyph = {};
int[] glyphStack = {};
int cursorIndex = 0;
boolean cursorOn = true;
int glyphIndex  = 0;
int glyphTableIndex = 0;
int currentCommand = 0;
String currentString;
String[] glyphArray0300s = new String[48];
String[] currentGlyphTable = {};
String[] currentShapeTable = {};
String[] currentFontTable = {};
String[] currentManuscript = {};

int[] recursionTest = {0304,0313,0337,0101,0141,0330,0330,0330,0205,0330,0330,0341,0332,0332,0336,0336,0304,0313,0102,0122,0101,0113};

char[] keyArray = {'1','2','3','4','5','6','7','8','q','w','e','r','t','y','u','i','a','s','d','f','g','h','j','k','o','z','x'};
int[] key2commandArray = {0303,0304,0305,0306,0350,0351,0352,0353,0310,0311,0312,0313,0336,0337,0334,0335,0330,0331,0332,0333,0340,0341,0342,0343,0313,0010,0011};

char[] shapeKeyArray = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p'};
int[] key2shapeArray = {0200,0201,0202,0203,0204,0205,0206,0207,0210,0211,0212,0213,0214,0215,0216,0217};

int keyboardMode = 0;
//0 is ascii based keyboard direct write
//1 is 0300 commands
//2 is shape table
//control keys are seperate, control-k selects keyboard mode
//other control characters do cursor move commands
//control k is 11 decimal which is 013 octal

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
  x0 = 50;
  y0 = 50;
  x = x0;
  y = y0;
  spellX = 0;
  spellY = height - 2*side;
  unit = 50;
  side = unit;
  theta  = 0;
  theta0 = 0;
  phi  = 1.618;
  E = 2.718;
  scaleFactor = 2;
  thetaStep  = PI/2;   
  glyphArray0300s = loadStrings("currentGlyphTable0300s.txt");
  currentGlyphTable = loadStrings("currentGlyphTable.txt");  
  currentShapeTable = currentGlyphTable;
  currentFontTable = loadStrings("ASCIItable_space2tilde.txt");


  currentGlyph = commandString2glyph(currentGlyphTable[3]);
  cursorIndex = currentGlyph.length; 

  currentManuscript = loadStrings("manuscript.txt");
//  currentGlyph = textString2glyph(currentManuscript[0]);  

}

void draw(){
  background(255);
  doTheThing(0300);
  doTheThing(0337);

  drawCurrentGlyph();
  doTheThing(0300);
  doTheThing(0337);
  spellCurrentGlyph();

}

void updateCurrentGlyph(){
    if(currentCommand != -1){
    int[] localGlyph = {};
    for(int index = 0;index < cursorIndex;index++){
      localGlyph = append(localGlyph,currentGlyph[index]);
    }
    localGlyph = append(localGlyph,currentCommand);
    for(int index = cursorIndex;index < currentGlyph.length;index++){
      localGlyph = append(localGlyph,currentGlyph[index]);
    }
    currentGlyph = localGlyph;
    cursorIndex++;
  }  
}

void keyPressed(){
 if(key == 013){  //switch keyboard mode on ctrl-k
    keyboardMode++;
    if(keyboardMode > 2){
      keyboardMode = 0;
    }
 }
 if(keyboardMode == 0){   //typewriter mode
   currentCommand = int(key);
   updateCurrentGlyph();
 }
 if(keyboardMode == 1){   //draw mode
   currentCommand = key2command(key);
   if(currentCommand >= 0300){
     updateCurrentGlyph();
   }
   if(currentCommand < 040){
      doTheThing(currentCommand); 
   }
 }
 if(keyboardMode == 2){   //shape invocation mode
   currentCommand = key2shape(key);
   println(currentCommand);
   updateCurrentGlyph();
 }
}

void drawGlyph(int[] localGlyph){
  for(int index = 0;index < localGlyph.length;index++){
    stroke(currentColor); 
    doTheThing(localGlyph[index]);  
  }  
}

void drawCurrentGlyph(){
  for(int index = 0;index < cursorIndex;index++){
    stroke(currentColor); 
    doTheThing(currentGlyph[index]);  
  }
  if(cursorOn){
    drawCursor();
  }
  if(cursorIndex < currentGlyph.length){
  for(int index = cursorIndex;index < currentGlyph.length;index++){
    stroke(currentColor); 
    doTheThing(currentGlyph[index]);  
  }
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

void spellCurrentGlyph(){
  x=spellX;
  y=spellY;
  scaleFactor = 2;
  thetaStep = PI/2;
  for(int index = 0;index < cursorIndex;index++){
     if(currentGlyph[index] >= 0300 && currentGlyph[index] <= 0377){
       drawGlyph(commandString2glyph(glyphArray0300s[currentGlyph[index] - 0300]));
     }
  }
  doTheThing(0300);
  for(int index = cursorIndex;index < currentGlyph.length-1;index++){
     drawGlyph(commandString2glyph(glyphArray0300s[currentGlyph[index] - 0300]));
  }  
}

int string2command(String localString){
  int sixtyfours = int(localString.charAt(1)) - 060; 
  int eights = int(localString.charAt(2)) - 060; 
  int ones = int(localString.charAt(3)) - 060; 
  currentCommand =  ones + 8*eights + 64*sixtyfours;
  return currentCommand;
}

String command2string(int localCommand){
   String localString = "";
   char ones = char((localCommand%8)+060);
   char eights = char(((localCommand >> 3)&7) + 060);
   char sixtyfours = char(((localCommand >> 6)&7) + 060);
   localString += '0';
   localString += sixtyfours;
   localString += eights;
   localString += ones;
   return localString;
}

String glyph2commandString(int[] localGlyph){
  String localString = "";  
  for(int index = 0;index < localGlyph.length;index++){
      localString += command2string(localGlyph[index]);
      localString += ',';
  }
  if(localString.length() > 2 ){
     localString = localString.substring(0,localString.length()-1);//remove trailing comma from non empty strings 
  }
  return localString;
}

int[] commandString2glyph(String localString){
  int[] localIntArray = {};
  String[] localStringArray  = split(localString,',');
  for(int index = 0;index < localStringArray.length;index++){
     localIntArray = append(localIntArray,string2command(localStringArray[index]));  
  }
  return localIntArray;
}

int[] textString2glyph(String localString){
  int[] localIntArray = {};
  for(int index = 0;index < localString.length();index++){
      localIntArray = append(localIntArray,int(localString.charAt(index)));
  }
  return localIntArray;
}

void deleteGlyph(){ 
  int[] localGlyph = {};
  if(cursorIndex != 0){
    for(int index = 0;index < currentGlyph.length;index++){
      if(index != cursorIndex - 1){
        localGlyph = append(localGlyph,currentGlyph[index]);
      }
    }
    currentGlyph = localGlyph;
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



int key2command(char localChar){
  int commandLocal = -1;
  for(int index = 0;index < keyArray.length;index++){
    if(localChar == keyArray[index]){
       commandLocal = key2commandArray[index]; 
    }
  }
  return commandLocal;
}

int key2shape(char localChar){
  int commandLocal = -1; 
  for(int index = 0;index < shapeKeyArray.length;index++){
    if(localChar == shapeKeyArray[index]){
       commandLocal = key2shapeArray[index]; 
    }
  }
  return commandLocal;
}


void cursorPositionForward(){
    if(cursorIndex < currentGlyph.length){
      cursorIndex++;
    }
}
void cursorPositionBack(){
    if(cursorIndex > 0){
      cursorIndex--;
    }
}
void nextGlyphInTable(){
   glyphTableIndex++;
   if(glyphTableIndex == currentGlyphTable.length){
      glyphTableIndex = 0;
   }
   currentGlyph = commandString2glyph(currentGlyphTable[glyphTableIndex]);
   cursorIndex = currentGlyph.length;

}
void previousGlyphInTable(){ 
    glyphTableIndex--;
    if(glyphTableIndex == -1){
      glyphTableIndex = currentGlyphTable.length - 1;
    }
    currentGlyph = commandString2glyph(currentGlyphTable[glyphTableIndex]);
    cursorIndex = currentGlyph.length;
}

void doTheThing(int localByte){

if(localByte == 0010){
  cursorPositionBack();
}
if(localByte == 0011){
  cursorPositionForward();
}
if(localByte == 0012){
  previousGlyphInTable();
}
if(localByte == 0013){
  nextGlyphInTable();
}
if(localByte == 0014){
  deleteGlyph();
}
if(localByte == 0015){
  pushGlyph();  
}
if(localByte == 0016){
  popGlyph();
}

if(localByte == 0300){
  scaleFactor = 2;theta = theta0;side = unit;x=x0;y=y0;currentColor = black; thetaStep = PI/2;//rst
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
  if(localByte - 0200 < currentShapeTable.length){
    drawGlyph(commandString2glyph(currentShapeTable[localByte  - 0200]));
  }
}

if(localByte >= 040 && localByte <= 0177){
   //print a letter based on ASCII and key from font table 
  if(localByte - 040 < currentFontTable.length){    
    drawGlyph(commandString2glyph(currentFontTable[localByte  - 040]));
  }
}

if(x > width){
   x -= width;
   y += unit;
}
if(x<-side){
  x+= width;
}
if(y> height + side){
   y -= height; 
}
if(y < -side){
   y += height; 
}
}