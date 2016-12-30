//EVERYTHING IS PHYSICAL
//EVERYTHING IS GLOBAL
//EVERYTHING IS ALWAYS RECURSIVE
//NO LAWS NO PROPERTY NO MINING NO NUMBERS NO MINERALS
//THE SOLE PURPOSE OF THE EXISTING SOFTWARE INDUSTRY IS TO CREATE AND MAINTAIN STRUCTURAL VIOLENCE, \
//ALL COMPUTER "SCIENCE" IS EVIL
//ALL "TECH" COMPANIES ARE BASED ON FRAUD AND LIES
//SMASH THE TECHNOCRATIC PRIESTHOOD


//simplify evertying, add recursive shape defs to 0300's
//no more stack, no more mid glyph edits, just delete it
//no keyboard mode, all shape all the time, no fonts

float x,y,x0,y0;
float side, scaleFactor,unit;
float theta,theta0,thetaStep;
float phi =  1.618;
int[] currentGlyph = {};
boolean cursorOn = true;

int glyphIndex  = 0;
int glyphTableIndex = 0;
int currentCommand = 0;
String currentString;
String[] currentGlyphTable = {};
String[] glyphSymbolArray = {};
String[] addressedGlyphSymbolArray = {};
char[] keyArray = {'`','3','4','5','6','7','8','9','0','q','w','e','r','t','a','s','d','f','g','h','-','=','z','x','c','v','b','n','m',',','Z','X','C','V','B','N'};
int[] key2commandArray = {0300,0303,0304,0305,0306,0350,0351,0352,0353,0310,0311,0312,0313,0315,0330,0331,0332,0333,0334,0335,0336,0337,0340,0341,0342,0343,0344,0345,0346,0347,0360,0361,0362,0363,0364,0365};
int[] command2indexArray = {};

void setup(){
  size(600,600);
  background(255);
  noFill();
  stroke(0);
  x0 = 300;
  y0 = 300;
  unit = 100;
  side = unit;
  theta  = 0;
  theta0 = 0;
  scaleFactor = 2;
  thetaStep  = PI/2;   
  currentGlyphTable = loadStrings("currentGlyphTable.txt");  
  currentGlyph = commandString2glyph(currentGlyphTable[glyphTableIndex]);
  addressedGlyphSymbolArray = loadStrings("addressedGlyphSymbolArray.txt");
  
  for(int index = 0;index < addressedGlyphSymbolArray.length;index++){
     String[] tempStringArray = split(addressedGlyphSymbolArray[index],':');
     command2indexArray = append(command2indexArray,string2command(tempStringArray[0]));
     glyphSymbolArray = append(glyphSymbolArray,tempStringArray[1]); 
  }
}

