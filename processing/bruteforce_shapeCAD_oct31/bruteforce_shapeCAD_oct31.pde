
float side = 20;
float x = 20;
float y = 20;
float commandGlyphScale = 1;
float roctalScale = 1;
float roctalX = 300;
float roctalY = 300;
float drawZeroX = 0;
float drawZeroY = 150;
int roctalColumnNumber = 12;

int[] message = {0101,0102,0103,0104,0105};

void setup(){
  size(500,500);
  background(255);
}
void draw(){
  drawControlPanel();
  
  x = 300;
  y = 300;

  writeRoctalArray(message);
  x = 200;
  y = 400;
  writeRoctalCharacter(0101);
}


void writeRoctalArray(int[] localByteArray){
  for(int byteIndex = 0;byteIndex < localByteArray.length;byteIndex++){
     x = roctalX + (byteIndex%roctalColumnNumber)*roctalScale*side;
     y = roctalY + (byteIndex/roctalColumnNumber)*roctalScale*side;
     writeRoctalCharacter(localByteArray[byteIndex]);
  }
}

void writeRoctalCharacter(int localByte){
  noFill();
  stroke(0);
  strokeWeight(1);
  rect(x,y,roctalScale*side,roctalScale*side);
  fill(0);
  rect(x,y,0.25*roctalScale*side,0.25*roctalScale*side);
  for(int bitIndex = 0;bitIndex < 9;bitIndex++){
      if(((localByte >> (8-bitIndex))&1) == 1){
        fill(0);
      }
      else{
        fill(255);
      }
  rect(x + 0.25*roctalScale*side*(1 + bitIndex%3),y + 0.25*roctalScale*side*(1 + bitIndex/3),0.25*roctalScale*side,0.25*roctalScale*side);
  }
    
}

void writeGlyphArray(int[] localByteArray){

}

void displayGlyph(int[] localByteArray){
  
}

void drawCommandGlyph(int localByte){
    switch(localByte){
    case 0300:
      setBlack_drawCommandGlyph();
      break;
    case 0301:
      setWhite_drawCommandGlyph();
      break;
    case 0302:
      fillIn_drawCommandGlyph();
      break;
    case 0303:
      outline_drawCommandGlyph();
      break;
    case 0304:
      deleteCommand_drawCommandGlyph();
      break;
    case 0305:
      deleteWholeGlyph_drawCommandGlyph();
      break;
    case 0306:
      break;
    case 0307:
      break;
    case 0310:
      break;
    case 0311:
      moveNorthNorthWest_drawCommandGlyph();
      break;
    case 0312:
      break;
    case 0313:
      moveNorthNorthEast_drawCommandGlyph();
      break;
    case 0314:
      break;
    case 0315:
      northWestHalfSquare_drawCommandGlyph();
      break;
    case 0316:
      southernQuarterSquare_drawCommandGlyph();
      break;
    case 0317:
      northEastHalfSquare_drawCommandGlyph();
      break;
    case 0320:
      moveWestNorthWest_drawCommandGlyph();
      break;
    case 0321:
      moveNorthWest_drawCommandGlyph();
      break;
    case 0322:
      moveNorth_drawCommandGlyph();
      break;
    case 0323:
      moveNorthEast_drawCommandGlyph();
      break;
    case 0324:
      moveEastNorthEast_drawCommandGlyph();
      break;
    case 0325:
      easternQuarterSquare_drawCommandGlyph();
      break;
    case 0326:
      wholeSquare_drawCommandGlyph();
      break;
    case 0327:
      westernQuarterSquare_drawCommandGlyph();
      break;
    case 0330:
      break;
    case 0331:
      moveWest_drawCommandGlyph();
      break;
    case 0332:
      restartPosition_drawCommandGlyph();
      break;
    case 0333:
      moveEast_drawCommandGlyph();
      break;
    case 0334:
      break;
    case 0335:
      southWestHalfSquare_drawCommandGlyph();
      break;
    case 0336:
      northernQuarterSquare_drawCommandGlyph();
      break;
    case 0337:
      southEastHalfSquare_drawCommandGlyph();
      break;
    case 0340:
      break;
    case 0341:
      break;
    case 0342:
      break;
    case 0343:
      break;
    case 0344:
      break;
    case 0345:
      break;
    case 0346:
      break;
    case 0347:
      break;
    case 0350:
      break;
    case 0351:
      break;
    case 0352:
      break;
    case 0353:
      break;
    case 0354:
      break;
    case 0355:
      break;
    case 0356:
      break;
    case 0357:
      break;
    case 0360:
      break;
    case 0361:
      break;
    case 0362:
      break;
    case 0363:
      break;
    case 0364:
      break;
    case 0365:
      break;
    case 0366:
      break;
    case 0367:
      break;
    case 0370:
      break;
    case 0371:
      break;
    case 0372:
      break;
    case 0373:
      break;
    case 0374:
      break;
    case 0375:
      break;
    case 0376:
      break;
    case 0377:
      break;
  }
}
  
