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
int[] currentLetter = new int[64];
int roctalOriginX = 0;
int roctalOriginY = 490;
int roctalIndex = 0;
int roctalSide = 1;

int roctalGlyphSide = 8; //number of roctals per char on a side

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
   if(localByte == 0310){
    doTheThing(0302);
    doTheThing(0302);
   }
   if(localByte == 0311){
    doTheThing(0303);
    doTheThing(0303);
   }
   if(localByte == 0312){
    doTheThing(0302);
    doTheThing(0302);
    doTheThing(0302);
   }
   if(localByte == 0313){
    doTheThing(0303);
    doTheThing(0303);
    doTheThing(0303);
   }
   if(localByte == 0314){
    doTheThing(0310);
    doTheThing(0310);
   }
   if(localByte == 0315){
    doTheThing(0311);
    doTheThing(0311);
   }
   if(localByte == 0316){
    doTheThing(0312);
    doTheThing(0312);
   }
   if(localByte == 0317){
    doTheThing(0313);
    doTheThing(0313);
   }

   if(localByte == 0320){
    doTheThing(0314);
    doTheThing(0314);
   }
   if(localByte == 0321){
    doTheThing(0315);
    doTheThing(0315);
   }
   if(localByte == 0322){
    theta += radians(18);
   }
   if(localByte == 0323){
    theta -= radians(18);
   }
   if(localByte == 0324){
    doTheThing(0322);
    doTheThing(0322);
   }
   if(localByte == 0325){
    doTheThing(0323);
    doTheThing(0323);
   }
   if(localByte == 0326){
    doTheThing(0322);
    doTheThing(0322);
    doTheThing(0322);
    doTheThing(0322);

   }
   if(localByte == 0327){
    doTheThing(0323);
    doTheThing(0323);
    doTheThing(0323);
    doTheThing(0323);
   }
   
   if(localByte == 0330){
     for(int bullshitIndex =0;bullshitIndex < 100;bullshitIndex++){ 
       if(currentGlyph.length != 0){
           currentGlyph = shorten(currentGlyph); 
        }
     }
   }
   if(localByte == 0331){
      background(255);
      save("font0.jpg");
   }

   if(localByte == 0200){ //triangleC1
       doTheThing(0301);
       doTheThing(0321);
       doTheThing(0301);
       doTheThing(0321);
       doTheThing(0301);
       doTheThing(0321);     
   }
   if(localByte == 0201){//square
       doTheThing(0301);
       doTheThing(0317);
       doTheThing(0301);
       doTheThing(0317);
       doTheThing(0301);
       doTheThing(0317);     
       doTheThing(0301);
       doTheThing(0317);     
   }
   if(localByte == 0202){//circle of radius side
       ellipseMode(CENTER);
       ellipse(x,y,2*side,2*side);
   }

}

