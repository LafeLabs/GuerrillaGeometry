float x,y,x0,y0;
float side, scaleFactor,unit;
float theta,theta0,thetaStep;
float phi, E,theta_magic;
color currentColor;
color black,white,red,orange,yellow,green,blue,violet;
float buttonSide = 40;
int[] currentGlyph = {};

void setup(){
  size(800,600);
  background(255);
  noFill();
  textSize(8);
  x0 = 600;
  y0 = 300;
  x = x0;
  y = y0;
  unit = 50;
  side = unit;
  theta  = 0;
  theta0 = 0;
  phi  = 1.6;
  E = 2.7;
  theta_magic = radians(54.7);
  scaleFactor = 2;
  thetaStep  = PI/3;
  
}

void draw(){
  String[] code0300 = loadStrings("0300s.txt"); 
  writeCode(code0300); 
  String[] labelArray = buttonLabels(code0300);
  background(255);
  drawButtons(labelArray);
  x=x0;
  y=y0;
  theta = theta0;
  side = unit;
  scaleFactor = 2;
  thetaStep = PI/3;
  drawCurrentGlyph();
  drawCursor();
//  noLoop();
}

void drawCurrentGlyph(){
  for(int bullshitIndex = 0;bullshitIndex < currentGlyph.length;bullshitIndex++){
     doTheThing(currentGlyph[bullshitIndex]); 
    
  }
  
}

void drawCursor(){
  strokeWeight(2);
  stroke(color(255,0,0));
  line(x,y,x + scaleFactor*side*cos(theta),y+scaleFactor*side*sin(theta));
  stroke(0);
  strokeWeight(3);
  line(x,y,x + side*cos(theta),y+side*sin(theta));
  stroke(color(0,0,255));
  strokeWeight(4);
  line(x,y,x + (side/scaleFactor)*cos(theta),y+(side/scaleFactor)*sin(theta));
  strokeWeight(1);
  stroke(0);
  line(x,y,x + side*cos(theta + thetaStep),y+side*sin(theta + thetaStep));
  line(x,y,x + side*cos(theta - thetaStep),y+side*sin(theta - thetaStep));

}


void drawButtons(String[] code0300local){
  for(int row = 0;row < 8;row++){
   for(int column = 0;column < 8;column++){
     rect(column*buttonSide,row*buttonSide,buttonSide,buttonSide);
     fill(0);
     text(code0300local[column + 8*row],(column + 0.1)*buttonSide,(row + 0.4)*buttonSide);
     noFill();
   }
  }
  
}

String[] buttonLabels(String[] code0300local){
    String[] labelArray = {};
    for(int index =0;index < code0300local.length;index++){
      if(code0300local[index].length() >=4){
        String thisLine = code0300local[index].substring(4,code0300local[index].length());
        String[] thisLineSplit = split(thisLine,"//");
        thisLine = thisLineSplit[1];
        //println(thisLine);
        labelArray = append(labelArray,thisLine);             
      }
     }
    return labelArray;
}

void writeCode(String[] code0300local){
    String[] codeOutput = {};
    codeOutput = append(codeOutput,"void doTheThing(int localByte){");
    for(int index =0;index < code0300local.length-1;index++){
      if(code0300local[index].length() >=4){
        codeOutput = append(codeOutput,"if(localByte == " + intOctal(index + 0300) + "){");
        String thisLine = code0300local[index].substring(4,code0300local[index].length());
        codeOutput = append(codeOutput,thisLine);
        codeOutput = append(codeOutput,"}");
       // println(thisLine);
      }
    }
   codeOutput = append(codeOutput,"}");
   saveStrings("codeOutput.txt",codeOutput);  
}



String intOctal(int localByte){
 String bullshit = "";
 char ones = char((localByte%8)+060);
 char eights = char(((localByte >> 3)&7) + 060);
 char sixtyfours = char(((localByte >> 6)&7) + 060);
 bullshit += '0';
 bullshit += sixtyfours;
 bullshit += eights;
 bullshit += ones;
 return bullshit; 
}



void mouseClicked(){
  if((mouseX < 8*buttonSide) && (mouseY < 6*buttonSide)){ 
    int ones = int(mouseX/buttonSide);
    int eights = int(mouseY/buttonSide);
    int sixtyfours = 3;
    int localByte = sixtyfours*64 + ones + 8*eights; 
    doTheThing(localByte);
    currentGlyph = append(currentGlyph,localByte);
    println(intOctal(localByte));
  }
  
}



