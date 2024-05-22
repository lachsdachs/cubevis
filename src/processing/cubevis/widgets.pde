// a widget is a rectangular tile that may subcontain other tiles.
// it has a bunch of properties and methods for updating and displaying it.

class Widget {
  //constructed properties go here
  PVector pos;
  PVector size;
  
  //run-time properties go here
  float x,y; //position
  float w,h; //size
  
  Widget(float posX, float posY, float w_, float h_) {
    pos = new PVector(posX, posY);
    size = new PVector(w_, h_);   
    
    x = posX;
    y = posY;
    w = w_;
    y = h_;
  }
  
  //empty constructor. This should not need to exist.
  Widget() {}
  
  //check for input and recalculate all the variables to see if rendering is needed
  void update() {
    
  }
  
  //render. first render self and then children if needed.
  void render() {
    
  }
}




// examples for testing and figuring out what i'm gonna do

class SimpleTile extends Widget {
  
  void update() {
    
  }
  
  void render() {
    
  }
}
