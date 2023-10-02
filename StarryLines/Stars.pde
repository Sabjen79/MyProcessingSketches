void drawConnections() {
  float[][] myEdges = myDelaunay.getEdges();

  for(int i=0; i<myEdges.length; i++)
  {
    float startX = myEdges[i][0];
    float startY = myEdges[i][1];
    float endX = myEdges[i][2];
    float endY = myEdges[i][3];
    
    if(dist(startX, startY, endX, endY) > 15) continue;
    
    r.strokeWeight(1);
    r.noFill();
    r.stroke(#fbffe3, pow((1-endY/height), 2)*150);
    r.line( startX, startY, endX, endY );
  }
}

class Star {
  float x, y;
  float s;
  
  Star(float x, float y) {
    this.x = x;
    this.y = y;
    s = random(1, 3);
  }
  
  void draw() {
    r.noStroke();
    r.fill(#fbffe3, pow((1-y/height), 2)*150);
    
    r.ellipse(x, y, s, s);
    
    if(random(1) > 0.1) return;
    
    r.noFill();
    r.strokeWeight(s/2);
    r.beginShape();
    for(float len = 0; len < 70; len += 10) {
      r.stroke(#fbffe3, (1-len/70)*150*pow((1-y/height), 2));
      r.vertex(x + cos(-PI/10)*len, y + sin(-PI/10)*len);
    }
    r.endShape();
  }
}
