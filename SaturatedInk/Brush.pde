float noiseValue = 0.0001;

color[] colors = {#E54846, #5D85AB, #A49386};

class Brush {
  float x, y;
  float dist;
  float size;
  color c;
  
  Brush(float x, float y) {
    this.x = x;
    this.y = y;
    
    dist = 20+pow(absnoise2(1000+x*0.005, y*0.005), 2)*150;
    size = 5+pow(random(1), 0.7)*10;
    
    c = editColor(colors[ int(random(2.999)) ]);
  }
  
  void draw() {
    float x1 = x;
    float y1 = y;
    
    float a = noiseO(x1*noiseValue, y1*noiseValue)*TWO_PI;
    
    for(float d = 0; d < dist; d += 1) {
      float s = pow(d/dist, 1.2)*size;
      r.noStroke();
      
      r.fill(c);
      r.ellipse(x1, y1, s/2, s/2);
      
      a = noiseO(x1*noiseValue, y1*noiseValue)*TWO_PI;
      
      x1 += cos(a)*1;
      y1 += sin(a)*1;
      
    }
  }
  
}
