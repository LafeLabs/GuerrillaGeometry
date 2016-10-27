//purity of essenence
//precious bodily fluids

float side = 30;
float scale = 1;
float scaleFactor = 5;  //2 for standard CAD, 5 for drawing the glyphs
float x,y,x0,y0;
int buttonByte = 0;

String[] shapeCodeEnglishDescriptions = new String[128];
String[] shapeCodeASCIIshifted = new String[128];
int[] shapeCodeArray = {0342};


int[] minusGlyph = {0312,0331,0362,0362,0344,0313,0344,0313,0344,0313,0322,0340,0340,0322,0344,0344,0344,0360};
int[] plusGlyph = {0312,0331,0362,0362,0344,0313,0344,0322,0313,0362,0362,0313,0322,0313,0344,0313,0322,0340,0340,0322,0340,0364};
int[] upperLeftGlyph = {0331,0313,0364};
int[] upperRightGlyph = {0333,0313,0360};
int[] lowerLeftGlyph= {0351,0313,0324};
int[] lowerRightGlyph= {0353,0313,0320};
int[] upArrowGlyph = {0312,0331,0344,0344,0313,0362,0313,0340,0313,0344,0344,0313,0340,0362,0340,0340,0313,0344,0313,0344,0313,0344,0313,0344,0313,0340,0340,0362,0313,0362,0313,0340,0340,0324};
int[] rightArrowGlyph = {0312,0331,0362,0362,0313,0344,0313,0344,0322,0322,0313,0362,0313,0362,0313,0362,0313,0362,0313,0322,0344,0313,0322,0313,0322,0313,0362,0344,0313,0322,0322,0360};
int[] downArrowGlyph = {0312,0331,0344,0344,0313,0362,0313,0362,0340,0340,0313,0344,0313,0344,0313,0344,0313,0344,0313,0340,0362,0313,0340,0313,0340,0313,0344,0362,0313,0344,0344,0320};
int[] leftArrowGlyph = {0312,0331,0362,0362,0313,0344,0322,0313,0362,0313,0362,0313,0362,0344,0313,0322,0313,0322,0313,0322,0313,0322,0313,0362,0362,0344,0313,0344,0313,0362,0362,0320};
int[] resetGlyph = {0312,0331,0344,0362,0313,0362,0313,0362,0313,0344,0313,0344,0313,0322,0313,0322,0313,0340,0313,0322,0340,0340,0364};
int[] fillGlyph = {0312,0331,0344,0313,0362,0340,0313,0362,0362,0362,0313,0344,0322,0313,0322,0344,0313,0322,0344,0313,0322,0344,0313,0362,0362,0362,0313,0340,0362,0313,0344,0320};
int[] outlineGlyph = {0340,0300,0331,0344,0344,0344,0344,0344,0313,0362,0313,0362,0313,0362,0313,0362,0313,0344,0313,0344,0313,0344,0313,0344,0313,0322,0313,0322,0313,0322,0313,0322,0313,0340,0313,0340,0313,0340,0313,0340,0364};
int[] deleteGlyph = {0312,0331,0313,0344,0362,0313,0344,0362,0313,0344,0362,0313,0344,0362,0313,0320,0351,0313,0344,0322,0313,0344,0322,0313,0344,0322,0313,0344,0322,0313,0360};

int[] blackGlyph = {0300,0313};
int[] brownGlyph = {0301,0313};
int[] redGlyph = {0302,0313};
int[] orangeGlyph = {0303,0313};
int[] yellowGlyph = {0304,0313};
int[] greenGlyph = {0305,0313};
int[] blueGlyph = {0306,0313};
int[] violetGlyph = {0307,0313};
int[] greyGlyph = {0310,0313};
int[] whiteGlyph = {0311,0313};

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
int colorIndex = 0;


void setup(){
  size(500,250);
  //rectMode(CENTER);
  background(255);  
  x = 3*width/4;
  y = height/2;
  x0 = x;
  y0 = y;
  
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

//  shapeCodeArray = concat(shapeCodeArray,deleteGlyph);
   
  
}

void draw(){
   background(255);
   drawButtons();
   drawShapeArray(shapeCodeArray);
   drawCursor();
}


void drawCursor(){
   noFill();
   rect(x,y,scale*side,scale*side); 
   setColor(colorIndex);
  
}

void drawShapeArray(int[] localShapeCodeArray){
  for(int shapeArrayIndex = 0;shapeArrayIndex < localShapeCodeArray.length;shapeArrayIndex++){
    doTheThing(localShapeCodeArray[shapeArrayIndex]);
  }
}

