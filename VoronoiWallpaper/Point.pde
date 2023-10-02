int stage1 = 40;
int stage2 = 60;
int stage3 = 70;

color Color = #cfcfcf;

class Point {
  float x, y;
  float a = 0;
  MPolygon poly;
  
  float stage = 0;
   
  Point(MPolygon m) {
     poly = m;
     float[][] region = poly.getCoords();
     x = 0;
     y = 0;
     
     for(int i = 0; i < region.length; i++) {
       x += region[i][0];
       y += region[i][1];
     }
     
     x /= region.length;
     y /= region.length;
     ////////////////////////////////////////
     
     stage = 100*noiseO(x*0.007, y*0.013);
     a = pow(constrain(map(y, 0, height/2+100, 0.5, 1), 0.5, 1), 5);
  }
  
  void draw(PApplet p) {
    
    if(stage <= stage1) {
      drawPoint(p);
    } else if(stage <= stage2) {
      drawPoint(p);
      drawLines(p);
    } else if(stage <= stage3) {
      drawLines(p);
      drawShape(p);
    } else {
      drawShape(p);
    }
    
  }
  /////////////////////////////////////////////////////////
  void drawPoint(PApplet p) {
    noStroke();
    float s = map(stage, 0, stage2, -1, 1);
    float size = 2 - constrain(s, -1, 0)*2;
    float alpha = (1 - constrain(s, 0, 1));
    
    fill(lerpColor(#000000, Color, a*alpha));
    
    ellipse(x, y, size, size);
  }
  
  void drawLines(PApplet p) {
    stroke(lerpColor(#000000, Color, a));
    strokeWeight(0.6);
    noFill();
    
    float s = map(stage, stage1, stage3, -1, 1);
    float start = constrain(s, 0, 1);
    float end = 1 + constrain(s, -1, 0);
    
    float[][] region = poly.getCoords();
    for(int i = 0; i < region.length; i++) {
      line( lerp(x, region[i][0], start),
            lerp(y, region[i][1], start),
            lerp(x, region[i][0], end),
            lerp(y, region[i][1], end) );
    }
  }
  
  void drawShape(PApplet p) {
    float s = map(stage, stage3, 100, 0, 2);
    float alpha = constrain(s, 0, 1);
    
    stroke(lerpColor(#000000, Color, a), alpha*255);
    strokeWeight(1);
    fill(lerpColor(#000000, #222222, random(1)*a), alpha*255);
    
    float[][] region = poly.getCoords();
    beginShape();
    for(int i = 0; i < region.length; i++) {
      vertex(region[i][0], region[i][1]);
    }
    endShape(CLOSE);
  }
}
