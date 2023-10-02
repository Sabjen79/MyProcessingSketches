class Crystal {
  float x, y, z;
  float size;
  float angle, rot;
  
  Crystal(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.size = s * map(noise(x*0.3, y*0.3, noiseSeed), 0, 1, 0.8, 1.2);
    
    angle = random(-PI/8, PI/8);
    rot = -PI/2 + noise(x*0.05, y*0.05, noiseSeed)*PI*2;
    
    z = random(-100, 0);
  }
  
  void draw() {
    color c = #b36002;
    
    if(abs(noise(1000 + x*0.01, y*0.03, noiseSeed) - 0.5) < 0.1) c = lerpColor(#b36002, #45503B, y/height);
    
    c = lerpColor(c, #000000, pow(map(abs(y - height/2), 0, height/2, 0, 1), 5));
    
    r.stroke(0);
    r.strokeWeight(0.8);
    
    r.fill(c);
  
    r.pushMatrix();
    r.translate(x, y, z);
    r.rotateY(angle);
    r.rotateZ(rot);
    
    r.beginShape();
    
    r.vertex(0,  size/2);
    r.vertex( size/3, 0);
    r.vertex(0, -size/2);
    r.vertex(-size/3, 0);
    
    r.endShape(CLOSE);
    
    r.line(0, size/2, 0.2, 0, -size/2, 0.2);
    
    r.popMatrix();
  }
}