void drawButtons(){
  noFill();
  for(int columns = 0;columns < 8;columns++){ 
    rect(columns*buttonSide,0,buttonSide,buttonSide);
  }  
  for(int columns = 0;columns < 8;columns++){ 
    rect(columns*buttonSide,buttonSide,buttonSide,buttonSide);
  }  
  for(int columns = 0;columns < 8;columns++){ 
    rect(columns*buttonSide,2*buttonSide,buttonSide,buttonSide);
  }  
  for(int columns = 0;columns < 8;columns++){ 
    rect(columns*buttonSide,3*buttonSide,buttonSide,buttonSide);
  }  
  for(int columns = 0;columns < 8;columns++){ 
    rect(columns*buttonSide,4*buttonSide,buttonSide,buttonSide);
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

  text("+30", 5 + 0*buttonSide, 25 + buttonSide);
  text("-30", 5 + 1*buttonSide, 25 + buttonSide);
  text("+45", 5 + 2*buttonSide, 25 + buttonSide);
  text("-45", 5 + 3*buttonSide, 25 + buttonSide);
  text("+60", 5 + 4*buttonSide, 25 + buttonSide);
  text("-60", 5 + 5*buttonSide, 25 + buttonSide);
  text("+90", 5 + 6*buttonSide, 25 + buttonSide);
  text("-90", 5 + 7*buttonSide, 25 + buttonSide);

  text("+120", 5 + 0*buttonSide, 25 + 2*buttonSide);
  text("-120", 5 + 1*buttonSide, 25 + 2*buttonSide);
  text("+18", 5 + 2*buttonSide, 25 + 2*buttonSide);
  text("-18", 5 + 3*buttonSide, 25 + 2*buttonSide);
  text("+36", 5 + 4*buttonSide, 25 + 2*buttonSide);
  text("-36", 5 + 5*buttonSide, 25 + 2*buttonSide);
  text("+72", 5 + 6*buttonSide, 25 + 2*buttonSide);
  text("-72", 5 + 7*buttonSide, 25 + 2*buttonSide);

  text("kill", 5 + 0*buttonSide, 25 + 3*buttonSide);
  text("wipe", 5 + 1*buttonSide, 25 + 3*buttonSide);
  //text("+18", 5 + 2*buttonSide, 25 + 3*buttonSide);
  //text("-18", 5 + 3*buttonSide, 25 + 3*buttonSide);
  //text("+36", 5 + 4*buttonSide, 25 + 3*buttonSide);
 // text("-36", 5 + 5*buttonSide, 25 + 3*buttonSide);
 // text("+72", 5 + 6*buttonSide, 25 + 3*buttonSide);
 // text("-72", 5 + 7*buttonSide, 25 + 3*buttonSide);

   text("tri", 5 + 0*buttonSide, 25 + 4*buttonSide);
   text("sqr", 5 + 1*buttonSide, 25 + 4*buttonSide);
   text("crcl", 5 + 2*buttonSide, 25 + 4*buttonSide);
//  text("-18", 5 + 3*buttonSide, 25 + 4*buttonSide);
//  text("+36", 5 + 4*buttonSide, 25 + 4*buttonSide);
//  text("-36", 5 + 5*buttonSide, 25 + 4*buttonSide);
//  text("+72", 5 + 6*buttonSide, 25 + 4*buttonSide);
//  text("-72", 5 + 7*buttonSide, 25 + 4*buttonSide);



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

  if((mouseY < 2*buttonSide) && (mouseY > buttonSide) && (mouseX < 8*buttonSide)){
    int localByte = 0310;
    localByte += mouseX/buttonSide;
    currentGlyph = append(currentGlyph,localByte);    
    doTheThing(localByte);
  }

  if((mouseY < 3*buttonSide) && (mouseY > 2*buttonSide) && (mouseX < 8*buttonSide)){
    int localByte = 0320;
    localByte += mouseX/buttonSide;
    currentGlyph = append(currentGlyph,localByte);    
    doTheThing(localByte);
  }
  if((mouseY < 4*buttonSide) && (mouseY > 3*buttonSide) && (mouseX < 8*buttonSide)){
    int localByte = 0330;
    localByte += mouseX/buttonSide;
    doTheThing(localByte);
  }
  if((mouseY < 5*buttonSide) && (mouseY > 4*buttonSide) && (mouseX < 8*buttonSide)){
    int localByte = 0200;
    localByte += mouseX/buttonSide;
    currentGlyph = append(currentGlyph,localByte);    
    doTheThing(localByte);
  }




//  println(currentGlyph); 
 // printOctal(currentGlyph[currentGlyph.length - 1]);
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

void readRoctalSequence(){
  for(roctalIndex=0;roctalIndex < 64;roctalIndex++){
    currentLetter[roctalIndex] = readRoctal();
  }
}

void writeRoctalSequence(int[] localByteArray){
  for(roctalIndex=0;roctalIndex < 64;roctalIndex++){
    if(roctalIndex < localByteArray.length){
      writeRoctal(localByteArray[roctalIndex]);
    }
    else{
      writeRoctal(0);
    }
  }
  save("font0.jpg");
}


void writeRoctal(int localByte){
  noStroke();
  fill(0);
  rect(roctalOriginX + 4*roctalSide*(roctalIndex%8),roctalOriginY + 4*roctalSide*(roctalIndex/8),roctalSide,roctalSide);
  for(int bitIndex = 8;bitIndex >=0;bitIndex--){
     if(((localByte >> bitIndex)&1) == 1){
        fill(0); 
     }
     else{
        fill(255); 
     }    
     rect(roctalOriginX + roctalSide + roctalSide*((8 - bitIndex)%3)  + 4*roctalSide*(roctalIndex%8),+ 4*roctalSide*(roctalIndex/8)+roctalOriginY + roctalSide + roctalSide*int((8 - bitIndex)/3),roctalSide,roctalSide);
  }
  noFill();
  stroke(0);
}

int readRoctal(){
  int localByte = 0;
  for(int bitIndex = 8;bitIndex >= 0; bitIndex--){
            PImage localSquare = get(int(roctalOriginX + 4*(roctalIndex%8)*roctalSide + roctalSide + roctalSide*((8 - bitIndex)%3)),int(roctalOriginY + roctalSide + roctalSide*int((8 - bitIndex)/3) + 4*(roctalIndex/8)*roctalSide),roctalSide,roctalSide);            
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
    roctalOriginX = 8*4*roctalSide*((key - 0101)%8);
    roctalOriginY = 300 + 8*4*roctalSide*((key - 0101)/8);
    writeRoctalSequence(currentGlyph); 
    save("font0.jpg");
  }
  if(key >= 0141 && key <= (0141 + 26)){
    roctalIndex = 0;
    roctalOriginX = 8*4*roctalSide*((key - 0141)%8);
    roctalOriginY = 300 + 8*4*roctalSide*((key - 0141)/8);
    doTheThing(0330);
    readRoctalSequence(); 
    
    for(int bullshitIndex = 0;bullshitIndex < 64;bullshitIndex++){
       if(currentLetter[bullshitIndex] != 0){
          currentGlyph = append(currentGlyph,currentLetter[bullshitIndex]); 
       }
    }
    
    println(currentGlyph);
    println("butt");
  }
  
}