void doTheThing(int localByte){
  switch(localByte){
    case 0300:
      break;
    case 0301:
      break;
    case 0302:
      break;
    case 0303:
      break;
    case 0304:
      break;
    case 0305:
      break;
    case 0306:
      break;
    case 0307:
      break;
    case 0310:
      break;
    case 0311:
      break;
    case 0312:
      break;
    case 0313:
      break;
    case 0314:
      break;
    case 0315:
      break;
    case 0316:
      break;
    case 0317:
      break;
    case 0320:
      break;
    case 0321:
      break;
    case 0322:
      break;
    case 0323:
      break;
    case 0324:
      break;
    case 0325:
      break;
    case 0326:
      break;
    case 0327:
      break;
    case 0330:
      break;
    case 0331:
      break;
    case 0332:
      break;
    case 0333:
      break;
    case 0334:
      break;
    case 0335:
      break;
    case 0336:
      break;
    case 0337:
      break;
    case 0340:
      break;
    case 0341:
      break;
    case 0342:
      break;
    case 0343:
      break;
    case 0344:
      break;
    case 0345:
      break;
    case 0346:
      break;
    case 0347:
      break;
    case 0350:
      break;
    case 0351:
      break;
    case 0352:
      break;
    case 0353:
      break;
    case 0354:
      break;
    case 0355:
      break;
    case 0356:
      break;
    case 0357:
      break;
    case 0360:
      break;
    case 0361:
      break;
    case 0362:
      break;
    case 0363:
      break;
    case 0364:
      break;
    case 0365:
      break;
    case 0366:
      break;
    case 0367:
      break;
    case 0370:
      break;
    case 0371:
      break;
    case 0372:
      break;
    case 0373:
      break;
    case 0374:
      break;
    case 0375:
      break;
    case 0376:
      break;
    case 0377:
      break;
  }
}

