
float t = 0;
float tMax = 2000;

import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 80;

void setup(){
  size(200,200);
  background(255);
  ellipseMode(CENTER);
  gifExport = new GifMaker(this, "triangleC1.gif", 80);
  gifExport.setRepeat(0); // make it an "endless" animation

}

void draw(){
  frameRate(25);
  background(255);
  strokeWeight(4);
  point(75,100);  
  strokeWeight(1);
  
  if(t < 500){
    arc(75, 100, 100, 100, 0, t*2*PI/500.0);
    noFill();  
  }
  if(t >= 500 && t < 1000){
    arc(75, 100, 100, 100, 0, 2*PI);
    strokeWeight(4);
    point(125,100);  
    strokeWeight(1);
    arc(125, 100, 100, 100, PI ,PI + (t - 500)*2*PI/500.0);    
  }

  if(t >= 1000 && t < 1200){
    arc(75, 100, 100, 100, 0, 2*PI);
    strokeWeight(4);
    point(125,100);  
    strokeWeight(1);
    arc(125, 100, 100, 100, PI ,PI + 2*PI);
    strokeWeight(4);
    point(100,57);  
    strokeWeight(1);
    line(75, 100,75 + 50*(t - 1000)/200.0, 100);        
  }

  if(t >= 1200 && t < 1400){
    arc(75, 100, 100, 100, 0, 2*PI);
    strokeWeight(4);
    point(125,100);  
    strokeWeight(1);
    arc(125, 100, 100, 100, PI ,PI + 2*PI);
    strokeWeight(4);
    point(100,57);  
    strokeWeight(1);
    line(75, 100,125,100);        
    line(125, 100,125 - 25*(t - 1200)/200,100 - 43*(t - 1200)/200);        
  }

  if(t >= 1400 && t < 1600){
    arc(75, 100, 100, 100, 0, 2*PI);
    strokeWeight(4);
    point(125,100);  
    strokeWeight(1);
    arc(125, 100, 100, 100, PI ,PI + 2*PI);
    strokeWeight(4);
    point(100,57);  
    strokeWeight(1);
    line(75, 100,125,100);        
    
    line(125, 100,125 - 25,100 - 43);        
    line(100, 57, 100 - 25*(t - 1400)/200, 57 + 43*(t - 1400)/200);        
  }

    if(t >= 1600){
    arc(75, 100, 100, 100, 0, 2*PI);
    strokeWeight(4);
    point(125,100);  
    strokeWeight(1);
    arc(125, 100, 100, 100, PI ,PI + 2*PI);
    strokeWeight(4);
    point(100,57);  
    strokeWeight(1);
    line(75, 100,125,100);        
    
    line(125, 100,125 - 25,100 - 43);        
    line(100, 57, 75, 100);       
    fill(0,0,255); 
    triangle(75,100,125,100,100,57);
    noFill();
  }

  
  t = t + 25.0;
  if(t > tMax){
    t = 0.0;
  }

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
