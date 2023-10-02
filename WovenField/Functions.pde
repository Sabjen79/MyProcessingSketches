boolean collides(float x, float y) {
  for(int i = shapes.size()-1; i >= 0; i--) {
    if(dist(x, y, shapes.get(i).x, shapes.get(i).y) < 4) return true;
  }
  
  return false;
}

boolean inShape(float x, float y, MPolygon m) {
  int intersections = 0;
  
  float[][] coords = m.getCoords();
  
  for(int i = 0; i < coords.length; i++) {
    if(lineIntersects(x-200, y, x, y, coords[i][0], coords[i][1], coords[(i+1)%coords.length][0], coords[(i+1)%coords.length][1])) intersections++;
  }
  
  return (intersections%2 == 1);
}

boolean lineIntersects(float v1x1, float v1y1, float v1x2, float v1y2, float v2x1, float v2y1, float v2x2, float v2y2) {
  float o1 = orientation(v1x1, v1y1, v1x2, v1y2, v2x1, v2y1);
  float o2 = orientation(v1x1, v1y1, v1x2, v1y2, v2x2, v2y2);
  float o3 = orientation(v2x1, v2y1, v2x2, v2y2, v1x1, v1y1);
  float o4 = orientation(v2x1, v2y1, v2x2, v2y2, v1x2, v1y2);
  
  if(o1 != o2 && o3 != o4) return true;
  
  if(o1 == 0 && onSegment(v1x1, v1y1, v2x1, v2y1, v1x2, v1y2)) return true;
  if(o2 == 0 && onSegment(v1x1, v1y1, v2x2, v2y2, v1x2, v1y2)) return true;
  if(o3 == 0 && onSegment(v2x1, v2y1, v1x1, v1y1, v2x2, v2y2)) return true;
  if(o4 == 0 && onSegment(v2x1, v2y1, v1x2, v1y2, v2x2, v2y2)) return true;
  
  return false;
}

boolean onSegment(float x, float y, float x1, float y1, float x2, float y2) {
  return (x <= max(x1, x2) && x >= min(x1, x2) && y <= max(x1, x2) && y >= min(x1, x2));
}

int orientation(float x1, float y1, float x2, float y2, float x3, float y3) {
  float val = (y2 - y1) * (x3 - x2) - (x2 - x1) * (y3 - y2);
  
  if(val == 0.0f) return 0;
  
  return (val > 0) ? 1 : 2;
}
