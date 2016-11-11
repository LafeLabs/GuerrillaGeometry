float unit = 50;
float side= unit;
float buttonSide = 50;
float roctalSide = 2;
float theta = 0;
float cursorTheta = 0;
float x0= 250;
float y0 = 250;
float x = x0;
float y = y0;
int[] currentGlyph= {};

void setup(){
  size(500,500);
  ellipseMode(CENTER);
    
}


void draw(){
   background(255);
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
  textSize(18);
  fill(0);
  text("move", 5, 25);   
  text("line", 5 + buttonSide, 25);   
  text("+15", 5 + 2*buttonSide, 25);
  text("-15", 5 + 3*buttonSide, 25);
  text("  +", 5 + 4*buttonSide, 25);
  text("  -", 5 + 5*buttonSide, 25);
  text("HOME", 5 + 6*buttonSide, 25);
  text("DEL", 5 + 7*buttonSide, 25);
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
    else{
         if(currentGlyph.length != 0){
            currentGlyph = shorten(currentGlyph);
         }
    }
    doTheThing(localByte);
  }
  if((mouseY < 2*buttonSide) && (mouseY > buttonSide) && (mouseX < 8*buttonSide)){
    int localByte = 0310;
    localByte += mouseX/buttonSide;
    currentGlyph = append(currentGlyph,localByte);    
    doTheThing(localByte);

  }
  
  println(currentGlyph); 
  
}

void drawGlyph(int[] localGlyph){
  doTheThing(0306);
   for(int index = 0;index < localGlyph.length; index++){
      doTheThing(localGlyph[index]);
   } 
}

void printLetter(char localLetter){
  
}

void drawShape(int shapeIndex){
  
  
}