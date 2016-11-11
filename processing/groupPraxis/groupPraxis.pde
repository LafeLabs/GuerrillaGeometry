float unit = 32;
float side = unit;
float theta = 0;
float x,y;
float roctalSide = 16;
float roctalOriginX = 0;
float roctalOriginY = 450;
int roctalIndex = 0;

int[] squareGlyph = {0301,0311,0301,0311,0301,0311,0301,0311};
int[] triangleGlyph = {0301,0320,0301,0320,0301,0320};
int[] turnArrow = {0323,0300,0300,0300,0300,0323,0310};
int[] currentGlyph = {};
float buttonSide = 50; 

void setup(){
  ellipseMode(CENTER);
  size(500,500);
  x=250;
  y=250;
  noFill();
  background(255);

}

void draw(){
  background(255);
  drawButtons();
  doTheThing(0305); //reset
  drawGlyph(currentGlyph);
  drawTool();
  drawCursor();
  roctalIndex = 0;
  writeRoctal(0301);
  writeRoctal(0320);
  writeRoctal(0301);
  writeRoctal(0320);
  doTheThing(readRoctal());

}


void drawCursor(){
      
    strokeWeight(3);
    rect(side*int(mouseX/side),side*int(mouseY/side),side,side);
    strokeWeight(1);
}

void drawTool(){
      strokeWeight(3);
      line(x,y,x+ side*cos(theta),y + side*sin(theta));
      strokeWeight(1);

}

void drawButtons(){
  noFill();
  for(int rows = 0;rows < 3;rows++){
      for(int columns = 0;columns < 6; columns++){
          rect(columns*buttonSide,rows*buttonSide,buttonSide,buttonSide);
      }
   }
   
textSize(18);
fill(0);
text("move", 5, 25);   
text("line", 55, 25);   
text("+", 110, 25);
text("-", 165, 25);
text("O", 210, 25);
text(".", 260, 25);

text("180",5,75);
text("90",55,75);
text("45",110,75);
text("-45",165,75);
text("-90",215,75);
text("X",265,75);


text("120",5,125);
text("60",55,125);
text("30",110,125);
text("-30",165,125);
text("-60",215,125);
text("-120",265,125);

noFill();
}


void drawGlyph(int[] localGlyph){
   for(int index = 0;index < localGlyph.length; index++){
      doTheThing(localGlyph[index]);
   } 
}

void doTheThing(int localByte){
  switch(localByte){
   case 0300: //move
     x += side*cos(theta);
     y += side*sin(theta);
     break;
   case 0301://draw line
     line(x,y,x+ side*cos(theta),y + side*sin(theta));    
     break;
   case 0302:
     side *= 2;
     break;
   case 0303:
     side /= 2;
     break;
   case 0304:
     ellipse(x,y,side,side);
     break;
   case 0305: //reset
     x=250;
     y=250;
     side = unit;
     theta = 0;
     break;
   case 0310:
     theta += PI;
     break;
   case 0311:
    theta -= PI/2;
     break;
   case 0312:
     theta -= PI/4;
     break;
   case 0313:
     theta += PI/4;
     break;
   case 0314:
     theta += PI/2;
     break;
   case 0320:
     theta -= 2*PI/3;
     break;
   case 0321:
     theta -= PI/3;
     break;
   case 0322:
     theta -= PI/6;
     break;
   case 0323:
     theta += PI/6;
     break;
   case 0324:
     theta += PI/3;
     break;
   case 0325:
     theta += 2*PI/3;
     break;  
  
}
  
}


int readRoctal(){
  int localByte = 0;
  for(int bitIndex = 8;bitIndex >=0;bitIndex--){
            PImage localSquare = get(int(roctalOriginX + 0.25*roctalSide + 0.25*roctalSide*((8 - bitIndex)%3)),int(roctalOriginY + 0.25*roctalSide + 0.25*roctalSide*int((8 - bitIndex)/3)),int(0.25*roctalSide),int(0.25*roctalSide) );            
            int numPixels = int(0.25*roctalSide)*int(0.25*roctalSide); 
            int pixelSum = 0;
            for(int imageIndex = 0;imageIndex < numPixels;imageIndex++){
              pixelSum += red(localSquare.pixels[imageIndex]);
            }
            pixelSum /= numPixels;
            if(pixelSum < 127){
               localByte += (1 << bitIndex);
           }
            else{
           }
 }
 return localByte;
}

void writeRoctal(int localByte){
  noFill();
  rect(roctalOriginX + roctalIndex*roctalSide,roctalOriginY,roctalSide,roctalSide);
  fill(0);
  rect(roctalOriginX + roctalIndex*roctalSide,roctalOriginY,0.25*roctalSide,0.25*roctalSide);

  for(int bitIndex = 8;bitIndex >=0;bitIndex--){
     if(((localByte >> bitIndex)&1) == 1){
        fill(0); 
     }
     else{
        noFill(); 
     }    
     rect(roctalOriginX + 0.25*roctalSide + 0.25*roctalSide*((8 - bitIndex)%3)  + roctalIndex*roctalSide,roctalOriginY + 0.25*roctalSide + 0.25*roctalSide*int((8 - bitIndex)/3),0.25*roctalSide,0.25*roctalSide);    
  }
  roctalIndex ++;  
}

void mouseClicked(){
    int ones,eights,sixtyfours,localByte;
    ones = int(mouseX/buttonSide);
    eights = int(mouseY/unit);
    sixtyfours = 3;
    localByte = ones + 8*eights + 64*sixtyfours;
    if(localByte != 0315){
      currentGlyph = append(currentGlyph,localByte);
    }
    else{
      currentGlyph = shorten(currentGlyph);
    }
    println(currentGlyph);
  
}