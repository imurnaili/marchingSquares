int xCount = 50;
int yCount = 50;

void setup(){
  frameRate(60);
  size(400,400);
  Ball.init(width, height);
}

int getXCoord(int x) {
  return x * width / xCount;
}

int getYCoord(int y) {
  return height-(y * height / yCount);
}

void draw(){
  background(0);
  Ball.updateAll();
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
  
  
  int squareindex;
  float isoval = 1.0;
  for (int y = 0; y < yCount-1; y++) {
    for (int x = 0; x < xCount-1; x++) {
      squareindex = 0;
      if (getValue(getXCoord(x),   getYCoord(y))   >= isoval) squareindex |= 1;
      if (getValue(getXCoord(x+1), getYCoord(y))   >= isoval) squareindex |= 2;
      if (getValue(getXCoord(x+1), getYCoord(y+1)) >= isoval) squareindex |= 4;
      if (getValue(getXCoord(x),   getYCoord(y+1)) >= isoval) squareindex |= 8;
      //if (squareindex > 0) print(squareindex + ":");
      int[] vals = triTable[squareindex];
      for (int i = 0; i < vals.length; i += 3) {
        if (vals[i] == 0) break;
        int[] tri = { vals[i], 0, vals[i+1], 0, vals[i+2], 0 };
        for (int k = 0; k < 3; k++) {
          if (tri[k*2] == 1) {
              tri[k*2] = getXCoord(x);
              tri[k*2+1] = getYCoord(y);
          }
          if (tri[k*2] == 2) {
              tri[k*2] = getXCoord(x+1);
              tri[k*2+1] = getYCoord(y);
          }
          if (tri[k*2] == 3) {
              tri[k*2] = getXCoord(x+1);
              tri[k*2+1] = getYCoord(y+1);
          }
          if (tri[k*2] == 4) {
              tri[k*2] = getXCoord(x);
              tri[k*2+1] = getYCoord(y+1);
          }
          if (tri[k*2] == 5) {
              tri[k*2] = getXCoord(x) + (getXCoord(x+1) - getXCoord(x)) / 2;
              tri[k*2+1] = getYCoord(y);
          }
          if (tri[k*2] == 6) {
              tri[k*2] = getXCoord(x+1);
              tri[k*2+1] = getYCoord(y) + (getYCoord(y+1) - getYCoord(y)) / 2;
          }
          if (tri[k*2] == 7) {
              tri[k*2] = getXCoord(x) + (getXCoord(x+1) - getXCoord(x)) / 2;
              tri[k*2+1] = getYCoord(y+1);
          }
          if (tri[k*2] == 8) {
              tri[k*2] = getXCoord(x);
              tri[k*2+1] = getYCoord(y) + (getYCoord(y+1) - getYCoord(y)) / 2;
          }
        }
        //if (tri[0] > 0) println(tri[0] + ":" + tri[1] + ":" + tri[2] + ":" + tri[3] + ":" + tri[4] + ":" + tri[5]);
        triangle(tri[0], tri[1], tri[2], tri[3], tri[4], tri[5]);
      }
    }
  }
}
