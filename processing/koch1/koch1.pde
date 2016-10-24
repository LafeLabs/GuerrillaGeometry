
float side = 350;
float side0 = side;
float minSide = 1;
float maxSide = 500;
float scale = 1;
float minScale = 0.001;
float maxScale = 10;
float scaleFactor = 3; //factor by which a scale operation happens
int angleIndex;
int orientation = 1; //values are 1 and -1
float x,y,x0,y0;
color currentColor = color(255,255,0);
float phi = (sqrt(5) + 1)/2;

int[] shapeCodeArray = {};  // initialize  shape array
int currentShapeCode = 1;

int shape = 0; //0 is triangle, 1 is square,2 is golden section

void setup(){//copied directly from triangles
   size(600,600); 
   background(255);
   x = width/2 - side/2;
   y = height/2 + side/3;
   orientation = 1;
   angleIndex = 0;
   setColor(0);
  drawShape();
  orientation *= -1;
  zoom(-1);
  move(0);
  drawShape();
  move(5);
  move(5);
  drawShape();
  move(3);
  move(3);
  drawShape();
  orientation *= -1;
  zoom(-1);
  move(0);
  drawShape();
  move(5); 
  move(5);
  move(0);
  orientation *= -1;
  drawShape();
  move(0);
  move(0);
  drawShape();

}

void draw(){


  drawShape();

}

void drawSquare(){
  rect(x,y,scale*side,scale*side);   
}
void drawTriangle(){
  triangle(x,y,x +scale*side*cos(radians(60)),y - orientation*scale*side*sin(radians(60)),x+ scale*side,y+0);   
}

void drawShape(){
  switch(shape){
   case 0: //equilateral triangle
      triangle(x,y,x +scale*side*cos(radians(60)),y - orientation*scale*side*sin(radians(60)),x+ scale*side,y+0);   
      break;
   case 1:  //square
      rect(x,y,scale*side,scale*side);   
      break;   
   case 2: //Golden Section, but not really, i have the value of phi wrong randomly
      triangle(x,y,x + scale*side,y,x + 0.5*scale*side,y + scale*side*1.5);
      triangle(x,y,x+scale*side*cos(0 + angleIndex*2*PI/5),y+scale*side*sin(0 + angleIndex*(2*PI/5)),x +scale*side*phi*cos((angleIndex+1)*2*PI/5),y + scale*side*phi*sin((angleIndex+1)*2*PI/5));
      break;
  }
}

void resetButton(){
  side = side0;
  scale = 1;
  orientation  = 1;
  x = x0;
  y = y0;
}

void rotateShape(int localAngleIndex){
    angleIndex += localAngleIndex;
}

void setColor(int colorNumber){//copied directly from triangles
   switch(colorNumber){
     case 0:               
       currentColor = color(0,0,0);//black
       break;
     case 1:               
       currentColor = color(127,0,0);//brown
       break;
     case 2:
       currentColor = color(255,0,0);//red
       break;
     case 3:
       currentColor = color(255,125,0);//red
       break;
     case 4:
       currentColor = color(255,255,0); //yellow
       break;
     case 5:
       currentColor = color(0,255,0); //green
       break;
     case 6:
       currentColor = color(0,0,255);  //blue
       break;
     case 7:
       currentColor = color(127,0,127); //violet
       break;
     case 8:
       currentColor = color(127,127,127); //grey
       break;
     case 9:
       currentColor = color(255,255,255); //white
       break;
   }
  fill(currentColor);
}

void move(int localDirection){

  switch(shape){
    case 0:
      x += (scale*side*cos(radians(localDirection*60)));
      y += scale*side*sin(radians(localDirection*60));
      break;
    case 1:
      x += scale*side*cos(radians(localDirection*90));
      y += scale*side*sin(radians(localDirection*90));
      break;
    case 2:
      x += scale*side*cos(radians(localDirection*72));
      y += scale*side*sin(radians(localDirection*72));
      break;
  }
  if(x > width){
    x -= width;
  }
  if(x < 0){
    x += width; 
  }
  if(y > height){
     y -= height; 
  }
  if(y < 0){
    y += height;
  }
  
}
void zoom(int localZoomFactor){
   scale *= pow(scaleFactor,float(localZoomFactor));
   if(scale > maxScale || side > maxSide){
     scale  *= pow(scaleFactor,-float(localZoomFactor));
   }
   if(scale < minScale || side < minSide){
     scale  *= pow(scaleFactor,-float(localZoomFactor));
   }
   
   
}

void keyPressed(){
  if(key == '=' || key == '+'){
     zoom(1); 
  }
  if(key == '-'){
     zoom(-1); 
  }
  if(key == 'o'){
    orientation *= -1;
  }
  if(key == 'd'){
     move(0);
  }
  if(key == 'x'){
     move(1);
  }
  if(key == 'z'){
     move(2);
  }
  if(key == 'a'){
     move(3);
  }
  if(key == 'w'){
     move(4);
  }
  if(key == 'e'){
     move(5);
  }
  if(key == 'h'){
    move(0);    
  }
  if(key == 'b'){
    move(1);    
  }
  if(key == 'g'){
    move(2);    
  }
  if(key == 'y'){
    move(3);    
  }
  
  if(key == 't'){
     shape = 0; 
  }
  if(key == 's'){
     shape = 1; 
  }
  if(key == '/'){
     shape = 2; 
     scaleFactor = phi;
  }
  
  if(key == '0'){
     setColor(0);
  }
  if(key == '1'){
     setColor(1);
  }
  if(key == '2'){
     setColor(2);
  }
  if(key == '3'){
     setColor(3);
  }
  if(key == '4'){
     setColor(4);
  }
  if(key == '5'){
     setColor(5);
  }
  if(key == '6'){
     setColor(6);
  }
  if(key == '7'){
     setColor(7);
  }

  if(key == '8'){
     setColor(8);
  }
  if(key == '9'){
     setColor(9);
  }
  if(key == '.'){
     resetButton(); 
  }
  if(key == 'c'){//clear
    background(255);
  }
  if(key == 'r'){
     rotateShape(1); 
  }
  if(key == 'l'){
     rotateShape(-1); 
  }
  if(key != 'q' && key != char(64+8+1)){
    int ones,eights,sixtyfours,keyInt;
    keyInt = int(key);
    keyInt +=128;
    ones = keyInt&7;
    eights = (keyInt>>3)&7;
    sixtyfours = (keyInt>>6)&7;

    currentShapeCode = ones + 8*eights + 64*sixtyfours;
    print(sixtyfours);
    print(eights);
    println(ones);
  }
  if(key == 'q'){
     shapeCodeArray = append(shapeCodeArray,currentShapeCode);
     for(int localIndex= 0;localIndex < shapeCodeArray.length;localIndex++){
       print((shapeCodeArray[localIndex]>>6)&7);
       print((shapeCodeArray[localIndex]>>3)&7);
       print((shapeCodeArray[localIndex]>>0)&7);
       print("   ");
     }
     println();
  }
}