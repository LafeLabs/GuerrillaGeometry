int index = 0;
int time = 0;
int startTime = 0;
int stopTime = 4000; //time in ms 

import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 100;

void setup(){
  size(300,300);
  background(255);
  gifExport = new GifMaker(this, "export.gif", 100);
  gifExport.setRepeat(0); // make it an "endless" animation
}

void draw(){
  frameRate(25);  //25 frames per second is 40 ms per frame
  strokeWeight(4);
  point(100,100);
  point(200,200);
  strokeWeight(1);
  stroke(0);
  line(100,100,100 + index,100 + index); 
  time += 40; //advance time by 40 ms
  if(index > 100){
    time = startTime;
    index = 0;    
    background(255);
    delay(250);
  }
  index += 1;
  export();
}

void export() {
  if(frames < totalFrames) {
    gifExport.setDelay(20);
    gifExport.addFrame();
    frames++;
  } else {
    gifExport.finish();
    frames++;
    println("gif saved");
    exit();
  }
}
