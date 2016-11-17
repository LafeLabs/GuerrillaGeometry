float unit = 35;
float side = unit;
float buttonSide = unit;
float x,y,x0,y0;
float theta = 0;
float phi = (sqrt(5) + 1)/2;
float E = 2.71828;
String[] nameArray = new String[64];
int[] currentGlyph = {};
String currentGlyphString = "{}";
String currentCommandString = "";
//String[] letterList = new String[26];
String[] letterList = {"","","","","","","","","","","","","","","","","","","","","","","","","",""};
void setup(){
  x0 = 550;
  y0 = 250;
  size(800,500);
  x=x0;
  y=y0;
  noFill();
  background(255);

  nameArray[0] = "0";
  nameArray[1] = "1";
  nameArray[2] = "180";
  nameArray[3] = "120";
  nameArray[4] = "90";
  nameArray[5] = "72";
  nameArray[6] = "60";
  nameArray[7] = "magic";
  nameArray[8] = "move";
  nameArray[9] = "back";
  nameArray[10] = "";
  nameArray[11] = "-120";
  nameArray[12] = "-90";
  nameArray[13] = "-72";
  nameArray[14] = "-60";
  nameArray[15] = "-mag";
  nameArray[16] = "DEL";
  nameArray[17] = "RST";
  nameArray[18] = "";
  nameArray[19] = "";
  nameArray[20] = "45";
  nameArray[21] = "36";
  nameArray[22] = "30";
  nameArray[23] = "2mag";
  nameArray[20 + 8] = "-45";
  nameArray[21 + 8] = "-36";
  nameArray[22 + 8] = "-30";
  nameArray[23 + 8] = "-2mag";
  nameArray[030] = "CLR";
  nameArray[040] = "rt(2)";
  nameArray[041] = "phi";
  nameArray[042] = "rt(3)";
  nameArray[043] = "2";
  nameArray[044] = "e";
  nameArray[045] = "3";
  nameArray[046] = "5";
  nameArray[047] = "10";
  nameArray[050] = "1/rt(2)";
  nameArray[051] = "1/phi";
  nameArray[052] = "1/rt(3)";
  nameArray[053] = "1/2";
  nameArray[054] = "1/e";
  nameArray[055] = "1/3";
  nameArray[056] = "1/5";
  nameArray[057] = "1/10";
}

void draw(){
    background(255);
    drawButtons();
    doTheThing(0321);
    drawGlyph();
    drawCursor();
//    noLoop();
}

void doTheThing(int localByte){
   if(localByte == 0300){
      ellipse(x,y,2*side,2*side); 
   }
   if(localByte == 0301){
      line(x,y,x+side*cos(theta),y+side*sin(theta));
   }   
   if(localByte == 0302){
       theta += PI;
   }
   if(localByte == 0303){
       theta += radians(120);
   }
   if(localByte == 0313){
       theta -= radians(120);
   }
   if(localByte == 0304){
       theta += radians(90);
   }
   if(localByte == 0314){
       theta -= radians(90);
   }
   if(localByte == 0324){
       theta += radians(45);
   }
   if(localByte == 0334){
       theta -= radians(45);
   }
   if(localByte == 0305){
       theta += radians(72);
   }
   if(localByte == 0315){
       theta -= radians(72);
   }
   if(localByte == 0325){
       theta += radians(36);
   }
   if(localByte == 0335){
       theta -= radians(36);
   }
   if(localByte == 0306){
       theta += radians(60);
   }
   if(localByte == 0316){
       theta -= radians(60);
   }
   if(localByte == 0326){
       theta += radians(30);
   }
   if(localByte == 0336){
       theta -= radians(30);
   }

   if(localByte == 0307){
       theta += radians(54.74);
   }
   if(localByte == 0317){
       theta -= radians(54.74);
   }
   if(localByte == 0327){
       theta += radians(2*54.74);
   }
   if(localByte == 0337){
       theta -= radians(2*54.74);
   }

   if(localByte == 0310){
     x += side*cos(theta);
     y += side*sin(theta);
   }
   if(localByte == 0311){
     x -= side*cos(theta);
     y -= side*sin(theta);
   }
   if(localByte == 0320){  //delete
     if(currentGlyph.length != 0){
        currentGlyph = shorten(currentGlyph); 
     }
   }
   if(localByte == 0330){
     deleteCurrentGlyph();   
   }
   
   if(localByte == 0321){
     x = x0;
     y = y0;
     side = unit;
     theta = 0;
   }
   if(localByte == 0340){  //sqrt(2)
     side *= sqrt(2);
   }
   if(localByte == 0350){  // 1/sqrt(2)
     side /= sqrt(2);
   }
   if(localByte == 0341){  // phi
     side *= phi;
   }
   if(localByte == 0351){  // 1/phi
     side /= phi;
   }
   if(localByte == 0342){  //sqrt(3)
     side *= sqrt(3);
   }
   if(localByte == 0352){  // 1/sqrt(3)
     side /= sqrt(3);
   }
   if(localByte == 0343){  // 2x
     side *= 2;
   }
   if(localByte == 0353){  // 1/2
     side /= 2;
   }
   if(localByte == 0344){  // e
     side *= E;
   }
   if(localByte == 0354){  // 1/e
     side /= E;
   }
   if(localByte == 0345){  //  3
     side *= 3;
   }
   if(localByte == 0355){  // 1/3
     side /= 3;
   }
   if(localByte == 0346){  // 5
     side *= 5;
   }
   if(localByte == 0356){  // 1/5
     side /= 5;
   }
   if(localByte == 0347){  // 10
     side *= 10;
   }
   if(localByte == 0357){  // 1/10
     side /= 10;
   }      
}

