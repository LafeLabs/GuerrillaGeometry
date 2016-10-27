//purity of essenence
//precious bodily fluids

float side = 30;
float scale = 1;
float scaleFactor = 5;  //2 for standard CAD, 5 for drawing the glyphs
float x,y,x0,y0;
int buttonByte = 0;

String[] shapeCodeEnglishDescriptions = new String[128];
String[] shapeCodeASCIIshifted = new String[128];
int[] shapeCodeArray = {};


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
int[] outlineGlyph = {0340,0300,0331,0344,0344,0344,0344,0313,0362,0313,0362,0313,0362,0313,0362,0313,0344,0313,0344,0313,0344,0313,0344,0313,0322,0313,0322,0313,0322,0313,0322,0313,0340,0313,0340,0313,0340,0313,0340,0364};
int[] deleteGlyph = {0312,0331,0313,0344,0362,0313,0344,0362,0313,0344,0362,0313,0344,0362,0313,0320,0351,0313,0344,0322,0313,0344,0322,0313,0344,0322,0313,0344,0322,0313,0360};

int[] blackGlyph = {0300};
int[] brownGlyph = {0301};
int[] redGlyph = {0302};
int[] orangeGlyph = {0303};
int[] yellowGlyph = {0304};
int[] greenGlyph = {0305};
int[] blueGlyph = {0306};
int[] violetGlyph = {0307};
int[] greyGlyph = {0310};
int[] whiteGlyph = {0311};

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

  shapeCodeArray = concat(shapeCodeArray,deleteGlyph);
   
  
}

void draw(){
   drawButtons();
   drawShapeArray();
   drawCursor();
   doTheThing(0342);

}


void drawCursor(){
  noFill();
   rect(x,y,scale*side,scale*side); 
    setColor(colorIndex);

}

void drawShapeArray(){
  for(int shapeArrayIndex = 0;shapeArrayIndex < shapeCodeArray.length;shapeArrayIndex++){
    doTheThing(shapeCodeArray[shapeArrayIndex]);
  }
  
}

void drawButtons(){
  noFill();
    for(int rowIndex = 0;rowIndex < 8;rowIndex++){
    for(int columnIndex = 0;columnIndex < 8;columnIndex++){
      rect(side*columnIndex,side*rowIndex,side,side);  
    }
  }
  setColor(colorIndex);
  
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
//     doTheThing(buttonByte);
     shapeCodeArray = append(shapeCodeArray,buttonByte);
     println(shapeCodeArray.length);
  }
  else{
  }
  
}

int[] rotateCW(int[] localArray){
  int[] outputArray = {};
  for(int localArrayIndex = 0;localArrayIndex < localArray.length;localArrayIndex++){
    if(localArray[localArrayIndex] == 0344){
     outputArray = append(outputArray,0363);
    }
    if(localArray[localArrayIndex] == 0362){
      outputArray = append(outputArray,0340);
    }
    if(localArray[localArrayIndex] == 0340){
      outputArray = append(outputArray,0322);
    }
    if(localArray[localArrayIndex] == 0322){
      outputArray = append(outputArray,0344);
    }
    if(localArray[localArrayIndex] == 0320){
      outputArray = append(outputArray,0324);
    }
    if(localArray[localArrayIndex] == 0324){
      outputArray = append(outputArray,0364);
    }
    if(localArray[localArrayIndex] == 0364){
      outputArray = append(outputArray,0360);
    }
    if(localArray[localArrayIndex] == 0360){
      outputArray = append(outputArray,0320);
    }
    if(localArray[localArrayIndex] == 0331){
      outputArray = append(outputArray,0333);
    }
    if(localArray[localArrayIndex] == 0333){
      outputArray = append(outputArray,0353);
    }
    if(localArray[localArrayIndex] == 0353){
      outputArray = append(outputArray,0351);
    }
    if(localArray[localArrayIndex] == 0351){
      outputArray = append(outputArray,0331);
    } 
    if(localArray[localArrayIndex] == 0313){
      outputArray = append(outputArray,0313);
    } 
    if(localArray[localArrayIndex] == 0312){
      outputArray = append(outputArray,0312);
    } 

  }
  return outputArray;
  
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