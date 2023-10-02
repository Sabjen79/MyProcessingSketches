void Voronoi() {
  ArrayList<PVector> points = poissonDiskSampling(40, 80);
  
  float[][] p = new float[points.size()][2];
  
  for(int i = 0; i < points.size(); i++) {
    p[i][0] = points.get(i).x;
    p[i][1] = points.get(i).y;
  }
  
  MPolygon[] voronoi = (new Voronoi(p)).getRegions();
  
  for(MPolygon m : voronoi) {
    color[] c = {#FFFFFF, #B89E97, #DECCCC};
    
    vShapes.add(new VShape(c[int(random(2.9999))], m));
  }
}

class VShape {
  MPolygon p;
  color c;
  
  VShape(color c, MPolygon p) {
    this.c = c;
    this.p = p;
  }
  
  void draw() {
    r.fill(c, 150);
    r.noStroke();
    
    p.draw(r);
  }
}
