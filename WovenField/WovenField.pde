import megamu.mesh.*;

PGraphics r;

ArrayList<Flow> flows;
ArrayList<FlowShape> shapes;
ArrayList<VShape> vShapes;

boolean finishedThread = false;

void setup() {
  //fullScreen(P3D);
  size(1280, 720, P3D);
  
  r = createGraphics(width*3, height*3, P3D);
  r.smooth(8);
  smooth(8);
  frameRate(60);
  r.hint(ENABLE_DEPTH_SORT);
  r.hint(ENABLE_STROKE_PURE);
  r.hint(DISABLE_OPTIMIZED_STROKE);
  r.hint(ENABLE_STROKE_PERSPECTIVE);
  
  flows = new ArrayList<Flow>();
  shapes = new ArrayList<FlowShape>();
  vShapes = new ArrayList<>();
  
  Voronoi();
  thread("addPoints");
}

void addPoints() {
  
  for(int i = 0; i < 10000; i++) {
    flows.add(new Flow(random(width), random(height)));
  }
  
  for(float x = 0; x < width; x+= 5) {
     for(float y = 0; y < height; y += 5) {
       flows.add(new Flow(x, y));
     } 
  }
  finishedThread = true;
}

void draw() {
  if(!finishedThread) return;
  
  r.beginDraw();
  r.ortho();
  
  r.background(#000000);
  r.scale(3);
  
  r.translate(width/2, height/2);
  r.scale(1.2);
  r.translate(-width/2, -height/2);
  
  for(int i = 0; i < vShapes.size(); i++) {
    //vShapes.get(i).draw();
  }
  
  for(int i = 0; i < shapes.size(); i++) {
    shapes.get(i).draw();
  }
  
  r.endDraw();
  //r.save("out/export####.tiff");

  image(r, 0, 0, width, height);
  
  r.clear();
  
  //setup();
}
