int xCount = 10;
int yCount = 10;

void setup(){
  size(400,400);
}

void draw(){
  background(0);
  pushStyle();
  strokeWeight(3);
  for(int x = 0; x < xCount; x++) {
    for(int y = 0; y < yCount; y++) {
      if(getValue(x * width / xCount,y * height / yCount) > 100) stroke(0, 0, 255);
      else stroke(255, 0, 0);
      point(x * width / xCount, y * height / yCount);
    }
  }
  popStyle();
  
}
