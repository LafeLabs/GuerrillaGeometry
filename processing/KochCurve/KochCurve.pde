float side  = 350;
float h = sqrt(3)*side/2;
float r_innner = h/3;
float r_outer = 2*h/3;  
int orientation = 0; //0 or 1, indicates adding orientation*PI to all angles in shape
float scale = 1;
float scaleFactor = 3;
float x,y,x0,y0;

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

int[] shapeCodeArray = {};  // initialize  shape array
int currentShapeCode = 0;

int shrinkDirection = 1;//1 or -1
int shrinkIndex = 0;

int[] shrinkDirectionArray = {-1,-1,-1,-1,-1,-1};
int shrinkDirectionByte = 0;

void setup(){
  size(500,500);
  x = width/2;
  y = height/2;
  x0 = x;
  y0 = y;
  background(255);
  noFill();
  
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
}

void draw(){

  
  noStroke();
  setColor(0);
  writeTriangle();
 
   for(shrinkDirectionByte = 0;shrinkDirectionByte < 32;shrinkDirectionByte++){   
     for(int bitIndex = 0;bitIndex < 6;bitIndex++){
         shrinkDirectionArray[bitIndex] = 2*(1&(shrinkDirectionByte>>bitIndex)) - 1;
         println(shrinkDirectionArray[bitIndex]);
      }
      
  
     for(int countZooms = 0;countZooms < 6;countZooms++){
        move((1 + shrinkIndex)%3);
        zoomIn((0 + shrinkIndex)%3);
        move((2 + shrinkIndex)%3);
        writeTriangle();
        shrinkIndex += shrinkDirectionArray[countZooms];
        print(shrinkIndex);
     }
     resetButton();
     writeTriangle();
  
     
     
   }
  noLoop();
}

void resetButton(){
   x = x0;
   y = y0;
   scale = 1;
   orientation = 0;
   setColor(0);
  // background(255);
}
void drawTriangle(){
  triangle(x + scale*r_outer*cos(orientation*PI + PI/2),y + scale*r_outer*sin(orientation*PI + PI/2),x + scale*r_outer*cos(orientation*PI + PI/2 + 2*PI/3),y + scale*r_outer*sin(orientation*PI + PI/2 + 2*PI/3),x + scale*r_outer*cos(orientation*PI + PI/2 + 4*PI/3),y + scale*r_outer*sin(orientation*PI + PI/2 + 4*PI/3));
}

void writeTriangle(){
  fill(color(colorArray[3*colorIndex],colorArray[3*colorIndex+1],colorArray[3*colorIndex+2]));
  drawTriangle();
  noFill();
}

void setColor(int localColorIndex){
  colorIndex = localColorIndex;
}

void flipOrientation(){
     if(orientation == 0){ 
       orientation = 1;
     }
     else if(orientation == 1){ 
       orientation = 0;
     }
  
}

void move(int moveIndexLocal){
  x += scale*r_outer*cos(orientation*PI + PI/2 + 2*PI/6 + moveIndexLocal*2*PI/3);
  y += scale*r_outer*sin(orientation*PI + PI/2 + 2*PI/6 + moveIndexLocal*2*PI/3);
  flipOrientation();
}

void zoomIn(int localZoomIndex){
  scale /= scaleFactor;
  flipOrientation();
  move(localZoomIndex);
  if(scaleFactor == 3){
    flipOrientation(); 
  }
  else{
    
  }
}



void zoomOut(int localZoomIndex){
  move(localZoomIndex);
  flipOrientation();
  scale *= scaleFactor;
}

void keyPressed(){
  if(key == 'o'){
    flipOrientation();
  }
  if(key == 'd' || key == 'f'){
    move(0);
  }
  if(key == 't' || key == 'x'){
    move(1);
  }
  if(key == 'g' || key == 's'){
    move(2);
  }
  if(key == 'c' || key == 'r'){
    zoomIn(2);
  }
  if(key == 'e' || key == 'v'){
    zoomIn(1);
  }
  if(key == 'z' || key == 'y'){
    zoomIn(0);
  }
  if(key == 'C' || key == 'R'){
    zoomOut(2);
  }
  if(key == 'E' || key == 'V'){
    zoomOut(1);
  }
  if(key == 'Z' || key == 'Y'){
    zoomOut(0);
  }
  if(key == ' '){
     writeTriangle();
  }
  if(key <= '9' && key >= '0'){
     setColor(int(key) - 48);
  }
  if(key == '.'){
     resetButton(); 
  }

  currentShapeCode = int(key) + 128;

  shapeCodeArray = append(shapeCodeArray,currentShapeCode); 
  for(int printIndex = 0;printIndex < shapeCodeArray.length;printIndex++){
     print(char(shapeCodeArray[printIndex] - 128));
  }
  println();
   
}