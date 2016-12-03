float unit = 50;
float side = unit;
PImage backgroundImage;
PImage[] imageStack = new PImage[64];
PImage topImage;
int imageStackPointer = 0;
int imageStackLength = 0;
int x0 = 0;
int y0=0;
int x = x0;
int y = y0;

void setup(){
  ellipseMode(CENTER);
  noFill();
  stroke(0);
  strokeWeight(2);
  background(255);
  size(500,500);
  image(loadImage("images.jpg"),0,0,500,500);
  PImage photo;
  photo = get(int(width - side),0,int(side),int(side));
  imageStack[0] = photo;   

}
void draw(){
  image(loadImage("images.jpg"),0,0,500,500);
  rect(mouseX,mouseY,side,side);    
  PImage photo;
  photo = get(mouseX,mouseY,int(side),int(side));
  image(imageStack[0],mouseX,mouseY - side);
}

void displayImageStack(){
  if(imageStackLength < 0){
    for(int index = 0;index < imageStackLength;index++){
      image(imageStack[index],width - side,height - side*(1 + index));   
    } 
  }
}

void popImage(){
  if(imageStackLength > 0){
    imageStack[0] = imageStack[1];
    for(int index = 1;index < imageStackLength-1;index++){
      imageStack[index] = imageStack[index + 1];   
    } 
  imageStackLength--;
  }  
}

void pushImage(){
  imageStackLength++;
  for(int index = 0;index < imageStackLength-1;index++){
    imageStack[index + 1] = imageStack[index];   
  }     
  imageStack[0] = get(x,y,int(side),int(side));
}

void scrollImageStackup(){
}

void captureImage(){
  
}

void printImage(){
  
}

void mouseClicked(){
  
}

void keyPressed(){
  if(key == 'a'){
  PImage photo;
  photo = get(mouseX,mouseY,int(side),int(side));
    imageStack[0] = photo;   
    imageStackPointer++;
  }
  if(key == 's'){
    PImage photo = imageStack[0];
    image(photo,mouseX,mouseY,side,side);
    if(imageStackPointer > 0 ){
      imageStackPointer--; 
    }
  }
}