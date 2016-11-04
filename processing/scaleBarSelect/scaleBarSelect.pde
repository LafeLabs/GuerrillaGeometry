float x0,y0;
float side =25;
int scaleIndex = 0;
float scaleFactor = 2;
float scale = 1;
float scaleMaximum = 8;
float scaleMinimum = 0.25;

void setup(){
  size(300,300);
  background(255);
  x0 = width/2;
  y0 = 0; 
  x0 = 0;
}

void draw(){
  background(255);
   
   if(mouseX > x0 && mouseX < x0 + 4*side && mouseY > x0 && mouseY < x0 + 4*side){
      fill(155);
   }
   else{
    noFill(); 
   }
   rect(x0,y0,4*side,4*side);
   fill(color(255,0,0));
   noStroke();
   rect(x0 + 1.5*side,y0 + 0.5*side,side,3*side);
   rect(x0 + .5*side,y0 + 1.5*side,3*side,side);
   noFill();
   stroke(0);

   if(mouseX > x0 + 4*side && mouseX < x0 + 8*side && mouseY > x0 && mouseY < x0 + 4*side){
      fill(155);
   }
   else{
    noFill(); 
   }   
   rect(x0 + 4*side,y0,4*side,4*side);
   fill(color(0,255,0));
   noStroke();

   rect(x0+4*side + .5*side,y0 + 1.5*side,3*side,side);
   noFill();
  stroke(0);

  drawScaleBars();
}

void drawScaleBars(){
  scaleIndex = 0;
  float barScale;
  for(barScale = scaleMaximum;barScale >= scaleMinimum; barScale /=scaleFactor){
     if(barScale == scale){
        fill(0); 
     }
     else{
        noFill(); 
     }
     rect(0,4*side + side*scaleIndex,barScale*side,side);   
     scaleIndex++;
  } 
}

void keyPressed(){
 if(key =='-' && scale > scaleMinimum){
    scale /= scaleFactor; 
 }
 if(key =='=' && scale < scaleMaximum){
    scale *= scaleFactor; 
 } 
}

void mouseClicked() {
  fill(0);
  if(mouseX > x0 && mouseX < x0 + 4*side && mouseY > x0 && mouseY < x0 + 4*side && scale < scaleMaximum){
       scale *= scaleFactor; 
       rect(x0,y0,4*side,4*side);
   }
   else{
   }
   if(mouseX > x0 + 4*side && mouseX < x0 + 8*side && mouseY > x0 && mouseY < x0 + 4*side && scale > scaleMinimum){
      scale /= scaleFactor; 
      rect(x0 + 4*side,y0,4*side,4*side);
   }
   else{
   }     
}