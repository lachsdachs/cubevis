void debug() {
  initScreenWrite();
  
  screenWrite("fps: " + limpad(frameRate,1));
  screenWrite(width + " x " + height);
  screenWrite("zoom: " + limpad(scale,1) + " X");
  screenWrite("iteration step size: " + step);
  screenWrite("vertex count: " + nfc((int)((1/step) * size)));
  screenWrite("frametime delta: " + dt);
  screenWrite("current time signature: " + tSig());
  if(keyPressed && key != CODED) screenWrite("key = " + key);
  if(keyPressed && keyCode != 0) screenWrite("keyCode = " + keyCode);
  if(mousePressed) screenWrite("mouse button code: " + mouseButton);
  empty();
  screenWrite("press [s] for screenshot");
  screenWrite("press [d] to hide/show debug");
  screenWrite("press [r] to toggle autorotation");
  screenWrite("press [c] to toggle cube");
  screenWrite("press [a] to toggle axes");
  
  flushScreenLog();
}

String tSig() {
  return pad(hour())+":"+pad(minute())+":"+pad(second());
}

String pad(int in) {
  String out = in + "";
  if(in < 10) {
    out = "0" + in;
  }
  return out;
}

float px = 7;
float py = 0;

int rows = 1;

void screenWrite(String text) {
  text(text, px, py + textAscent()*rows);
  rows++;
}

void initScreenWrite() {
  rows = 1;
}

String limpad(float in, int digits) {
  in *= 10;
  in = round(in);
  in /= pow(10,digits);
  
  return nf(in);
}

void empty() {
  screenWrite("");
}


String msg = "";
void screenLog(String in) {
  msg = tSig() + " - " + in;
}

void flushScreenLog(){
  text(msg, 7, height-7);
}
