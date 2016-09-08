size(1000,1000);


color colorZero = color(0, 0, 0);//black
color colorOne = color(127, 0, 0);//brown
color colorTwo = color(255, 0, 0);//red
color colorThree = color(255, 127, 0);//orange
color colorFour = color(255, 255, 0);//yellow
color colorFive = color(0,127,0);//green
color colorSix = color(0,0,255);//blue
color colorSeven = color(127,0,127);// violet

color colorCurrent = colorZero;

int index = 0;

int x = 0;
int[] xArray = { 0, 1,2,3,4,5,6,7,6,5,4,3,2,1,0};
int xLength = 15;


background(255);


for(index = 0;index < xLength;index++){
  x = xArray[index]; 
  switch(x){
     case 0:
       colorCurrent = colorZero;
       break;
     case 1:
       colorCurrent = colorOne;
       break;
     case 2:
       colorCurrent = colorTwo;
       break;
     case 3:
       colorCurrent = colorThree;
       break;
     case 4:
       colorCurrent = colorFour;
       break;
     case 5:
       colorCurrent = colorFive;
       break;
     case 6:
       colorCurrent = colorSix;
       break;
     case 7:
       colorCurrent = colorSeven;
       break;
   }
  fill(colorCurrent);
  stroke(colorCurrent);
  rect(10*index,0,10,10);
  
}

x = 25;
print("RGB = ");
print(red(get(x,5)));
print(", ");
print(green(get(x,5)));
print(", ");
println(blue(get(x,5)));