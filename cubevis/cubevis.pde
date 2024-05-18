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

float p = 7;
float q = 5;
void function(float t) {
  //p += millis()/1000f;
  x = (2+cos(p*t))*cos(q*t + millis()/1000f)*100;
  y = (2+cos(p*t))*sin(q*t + millis()/1000f)*100;
  z = sin(t*p)*100;
}

//  //hyperknoten, schlingenngrad 12 -> 17 oder 9
//void function(float t) {
//  x = sin(t/10+sin(z/100))*100;
//  y = constrain(cos(t/10)*100+t/x,-100,100);
//  z = cos(cos(t/10)+t)*100;
//}
