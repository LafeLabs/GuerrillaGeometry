float[] triangleChain = {};
float[] currentTriangle = new float[6];
float x = width/2;
float y = height/2;

float side = 50;
float h = sqrt(3)*side/2;
float r = 2*h/3;
float theta = 0;

void setup(){
 size(500,500); 
 x = width/2;
 y = height/2;
}

void draw(){
  h = sqrt(3)*side/2;
  r = 2*h/3;
  background(255);
  stroke(0);
  if(triangleChain.length != 0){
    fill(255,0,0);
    for(int index = 0;index < triangleChain.length/6;index++){
      triangle(triangleChain[6*index + 0],triangleChain[6*index + 1],triangleChain[6*index + 2],triangleChain[6*index + 3],triangleChain[6*index + 4],triangleChain[6*index + 5]);  
    }
  }
  fill(0,0,255);
  makeTriangle();
  triangle(currentTriangle[0],currentTriangle[1],currentTriangle[2],currentTriangle[3],currentTriangle[4],currentTriangle[5]);
  println((theta/(2*PI)));
}

void makeTriangle(){
   for(int index = 0;index < 6; index += 2){
      currentTriangle[index] = x + r*cos(-2*PI/12 + theta + index*2*PI/3);
      currentTriangle[index + 1] = y + r*sin(-2*PI/12 + theta + index*2*PI/3);
   }

}
  
void keyPressed(){
 if(key == 'j'){  //down and left
   theta += PI; 
   x -= side/2;
   y += h/3;
 }
 if(key == 'k'){ //right and down
   theta += PI; 
   x += side/2;
   y += h/3;

 } 
 if(key == 'i'){//up
   theta += PI; 
   y -= 2*h/3;
 }
 if(key == 'u'){  //left and up
   theta += PI; 
   x -= side/2;
   y -= h/3;
 }
 if(key == 'o'){ //right and up
   theta += PI; 
   x += side/2;
   y -= h/3;

 } 
 if(key == 'm'){  //down
   theta -= PI; 
   y += 2*h/3;
 }
 if(key == 'a'){
   triangleChain = concat(triangleChain,currentTriangle); 
 }
 if(key == '+'){
   side *= 2;
 }
 if(key == '+'){
   side /= 2;
 }

}