void drawControlPanel(){
 x=0;
 y=0;
 setBlack_drawCommandGlyph();
 x += commandGlyphScale*side;
 setWhite_drawCommandGlyph();
 x += commandGlyphScale*side;
 fillIn_drawCommandGlyph();
 x += commandGlyphScale*side;
 outline_drawCommandGlyph();
 x += commandGlyphScale*side;
 deleteCommand_drawCommandGlyph();
 x += commandGlyphScale*side;
 deleteWholeGlyph_drawCommandGlyph();
 y += commandGlyphScale*side;
 x -= 4*commandGlyphScale*side;
 moveNorthNorthWest_drawCommandGlyph();
 x += 2*commandGlyphScale*side;
 moveNorthNorthEast_drawCommandGlyph();
 x += 2*commandGlyphScale*side;
 northWestHalfSquare_drawCommandGlyph();
 x += commandGlyphScale*side;
 southernQuarterSquare_drawCommandGlyph();
 x += commandGlyphScale*side; 
 northEastHalfSquare_drawCommandGlyph();
 y += commandGlyphScale*side; 
 x=0;
 moveWestNorthWest_drawCommandGlyph();
 x += commandGlyphScale*side; 
 moveNorthWest_drawCommandGlyph();
 x += commandGlyphScale*side; 
 moveNorth_drawCommandGlyph();
 x += commandGlyphScale*side; 
 moveNorthEast_drawCommandGlyph();
 x += commandGlyphScale*side;  
 moveEastNorthEast_drawCommandGlyph();
 x += commandGlyphScale*side;  
 easternQuarterSquare_drawCommandGlyph();
 x += commandGlyphScale*side;  
 wholeSquare_drawCommandGlyph();
 x += commandGlyphScale*side;  
 westernQuarterSquare_drawCommandGlyph();
 y += commandGlyphScale*side; 
 x = commandGlyphScale*side;  
 moveWest_drawCommandGlyph();
 x += commandGlyphScale*side;  
 restartPosition_drawCommandGlyph();
 x += commandGlyphScale*side;  
 moveEast_drawCommandGlyph();
 x += 2*commandGlyphScale*side;  
 southWestHalfSquare_drawCommandGlyph(); 
 x += commandGlyphScale*side;   
 northernQuarterSquare_drawCommandGlyph();
 x += commandGlyphScale*side;    
 southEastHalfSquare_drawCommandGlyph();
 x = 0;    
 y += commandGlyphScale*side;    
 moveWestSouthWest_drawCommandGlyph();
 x += commandGlyphScale*side; 
 moveSouthWest_drawCommandGlyph();
 x += commandGlyphScale*side; 
 moveSouth_drawCommandGlyph();
 x += commandGlyphScale*side; 
 moveSouthEast_drawCommandGlyph();
 x += commandGlyphScale*side;  
 moveEastSouthEast_drawCommandGlyph();
 x += commandGlyphScale*side;   
 pointNorthEquilateralTriangle_drawCommandGlyph();
 x += commandGlyphScale*side;   
 twoXZoomIn_drawCommandGlyph();
 x += commandGlyphScale*side;   
 fourXZoomIn_drawCommandGlyph();
 x = commandGlyphScale*side;   
 y += commandGlyphScale*side;   
 moveSouthSouthWest_drawCommandGlyph();
 x += 2*commandGlyphScale*side;   
 moveSouthSouthEast_drawCommandGlyph();
 x += 2*commandGlyphScale*side;   
 pointSouthEquilateralTriangle_drawCommandGlyph();
 x += commandGlyphScale*side;   
 twoXZoomOut_drawCommandGlyph();
 x += commandGlyphScale*side;   
 fourXZoomOut_drawCommandGlyph();
 x=0;
 y += commandGlyphScale*side;   
 fullCircle_drawCommandGlyph();
 x += 4*commandGlyphScale*side;   
 pointWestEquilateralTriangle_drawCommandGlyph();
 x += commandGlyphScale*side;   
 pointEastEquilateralTriangle_drawCommandGlyph();
 x=0;
 y += commandGlyphScale*side; 
 setBrown_drawCommandGlyph();  
 x += commandGlyphScale*side;
 setRed_drawCommandGlyph(); 
 x += commandGlyphScale*side;
 setOrange_drawCommandGlyph(); 
 x += commandGlyphScale*side;
 setYellow_drawCommandGlyph(); 
 x += commandGlyphScale*side;
 setGreen_drawCommandGlyph(); 
 x += commandGlyphScale*side;
 setBlue_drawCommandGlyph(); 
 x += commandGlyphScale*side;
 setViolet_drawCommandGlyph(); 
 x += commandGlyphScale*side;
 setGrey_drawCommandGlyph(); 

}

