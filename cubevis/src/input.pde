void handleInput() {
  if (mousePressed && mouseButton == LEFT) {
    rx += (bsy-(float)mouseY)/30f;
    ry -= (bsx-(float)mouseX)/30f;
  }
}

void mouseWheel(MouseEvent event) {
  scale *= 1 - event.getCount()/20f;
}

boolean printDebug = true;
boolean autorotate = false;
void keyPressed() {
  if (key == 's') {
    screenshot();
    screenLog("took a screenshot of " + width + " x " + height);
  } else if (key == 'd') {
    printDebug = !printDebug;
    screenLog("toggled debug view to " + printDebug);
  } else if (key == 'a') {
    autorotate = !autorotate;
    screenLog("toggled autorotation to "+ autorotate);
  }
}

void screenshot() {
  PImage screenshot = createImage(width, height, RGB);
  screenshot.loadPixels();
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    screenshot.pixels[i] = pixels[i];
  }
  screenshot.save("screenshot_" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + "_" + millis() + ".png");
}
