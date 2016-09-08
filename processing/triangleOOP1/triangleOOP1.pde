
// Example: Two Triangle objects
ATriangle myAT1;
ATriangle myAT2; // 
ATriangle myAT3; // 


void setup() {
  size(200,200);
  // Parameters go inside the parentheses when the object is constructed.
  myAT1 = new ATriangle(100,100,50); 
  myAT2 = new ATriangle(100,100 - 30,25);
  myAT3 = new ATriangle(125,100 + 15,25);

}

void draw() {
  background(255);
  myAT1.display();
  myAT2.display();
  myAT3.display();

}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class ATriangle { 

  float xpos;
  float ypos;
  float side;

  // The Constructor is defined with arguments.
  ATriangle(float tempXpos, float tempYpos, float tempSide) { 
    
    xpos = tempXpos;
    ypos = tempYpos;
    side = tempSide;
  }

  void display() {
    stroke(0);
    fill(0,0,255);
    float h = side*sqrt(3)/2;
    ellipseMode(CENTER);
    triangle(xpos - 0.5*side,ypos - h/3,xpos + 0.5*side, ypos - h/3, xpos , ypos + 2*h/3);
  }
}