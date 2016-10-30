float cursorX,cursorY;
float cursorSide,cursorScale,cursorScaleFactor;
float cursorStepAngle = PI/2; // 90 degrees, in rad, for square
int   cursorAngleIndex = 0;
float cursorAngle = cursorStepAngle*cursorAngleIndex;
String cursorShapeString = "rect(cursorX,cursorY,cursorScale*cursorSide,cursorScale*cursorSide); //square";
String latticeName = "square lattice";
float latticeAngle = cursorStepAngle;
String material = "pixel meat";
int[] currentGlyph = {};
int[] fillGlyph = {0300,0306};
int[] outlineGlyph = {0301,0306};
int[] moveRightGlyph = {0301,0304,0304,0302,0302,0303,0305,0300,0306};
int[] rotateCWGlyph = {0301,0306,0306};


void setup(){
  size(600,600);
  cursorSide = 30;
  cursorScale = 1;
  cursorScaleFactor = 2;
  cursorStepAngle = PI/2;
  cursorAngleIndex = 0;
  cursorAngle = cursorStepAngle*cursorAngleIndex;
  background(255);
  cursorX = 300;
  cursorY = 300;
  textSize(10);
}

void draw(){
  background(255);//clear background to white
  cursorX = 0;
  cursorY = 0;
  rect(cursorX,cursorY,cursorSide,cursorSide);
  cursorX += cursorSide;
  rect(cursorX,cursorY,cursorSide,cursorSide);
  cursorX += cursorSide;
  rect(cursorX,cursorY,cursorSide,cursorSide);
  cursorX += cursorSide;
  rect(cursorX,cursorY,cursorSide,cursorSide);
  cursorX += cursorSide;
  rect(cursorX,cursorY,cursorSide,cursorSide);
  cursorX += cursorSide;
  rect(cursorX,cursorY,cursorSide,cursorSide);

  doTheThing(0306);//reset
  cursorX = 300;
  cursorY = 300;
  writeGlyph(currentGlyph);
  rect(cursorX,cursorY,cursorScale*cursorSide,cursorScale*cursorSide);
}

void drawShape(){ 
   rect(cursorX,cursorY,cursorScale*cursorSide,cursorScale*cursorSide); //square;
}
void stepMove(){ 
  cursorX += cursorScale*cursorSide*cos(cursorAngle);
  cursorY += cursorScale*cursorSide*sin(cursorAngle);
}
void stepRotate(){ 
  cursorAngleIndex = (cursorAngleIndex + 1)%4;
  cursorAngle = cursorAngleIndex*cursorStepAngle;
}
void zoomIn(){ 
  cursorScale /= cursorScaleFactor;
}
void zoomOut(){  
  cursorScale *= cursorScaleFactor;
}

void writeFillShape(){  
  noStroke();
  fill(0);
  drawShape();
  stroke(1);
  noFill();
}
void writeOutlineShape(){ 
  stroke(1);
  fill(255);
  drawShape(); 
}

void resetCursor(){
//  cursorX = 300;
  //cursorY = 300;
  cursorScale = 1;
  cursorAngleIndex = 0;
}

int[] addGlyphElement(int[] localGlyph,int localElement){
  localGlyph = append(localGlyph,localElement);
  return localGlyph;
}

int[] deleteGlyphElement(int[] localGlyph){
  localGlyph = shorten(localGlyph);
  return localGlyph;
}

void writeGlyph(int[] localGlyph){
  print("{");
  for(int elementIndex = 0;elementIndex < localGlyph.length;elementIndex++){
     doTheThing(localGlyph[elementIndex]); 
     printOctal(localGlyph[elementIndex]);
  }
  print("}");
  println();
}


void doTheThing(int localThing){
  switch(localThing){
     case 0300:
       writeFillShape();
       break;
     case 0301:
      writeOutlineShape();
      break;
     case 0302:
      stepMove();
      break;
     case 0303:
      stepRotate();
      break;
     case 0304:
      zoomIn();
      break;
     case 0305:
      zoomOut();
      break;
     case 0306:
      resetCursor();
      break;
  }
}

void keyPressed(){
  if(key == 'a'){
        currentGlyph = append(currentGlyph,0300);
  }
  if(key == 's'){
        currentGlyph = append(currentGlyph,0301);
  }
  if(key == 'd'){
        currentGlyph = append(currentGlyph,0302);
  }
  if(key == 'f'){
        currentGlyph = append(currentGlyph,0303);
  }
  if(key == 'g'){
        currentGlyph = append(currentGlyph,0304);
  }
  if(key == 'h'){
        currentGlyph = append(currentGlyph,0305);
  }
  if(key == 'j'){
        currentGlyph = append(currentGlyph,0306);
  }
  if(key == 'k'){
        currentGlyph = append(currentGlyph,0307);
  }
    
}
void mouseClicked() {
  if(mouseX < 8*cursorSide && mouseY < 8*cursorSide){
     int ones = int(mouseX/cursorSide);
     int eights = int(mouseY/cursorSide);
     int sixtyfours = 3;
     int buttonByte = ones + 8*eights + 64*sixtyfours;
     printOctal(buttonByte);
     doTheThing(buttonByte);
     currentGlyph = append(currentGlyph,buttonByte);
     println(currentGlyph.length);
     
  }
  else{
  }
  
}
void printOctal(int localByte){
   print((localByte >> 6)&7); //sixtyfours
   print((localByte >> 3)&7);//eights
   print(localByte &7);//ones
   print(", ");
}