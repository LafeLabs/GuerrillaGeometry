float unit = 50;
float side= unit;
float buttonSide = 30;
float theta = 0;
float cursorTheta = 0;
float x0= 325;
float y0 = 125;
float x = x0;
float y = y0;
int[] currentGlyph= {};
int roctalOriginX = 0;
int roctalOriginY = 490;
int roctalIndex = 0;
int roctalSide = 1;
PImage img;


void setup(){
  size(500,500);
  ellipseMode(CENTER); 
  img = loadImage("font0.jpg");
}


void draw(){
   background(255);
   img = loadImage("font0.jpg");
   image(img,0,0);
   drawButtons();
   drawGlyph(currentGlyph);
   drawCursor();
}


void doTheThing(int localByte){
   if(localByte == 0300){
      x += side*cos(theta);
      y += side*sin(theta);
   }
   if(localByte == 0301){
      line(x,y,x + side*cos(theta),y + side*sin(theta)); 
      x += side*cos(theta);
      y += side*sin(theta);
   }
   if(localByte == 0302){
      theta += 2*PI/24; 
   }
   if(localByte == 0303){
      theta -= 2*PI/24; 
   }
   if(localByte == 0304){
      side *= 2; 
   }
   if(localByte == 0305){
      side /= 2; 
   }
   if(localByte == 0306){
      x = x0;
      y = y0;
      side = unit;
      theta = 0;
   }
   if(localByte == 0307){
      if(currentGlyph.length != 0){
          currentGlyph = shorten(currentGlyph);
      }
   }
}

void drawButtons(){
  noFill();
  for(int columns = 0;columns < 8;columns++){ 
    rect(columns*buttonSide,0,buttonSide,buttonSide);
  }  
  textSize(10);
  fill(0);
  text("move", 2, 25);   
  text("line", 5 + buttonSide, 25);   
  text("+15", 5 + 2*buttonSide, 25);
  text("-15", 5 + 3*buttonSide, 25);
  text("  +", 5 + 4*buttonSide, 25);
  text("  -", 5 + 5*buttonSide, 25);
  text("home", 1 + 6*buttonSide, 25);
  text("del", 5 + 7*buttonSide, 25);
  noFill();
}

void drawCursor(){
   strokeWeight(2);
   line(x,y,x + side*cos(theta),y + side*sin(theta)); 
   strokeWeight(1);
}

void mouseClicked(){
  
  if((mouseY < buttonSide) && (mouseX < 8*buttonSide)){
    int localByte = 0300;
    localByte += mouseX/buttonSide;
    if(localByte != 0307){
       currentGlyph = append(currentGlyph,localByte);    
    }
    else{}
    if(localByte == 0307){
         if(currentGlyph.length != 0){
            currentGlyph = shorten(currentGlyph);
         }
    }
    else{}
    doTheThing(localByte);
  }

  println(currentGlyph); 
  
}

void drawGlyph(int[] localGlyph){
  doTheThing(0306);
  roctalIndex = 0;
   for(int index = 0;index < localGlyph.length; index++){
      doTheThing(localGlyph[index]);
   } 
}



void printLetter(char localLetter){
  
}

void drawShape(int shapeIndex){
    
}

int[] readRoctalSequence(){
  int[] localGlyph = {};
  
  for(roctalIndex=0;roctalIndex < 100;roctalIndex++){
    localGlyph = append(localGlyph,readRoctal());
    if(localGlyph[roctalIndex] == 0){
      break;
    }
  }
  localGlyph = shorten(localGlyph);
  return localGlyph;  
}

void writeRoctalSequence(int[] localByteArray){
  for(roctalIndex=0;roctalIndex < localByteArray.length;roctalIndex++){
    writeRoctal(localByteArray[roctalIndex]);
  }  
  
}

void writeRoctal(int localByte){
  noStroke();
  fill(0);
  rect(roctalOriginX + 4*roctalIndex*roctalSide,roctalOriginY,roctalSide,roctalSide);
  for(int bitIndex = 8;bitIndex >=0;bitIndex--){
     if(((localByte >> bitIndex)&1) == 1){
        fill(0); 
     }
     else{
        noFill(); 
     }    
     rect(roctalOriginX + roctalSide + roctalSide*((8 - bitIndex)%3)  + 4*roctalIndex*roctalSide,roctalOriginY + roctalSide + roctalSide*int((8 - bitIndex)/3),roctalSide,roctalSide);
  }
  noFill();
  stroke(0);
}

int readRoctal(){
  int localByte = 0;
  for(int bitIndex = 8;bitIndex >= 0; bitIndex--){
            PImage localSquare = get(int(roctalOriginX + 4*roctalIndex*roctalSide + roctalSide + roctalSide*((8 - bitIndex)%3)),int(roctalOriginY + roctalSide + roctalSide*int((8 - bitIndex)/3)),roctalSide,roctalSide);            
            int numPixels = int(roctalSide)*int(roctalSide); 
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

void printOctal(int localByte){
   print((localByte >> 6) & 7);
   print((localByte >> 3) & 7);
   print((localByte) & 7);
   println(); 
}

void keyPressed(){
  if(key >= 0101 && key <= (0101 + 26)){
    roctalIndex = 0;
    background(255);
    img = loadImage("font0.jpg");
    image(img,0,0);
    roctalOriginY = 300 + 4*roctalSide*(key - 0101);
    writeRoctalSequence(currentGlyph); 
    save("font0.jpg");
  }
}