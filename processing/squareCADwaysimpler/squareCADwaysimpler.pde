
//copied directly from triangles:
float side = 150;
float scale = 1;
float scaleFactor = 2; //factor by which a scale operation happens

int orientation = 1; //values are 1 and -1
float x,y;
color currentColor = color(255,255,0);

void setup(){//copied directly from triangles
   size(500,500); 
   background(255);
   x = width/2;
   y = height/2;
   orientation = 1;
}

void draw(){
  setColor(6);
  move(2);
  move(3);
  drawSquare();
  move(0);
  setColor(7);
  drawSquare();
  move(2);
  move(1);
  zoom(-1);
  setColor(6);
  drawSquare();
  move(0);
  setColor(7);
  drawSquare();
  move(2);
  move(1);
  zoom(-1);
  setColor(6);
  drawSquare();
  move(0);
  setColor(7);
  drawSquare();
  move(2);
  move(1);
  zoom(-1);
  setColor(6);
  drawSquare();
  move(0);
  setColor(7);
  drawSquare();
  move(2);
  move(1);
  zoom(-1);
  setColor(6);
  drawSquare();
  move(0);
  setColor(7);
  drawSquare();

  noLoop();
}

void drawSquare(){
  rect(x,y,scale*side,scale*side);   
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

      x += scale*side*cos(radians(localDirection*90));
      y += scale*side*sin(radians(localDirection*90));

}
void zoom(int localZoomFactor){
 scale *= pow(scaleFactor,float(localZoomFactor));
}