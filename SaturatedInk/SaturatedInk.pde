import megamu.mesh.*;

PGraphics r;

ArrayList<Brush> brushes;

void setup() {
  hint(DISABLE_ASYNC_SAVEFRAME);
  //fullScreen(P3D);
  size(1280, 720, P3D);
  
  r = createGraphics(width*3, height*3, P3D);
  r.smooth(8);
  smooth(8);
  frameRate(60);
  
  
  
  brushes = new ArrayList<>();
  
  var disk = poissonDiskSampling(8, 20);
  for(int i = 0; i < disk.size(); i++) {
    brushes.add(new Brush(disk.get(i).x, disk.get(i).y));
  }
}

void draw() {
  r.beginDraw();
  r.ortho();
  
  r.background(#ECDFC8);
  r.scale(3);
  
  r.translate(width/2, height/2);
  r.scale(1.2);
  r.translate(-width/2, -height/2);
  
  for(var b : brushes) b.draw();
  
  
  r.get().save("out/" + frameCount + ".tiff");
  r.endDraw();
  image(r, 0, 0, width, height);
  
  r.clear();
  
  setup();
}