void draw(){
  background(255);
  doTheThing(0300);
  drawGlyph(currentGlyph);
  drawCursor();
  theta = theta0;
  side = 18;
  scaleFactor = 2;
  x = side;
  y = height - 3*side;
  thetaStep = PI/2;
  spellGlyph(currentGlyph);
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

void drawGlyph(int[] localGlyph){
  for(int index = 0;index < localGlyph.length;index++){
    doTheThing(localGlyph[index]);  
  }  
}

int command2index(int commandLocal){
  int indexLocal = -1;
  for(int index = 0;index < command2indexArray.length;index++){
    if(commandLocal == command2indexArray[index]){
       indexLocal = index;
    }
  }
  return indexLocal;
}

void spellGlyph(int[] localGlyph){
 for(int index = 0;index < localGlyph.length;index++){
     drawGlyph(commandString2glyph(glyphSymbolArray[command2index(localGlyph[index])]));
 }  
}

void keyPressed(){
  if(int(key) == 8){ //DEL
    currentGlyph = shorten(currentGlyph);
  }
  else{
    if(key2command(key) != -1){
      currentGlyph = append(currentGlyph,key2command(key));   
    }
  }
  currentGlyphTable[glyphTableIndex] = glyph2commandString(currentGlyph);
  saveStrings("currentGlyphTable.txt",currentGlyphTable);
  if(key == ']'){
    glyphTableIndex++;
    if(glyphTableIndex >= currentGlyphTable.length){
      glyphTableIndex = 0;
    }
    currentGlyph = commandString2glyph(currentGlyphTable[glyphTableIndex]);
  }
  if(key == '['){
    glyphTableIndex--;
    if(glyphTableIndex < 0){
      glyphTableIndex = currentGlyphTable.length - 1;
    }
    currentGlyph = commandString2glyph(currentGlyphTable[glyphTableIndex]);
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

int string2command(String localString){
  int sixtyfours = int(localString.charAt(1)) - 060; 
  int eights = int(localString.charAt(2)) - 060; 
  int ones = int(localString.charAt(3)) - 060; 
  int localCommand =  ones + 8*eights + 64*sixtyfours;
  return localCommand;
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

void doTheThing(int localByte){
if(localByte == 0300){
  scaleFactor = 2;theta = theta0;side = unit;x=x0;y=y0;thetaStep = PI/2;//rst
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
if(localByte == 0315){
  scaleFactor = 3;   //3x
}
if(localByte == 0330){
  x += side*cos(theta);y += side*sin(theta); //move
}
if(localByte == 0331){
  x -= side*cos(theta);y -= side*sin(theta);  //back
}
if(localByte == 0332){
  x += side*cos(theta - thetaStep);y += side*sin(theta - thetaStep); //move
}
if(localByte == 0333){
  x += side*cos(theta + thetaStep);y += side*sin(theta + thetaStep); //move
}
if(localByte == 0334){
  theta -= thetaStep; // CCW
}
if(localByte == 0335){
  theta += thetaStep; // CW
}
if(localByte == 0336){
  side /= scaleFactor;  //(-)
}
if(localByte == 0337){
  side *= scaleFactor;  //(+)
}
if(localByte == 0340){
   strokeWeight(5);point(x,y);strokeWeight(2);//point
}
if(localByte == 0341){
  ellipse(x,y,2*side,2*side);//circle
}
if(localByte == 0342){
    line(x,y,x + side*cos(theta),y + side*sin(theta));//line
}
if(localByte == 0343){
    arc(x,y,2*side,2*side,theta - thetaStep,theta + thetaStep);//arcmov
}
if(localByte == 0344){
  int[] localGlyph = {0306,0342,0330,0334,0334,0342,0330,0334,0334,0342,0330,0334,0334};
  drawGlyph(localGlyph);
}
if(localByte == 0345){
  int[] localGlyph = {0304,0342,0330,0334,0342,0330,0334,0342,0330,0334,0342,0330,0334};
  drawGlyph(localGlyph);
}
if(localByte == 0346){
  int[] localGlyph = {0305,0342,0330,0334,0342,0330,0334,0342,0330,0334,0342,0330,0334,0342,0330,0334};
  drawGlyph(localGlyph);
}
if(localByte == 0347){
  int[] localGlyph = {0306,0342,0330,0334,0342,0330,0334,0342,0330,0334,0342,0330,0334,0342,0330,0334,0342,0330,0334};
  drawGlyph(localGlyph);
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
if(localByte == 0360){
  int[] localGlyph = {0342,0330,0304,0334,0312,0337,0342,0330,0334,0306,0334,0336,0313,0337,0342,0330,0335,0304,0335,0335,0336};
  drawGlyph(localGlyph);  
}
if(localByte == 0361){
  int[] localGlyph = {0342,0330,0304,0334,0312,0336,0342,0330,0334,0313,0337,0306,0350,0334,0342,0330,0335,0304,0335,0335,0313,0336,0312,0337};
  drawGlyph(localGlyph);  
}
if(localByte == 0362){
  int[] localGlyph = {0304,0342,0330,0334,0342,0330,0334,0350,0334,0310,0337,0342,0330,0335,0304,0335,0335,0336,0313};
  drawGlyph(localGlyph);  
}
if(localByte == 0363){
  int[] localGlyph = {0304,0342,0330,0334,0350,0334,0310,0336,0342,0330,0334,0334,0342,0330,0334,0334,0334,0337,0304};
  drawGlyph(localGlyph);  
}
if(localByte == 0364){
  int[] localGlyph = {0305,0342,0330,0334,0350,0334,0311,0337,0342,0330,0334,0334,0334,0334,0342,0330,0336,0334,0334,0334};
  drawGlyph(localGlyph);  
}
if(localByte == 0365){
  int[] localGlyph = {0305,0342,0330,0350,0334,0334,0342,0330,0334,0334,0334,0334,0311,0337,0342,0330,0334,0334,0334,0334,0336};
  drawGlyph(localGlyph);  
}


if(x > (width - side)){
   x -= width;
   x += side;
   y += side;
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