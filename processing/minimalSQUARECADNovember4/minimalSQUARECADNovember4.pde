float x,y,x0,y0;

float unit=50;
float side = unit;

int[] currentGlyph = {};

void setup(){
  size(500,500);
  x0 = 250;
  y0= 250;
  x = x0;
  y = y0;
}

void draw(){
  background(255);
  drawControlPanel();
  drawCurrentGlyph();
  drawCursor();
  println(x);
}

void drawControlPanel(){
  side = unit;
  for(int rows = 0;rows < 8;rows++){
  for(int columns = 0;columns < 8;columns++){
    x = columns*side;
    y = rows*side;
    drawCommandGlyph(0300 + 010*rows + columns); 
  }   
 }
  x=x0;
  y=y0;

}

void drawCursor(){
   noFill();
   rect(x,y,side,side);
  
}

void drawCurrentGlyph(){
  x = x0;
  y = y0;
  side = unit;
  for(int index = 0;index < currentGlyph.length;index++){
     doTheThing(currentGlyph[index]);   
  }
}

void doTheThing(int localByte){
   switch(localByte){
    case 0301: //up
      y -= side;
      break; 
    case 0310: //left
      x -= side;
      break;
    case 0326:  // delete
      if(currentGlyph.length != 0){
          shorten(currentGlyph);
      }
      else{}
      break;
    case 0312:  //right
      x += side;
      break;
    case 0320:  //double
      side *= 2;
      break;
    case 0321:  //down
      y += side;
      break;
    case 0322:  //halve
      side /= 2;
      break;
    case 0324:  //fillsquare
      fill(0);
      rect(x,y,side,side);
      break;
    case 0304:   //fill lower left corner
      fill(0);
      triangle(x,y,x+side,y+side,x,y+side);
      break;
    case 0305:  //fill upper left corner
      fill(0);
      triangle(x,y,x+side,y,x,y+side);
      break;
    case 0306:  //fill upper right corner
      fill(0);
      triangle(x,y,x+side,y,x+side,y+side);
      break;
    case 0307:  //fill lower right corner
      fill(0);
      triangle(x+side,y,x+side,y+side,x,y+side);
      break;
   }
}

void drawCommandGlyph(int localByte){
   switch(localByte){
    case 0301: //up
      noFill();
      rect(x,y,side,side);
      fill(0);
      rect(x+0.25*side,y+0.25*side,0.5*side,0.5*side);
      triangle(x,y+0.25*side,x+0.5*side,y,x+side,y+0.25*side);
      break; 
    case 0310: //left
      noFill();
      rect(x,y,side,side);
      fill(0);
      rect(x+0.25*side,y+0.25*side,0.5*side,0.5*side);
      triangle(x + 0.25*side,y,x,y+0.5*side,x+0.25*side,y+side);
      break;
    case 0326:  // delete
      noFill();
      rect(x,y,side,side);
      line(x,y,x+side,y+side);
      line(x,y+side,x+side,y);
      break;
    case 0312:  //right
      noFill();
      rect(x,y,side,side);
      fill(0);
      rect(x+0.25*side,y+0.25*side,0.5*side,0.5*side);
      triangle(x + 0.75*side,y,x + side,y+0.5*side,x+0.75*side,y+side);
      break;
    case 0320:  //double
      noFill();
      rect(x,y,side,side);
      fill(0);
      rect(x + 0.4*side,y + 0.2*side,0.2*side,0.6*side);
      rect(x + 0.2*side,y + 0.4*side,0.6*side,0.2*side);
      break;
    case 0321:  //down
      noFill();
      rect(x,y,side,side);
      fill(0);
      rect(x+0.25*side,y+0.25*side,0.5*side,0.5*side);
      triangle(x,y+0.75*side,x+side,y+0.75*side,x+0.5*side,y+side);
      break;
    case 0322:  //halve
      noFill();
      rect(x,y,side,side);
      fill(0);
      rect(x + 0.2*side,y + 0.4*side,0.6*side,0.2*side);
      break;
    case 0324:  //fillsquare
      fill(0);
      rect(x,y,side,side);
      break;
    case 0304:   //fill lower left corner
      noFill();
      rect(x,y,side,side);
      fill(0);
      triangle(x,y,x+side,y+side,x,y+side);
      break;
    case 0305:  //fill upper left corner
      noFill();
      rect(x,y,side,side);
      fill(0);
      triangle(x,y,x+side,y,x,y+side);
      break;
    case 0306:  //fill upper right corner
      noFill();
      rect(x,y,side,side);      
      fill(0);
      triangle(x,y,x+side,y,x+side,y+side);
      break;
    case 0307:  //fill lower right corner
      noFill();
      rect(x,y,side,side);
      fill(0);
      triangle(x+side,y,x+side,y+side,x,y+side);
      break;
   }
}

void mouseClicked(){
    int ones,eights,sixtyfours,localByte;
    ones = int(mouseX/unit);
    eights = int(mouseY/unit);
    sixtyfours = 3;
    localByte = ones + 8*eights + 64*sixtyfours;
    if(localByte != 0326){
      currentGlyph = append(currentGlyph,localByte);
    }
    else{
      currentGlyph = shorten(currentGlyph);
    }
    println(currentGlyph);
}