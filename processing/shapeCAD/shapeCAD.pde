
float side = 150;
float scale = 1;
float scaleFactor = 2; //factor by which a scale operation happens

int orientation = 1; //values are 1 and -1
float x,y;
color currentColor = color(255,255,0);

int shape = 1; //0 is triangle, 1 is square

void setup(){//copied directly from triangles
   size(500,500); 
   background(255);
   x = width/2;
   y = height/2;
   orientation = 1;
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
   case 0: 
      triangle(x,y,x +scale*side*cos(radians(60)),y - orientation*scale*side*sin(radians(60)),x+ scale*side,y+0);   
      break;
   case 1:
      rect(x,y,scale*side,scale*side);   
      break;   
  }
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
       currentColor = color(255,127,0);//orange
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
      x += scale*side*cos(radians(localDirection*60));
      y += scale*side*sin(radians(localDirection*60));
      break;
    case 1:
      x += scale*side*cos(radians(localDirection*90));
      y += scale*side*sin(radians(localDirection*90));
      break;
  }
  
}
void zoom(int localZoomFactor){
 scale *= pow(scaleFactor,float(localZoomFactor));
}

void keyPressed(){
  if(key == '+'){
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
  
}