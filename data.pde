static class Ball{
  PVector pos;
  PVector v;
  float r;
  
  static int w;
  static int h;
  static int c;
  
  static Ball[] balls;
  static void init(int wi, int he, int count){
    c = count;
    w = wi;
    h = he;
    balls = new Ball[count];
    for(int i = 0; i < count; i++){
      float radius = map(i, 0 , count, 20, w /5);
      PVector pos = PVector.random2D();
      
      pos.x *= w/2 - radius;
      pos.y *= h/2 - radius;
      pos.x += w/2;
      pos.y += h/2;

      balls[i] = new Ball(pos, radius, PVector.random2D().setMag(w/800));
    }
  }
  
  static void updateAll(){
   for (Ball e : balls){
     e.update();
   }
  }
  
  Ball(PVector pos, float radius, PVector v){
    this.pos = pos.copy();
    r = radius;
    this.v = v.copy();
  }
  
  void update(){  
    pos.add(v);
    
    //colision checking
   
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


float getValue(float x, float y) {
  float value = 0;
  for (Ball ball : Ball.balls){
    // r^2/(x−xi)^2+(y−yi)^2
    value += (pow(ball.r, 2))/
                    (pow(x - ball.pos.x, 2) + pow(y - ball.pos.y, 2));
  }
  return value;
}
