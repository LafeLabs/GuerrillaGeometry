
float side = 25;
float scale = 1;
float x,y,x0,y0;
String[] shapeNameArray = {"SQUARE","TRIANGLEC1","QUARTERSQUARE","CIRCLE"};
int shapeIndex = 0;

void setup(){
  size(250,200);
  x = width/2;
  y = height/2;
  x0 = 0;
  y0 = 0;
}

void draw(){
   background(255);
   noFill();
   stroke(0);
   strokeWeight(1);
   if(mouseX > x0 && mouseX < x0 + 4*side && mouseY > x0 && mouseY < x0 + 4*side){
      fill(155);
   }
   else{
    noFill(); 
   }
   rect(x0,y0,4*side,4*side);
   if(mouseX > x0 + 4*side && mouseX < x0 + 8*side && mouseY > x0 && mouseY < x0 + 4*side){
      fill(155);
   }
   else{
    noFill(); 
   }   
   rect(x0 + 4*side,y0,4*side,4*side);
   fill(color(0,0,255));
   rect(x0 + 3*side,y0+side,2*side,2*side);
   fill(color(255,255,0));
   ellipse(x0 + 4*side,y0 + 2*side,2*side,2*side);
   fill(0);
   triangle(x0 + 3*side,y0,x0 + 3*side,y0+4*side,x0 + side,y0 + 2*side);
   triangle(x0 + 5*side,y0,x0 + 5*side,y0+4*side,x0 + 7*side,y0 + 2*side);

  for(int index = 0;index < 11;index++){
     y = y0 + 4.5*side + 1.5*side*int(index/6); 
     x = x0 + 0.5*side + 1.5*side*(index%6);
     drawShape(index);
     if(index == shapeIndex){
        strokeWeight(3);
        noFill();
        rect(x-0.2*side,y-0.2*side,1.4*side,1.4*side);
        strokeWeight(1);
     }
     else{
     }
  }

}

void drawShape(int localShapeIndex){
  switch(localShapeIndex){//squareC1
   case 0:
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(0,0,255));
     rect(x,y,scale*side,scale*side);
     break;
   case 1:
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(0,0,255));
     quad(x + 1*side,y + 0.5*side,x + 0.5*side,y + 1*side,x - 0.0*side,y + 0.5*side,x + 0.5*side,y - 0.0*side);
     break;
   case 2:  //triangleC1pointdown
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(255,0,0));
     triangle(x,y,x+scale*side,y,x + scale*side*cos(PI/3),y + scale*side*sin(PI/3));
     break;
   case 3:  //triangleC1pointUp
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(255,0,0));
     triangle(x,y + scale*side,x+scale*side,y + scale*side,x + scale*side*cos(PI/3),y + scale*side - scale*side*sin(PI/3));
     break;
   case 4:  //triangleC1pointRight
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(255,0,0));
     triangle(x,y,x,y + scale*side,x + scale*side*sin(PI/3),y + 0.5*scale*side);
     break;
   case 5:  //triangleC1pointLeft
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(255,0,0));
     triangle(x+scale*side,y,x+scale*side,y + scale*side,x + scale*side*(1-sin(PI/3)),y + 0.5*scale*side);
     break;
   case 6:  //quartersquaretop
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(0,0,255));
     triangle(x,y,x + scale*side,y,x + 0.5*scale*side,y + 0.5*scale*side);
     break;
   case 7:  //quartersquareleft
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(0,0,255));
     triangle(x,y,x,y + scale*side,x + 0.5*scale*side,y + 0.5*scale*side);
     break;
   case 8:  //quartersquarebottom
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(0,0,255));
     triangle(x,y + scale*side,x + scale*side,y + scale*side,x + 0.5*scale*side,y + 0.5*scale*side);
     break;
   case 9:  //quartersquareright
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(0,0,255));
     triangle(x + scale*side,y,x + scale*side,y + scale*side,x + 0.5*scale*side,y + 0.5*scale*side);
     break;
   case 10:  //circle
     stroke(0);
     strokeWeight(1);
     noFill();
     rect(x,y,scale*side,scale*side);
     fill(color(255,255,0));
     ellipse(x+0.5*side,y+0.5*side,side,side);
     break;

  }
}

void keyPressed(){
// shapeIndex = (shapeIndex + 1)%11; 
}

void mouseClicked() {
  fill(0);
  if(mouseX > x0 && mouseX < x0 + 4*side && mouseY > x0 && mouseY < x0 + 4*side){
       shapeIndex = (shapeIndex - 1)%11; 
       if(shapeIndex == -1){
           shapeIndex = 10;
       }
       else{}
       rect(x0,y0,4*side,4*side);
   }
   else{
   }
   if(mouseX > x0 + 4*side && mouseX < x0 + 8*side && mouseY > x0 && mouseY < x0 + 4*side){
       shapeIndex = (shapeIndex + 1)%11; 
       rect(x0 + 4*side,y0,4*side,4*side);
   }
   else{
   }     
}