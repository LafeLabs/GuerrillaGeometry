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
int colorIndex = 2;

float side = 25;
float x0,y0;
  
  
void setup(){
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
  size(600,300);
  background(255);
  x0 = 0;
  y0 = 0;
}

void draw(){
  background(255);
  
  noFill();
     if(mouseX > x0 && mouseX < x0 + 8*side && mouseY > x0 && mouseY < x0 + 8*side){
      fill(155);
   }
   else{
    noFill(); 
   }
  rect(x0,y0,8*side,8*side);
     if(mouseX > x0 + 8*side && mouseX < x0 + 16*side && mouseY > x0 && mouseY < x0 + 4*side){
      fill(155);
   }
   else{
     noFill();      
   }
  rect(x0 + 8*side,y0,8*side,8*side);

  for(int index = 0;index < 10;index++){
    setFillColor(index);
    rect(x0 + 4*side,y0 +1.5*side+ 0.5*side*index,8*side,0.5*side);
    rect(x0 + 0.5*side + 1.6*side*index,y0+8.5*side,side,side);
  }
  setFillColor(0);
  triangle(x0 + 4*side,y0,x0 + 4*side,y0 + 8*side,x0,y0 + 4*side);
  triangle(x0 + 12*side,y0,x0 + 12*side,y0 + 8*side,x0 + 16*side,y0 + 4*side);
  noFill();
  strokeWeight(3);
  rect(x0 + 0.3*side + 1.6*side*colorIndex,y0+8.3*side,1.35*side,1.35*side);
  strokeWeight(1);
  setFillColor(colorIndex);
  rect(x0 + 18*side,y0 + 4*side,4*side,4*side);
}

void setFillColor(int localColorIndex){
  fill(color(colorArray[3*localColorIndex],colorArray[3*localColorIndex + 1],colorArray[3*localColorIndex + 2]));   
}

void keyPressed(){
 colorIndex = (colorIndex + 1)%10;  
}


void mouseClicked() {
  fill(0);
  if(mouseX > x0 && mouseX < x0 + 8*side && mouseY > x0 && mouseY < x0 + 8*side){
       colorIndex = (colorIndex - 1)%10; 
       if(colorIndex == -1){
           colorIndex = 9;
       }
       rect(x0,y0,8*side,8*side);
   }
   else{
   }
   if(mouseX > x0 + 8*side && mouseX < x0 + 16*side && mouseY > x0 && mouseY < x0 + 8*side){
       colorIndex = (colorIndex + 1)%10; 
       rect(x0 + 8*side,y0,8*side,8*side);
   }
   else{
   }     
}