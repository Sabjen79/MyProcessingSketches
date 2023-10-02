class FlowShape {
  float x, y;
  float angle;
  float size;
  float type;
  
  color c;
  
  FlowShape prev;
  
  FlowShape(float x, float y, float a, color c) {
    this.x = x;
    this.y = y;
    this.angle = a;
    
    this.c = c;
    
    if(this.c == 0) {
      for(VShape shape : vShapes) {
        if(inShape(x, y, shape.p)) {
          this.c = shape.c;
          break;
        }
      }
    }
    
    type = random(10);
  }
  
  FlowShape(float x, float y, float a) {
    this(x, y, a, 0);
  }
  
  
  
  void draw() {
    
    r.fill(c);
    //r.stroke(200, 0, 0);
    
    r.rectMode(CENTER);
    r.pushMatrix();
    r.translate(x, y);
    r.rotateZ(angle);
    
    r.ellipse(0, 0, 5, 2.5);
    
    r.popMatrix();
  }
}
