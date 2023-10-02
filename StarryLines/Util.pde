void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  r.noFill();
  
  r.pushMatrix();
  r.translate(width/2, height/2);
  r.rotateZ(-PI/10);
  r.scale(1.5);
  r.translate(-width/2, -height/2);

  if (axis == 0) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      r.stroke(c);
      r.line(x, i, x+w, i);
    }
  }  
  else if (axis == 1) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      r.stroke(c);
      r.line(i, y, i, y+h);
    }
  }
  
  r.popMatrix();
}

float noiseO(float x, float y) {
  float n = OpenSimplex2S.noise2(frameCount, x, y);
  
  return n;
}
