import megamu.mesh.*;

PGraphics r;

final int SCALE = 3;

ArrayList<Wave> waves;
ArrayList<Star> stars;
Delaunay myDelaunay;

void setup() {
  //fullScreen(P3D);
  size(1280, 720, P3D);
  
  r = createGraphics(width*SCALE, height*SCALE, P3D);
  r.smooth(8);
  smooth(8);
  frameRate(60);
  r.hint(ENABLE_DEPTH_SORT);
  r.hint(ENABLE_STROKE_PURE);
  r.hint(DISABLE_OPTIMIZED_STROKE);
  r.hint(ENABLE_STROKE_PERSPECTIVE);
}

void draw() {
  waves = new ArrayList();
  for(float y = height/2; y < height*1.3; y += 10) {
    waves.add(new Wave(y));
  }
  
  stars = new ArrayList();
  float[][] points = new float[1500][2];
  for(int i = 0; i < 1500; i++) {
    var star = new Star(random(width), random(height));
    stars.add(star);
    points[i][0] = star.x;
    points[i][1] = star.y;
  }
  
  myDelaunay = new Delaunay( points );
  
  r.beginDraw();
  r.ortho();
  
  r.background(#000000);
  r.scale(SCALE);
  setGradient(0, 0, width, height, #190d48, #000117, 0);
  
  r.translate(width/2, height/2);
  r.scale(1.2);
  r.translate(-width/2, -height/2);
  
  for(var s : stars) s.draw();
  for(var w : waves) w.draw();
  
  r.endDraw();
  r.save("out/" + frameCount + ".tiff");

  image(r, 0, 0, width, height);
  
  r.clear();
}
