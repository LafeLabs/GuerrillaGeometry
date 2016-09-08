float side = 50;
float x0 = 0;
float y0 = 0;
float x1 = 0.5*side;
float y1 = 0.5*sqrt(3)*side;
float x2 = side;
float y2 = 0;
float verticalPosition = 0;

int red = 0;
int green = 0;
int blue = 0;

size(600,100);
background(255);

//0: black
red = 0;
green = 0;
blue = 0;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("0",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//1: brown
red = 127;
green = 0;
blue = 0;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("1",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//2: red
red = 255;
green = 0;
blue = 0;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("2",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//3: orange
red = 255;
green = 127;
blue = 0;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("3",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//4: yellow
red = 255;
green = 255;
blue = 0;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("4",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//5: green
red = 0;
green = 127;
blue = 0;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("5",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//6: blue
red = 0;
green = 0;
blue = 255;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("6",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//7: violet
red = 127;
green = 0;
blue = 127;
fill(red,green,blue);
triangle(x0, y0, x1, y1, x2, y2); 
text("7",x0 + 0.6*side,y0 + side);
x0 += side;
x1 += side;
x2 += side;

//that's it for octal data.