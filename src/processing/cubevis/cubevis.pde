void setup() {
  size(800, 800, P3D);
  surface.setResizable(true);
  noFill();
  textSize(20);
  strokeWeight(3);
  //colorMode(HSB);
  screenLog("initiated succesfully");
}

float x, y, z = 0;
float size = 500;
int axisLength = 200;

float step = 0.01;
float scale = 1;

float rx, ry = 0;

float bsx, bsy;

float dt = 16; // 16 is the expected value at 60 fps

float tx;
float ty;

void draw() {
  hint(ENABLE_DEPTH_TEST);
  getDt();
  pushMatrix();
  stroke(0);
  background(50);
  handleInput();
  
  //temp file has different versions of this.
  
  translate(width/2, height/2, -size);
  scale(scale);
  translate(tx, ty);
  rotateX(rx);
  rotateY(ry);
  
  
  bsx = mouseX;
  bsy = mouseY;
  
  
  if (autorotate) {
    ry += dt/500f;
  }
  if(showCube) {
    box(size);
  }
  if(showAxes) {
    stroke(255, 0, 0);
    line(0, 0, 0, axisLength, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, axisLength, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, axisLength);
  }
  
  
  beginShape(LINES);

  function(-size/2);
  for (float t = -size/2; t < size/2; t+=step) {
    vertex(x, y, z);
    function(t);
    stroke(x, y, z);
    vertex(x, y, z);
  }
  endShape(CLOSE);
  popMatrix();
  
  if(showAxes) {
    
  } 
  
  hint(DISABLE_DEPTH_TEST);

  if (printDebug) {
    debug();
  }
}

long lm = 0;
void getDt() {
  long m = millis();
  dt = m - lm;
  lm = m;
}