void setBlack_drawCommandGlyph(){
  fill(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
}

void setWhite_drawCommandGlyph(){
  stroke(1);
  fill(255);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
}

void fillIn_drawCommandGlyph(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(0);
   rect(x+0.15*commandGlyphScale*side,y+0.15*commandGlyphScale*side,0.7*commandGlyphScale*side,0.7*commandGlyphScale*side);
}

void outline_drawCommandGlyph(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   rect(x+0.15*commandGlyphScale*side,y+0.15*commandGlyphScale*side,0.7*commandGlyphScale*side,0.7*commandGlyphScale*side);
}

void deleteCommand_drawCommandGlyph(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
    strokeWeight(3);
    line(x + 0.1*commandGlyphScale*side,y + 0.1*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.9*commandGlyphScale*side); 
    line(x + 0.1*commandGlyphScale*side,y + 0.9*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.1*commandGlyphScale*side); 
    strokeWeight(1);
}

void deleteWholeGlyph_drawCommandGlyph(){
   strokeWeight(1);
   fill(color(255,0,0));
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
    strokeWeight(3);
    line(x + 0.1*commandGlyphScale*side,y + 0.1*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.9*commandGlyphScale*side); 
    line(x + 0.1*commandGlyphScale*side,y + 0.9*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.1*commandGlyphScale*side); 
    strokeWeight(1);
}


void moveNorthNorthWest_drawCommandGlyph(){
  noFill();
  stroke(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.3*side,y + commandGlyphScale*0.1*side);
  
}

void moveNorthNorthEast_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.6*side,y + commandGlyphScale*0.1*side);
}

void northWestHalfSquare_drawCommandGlyph(){
   strokeWeight(1);
   fill(color(0,0,255));
   rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(color(255,0,255));
   rect(x+0.5*commandGlyphScale*side,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(255);
   triangle(x + commandGlyphScale*side,y,x,y + commandGlyphScale*side,x + commandGlyphScale*side,y + commandGlyphScale*side);
}

void southernQuarterSquare_drawCommandGlyph(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(255,0,255));
   triangle(x,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y+ commandGlyphScale*side);  
   fill(color(0,0,255));
   triangle(x + commandGlyphScale*side,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y+ commandGlyphScale*side);
  
}

void northEastHalfSquare_drawCommandGlyph(){
   strokeWeight(1);
   fill(color(0,0,255));
   rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x+0.5*commandGlyphScale*side,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(color(255,0,255));
   rect(x+0.5*commandGlyphScale*side,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(255);
   triangle(x,y,x,y + commandGlyphScale*side,x + commandGlyphScale*side,y + commandGlyphScale*side);
}


void moveWestNorthWest_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.1*side,y + commandGlyphScale*0.4*side);
}

void moveNorthWest_drawCommandGlyph(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x,y);  
}

void moveNorth_drawCommandGlyph(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + 0.5*commandGlyphScale*side,y);  
}

void moveNorthEast_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*side,y);  
}

void moveEastNorthEast_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.9*side,y + commandGlyphScale*0.4*side);   
}

void easternQuarterSquare_drawCommandGlyph(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(255,0,255));
   triangle(x + commandGlyphScale*side,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + commandGlyphScale*side,y+ 0.5*commandGlyphScale*side);  
   fill(color(0,0,255));
   triangle(x + commandGlyphScale*side,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + commandGlyphScale*side,y + 0.5*commandGlyphScale*side);

}

void wholeSquare_drawCommandGlyph(){
   strokeWeight(1);
   fill(color(0,0,255));
   rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x+0.5*commandGlyphScale*side,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(color(255,0,255));
   rect(x+0.5*commandGlyphScale*side,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
}

void westernQuarterSquare_drawCommandGlyph(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(0,0,255));
   triangle(x,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x,y+ 0.5*commandGlyphScale*side);  
   fill(color(255,0,255));
   triangle(x,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x,y + 0.5*commandGlyphScale*side);
}

void moveWest_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x,y + 0.5*commandGlyphScale*side);  
}

