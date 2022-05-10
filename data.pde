static class Ball{
  PVector pos;
  PVector v;
  float r;
  
  static int w;
  static int h;
  static boolean booty = false;
  
  static Ball[] balls;
  static void init(int wi, int he, int count){
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

      balls[i] = new Ball(pos, radius, PVector.random2D().setMag(0.5));
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
  
  float getMass(){
    return PI * pow(r, 2);
  }
  
  void update(){
    PVector a = new PVector(0,0);
    //n booty sim
    if (booty){
      for(Ball b: Ball.balls){
        float magnitude = 0.2*b.getMass()/pow(r,2);

        PVector partialA = b.pos.copy().sub(pos).setMag(magnitude);
        a.add(partialA);
      }
    }    

    v.add(a);
    pos.add(v);
    
    //colision checking
    if (!booty){
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
  
}


float getValue(int x, int y) {
  float value = 0;
  for (Ball ball : Ball.balls){
    // r^2/(x−xi)^2+(y−yi)^2
    value += (pow(ball.r, 2))/
                    (pow(x - ball.pos.x, 2) + pow(y - ball.pos.y, 2));
  }
  return value;
}
