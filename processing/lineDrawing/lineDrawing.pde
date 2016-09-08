int index = 0;

void setup(){
  size(250,250);
  background(255);
}

void draw(){
  background(255);
  frameRate(30);
  strokeWeight(4);
  point(100,100);
  strokeWeight(1);
  stroke(0);
  line(100,100,100 + index,100 + index); 
  index += 5;
  strokeWeight(4);
  point(200,200);
  strokeWeight(1);
  if(index > 105){
    index = 0;
    delay(500);
  }
}
