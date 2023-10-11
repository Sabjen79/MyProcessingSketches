float noiseO(float x, float y) {
  int octaves = 2;
  float lacunarity = 5.0;
  float gain = 0.3;
  
  float result = 0;
  float maxresult = 0;
  //
  // Initial values
  float amplitude = 1.;
  float frequency = 1.;
  //
  // Loop of octaves
  for (int i = 0; i < octaves; i++) {
    result += amplitude * noise2(frequency*x, frequency*y);
    maxresult += amplitude;
    frequency *= lacunarity;
    amplitude *= gain;
  }
  
  return result / maxresult; 
}

float noise2(float x, float y) {
  return OpenSimplex2S.noise2(frameCount, x, y);
}

float absnoise2(float x, float y) {
  float noise = OpenSimplex2S.noise2(frameCount, x, y);
  
  return abs(noise);
}

color editColor(color c) {
  return lerpColor(#000000, c, 0.5 + 0.5*pow(random(1), 0.3));
}
