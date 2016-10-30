float x,y,x0,y0;
float side,scale,scaleFactor;


int[] mainGlyphArray = {0314};

void setup(){
  rectMode(CENTER);
  scale =1;
  scaleFactor = 2;
  side = 30;
  size(600,600);
  x0 = 200;
  y0 = 400;
  x = x0;
  y = y0;
  background(255); 
}


void draw(){
  background(255);
  drawControlPanel();
  drawMainGlyph();
  drawCursor();
  drawGlyphChain();
}

void drawGlyphChain(){
  x = 550;
  y = side;
  for(int glyphIndex = 0;glyphIndex < mainGlyphArray.length;glyphIndex++){
    drawCommandGlyph(mainGlyphArray[glyphIndex]);
    y+=side;
  }
  
}

void drawCursor(){
  stroke(1);
  noFill();
  rect(x,y,scale*side,scale*side);
  
}

void drawControlPanel(){
  for(int row = 0;row < 8;row++){
   for(int column = 0;column < 8; column++){
     x = 0.5*side + side*column;
     y = 0.5*side + side*row;
     drawCommandGlyph(0300 + 0010*row + column);

   }
  } 
}

void drawMainGlyph(){
  for(int glyphIndex = 0;glyphIndex < mainGlyphArray.length;glyphIndex++){
    doTheThing(mainGlyphArray[glyphIndex]);
  }
}

void doTheThing(int localCommandOctal){
    switch(localCommandOctal){
      case 0300:  //fill in black
        noStroke();
        fill(0);
        rect(x,y,scale*side,scale*side);
        break;
      case 0301:  //fill in white
        noStroke();
        fill(255);
        rect(x,y,scale*side,scale*side);
        break;
      case 0302://shrink
        scale /= scaleFactor;
        break;
      case 0303: //grow
        scale *= scaleFactor;
        break;
      case 0304: //move 1 right
        x += scale*side;
        break;
      case 0305: //move 1 down
        y += scale*side;
        break;
      case 0306: //move 1 left
        x -= scale*side;
        break;
      case 0307: // move 1 up
        y -= scale*side;
        break;
      case 0310: //move 1/2 right
        x += 0.5*scale*side;
        break;
      case 0311: //move 1/2 down
        y += 0.5*scale*side;
        break;
      case 0312: //move 1/2 left
        x -= 0.5*scale*side;
        break;
      case 0313: // move 1/2 up
        y -= 0.5*scale*side;
        break;
      case 0314: //reset
        x = x0;
        y = y0;
        scale  =1;
        break;
    }
 
}



void drawCommandGlyph(int localCommandOctal){
    switch(localCommandOctal){
      case 0300:  //fill in black
        noStroke();
        fill(0);
        rect(x,y,side,side);
        break;
      case 0301:  //fill in white
        stroke(1);
        fill(255);
        rect(x,y,side,side);
        break;
      case 0302://shrink
        stroke(1);
        noFill();
        rect(x,y,side,side);
        fill(0);
        rect(x,y,0.75*side,0.2*side);
        break;
      case 0303: //grow
        stroke(1);
        noFill();
        rect(x,y,side,side);

        fill(0);
        rect(x,y,0.75*side,0.2*side);
        rect(x,y,0.2*side,0.75*side);        
        break;
      case 0304: //move 1 right
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        rect(x,y,0.2*side,0.1*side);
        triangle(x + 0.1*side,y + 0.2*side,x + 0.1*side,y - 0.2*side,x + 0.3*side,y);
        break;
      case 0305: //move 1 down
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        rect(x,y,0.1*side,0.2*side);
        triangle(x + 0.2*side,y + 0.1*side,x - 0.2*side,y + 0.1*side,x,y+ 0.3*side);
        break;
      case 0306: //move 1 left
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        rect(x,y,0.2*side,0.1*side);
        triangle(x - 0.1*side,y + 0.2*side,x - 0.1*side,y - 0.2*side,x - 0.3*side,y);
        break;
      case 0307: // move 1 up
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        rect(x,y,0.1*side,0.2*side);
        triangle(x + 0.2*side,y - 0.1*side,x - 0.2*side,y - 0.1*side,x,y- 0.3*side);
        break;
      case 0310: //move 1/2 right
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        triangle(x + 0.1*side,y + 0.2*side,x + 0.1*side,y - 0.2*side,x + 0.3*side,y);
        break;
      case 0311: //move 1/2 down
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        triangle(x + 0.2*side,y + 0.1*side,x - 0.2*side,y + 0.1*side,x,y+ 0.3*side);
        break;
      case 0312: //move 1/2 left
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        triangle(x - 0.1*side,y + 0.2*side,x - 0.1*side,y - 0.2*side,x - 0.3*side,y);
        break;
      case 0313: // move 1/2 up
        noFill();
        stroke(1);
        rect(x,y,side,side);
        fill(0);
        triangle(x + 0.2*side,y - 0.1*side,x - 0.2*side,y - 0.1*side,x,y- 0.3*side);
        break;
      case 0314: //reset
        stroke(0);
        noFill();
        rect(x,y,side,side);
        fill(0);
        rect(x,y,0.7*side,0.7*side);
        fill(255);
        rect(x,y,0.5*side,0.5*side);
        fill(0);
        rect(x,y,0.2*side,0.2*side);
        break;
    } 
}

void mouseClicked(){
   if(mouseX < 8*side && mouseY < 8*side){
     int ones = int(mouseX/side);
     int eights = int(mouseY/side);
     int sixtyfours = 3;
     int buttonByte = ones + 8*eights + 64*sixtyfours;
     printOctal(buttonByte);
     mainGlyphArray = append(mainGlyphArray,buttonByte);
  }
  else{
  }
}

void printOctal(int localByte){
   print((localByte >> 6)&7); //sixtyfours
   print((localByte >> 3)&7);//eights
   println(localByte &7);//ones
}