void doTheThing(int localByte){
if(localByte == 0300){
  theta = theta0;  //theta0
}
if(localByte == 0301){
  point(x,y); //point
}
if(localByte == 0302){
  thetaStep = PI; //180deg
}
if(localByte == 0303){
  thetaStep = 2*PI/3; //120deg
}
if(localByte == 0304){
  thetaStep = PI/2;  //90deg
}
if(localByte == 0305){
  thetaStep = 2*PI/5;  //72deg
}
if(localByte == 0306){
  thetaStep = PI/3; //60deg
}
if(localByte == 0307){
  thetaStep = 2*theta_magic; //2*magic
}
if(localByte == 0310){
  //    derp
}
if(localByte == 0311){
  line(x,y,x + side*cos(theta),y + side*sin(theta)); //line
}
if(localByte == 0312){
    thetaStep /= 2;  //angle/2
}
if(localByte == 0313){
  thetaStep /= 3; //angle/3
}
if(localByte == 0314){
  thetaStep /= 4;  //angle/4
}
if(localByte == 0315){
  thetaStep /= 5;  //angle/5
}
if(localByte == 0316){
  thetaStep /= 6;  //angle/6
}
if(localByte == 0317){
  thetaStep /= 60; //angle/60
}
if(localByte == 0320){
  rect(x,y,side,side);  //square
}
if(localByte == 0321){
  //     derp
}
if(localByte == 0322){
  thetaStep *= 2;  //2angle
}
if(localByte == 0323){
  thetaStep *= 3; //3angle
}
if(localByte == 0324){
  thetaStep *= 4;   //4angle
}
if(localByte == 0325){
  thetaStep *= 5; //5angle
}
if(localByte == 0326){
  thetaStep *= 6; //6angle
}
if(localByte == 0327){
  thetaStep *= 60;  //60angle
}
if(localByte == 0330){
  x += side*cos(theta);y += side*sin(theta); //move
}
if(localByte == 0331){
  x -= side*cos(theta);y -= side*sin(theta);  //back
}
if(localByte == 0332){
    line(x,y,x + side*cos(theta),y + side*sin(theta));x += side*cos(theta);y += side*sin(theta);//linmov
}
if(localByte == 0333){
  line(x,y,x - side*cos(theta),y - side*sin(theta));x -= side*cos(theta);y -= side*sin(theta);//linbak
}
if(localByte == 0334){
  x = x0;y = y0;//homeXY
}
if(localByte == 0335){
  x0 += side*cos(theta);y0 += side*sin(theta);//moveX0Y0
}
if(localByte == 0336){
  x0 -= side*cos(theta);y0 -= side*sin(theta);//backX0Y0
}
if(localByte == 0337){
  drawCursor();//draw\n cursor
}
if(localByte == 0340){
  theta += thetaStep; // CW
}
if(localByte == 0341){
  theta -= thetaStep; // CCW
}
if(localByte == 0342){
  arc(x,y,2*side,2*side,theta,theta + thetaStep);//arc+
}
if(localByte == 0343){
  arc(x,y,2*side,2*side,theta - thetaStep,theta);//arc-
}
if(localByte == 0344){
  arc(x,y,2*side,2*side,theta,theta + thetaStep);theta += thetaStep;//arcmov
}
if(localByte == 0345){
  arc(x,y,2*side,2*side,theta - thetaStep,theta);theta -= thetaStep;//arcbak
}
if(localByte == 0346){
  theta0 += thetaStep;  //t0CW
}
if(localByte == 0347){
  theta0 -= thetaStep;  //t0CCW
}
if(localByte == 0350){
  side *= scaleFactor;  //(+)
}
if(localByte == 0351){
  side /= scaleFactor;  //(-)
}
if(localByte == 0352){
  side = unit;      //unit
}
if(localByte == 0353){
  strokeWeight(3);    //thick
}
if(localByte == 0354){
  strokeWeight(1);      //thin
}
if(localByte == 0355){
  noFill();  //nofill
}
if(localByte == 0356){
  fill(currentColor);//fill
}
if(localByte == 0357){
  ellipse(x,y,2*side,2*side);//circle
}
if(localByte == 0360){
  scaleFactor = sqrt(2); //sqrt(2)x
}
if(localByte == 0361){
  scaleFactor = phi; //phix
}
if(localByte == 0362){
  scaleFactor = sqrt(3); //sqrt(3)x 
}
if(localByte == 0363){
  scaleFactor = 2;  //2x
}
if(localByte == 0364){
  scaleFactor = E;   //ex
}
if(localByte == 0365){
  scaleFactor = 3;   //3x
}
if(localByte == 0366){
  scaleFactor = 5;   //5x
}
if(localByte == 0367){
  scaleFactor = 10;  //10x
}
if(localByte == 0370){
  currentColor = white;  //white
}
if(localByte == 0371){
  currentColor = black;  //black
}
if(localByte == 0372){
  currentColor = red;  //red
}
if(localByte == 0373){
  currentColor = orange;  //orange
}
if(localByte == 0374){
  currentColor = yellow;  //yellow
}
if(localByte == 0375){
  currentColor = green;  //green
}
if(localByte == 0376){
  currentColor = blue;  //blue
}
}