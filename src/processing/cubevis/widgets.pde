class Style {
  Style() {}
  
  Style(Runnable style) {
    this.style = style;
  }
  
  void apply() {
    style.run();
  }
  Runnable style = () -> System.out.println("Warning: someone just applied an empty style");
}

abstract class Widget {
  public float x, y, w, h;
  Style style = new Style();
  
  
  ArrayList<Widget> children = new ArrayList<Widget>();

  public abstract void update();

  public void updateChildren() {
    pushMatrix();
    pushStyle();
    translate(x, y);
    children.forEach(e -> e.update());
    popMatrix();
    popStyle();
  }

  Widget add(Widget widget) {
    children.add(widget);
    return(this);
  }
  
  Widget add(Widget[] widgets) {
    for(Widget widget : widgets) {
      children.add(widget);
    }
    return(this);
  }
  
  public Widget style(Style style) {
    this.style = style;
    return(this);
  }
  
  public Widget style(Runnable style) {
    this.style.style = style; // T I H I
    return(this);
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
    style.apply();
    rect(x, y, w, h);
    text(label, x+((w/2)-(textWidth(label)/2)), y+(h/2)+(textAscent()/2));
  }
}
