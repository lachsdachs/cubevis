void debug() {
  initScreenWrite();
  
  screenWrite("fps: " + limpad(frameRate,1));
  screenWrite(width + " x " + height);
  screenWrite("zoom: " + limpad(scale,1) + " X");
  screenWrite("iteration step size: " + step);
  screenWrite("frametime delta: " + dt);
  screenWrite("current time signature: " + tSig());
  screenWrite(keyPressed && key != CODED ? "key = " + key : "no key set");
  screenWrite(keyPressed && keyCode != 0 ? "keyCode = " + keyCode : "no keycode set");
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
