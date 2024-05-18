void setup() {
  size(800, 800, P3D);
  hint(DISABLE_OPENGL_ERRORS);
  surface.setResizable(true);
  noFill();
  textSize(20);
  strokeWeight(3);
  //colorMode(HSB);
  screenLog("initiated succesfully");
}

float x, y, z = 0;
float size = 500;
float step = 0.01;
float scale = 1;

float rx, ry = 0;

float bsx, bsy;

float dt = 16; // 16 is the expected value at 60 fps

void draw() {
  getDt();
  pushMatrix();
  stroke(0);
  background(200);
  translate(width/2, height/2, -size);

  handleInput();

  bsx = mouseX;
  bsy = mouseY;
  if (autorotate) {
    ry += dt/500f;
  }
  rotateX(rx);
  rotateY(ry);
  scale(scale);
  box(size);

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
