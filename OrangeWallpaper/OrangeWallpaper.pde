PGraphics r;

ArrayList<Crystal> crystals;
int noiseSeed = 0;

void setup() {
  //fullScreen(P3D);
  size(393, 852, P3D);
  
  r = createGraphics(width*3, height*3, P3D);
  r.smooth(8);
  smooth(8);
  frameRate(60);
  r.hint(ENABLE_DEPTH_SORT);
  r.hint(ENABLE_STROKE_PURE);
  r.hint(DISABLE_OPTIMIZED_STROKE);
  r.hint(ENABLE_STROKE_PERSPECTIVE);
  
  reset();
  
}

void draw() {
  r.beginDraw();
  r.ortho();
  //r.camera(width/2, height/2, (height/2.0) / tan(PI*30.0 / 180.0), width/2, height/2, 0, 0, 1, 0);
  r.background(#1A1E16);
  r.scale(3);
  
  r.translate(width/2, height/2);
  r.scale(1.2);
  r.translate(-width/2, -height/2);
  
  for(int i = 0; i < crystals.size(); i++) {
    crystals.get(i).draw();
  }
  
  r.endDraw();
  r.save("out/" + frameCount + ".tiff");
  scale(0.3333333);
  image(r, 0, 0);
  
  reset();
  r.clear();
}

void reset() {
  crystals = new ArrayList<Crystal>();
  
  for(float x = 0; x < width; x += width/25) {
    for(float y = 0; y < height; y += height/55) {
      crystals.add(new Crystal(x + random(-5, 5), y + random(-5, 5), 30));
    }
  }
  
  noiseSeed += 10;
}
