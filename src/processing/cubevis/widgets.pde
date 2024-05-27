abstract class Widget extends DrawingContext{
  public float x, y, w, h;
  
  
  ArrayList<Widget> children = new ArrayList<Widget>();

  Widget() {
  }

  public abstract void update();

  public void updateChildren() {
    translate(x, y);
    children.forEach(e -> e.update());
  }

  void add(Widget widget) {
    children.add(widget);
  }

  void add(Widget[] widgets) {
    for (Widget widget : widgets) {
      children.add(widget);
    }
  }
  
  
  
}

class Window extends Widget {
  void update() {
    w = width;
    h = height;
    updateChildren();
  }
}

class Label extends Widget {
  //float x, y, w, h;
  String label;

  Label(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }

  void update() {
    rect(x, y, w, h);
    text(label, x+((w/2)-(textWidth(label)/2)), y+(h/2)+(textAscent()/2));
  }
}
