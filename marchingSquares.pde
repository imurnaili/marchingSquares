int xCount = 10;
int yCount = 10;

void setup(){
  println(getValue(200,200));
  size(400,400);
}

void draw(){
  background(0);
  pushStyle();
  for(int x = 0; x < xCount; x++) {
    for(int y = 0; y < yCount; y++) {
      if(getValue(x,y) == 1) stroke(0, 0, 255);
      else stroke(0, 255, 0);
      point(x * width / xCount, y * height / yCount);
    }
  }
  popStyle();
  
}
