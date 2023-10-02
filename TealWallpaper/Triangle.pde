class Triangle {
  float x, y;
  float size;
  boolean flip;
  
  int type = 1; // 0 - invisible, 1 - visible, 2 - big
  
  Triangle(float x, float y, float s, boolean flip) {
    this.x = x;
    this.y = y;
    this.size = s;
    this.flip = flip;
  }
  
  void draw() {
    if(type == 0) return;
    
    float z = pow(noise(x*0.003 + frameCount, y*0.003), 2)*600;
    float dist = pow(constrain(abs(x - width/2+ (noise(y*0.001 + frameCount)-0.5)*2*300), 0, 75)/75, 4);
    z *= dist;
    float radius = size/sqrt(3) - 5 * dist;//* map(noise(x*0.005, y*0.005), 0, 1, 0.8, 1);
    
    hires.fill(lerpColor(#007878, #000000, dist), 200);
    hires.stroke(225);
    hires.strokeWeight(0.7);
    
    for(int i = 0; i < 2; i++) {
      hires.beginShape();
      for(float angle = 0; angle < TWO_PI; angle += TWO_PI/3) {
        float a = angle - PI/2 + (flip ? PI : 0);
        hires.vertex(x+cos(a)*radius, y+sin(a)*radius, i*z);
      }
      hires.endShape(CLOSE);
    }
    
    //if(true) return;
    for(float angle = 0; angle < TWO_PI; angle += TWO_PI/3) {
      float a = angle - PI/2 + (flip ? PI : 0);
      hires.beginShape();
      hires.vertex(x+cos(a)*radius, y+sin(a)*radius, 0);
      hires.vertex(x+cos(a)*radius, y+sin(a)*radius, z);
      hires.vertex(x+cos(a+TWO_PI/3)*radius, y+sin(a+TWO_PI/3)*radius, z);
      hires.vertex(x+cos(a+TWO_PI/3)*radius, y+sin(a+TWO_PI/3)*radius, 0);
      hires.endShape(CLOSE);
    }
  
  }
  
}
