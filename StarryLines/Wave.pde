color c0 = #1F6878;
color c1 = #211f78;
color c2 = #401f78;

class Wave {
  float y;
  
  Wave(float y) {
    this.y = y;
  }
  
  void draw() {
    float y1 = y;
    
    
    r.strokeWeight(2);
    r.noFill();
    //r.beginShape();
    
    for(float x = 0; x < width; x += 2) {
      float y2 = y + OpenSimplex2S.noise2(frameCount, x*0.0030, y*0.0030)*80;
      
      float p = pow(abs(OpenSimplex2S.noise2(frameCount+2, x*0.001, y*0.001)), 1)*2;
      color c = (p < 1) ? lerpColor(c0, c1, p) : lerpColor(c1, c2, p-1);
      r.stroke(c);
      r.strokeWeight(abs(OpenSimplex2S.noise2(frameCount+1, x*0.001, y*0.001)*5)+1);
      
      r.line(x, y1, x+2, y2);
      
      y1 = y2;
    }
    
    //r.endShape();
  }
}
