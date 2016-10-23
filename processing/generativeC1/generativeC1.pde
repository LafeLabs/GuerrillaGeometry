float side = 50;
float[] angleArray = {0.5*PI + 0,0.5*PI + 2*PI/3,0.5*PI + 2*2*PI/3};
float h = sqrt(3)*side/2;
float r = 2.0*h/3.0;
float x,y;
float phi = (1+sqrt(5))/2;//1.618

void setup(){
  size(500,500);      
  background(255);
  x = width/2.0;
  y = height/2.0 - 2*side;
}

void draw(){
  fill(255,255,0);
  triangle(x + r*cos(angleArray[0]),y + r*sin(angleArray[0]),x + r*cos(angleArray[1]),y + r*sin(angleArray[1]),x+ r*cos(angleArray[2]),y+r*sin(angleArray[2])); 
  for(int angleIndex = 0; angleIndex < 3;angleIndex++){
     angleArray[angleIndex] += PI/3; 
  }
  fill(255,0,0);
  y -= r;
  triangle(x + r*cos(angleArray[0]),y + r*sin(angleArray[0]),x + r*cos(angleArray[1]),y + r*sin(angleArray[1]),x+ r*cos(angleArray[2]),y+r*sin(angleArray[2])); 
  fill(0,0,255);
  y +=h;
  x += side/2;
  triangle(x + r*cos(angleArray[0]),y + r*sin(angleArray[0]),x + r*cos(angleArray[1]),y + r*sin(angleArray[1]),x+ r*cos(angleArray[2]),y+r*sin(angleArray[2])); 
  x -= side;
  fill(0,127,0);
  triangle(x + r*cos(angleArray[0]),y + r*sin(angleArray[0]),x + r*cos(angleArray[1]),y + r*sin(angleArray[1]),x+ r*cos(angleArray[2]),y+r*sin(angleArray[2])); 
  rectMode(CENTER);
 
  y += h/3;
  y += side/2;
  fill(0,0,255);
  rect(x,y,side,side);
  x += side;
  y += side;
  rect(x,y,side,side);
  fill(127,0,127);
  y -= side;
  rect(x,y,side,side);
  x -= side;
  y += side;
  rect(x,y,side,side);

  fill(255,255,0);
  y += side/2;
  x -= side/2;
  triangle(x,y,x+2*side,y,x + side,y + 2*phi*side);

  noLoop();
}