
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
      moveWestSouthWest_drawCommandGlyph();
      break;
    case 0341:
      moveSouthWest_drawCommandGlyph();
      break;
    case 0342:
      moveSouth_drawCommandGlyph();
      break;
    case 0343:
      moveSouthEast_drawCommandGlyph();
      break;
    case 0344:
      moveEastSouthEast_drawCommandGlyph();
      break;
    case 0345:
      pointNorthEquilateralTriangle_drawCommandGlyph();
      break;
    case 0346:
      twoXZoomIn_drawCommandGlyph();
      break;
    case 0347:
      fourXZoomIn_drawCommandGlyph();
      break;
    case 0350:
      break;
    case 0351:
      moveSouthSouthWest_drawCommandGlyph();
      break;
    case 0352:
      break;
    case 0353:
      moveSouthSouthEast_drawCommandGlyph();
      break;
    case 0354:
      break;
    case 0355:
      pointSouthEquilateralTriangle_drawCommandGlyph();
      break;
    case 0356:
      twoXZoomOut_drawCommandGlyph();
      break;
    case 0357:
      fourXZoomOut_drawCommandGlyph();
      break;
    case 0360:
      fullCircle_drawCommandGlyph();
      break;
    case 0361:
      break;
    case 0362:
      break;
    case 0363:
      break;
    case 0364:
      pointWestEquilateralTriangle_drawCommandGlyph();
      break;
    case 0365:
      pointEastEquilateralTriangle_drawCommandGlyph();
      break;
    case 0366:
      break;
    case 0367:
      break;
    case 0370:
      setBrown_drawCommandGlyph();
      break;
    case 0371:
      setRed_drawCommandGlyph();
      break;
    case 0372:
      setOrange_drawCommandGlyph();
      break;
    case 0373:
      setYellow_drawCommandGlyph();
      break;
    case 0374:
      setGreen_drawCommandGlyph();
      break;
    case 0375:
      setBlue_drawCommandGlyph();
      break;
    case 0376:
      setViolet_drawCommandGlyph();
      break;
    case 0377:      
      setGrey_drawCommandGlyph();
      break;
  }
}
  
