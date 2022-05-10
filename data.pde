static class Ball{
  PVector pos;
  PVector v;
  float r;
  color c;
  
  static int w;
  static int h;
  
  static Ball[] balls;
  static void init(int wi, int he){
    w = wi;
    h = he;
    balls = new Ball[3];
    for(int i = 0; i < 3; i++){
      balls[i] = new Ball(new PVector(w/2, h/2), lerp(w/20, w/10, i/3), PVector.random2D().setMag(5), #330033);
    }
  }
  
  static void updateAll(){
   for (Ball e : balls){
     e.update();
   }
  }
  
  Ball(PVector pos, float radius, PVector v, color c){
    this.pos = pos.copy();
    r = radius;
    this.v = v.copy();
    this.c = c;
  }
  
  void update(){
    pos.add(v);
    if(pos.x < r) {
      pos.x = r;
      v.x*= -1;
    }
    if(pos.y < r) {
      pos.y = r;
      v.y*= -1;
    }
    if(pos.x > w - r) {
      pos.x = w - r;
      v.x*= -1;
    }
    if(pos.y > h - r) {
      pos.y = h - r;
      v.y*= -1;
    }
  }
  
}


float getValue(int x, int y) {
  PVector p = new PVector(x, y).sub(new PVector(width/ 2, height /2));
  return p.mag();
}
