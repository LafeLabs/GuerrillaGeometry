float side = 50;
float unit = 50;
float buttonSide = 50;
float crx0 = buttonSide*3;
float cry0 = buttonSide*3;
float theta = 0;
float cursorTheta=0;
float deltaTheta = 0;
float x,y;
float x0,y0;

int[] currentGlyph = {0364,0361,0360};

void setup(){
  size(500,500);  
  ellipseMode(CENTER);
  x0= 400;
  y0= 400;
  x=x0;
  y=y0;
}

void draw(){
  background(255);
  compassRose();
  drawButtons();
  drawGlyph(currentGlyph);
  drawCursor();

}

void compassRose(){
    strokeWeight(1);
    ellipse(crx0,cry0,6*buttonSide,6*buttonSide);
    for(int index = 0;index < 24;index++){
       line(crx0,cry0,crx0 + 3*buttonSide*cos(index*radians(15)),cry0 + 3*buttonSide*sin(index*radians(15)));
    }
    strokeWeight(3);
    line(crx0,cry0,crx0 + 3*buttonSide*cos(theta),cry0 + 3*buttonSide*sin(theta));
    if(dist(crx0,cry0,mouseX,mouseY) < 3*buttonSide){  
      cursorTheta = radians(15*int(degrees((- atan2(mouseX - crx0,mouseY-cry0) +  PI/2))/15));
    }
    line(crx0,cry0,crx0 + 3*buttonSide*cos(cursorTheta),cry0 + 3*buttonSide*sin(cursorTheta));
    strokeWeight(1);
    
}

void doTheThing(int localByte){
  
  if(localByte >= 0301 && localByte <= 0327){
     theta += radians(15*(localByte - 0300)); 
  }
  if(localByte >= 0331 && localByte <= 0354){
     theta += radians(18*(localByte - 0330)); 
  }
  if(localByte == 0360){
      x += side*cos(theta);
      y += side*sin(theta);
  }
  if(localByte == 0361){
      line(x,y,x + side*cos(theta),y + side*sin(theta));
  }  
  if(localByte == 0362){
    side *=2;
  }
  if(localByte == 0363){
    side /=2;
  }  
  if(localByte == 0364){
    side = unit;;
    x=x0;
    y=y0;
    theta=0;
  }
  if(localByte == 0365){
    if(currentGlyph.length != 0){
       currentGlyph = shorten(currentGlyph); 
    }
  }

}

void mouseClicked(){
  if(dist(crx0,cry0,mouseX,mouseY) < 3*buttonSide){      
     cursorTheta = radians(15*int(degrees((- atan2(mouseX - crx0,mouseY-cry0) +  PI/2))/15));
     deltaTheta = cursorTheta - theta;  
     theta += deltaTheta;
     currentGlyph = append(currentGlyph,0300 + int(deltaTheta*24/(2*PI)));
  }
  if((mouseY > 6*buttonSide) && (mouseY < 8*buttonSide) && mouseX < 8*buttonSide){
    int localByte = 0360;
    localByte += mouseX/buttonSide;
    if(localByte != 0365){
       currentGlyph = append(currentGlyph,localByte);    
    }
    doTheThing(localByte);
  }
  println(currentGlyph);
}

void keyPressed(){
  
  if(key == 'a'){
    currentGlyph = append(currentGlyph,0360);
  }
  if(key == 's'){
    currentGlyph = append(currentGlyph,0361);
  }
    if(key == 'd'){
    currentGlyph = append(currentGlyph,0362);
  }
    if(key == 'f'){
    currentGlyph = append(currentGlyph,0363);
  }
  if(key == 'g'){
     currentGlyph = append(currentGlyph,0364);
  }
  if(key == 'h'){
     currentGlyph = append(currentGlyph,0365);
  }
}

void drawGlyph(int[] localGlyph){
   for(int index = 0;index < localGlyph.length; index++){
      doTheThing(localGlyph[index]);
   } 
}

void drawCursor(){
   line(x,y,x + side*cos(theta),y + side*sin(theta));
}


void drawButtons(){
  noFill();
  for(int columns = 0;columns < 6;columns++){ 
    rect(columns*buttonSide,6*buttonSide,buttonSide,buttonSide);
  }  
  textSize(18);
  fill(0);
  text("move", 5, 25 + 6*buttonSide);   
  text("line", 5 + buttonSide, 25 + 6*buttonSide);   
  text("  +", 5 + 2*buttonSide, 25 + 6*buttonSide);
  text("  -", 5 + 3*buttonSide, 25 + 6*buttonSide);
  text("HOME", 5 + 4*buttonSide, 25 + 6*buttonSide);
  text("DEL", 5 + 5*buttonSide, 25 + 6*buttonSide);

  noFill();
}