void doTheThing(int localByte){
    switch(localByte){
    case 0300:
      setBlack();
      break;
    case 0301:
      setWhite();
      break;
    case 0302:
      fillIn();
      break;
    case 0303:
      outline();
      break;
    case 0304:
      deleteCommand();
      break;
    case 0305:
      deleteWholeGlyph();
      break;
    case 0306:
      break;
    case 0307:
      break;
    case 0310:
      break;
    case 0311:
      moveNorthNorthWest();
      break;
    case 0312:
      break;
    case 0313:
      moveNorthNorthEast();
      break;
    case 0314:
      break;
    case 0315:
      northWestHalfSquare();
      break;
    case 0316:
      southernQuarterSquare();
      break;
    case 0317:
      northEastHalfSquare();
      break;
    case 0320:
      moveWestNorthWest();
      break;
    case 0321:
      moveNorthWest();
      break;
    case 0322:
      moveNorth();
      break;
    case 0323:
      moveNorthEast();
      break;
    case 0324:
      moveEastNorthEast();
      break;
    case 0325:
      easternQuarterSquare();
      break;
    case 0326:
      wholeSquare();
      break;
    case 0327:
      westernQuarterSquare();
      break;
    case 0330:
      break;
    case 0331:
      moveWest();
      break;
    case 0332:
      restartPosition();
      break;
    case 0333:
      moveEast();
      break;
    case 0334:
      break;
    case 0335:
      southWestHalfSquare();
      break;
    case 0336:
      northernQuarterSquare();
      break;
    case 0337:
      southEastHalfSquare();
      break;
    case 0340:
      moveWestSouthWest();
      break;
    case 0341:
      moveSouthWest();
      break;
    case 0342:
      moveSouth();
      break;
    case 0343:
      moveSouthEast();
      break;
    case 0344:
      moveEastSouthEast();
      break;
    case 0345:
      pointNorthEquilateralTriangle();
      break;
    case 0346:
      twoXZoomIn();
      break;
    case 0347:
      fourXZoomIn();
      break;
    case 0350:
      break;
    case 0351:
      moveSouthSouthWest();
      break;
    case 0352:
      break;
    case 0353:
      moveSouthSouthEast();
      break;
    case 0354:
      break;
    case 0355:
      pointSouthEquilateralTriangle();
      break;
    case 0356:
      twoXZoomOut();
      break;
    case 0357:
      fourXZoomOut();
      break;
    case 0360:
      fullCircle();
      break;
    case 0361:
      break;
    case 0362:
      break;
    case 0363:
      break;
    case 0364:
      pointWestEquilateralTriangle();
      break;
    case 0365:
      pointEastEquilateralTriangle();
      break;
    case 0366:
      break;
    case 0367:
      break;
    case 0370:
      setBrown();
      break;
    case 0371:
      setRed();
      break;
    case 0372:
      setOrange();
      break;
    case 0373:
      setYellow();
      break;
    case 0374:
      setGreen();
      break;
    case 0375:
      setBlue();
      break;
    case 0376:
      setViolet();
      break;
    case 0377:      
      setGrey();
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

void setBlack(){
  fill(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
}

void setWhite(){
  stroke(1);
  fill(255);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
}

void fillIn(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(0);
   rect(x+0.15*commandGlyphScale*side,y+0.15*commandGlyphScale*side,0.7*commandGlyphScale*side,0.7*commandGlyphScale*side);
}

void outline(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   rect(x+0.15*commandGlyphScale*side,y+0.15*commandGlyphScale*side,0.7*commandGlyphScale*side,0.7*commandGlyphScale*side);
}

void deleteCommand(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
    strokeWeight(3);
    line(x + 0.1*commandGlyphScale*side,y + 0.1*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.9*commandGlyphScale*side); 
    line(x + 0.1*commandGlyphScale*side,y + 0.9*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.1*commandGlyphScale*side); 
    strokeWeight(1);
}

void deleteWholeGlyph(){
   strokeWeight(1);
   fill(color(255,0,0));
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
    strokeWeight(3);
    line(x + 0.1*commandGlyphScale*side,y + 0.1*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.9*commandGlyphScale*side); 
    line(x + 0.1*commandGlyphScale*side,y + 0.9*commandGlyphScale*side,x + 0.9*commandGlyphScale*side,y + 0.1*commandGlyphScale*side); 
    strokeWeight(1);
}


void moveNorthNorthWest(){
  noFill();
  stroke(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.3*side,y + commandGlyphScale*0.1*side);
  
}

void moveNorthNorthEast(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.6*side,y + commandGlyphScale*0.1*side);
}

void northWestHalfSquare(){
   strokeWeight(1);
   fill(color(0,0,255));
   rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(color(255,0,255));
   rect(x+0.5*commandGlyphScale*side,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(255);
   triangle(x + commandGlyphScale*side,y,x,y + commandGlyphScale*side,x + commandGlyphScale*side,y + commandGlyphScale*side);
}

void southernQuarterSquare(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(255,0,255));
   triangle(x,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y+ commandGlyphScale*side);  
   fill(color(0,0,255));
   triangle(x + commandGlyphScale*side,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y+ commandGlyphScale*side);
  
}

void northEastHalfSquare(){
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


void moveWestNorthWest(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.1*side,y + commandGlyphScale*0.4*side);
}

void moveNorthWest(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x,y);  
}

void moveNorth(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + 0.5*commandGlyphScale*side,y);  
}

void moveNorthEast(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*side,y);  
}

void moveEastNorthEast(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.9*side,y + commandGlyphScale*0.4*side);   
}

void easternQuarterSquare(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(255,0,255));
   triangle(x + commandGlyphScale*side,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + commandGlyphScale*side,y+ 0.5*commandGlyphScale*side);  
   fill(color(0,0,255));
   triangle(x + commandGlyphScale*side,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + commandGlyphScale*side,y + 0.5*commandGlyphScale*side);

}

