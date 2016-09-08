float x= 400;
float y = 400;
float side = 400;


void setup() {
  size(800,800);
  background(255);
}

void draw() {
 frameRate(10);
  drawATriangle();
  x += 0.5*side;
  side = 0.5*side;
  y += 0.55*side;
  if(side < 1){
    side = 400;
    x = 400;
    y = 400;
    background(255);
  }
}

void drawATriangle(){
    stroke(0);
    fill(0,0,255);
    float h = side*sqrt(3)/2;
    triangle(x - 0.5*side,y - h/3,x + 0.5*side, y - h/3, x, y + 2*h/3);
}