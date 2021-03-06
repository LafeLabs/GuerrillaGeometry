float side = 150;
float scale = 1;
float scaleFactor = 2; //factor by which a scale operation happens

int orientation = 1; //values are 1 and -1
float x,y;
color currentColor = color(255,255,0);



void setup(){
   size(500,500); 
   background(255);
   x = width/2;
   y = height/2;
   orientation = 1;
}

void draw(){
  move(0);
  move(4);
 for(int localIndex = 0;localIndex < 8;localIndex++){
      setColor(localIndex);
      drawTriangle();
      zoom(-1);
      move(2);
  }

  

  noLoop();
}

void drawTriangle(){
  triangle(x,y,x +scale*side*cos(radians(60)),y - orientation*scale*side*sin(radians(60)),x+ scale*side,y+0);   
}

void setColor(int colorNumber){
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

      x += scale*side*cos(radians(localDirection*60));
      y += scale*side*sin(radians(localDirection*60));

}

void zoom(int localZoomFactor){
 scale *= pow(scaleFactor,float(localZoomFactor));
}