void drawButtons(){
   int buttonIndex = 0;
   for(int rows = 0;rows < 6;rows++){
      for(int columns = 0;columns <8;columns++){
         rect(columns*buttonSide,rows*buttonSide,buttonSide,buttonSide);
         if(nameArray[buttonIndex] != null){
           fill(0);
           text(nameArray[buttonIndex],(columns+0.1)*buttonSide,(rows + 0.5)*buttonSide); 
           noFill();
         }
         buttonIndex++;
      }
   }  
}

void mouseClicked(){
  if((mouseX < 8*buttonSide) && (mouseY < 6*buttonSide)){ 
    int ones = int(mouseX/buttonSide);
    int eights = int(mouseY/buttonSide);
    int sixtyfours = 3;
    int localByte = sixtyfours*64 + ones + 8*eights;
    if(localByte  != 0320 && localByte != 0330){
      currentGlyph = append(currentGlyph,localByte);
      if(currentCommandString.length() != 0){
        currentCommandString += ",";
      }
      currentCommandString += "0";
      currentCommandString += char(060 + sixtyfours);
      currentCommandString += char(060 + eights);
      currentCommandString += char(060 + ones);
      println(currentCommandString);
    }
    if(localByte == 0320){
      if(currentGlyph.length > 0){
        currentGlyph = shorten(currentGlyph);
        currentCommandString = currentCommandString.substring(0,currentCommandString.length() - 5);
        println(currentCommandString);
      }         
    }
    
    if(localByte == 0330){
      deleteCurrentGlyph();
      println();
    }   
    else{
       }        
  }
}

void drawGlyph(){
 for(int bullshitIndex = 0;bullshitIndex < currentGlyph.length;bullshitIndex++){
     doTheThing(currentGlyph[bullshitIndex]);
 }
}

void drawCursor(){
   strokeWeight(3);
   line(x,y,x+side*cos(theta),y + side*sin(theta));
   strokeWeight(1);
}

void keyPressed(){
  if(key == ' '){
     saveStrings("letterList.txt",letterList); 
  }
  if(key == '`'){
     letterList = loadStrings("letterList.txt"); 
  }

  if(key >= 'A' && key <= 'Z'){
    letterList[int(key) - int('A')] = currentCommandString;    
  }
  if(key >= 'a' && key <= 'z'){
     currentCommandString = letterList[int(key) - int('a')];    //just a string, with op codes separated by commas
     String[] butt = split(currentCommandString,',');  //butt is an array of strings, each of which is an octal command
     for(int bullshitIndex = 0;bullshitIndex < butt.length;bullshitIndex++){
        int x =  octalString2Int(butt[bullshitIndex]);  //decimal value of roctal op code
        currentGlyph = append(currentGlyph,x);
     }
  }
  
}

int octalString2Int(String localString){
  if(localString.length() != 0){
    int sixtyfours = (localString.charAt(1)) - 060;
    int eights = (localString.charAt(2)) - 060;
    int ones = (localString.charAt(3)) - 060; 
    int x = ones + 8*eights + 64*sixtyfours;
    return x;
  }
  else{
    return 0;
  }
}


void deleteCurrentGlyph(){
 for(int bullshitIndex = 0;bullshitIndex < currentGlyph.length;bullshitIndex++){
   currentGlyph = shorten(currentGlyph); 
 }
 currentCommandString = "";
}