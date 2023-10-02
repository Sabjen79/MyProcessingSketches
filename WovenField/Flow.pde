float noiseValue = 0.002;

float noiseFunc(float x, float y) {
  int octaves = 2;
  float lacunarity = 4.0;
  float gain = 0.7;

  float result = 0;
  float maxresult = 0;
  //
  // Initial values
  float amplitude = 0.5;
  float frequency = 1.;
  //
  // Loop of octaves
  for (int i = 0; i < octaves; i++) {
    result += amplitude * noise(frequency*x, frequency*y);
    maxresult += amplitude;
    frequency *= lacunarity;
    amplitude *= gain;
  }
  
  return result / maxresult;
}

class Flow {
  float x, y;
  
  Flow(float x, float y) {
    this.x = x;
    this.y = y;
    
    addShapes();
  }
  
   void addShapes() {
    float xx = x;
    float yy = y;
    float angle = TWO_PI*noiseFunc(xx*noiseValue, yy*noiseValue);
    
    ArrayList<FlowShape> shapesToAdd = new ArrayList<>();
    
    int distance = 0;
      
    while(xx > 0 && xx < width && yy > 0 && yy < height) {
      if(!collides(xx, yy)) {
        shapesToAdd.add(new FlowShape(xx, yy, angle));
      } else break;
      
      angle = TWO_PI*noiseFunc(xx*noiseValue, yy*noiseValue);
      xx += cos(angle)*6;
      yy += sin(angle)*6;
      
      distance++;
    }
    
    if(distance > 10 && random(100) < 15) {
      for(FlowShape s : shapesToAdd) {
        s.c = #1098F7;
      }
    }
    
    shapes.addAll(shapesToAdd);
   }
}
