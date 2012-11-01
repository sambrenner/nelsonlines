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
      Line currentLine = lines[i];
      currentLine.updatePosition();
      currentLine.render(frameCount);
    }
  }
}

class Line {
  private int _offsetX, _offsetY, _y;
  
  Line(int offsetX, int offsetY) {
    _y = 0;
    _offsetX = offsetX;
    _offsetY = offsetY;
  }
  
  void updatePosition() {
    _y = _y + floor(random(3)) - 1;
  }
  
  void render(int step) {
    point(_offsetX + step, _offsetY + _y);
  }
}
