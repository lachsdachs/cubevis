void handleInput() {
  if (mousePressed) {
    if(mouseButton == LEFT) {
    rx += (bsy-(float)mouseY)/30f;
    ry -= (bsx-(float)mouseX)/30f;
  } else if (mouseButton == RIGHT) {
    tx += mouseX - pmouseX;
    ty += mouseY - pmouseY;
  }
  }
}

void mouseWheel(MouseEvent event) {
  scale *= 1 - event.getCount()/20f;
}

boolean printDebug = true;
boolean autorotate = false;
boolean showCube = true;
boolean showAxes = false;

void keyPressed() {
  if (key == 's') {
    screenshot();
    screenLog("took a screenshot of " + width + " x " + height);
  } else if (key == 'd') {
    printDebug = !printDebug;
    screenLog("toggled debug view to " + printDebug);
  } else if (key == 'r') {
    autorotate = !autorotate;
    screenLog("toggled autorotation to " + autorotate);
  } else if (key == 'c') {
    showCube = !showCube;
    screenLog("toggled cube to " + showCube);
  } else if (key == 'a') {
    showAxes = !showAxes;
    screenLog("toggled axes to " + showAxes);
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
