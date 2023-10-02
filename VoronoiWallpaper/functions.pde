float noiseO(float x, float y) {
  int octaves = 2;
  float lacunarity = 2.0;
  float gain = 0.5;
  
  float result = 0;
  float maxresult = 0;
  //
  // Initial values
  float amplitude = 0.5;
  float frequency = 1.;
  //
  // Loop of octaves
  for (int i = 0; i < octaves; i++) {
    result += amplitude * noiseT(frequency*x, frequency*y);
    maxresult += amplitude;
    frequency *= lacunarity;
    amplitude *= gain;
  }
  
  return result / maxresult; 
}

float noiseT(float x, float y) {
  return pow(constrain(map(noise(x, y, frameCount), 0, 1, 0, 1.4), 0, 1), 1);
}
