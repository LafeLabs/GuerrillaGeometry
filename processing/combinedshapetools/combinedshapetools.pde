int[] zeroColor = {0,0,0};  //black
int[] oneColor = {127,0,0};   //brown
int[] twoColor = {255,0,0};   //red
int[] threeColor = {255,125,0}; //orange
int[] fourColor = {255,255,0};  //yellow
int[] fiveColor = {0,255,0};  //green
int[] sixColor = {0,0,255};   //blue
int[] sevenColor = {255,0,255}; //violet
int[] eightColor = {125,125,125}; //grey
int[] nineColor = {255,255,255};  //white
int[] colorArray = {};


float side = 50;
float scale =0;
float x0 = 200;
float y0 = 300;
float x = x0;
float y = y0;
float unit = 50;

int colorIndex = 0;
int shapeIndex = 0;
int directionIndex = 0; //0 through 15, in 15 degree increments
float angleIncrement = 2*PI/16; //15 degrees
float theta = angleIncrement*directionIndex;

int[] currentGlyph = {0303};

void setup(){
    colorArray = concat(colorArray,zeroColor);
  colorArray = concat(colorArray,oneColor);
  colorArray = concat(colorArray,twoColor);
  colorArray = concat(colorArray,threeColor);
  colorArray = concat(colorArray,fourColor);
  colorArray = concat(colorArray,fiveColor);
  colorArray = concat(colorArray,sixColor);
  colorArray = concat(colorArray,sevenColor);
  colorArray = concat(colorArray,eightColor);
  colorArray = concat(colorArray,nineColor);

 size(400,600); 
}

void draw(){
  background(255);
  doTheThing(0303);
  rect(0,2*side,8*side,8*side);
  drawButtons();
  drawGlyph(currentGlyph);
  drawCursor();
 // noLoop();
}

void drawCursor(){
  stroke(color(colorArray[3*colorIndex],colorArray[3*colorIndex + 1],colorArray[3*colorIndex + 2]));
  strokeWeight(2);
  noFill();
  drawShape(shapeIndex);
  line(x+0.5*side,y + 0.5*side,x+0.5*side + 0.5*side*cos(theta),y + 0.5*side + 0.5*side*sin(theta));
}

void drawButtons(){
  noFill();
  stroke(0);
  for(int rows = 0;rows < 2;rows++){
   for(int columns = 0;columns < 8;columns++){
      rect(columns*side,rows*side,side,side); 
   }
  }
  if(mouseY < 2*side){
     fill(100);
     rect(side*int(mouseX/side),side*int(mouseY/side),side,side);
      noFill();
  }
  
}

void drawShape(int localShapeIndex){
  switch(localShapeIndex){//squareC1
   case 0:
     rect(x,y,side,side);
     break;
   case 1:
     quad(x + side,y + 0.5*side,x + 0.5*side,y + 1*side,x - 0.0*side,y + 0.5*side,x + 0.5*side,y - 0.0*side);
     break;
   case 2:  //triangleC1pointdown
     triangle(x,y,x+side,y,x + side*cos(PI/3),y + side*sin(PI/3));
     break;
   case 3:  //triangleC1pointUp
     triangle(x,y + side,x + side,y + side,x + side*cos(PI/3),y + side - side*sin(PI/3));
     break;
   case 4:  //triangleC1pointRight
     triangle(x,y,x,y + side,x + side*sin(PI/3),y + 0.5*side);
     break;
   case 5:  //triangleC1pointLeft
     triangle(x + side,y,x + side,y + side,x + side*(1-sin(PI/3)),y + 0.5*side);
     break;
   case 6:  //quartersquaretop
     triangle(x,y,x + side,y,x + 0.5*side,y + 0.5*side);
     break;
   case 7:  //quartersquareleft
     triangle(x,y,x,y + side,x + 0.5*side,y + 0.5*side);
     break;
   case 8:  //quartersquarebottom
     triangle(x,y + side,x + side,y + side,x + 0.5*side,y + 0.5*side);
     break;
   case 9:  //quartersquareright
     triangle(x + side,y,x + side,y + side,x + 0.5*side,y + 0.5*side);
     break;
   case 10:  //circle
     ellipse(x+0.5*side,y+0.5*side,side,side);
     break;
  }
}

void drawGlyph(int[] localGlyph){
   for(int index = 0;index < localGlyph.length;index++){
      doTheThing(localGlyph[index]); 
   }
}

void doTheThing(int localByte){
 switch(localByte){
   case 0300://move
     x += side*cos(theta);
     y += side*sin(theta);
     break;
   case 0301://writeFilled
     setFillColor(colorIndex);
     noStroke();
     drawShape(shapeIndex);
     break;
   case 0302://writeOutline
     noFill();
     stroke(0);
     strokeWeight(1);
     drawShape(shapeIndex);
     break;
   case 0303: //resetCursor
     x=x0;
     y=y0;
     side = unit;
     directionIndex = 0;
     colorIndex = 0;
     shapeIndex = 0;
     break;
   case 0304: //deleteOne
     break;
   case 0305: //deleteAll
     break;
   case 0310: //rotateRight
     directionIndex = (directionIndex - 1)%16; 
     theta = directionIndex*angleIncrement;
     break;
   case 0311: //rotateLeft
     directionIndex = (directionIndex + 1)%16; 
     theta = directionIndex*angleIncrement;
     break;
   case 0312: //increaseSize
     side *= 2;
     break;
   case 0313: //decreaseSize
     side /= 2;
     break;
   case 0314: //decreaseColor
      colorIndex = (colorIndex - 1)%10; 
      if(colorIndex == -1){
         colorIndex = 9;
      }
      break;
   case 0315: //increaseColor
     colorIndex = (colorIndex + 1)%10; 
     break;
   case 0316: //decreaseShape
     shapeIndex = (shapeIndex - 1)%11;
     if(shapeIndex == -1){
       shapeIndex = 10;
     }
     break;
   case 0317: //increaseShape
     shapeIndex = (shapeIndex + 1)%11;
     break;
 }
}

void drawCommandGlyph(int localByte){
 switch(localByte){
   case 0300://moveGlyph
     break;
   case 0301://writeFilledGlyph
     break;
   case 0302://writeOutlineGlyph
     break;
   case 0303: //resetCursorGlyph
     break;
   case 0304: //deleteOneGlyph
     break;
   case 0305: //deleteAllGlyph
     break;
   case 0310: //rotateRightGlyph
     break;
   case 0311: //rotateLeftGlyph
     break;
   case 0312: //increaseSizeGlyph
     break;
   case 0313: //decreaseSizeGlyph
     break;
   case 0314: //decreaseColorGlyph
     break;
   case 0315: //increaseColorGlyph
     break;
   case 0316: //decreaseShapeGlyph
     break;
   case 0317: //increaseShapeGlyph
     break;
 }
  
}
void setFillColor(int localColorIndex){
  fill(color(colorArray[3*localColorIndex],colorArray[3*localColorIndex + 1],colorArray[3*localColorIndex + 2]));   
}

void mouseClicked(){
  int ones,eights,sixtyfours,localByte;
  sixtyfours = 3;
  ones = int(mouseX/side);
  eights = int(mouseY/side);
  localByte = ones + 8*eights + 64*sixtyfours;
  currentGlyph = append(currentGlyph,localByte);
}