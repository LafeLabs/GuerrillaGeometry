
float side = 20;
float x = 20;
float y = 20;
float commandGlyphScale = 1;


void setup(){
size(200,200);
background(255);
}
void draw(){
  drawControlPanel();
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