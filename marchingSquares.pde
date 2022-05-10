int xCount = 10;
int yCount = 10;

void setup(){
  size(400,400);
  Ball.init(width, height);
}

void draw(){
  background(0);
  pushStyle();
  strokeWeight(3);
  for(int x = 0; x < xCount; x++) {
    for(int y = 0; y < yCount; y++) {
      if(getValue(x * width / xCount,y * height / yCount) > 1) stroke(0, 0, 255);
      else stroke(255, 0, 0);
      point(x * width / xCount, y * height / yCount);
    }
  }
  popStyle();
  /*
  beginShape();
  int squareindex;
  float isoval = 0.5;
  for (int y = 0; y < yCount-1; y++) {
    for (int x = 0; x < xCount-1; x++) {
      squareindex = 0;
      if (getValue(x  , y  ) < isoval) squareindex |= 1;
      if (getValue(x+1, y  ) < isoval) squareindex |= 2;
      if (getValue(x+1, y+1) < isoval) squareindex |= 4;
      if (getValue(x  , y+1) < isoval) squareindex |= 8;
      int[] vals = triTable[squareindex];
      for (int i = 0; i < vals.length; i += 3) {
        float[] tri = { vals[i], 0, vals[i+1], 0, vals[i+2], 0 };
        for (int k = 0; k < 3; k++) {
          
        }
        triangle(tri[0], tri[1], tri[2], tri[3], tri[4], tri[5]);
      }
    }
  }
  endShape();*/
}
