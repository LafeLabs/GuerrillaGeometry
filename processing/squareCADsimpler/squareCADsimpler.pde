float side = 150;
float scale = 1;
float scaleFactor = 4;
float x,y,x0,y0;

void setup(){
  size(500,500);
  x = width/2;
  y = height/2;
  x0 = x;
  y0 = y;
  background(255);
  fill(100);
}

void draw(){
  drawSquare();
  zoomIn();
  move(3);
  drawSquare();
  move(3);
  drawSquare();
  move(3);
  drawSquare();
  move(3);
  drawSquare();
  move(0);
  zoomIn();
  drawSquare();
  move(0);
  drawSquare();
  move(0);
  drawSquare();
  move(0);
  drawSquare();
  move(1);
  move(0);
  zoomIn();
  move(2);
  drawSquare();
  move(1);
  drawSquare();
  move(1);
  drawSquare();
  move(1);
  drawSquare();
  
  noLoop();
}

void drawSquare(){
  rect(x,y,scale*side,scale*side);
}

void move(int localMoveIndex){
  x += scale*side*cos(localMoveIndex*PI/2);
  y += scale*side*sin(localMoveIndex*PI/2);
}
void zoomIn(){
  scale /= scaleFactor;
}