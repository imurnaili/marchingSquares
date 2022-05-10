float getValue(int x, int y) {
  PVector p = new PVector(x, y).sub(new PVector(width/ 2, height /2));
  return p.mag();
}
