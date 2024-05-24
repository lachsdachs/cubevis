abstract class Widget {
  public float x,y,w,h;
  
  Widget() {}
  
  public abstract void update();
}

class Window extends Widget {
  ArrayList<Widget> children;
  
  void update() {
    children.forEach(e -> e.update());
  }
}

class DraggableLabel extends Widget {
  //float x, y, w, h;
  String label;
  
  DraggableLabel(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }
  
  void update() {
    rect(x,y,w,h);
    text(label, x+((w/2)-(textWidth(label)/2)), y+(h/2)+(textAscent()/2));
  }
}




//abstract class Widget {
//  float x,y,w,h;
//  ArrayList<Widget> children;
  
//  Widget(float x, float y, float w, float h) {
//    this.x = x;
//    this.y = y;
//    this.w = w;
//    this.h = h;
//  }
  
//  Widget() {}
  
//  public abstract void update();
//}



//abstract class Widget {
//  float x,y,w,h;
//  ArrayList<Widget> children;
  
//  Widget(float x, float y, float w, float h) {
//    this.x = x;
//    this.y = y;
//    this.w = w;
//    this.h = h;
//  }
  
//  Widget() {}
  
//  public void update() {
//    children.forEach(e -> e.update());
//  };
  
//  abstract protected void render();
//}
//
//
//class SimpleTile extends Widget {
  
//  void update() {
    
//  }
  
//  void render() {
    
//  }
//}
