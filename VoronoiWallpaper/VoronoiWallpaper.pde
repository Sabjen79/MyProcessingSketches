import processing.svg.*;

import megamu.mesh.*;

ArrayList<Point> points;
int NUM = 3000;
PGraphics hires;

void setup() {
  size(393, 852, P3D);
  smooth(8);

  float[][] p = new float[NUM][2];
  
  for(int i = 0; i < NUM; i++) {
    p[i][0] = random(width);
    p[i][1] = random(height);
  }
  
  MPolygon[] v = (new Voronoi(p)).getRegions();
  
  points = new ArrayList<>();
  for(int i = 0; i < NUM; i++) {
    points.add(new Point(v[i]));
  }
  
  //beginRecord(SVG, "out/frame-####.svg");
}

void draw() {
  background(0);
  translate(width/2, height/2);
  scale(1.2);
  translate(-width/2, -height/2);
  
  
  for(int i = 0; i < points.size(); i++) {
    points.get(i).draw(this);
  }
  
  //endRecord();
  setup();
}