void restartPosition_drawCommandGlyph(){
   noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(0);
  rect(x + 0.4*commandGlyphScale*side,y + 0.4*commandGlyphScale*side,0.1*commandGlyphScale*side,0.1*commandGlyphScale*side);
  
}

void moveEast_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*side,y + 0.5*commandGlyphScale*side);  
}

void southWestHalfSquare_drawCommandGlyph(){
   strokeWeight(1);
   fill(color(0,0,255));
   rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x+0.5*commandGlyphScale*side,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(color(255,0,255));
   rect(x+0.5*commandGlyphScale*side,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(255);
   triangle(x,y,x + commandGlyphScale*side,y,x + commandGlyphScale*side,y + commandGlyphScale*side);
}

void northernQuarterSquare_drawCommandGlyph(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(0,0,255));
   triangle(x,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y);  
   fill(color(255,0,255));
   triangle(x + commandGlyphScale*side,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y);  
}

void southEastHalfSquare_drawCommandGlyph(){
   strokeWeight(1);
   fill(color(0,0,255));
   rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x+0.5*commandGlyphScale*side,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(color(255,0,255));
   rect(x+0.5*commandGlyphScale*side,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(255);
   triangle(x,y,x + commandGlyphScale*side,y,x,y + commandGlyphScale*side);
}

void moveWestSouthWest_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.1*side,y + commandGlyphScale*0.6*side);
}

void moveSouthWest_drawCommandGlyph(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x,y + commandGlyphScale*side);  
}

void moveSouth_drawCommandGlyph(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + 0.5*commandGlyphScale*side,y + commandGlyphScale*side);  
}

void moveSouthEast_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*side,y + commandGlyphScale*side);  
}

void moveEastSouthEast_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.9*side,y + commandGlyphScale*0.6*side);   
}

void pointNorthEquilateralTriangle_drawCommandGlyph(){
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + commandGlyphScale*side*(1-sin((2*PI)/6)),x + commandGlyphScale*side,y + commandGlyphScale*side);
}

void twoXZoomIn_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(0);
  rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
}

void fourXZoomIn_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(0);
  rect(x,y,0.25*commandGlyphScale*side,0.25*commandGlyphScale*side);
}

void moveSouthSouthWest_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.4*side,y + commandGlyphScale*0.9*side);  
}

void moveSouthSouthEast_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.6*side,y + commandGlyphScale*0.9*side);  
}

void pointSouthEquilateralTriangle_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x,y,x + 0.5*commandGlyphScale*side,y + commandGlyphScale*side*(sin((2*PI)/6)),x + commandGlyphScale*side,y);
}

void twoXZoomOut_drawCommandGlyph(){
  fill(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(255);
  rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);    
}


void fourXZoomOut_drawCommandGlyph(){
  fill(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(255);
  rect(x,y,0.25*commandGlyphScale*side,0.25*commandGlyphScale*side);    
}

void fullCircle_drawCommandGlyph(){
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(color(255,255,0));
  ellipse(x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,commandGlyphScale*side,commandGlyphScale*side); 
}


void pointWestEquilateralTriangle_drawCommandGlyph(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x+commandGlyphScale*side*(1-sin((2*PI)/6)),y + 0.5*commandGlyphScale*side,x + commandGlyphScale*side,y,x + commandGlyphScale*side,y + commandGlyphScale*side);  
}

void pointEastEquilateralTriangle_drawCommandGlyph(){
 noFill();
 strokeWeight(0);
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x+commandGlyphScale*side*(sin((2*PI)/6)),y + 0.5*commandGlyphScale*side,x,y,x,y + commandGlyphScale*side);  
}


void setBrown_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(127,0,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setRed_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setOrange_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,127,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setYellow_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,255,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setGreen_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(0,255,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setBlue_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(0,0,255));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setViolet_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,255));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setGrey_drawCommandGlyph(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(100);
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}