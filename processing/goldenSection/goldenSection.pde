
float side = 50;
float x,y;
int angleIndex =0;

float phi = (sqrt(5) + 1)/2;

void setup(){
 size(500,500);
 background(255);
 x = width/2;
 y = height/2;
}

void draw(){
  
  triangle(x,y,x+side*cos(0 + angleIndex*2*PI/5),y+side*sin(0 + angleIndex*(2*PI/5)),x +side*phi*cos((angleIndex+1)*2*PI/5),y + side*phi*sin((angleIndex+1)*2*PI/5));
  
}

void keyPressed(){
 if(key == 'r'){
  angleIndex +=1; 
 }
 if(key == 'l'){
  angleIndex -=1; 
 }
 
}