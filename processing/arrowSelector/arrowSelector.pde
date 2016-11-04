
float angleStep = 2*PI/16;
int angleIndex = 0;
float side = 25;
float R = 4*side;


float x0,y0;

void setup(){
  size(300,300);
  background(255);
  x0 = 4*side;
  y0 = 8*side;
  
}

void draw(){
  background(255);
     noFill();
   stroke(0);
   strokeWeight(1);
   if(mouseX > 0 && mouseX < 0 + 4*side && mouseY > 0 && mouseY < 0 + 4*side){
      fill(155);
   }
   else{
    noFill(); 
   }
   rect(0,0,4*side,4*side);
   if(mouseX > 0 + 4*side && mouseX < 0 + 8*side && mouseY > 0 && mouseY < 0 + 4*side){
      fill(155);
   }
   else{
    noFill(); 
   }   
   rect(0 + 4*side,0,4*side,4*side);
  fill(color(255,0,0));
  ellipse(2*side,2*side,3*side,3*side);
  fill(255);
  ellipse(2*side,2*side,2*side,2*side);  
  fill(color(0,200,0));
  ellipse(6*side,2*side,3*side,3*side);
  fill(255);
  ellipse(6*side,2*side,2*side,2*side);  
  fill(0);
  triangle(2*side,0,2*side,2*side,1*side,side);
  triangle(6*side,0,6*side,2*side,7*side,side);

  stroke(0);
  strokeWeight(1);
  fill(255);  
  rect(x0- R,y0 - R,2*R,2*R);
  float theta = angleIndex*angleStep;
  strokeWeight(3);
  stroke(0);
  line(x0,y0,x0 + R*cos(theta),y0 + R*sin(theta));
  strokeWeight(1);
  fill(0);
  triangle(x0 + 0.9*R*cos((angleIndex + 0.5)*angleStep),y0 + 0.9*R*sin((angleIndex + 0.5)*angleStep),x0 + 0.9*R*cos((angleIndex - 0.5)*angleStep),y0 + 0.9*R*sin((angleIndex - 0.5)*angleStep),x0 + 1.05*R*cos(theta),y0 + 1.05*R*sin(theta));

}

void keyPressed(){
  if(key == 'r'){
    angleIndex = (angleIndex + 1)%16;
  } 
  if(key == 'l'){
    angleIndex = (angleIndex - 1)%16;
  } 
}

void mouseClicked() {
  fill(0);
  if(mouseX > 0 && mouseX < 0 + 4*side && mouseY > 0 && mouseY < 0 + 4*side){
        angleIndex = (angleIndex - 1)%16;
       if(angleIndex == -1){
           angleIndex = 16;
       }
       else{}
       rect(0,0,4*side,4*side);
   }
   else{
   }
   if(mouseX > 0 + 4*side && mouseX < 0 + 8*side && mouseY > 0 && mouseY < 0 + 4*side){
       angleIndex = (angleIndex + 1)%16;
       rect(0 + 4*side,0,4*side,4*side);

   }
   else{
   }     
}