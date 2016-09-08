
float side = 10;
float x0 = 0;
float y0 = 0;
float x1 = 0.5*side;
float y1 = 0.5*sqrt(3)*side;
float x2 = side;
float y2 = 0;
float verticalPosition = 0;

int red = 0;
int green = 0;
int blue = 0;

void setup(){
  size(400,400);
  background(255);
}

void draw(){
   frameRate(20);
   red = int(random(3))*127;
   blue = int(random(3))*127;
   green = int(random(3))*127;
   fill(red,green,blue);
   triangle(x0, y0, x1, y1, x2, y2); 
   x0 = x1;
   y0 = y1;
   x1 = x2;
   y1 = y2;
   x2 += 0.5*side;
   if(y2 == verticalPosition){
     y2 = verticalPosition + 0.5*sqrt(3)*side;
   }
   else{
     y2 = verticalPosition;
   }
   if(x2 > width){
     x2 = side;
     x0 = 0;
     x1 = 0.5*side;
     verticalPosition += side;
     y0 = verticalPosition;
     y1 = verticalPosition + 0.5*sqrt(3)*side;
     y2 = verticalPosition;
   }
}