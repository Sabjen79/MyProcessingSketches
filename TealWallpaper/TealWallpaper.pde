ArrayList<Triangle> triangles;
float size = 30;

PGraphics hires;

void scaleTriangle() {
  
  int start = int(random(triangles.size()));
  int level = ceil(width*2/(size/2)) * (triangles.get(start).flip ? -1 : 1);
  int maxLevel = int(random(2, 5));
  
  ArrayList<Triangle> removal = new ArrayList<>();
  for(int i = 0; i < maxLevel; i++) {
    for(int j = 0; j <= i; j++) {
      int index = level*i + start;
      
      if(index-j < 0 || index+j >= triangles.size() || triangles.get(index-j).type != 1 || triangles.get(index+j).type != 1) return;
      
      removal.add(triangles.get( index+j ));
      removal.add(triangles.get( index-j ));
    }
  }
  
  for(Triangle t : removal) {
    t.type = 0;
  }
  
  Triangle t = triangles.get(start);
  t.type = 2;
  t.y += (t.flip ? -1 : 1) * t.size/sqrt(3)*(maxLevel-1);
  t.size *= maxLevel;
}

void setup() {
  //fullScreen(P3D);
  size(393, 852, P3D);
  
  hires = createGraphics(width*3, height*3, P3D);
  hires.smooth(8);
  
  
  frameRate(60);
  hires.hint(ENABLE_DEPTH_SORT);
  hires.hint(ENABLE_STROKE_PURE);
  hires.hint(DISABLE_OPTIMIZED_STROKE);
  hires.hint(ENABLE_STROKE_PERSPECTIVE);
  
  triangles = new ArrayList<>();
  boolean flip = true;
  
  for(float y = -height*1.5; y < height*1.5; y += size*sqrt(3)/2) {
    //flip = !flip;
    for(float x = -width/2; x < width*1.5; x += size/2) {
      triangles.add(new Triangle(x, y + (flip ? size*sqrt(3)/6 : 0), size, flip = !flip));
    }
  }
  
  
  for(int i = 0; i < 150; i++) scaleTriangle();
}

void draw() {
  hires.beginDraw();
  hires.ortho(-width*3/2, width*3/2, -height*3/2, height*3/2, -3000, 6000);
  hires.scale(3);
  hires.background(0);
  
  hires.translate(width/2, height/2);
  hires.rotateX(PI/2.8);
  hires.rotateZ((random(5) < 3 ? -1 : 1) * PI/15);
  hires.scale(1.1);
  hires.translate(-width/2, -height/2 + 500);
  
  for(Triangle t : triangles) {
    t.draw();
  }
  
  
  hires.endDraw();
  //hires.save("out/" + frameCount + ".tiff");
  scale(0.3333);
  image(hires, 0, 0);
  hires.clear();
  //setup();
}
