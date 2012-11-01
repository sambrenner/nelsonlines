Line[] lines;
int interval = 10;
int numLines;

void setup() {
  size(800,800);
  background(0);
  setupLines();
}

void setupLines() {
  numLines = floor(height/interval);
  lines = new Line[numLines];
  stroke(255);
  
  for(int i=0; i<numLines; i++) {
    lines[i] = new Line(0, interval * i);
  }
}

void draw() {
  if(frameCount <= width) {
    for(int i=0; i<numLines; i++) {
      lines[i].render(frameCount);
    }
  }
}

class Line {
  private int _offsetX, _offsetY;
  
  Line(int offsetX, int offsetY) {
    _offsetX = offsetX;
    _offsetY = offsetY;
  }
  
  void render(int step) {
    point(_offsetX + step, _offsetY);
  }
}