void drawButtons(){
  scale = 1;
  scaleFactor = 5;
  noFill();
    for(int rowIndex = 0;rowIndex < 8;rowIndex++){
    for(int columnIndex = 0;columnIndex < 8;columnIndex++){
      rect(side*columnIndex,side*rowIndex,side,side);  
    }
  }
  setColor(colorIndex);
  x=0;
  y=0;
  drawShapeArray(blackGlyph);
  x+=side;
  drawShapeArray(brownGlyph);
  x+=side;
  drawShapeArray(redGlyph);
  x+=side;  
  drawShapeArray(orangeGlyph);
  x+=side;  
  drawShapeArray(yellowGlyph);
  x+=side;  
  drawShapeArray(greenGlyph);
  x+=side;
  drawShapeArray(blueGlyph);
  x+=side;
  drawShapeArray(violetGlyph);
  x =0;
  y += side;
  drawShapeArray(greyGlyph);
  x += side;
  drawShapeArray(whiteGlyph);
  x += side;
  drawShapeArray(outlineGlyph);
  x += side;
  drawShapeArray(fillGlyph);
  x += side;
  drawShapeArray(deleteGlyph);
  x = 0;
  y += side;
  drawShapeArray(plusGlyph);
  x += 2*side;
  drawShapeArray(upArrowGlyph);
  x += 2*side;
  drawShapeArray(plusGlyph);
  y += side;
  x = side;
  drawShapeArray(minusGlyph);
  x += 2*side;  
  drawShapeArray(minusGlyph);
  x = 0;
  y += side;
  drawShapeArray(leftArrowGlyph);
  x += 2*side;
  drawShapeArray(resetGlyph);
  x += 2*side;
  drawShapeArray(rightArrowGlyph);
  y += side;
  x = side;
  drawShapeArray(minusGlyph);
  x += 2*side;  
  drawShapeArray(minusGlyph);
  y += side;
  x = 0;
  drawShapeArray(plusGlyph);
  x += 2*side;
  drawShapeArray(downArrowGlyph);
  x += 2*side;
  drawShapeArray(plusGlyph);
  scaleFactor = 2;
  scale = 1;
}

void printOctal(int localByte){
   print((localByte >> 6)&7); //sixtyfours
   print((localByte >> 3)&7);//eights
   println(localByte &7);//ones
}

void mouseClicked() {
  if(mouseX < 8*side && mouseY < 8*side){
     int ones = int(mouseX/side);
     int eights = int(mouseY/side);
     int sixtyfours = 3;
     buttonByte = ones + 8*eights + 64*sixtyfours;
     printOctal(buttonByte);
     doTheThing(buttonByte);
     shapeCodeArray = append(shapeCodeArray,buttonByte);
     println(shapeCodeArray.length);
  }
  else{
  }
  
}


void setColor(int colorSelectLocal){
   colorIndex = colorSelectLocal;
   fill(color(colorArray[3*colorIndex+0],colorArray[3*colorIndex+1],colorArray[3*colorIndex+2]));
}

void doTheThing(int localByte){
  switch(localByte){
   case 0300:
     setColor(0);
     break;
   case 0301:
     setColor(1);
     break;
   case 0302:
     setColor(2);
     break;
   case 0303:
     setColor(3);
     break;
   case 0304:
     setColor(4);
     break;
   case 0305:
     setColor(5);
     break;
  case 0306:
     setColor(6);
     break;
   case 0307:
     setColor(7);
     break;
  case 0310:
     setColor(8);
     break;
   case 0311:
     setColor(9);
     break;
   case 0312:
     noFill();
     rect(x,y,scale*side,scale*side);
     setColor(colorIndex);
     break;
   case 0313:
     rect(x,y,scale*side,scale*side);
     break;
   case 0314:
     //delete a byte from the commandarray
     shapeCodeArray = shorten(shapeCodeArray);
     
     break;
   case 0320: //scale up, upper left
     x += scale*side;
     y += scale*side;
     scale *= scaleFactor;
     x -= scale*side;
     y -= scale*side;
  
     break;
   case 0322: // move up
     y -= scale*side;
     break;
   case 0324: //scale up, upper right
     y += scale*side;
     scale *= scaleFactor;
     y -= scale*side;
     break;
   case 0331: //scale down uppper left
     scale /= scaleFactor;
     break;
   case 0333: //scale down upper right
      x += scale*side;
      scale /= scaleFactor;     
      x -= scale*side;
     break;
   case 0340:  //move left
     x -= scale*side;
     break;
   case 0342:  //go back to start position
     x = x0;
     y = y0;
     scale = 1;
     break;
   case 0344: //move right
     x += scale*side;
     break;
   case 0351: // shrink to the lower left
     y += scale*side;
     scale /= scaleFactor;
     y -= scale*side;
     break;
   case 0353:  //shrink to the lower right
     y += scale*side;
     x += scale*side;
     scale /= scaleFactor;
     y -= scale*side;
     x -= scale*side;
     break;
  case 0360: //grow to the lower left
     x += scale*side;
     scale *= scaleFactor;
     x -= scale*side;
     break;
  case 0362:  //move down
     y += scale*side;
     break;
  case 0364:  //grow to the lower right
     scale *= scaleFactor;
  }
}