void wholeSquare(){
   strokeWeight(1);
   fill(color(0,0,255));
   rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x+0.5*commandGlyphScale*side,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   fill(color(255,0,255));
   rect(x+0.5*commandGlyphScale*side,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
   rect(x,y+0.5*commandGlyphScale*side,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
}

void westernQuarterSquare(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(0,0,255));
   triangle(x,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x,y+ 0.5*commandGlyphScale*side);  
   fill(color(255,0,255));
   triangle(x,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x,y + 0.5*commandGlyphScale*side);
}

void moveWest(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x,y + 0.5*commandGlyphScale*side);  
}

void restartPosition(){
   noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(0);
  rect(x + 0.4*commandGlyphScale*side,y + 0.4*commandGlyphScale*side,0.1*commandGlyphScale*side,0.1*commandGlyphScale*side);
  
}

void moveEast(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*side,y + 0.5*commandGlyphScale*side);  
}

void southWestHalfSquare(){
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

void northernQuarterSquare(){
   strokeWeight(1);
   noFill();
   rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
   fill(color(0,0,255));
   triangle(x,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y);  
   fill(color(255,0,255));
   triangle(x + commandGlyphScale*side,y,x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y);  
}

void southEastHalfSquare(){
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

void moveWestSouthWest(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.1*side,y + commandGlyphScale*0.6*side);
}

void moveSouthWest(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x,y + commandGlyphScale*side);  
}

void moveSouth(){
 noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + 0.5*commandGlyphScale*side,y + commandGlyphScale*side);  
}

void moveSouthEast(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*side,y + commandGlyphScale*side);  
}

void moveEastSouthEast(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.9*side,y + commandGlyphScale*0.6*side);   
}

void pointNorthEquilateralTriangle(){
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x,y + commandGlyphScale*side,x + 0.5*commandGlyphScale*side,y + commandGlyphScale*side*(1-sin((2*PI)/6)),x + commandGlyphScale*side,y + commandGlyphScale*side);
}

void twoXZoomIn(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(0);
  rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);
}

void fourXZoomIn(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(0);
  rect(x,y,0.25*commandGlyphScale*side,0.25*commandGlyphScale*side);
}

void moveSouthSouthWest(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.4*side,y + commandGlyphScale*0.9*side);  
}

void moveSouthSouthEast(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(3);
  line(x + commandGlyphScale*0.5*side,y + commandGlyphScale*0.5*side,x + commandGlyphScale*0.6*side,y + commandGlyphScale*0.9*side);  
}

void pointSouthEquilateralTriangle(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x,y,x + 0.5*commandGlyphScale*side,y + commandGlyphScale*side*(sin((2*PI)/6)),x + commandGlyphScale*side,y);
}

void twoXZoomOut(){
  fill(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(255);
  rect(x,y,0.5*commandGlyphScale*side,0.5*commandGlyphScale*side);    
}


void fourXZoomOut(){
  fill(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(255);
  rect(x,y,0.25*commandGlyphScale*side,0.25*commandGlyphScale*side);    
}

void fullCircle(){
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  fill(color(255,255,0));
  ellipse(x + 0.5*commandGlyphScale*side,y + 0.5*commandGlyphScale*side,commandGlyphScale*side,commandGlyphScale*side); 
}


void pointWestEquilateralTriangle(){
  noFill();
  strokeWeight(0);
  rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
  strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x+commandGlyphScale*side*(1-sin((2*PI)/6)),y + 0.5*commandGlyphScale*side,x + commandGlyphScale*side,y,x + commandGlyphScale*side,y + commandGlyphScale*side);  
}

void pointEastEquilateralTriangle(){
 noFill();
 strokeWeight(0);
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 triangle(x+commandGlyphScale*side*(sin((2*PI)/6)),y + 0.5*commandGlyphScale*side,x,y,x,y + commandGlyphScale*side);  
}


void setBrown(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(127,0,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setRed(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setOrange(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,127,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setYellow(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,255,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setGreen(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(0,255,0));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setBlue(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(0,0,255));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setViolet(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(color(255,0,255));
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}

void setGrey(){
 noFill();
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);
 strokeWeight(1);
 stroke(0);
 fill(100);
 rect(x,y,commandGlyphScale*side,commandGlyphScale*side);    
}