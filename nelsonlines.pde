// user variables
int pad = 10; // frame padding
int xSpacing = 20; // distance between draw points 
int ySpacing = 4; // distance between lines
int wander = 1; // randomness in Y position

// don't touch these
int x=pad;
int y=pad;
int px, py;
int[] prevLineYs;
int count = 0;
Boolean firstPoint = true;
Boolean firstLine = true;

void setup() {
  size(500,500);
  background(255);
  frameRate(500);
  
  prevLineYs = new int[((width - (2*pad)) / xSpacing) + 1];
}

void draw() {
  int wanderY = ((firstLine) ? y : prevLineYs[count] + ySpacing) + round(random(wander * 2)) - wander; 
  
  if(!firstPoint) {
    line(px,py,x,wanderY);
  }
  
  prevLineYs[count] = wanderY;
  px=x;
  py=wanderY;
  x+=xSpacing;
  count++;
  
  if(firstPoint) firstPoint = false;
  
  if(x>width-pad) {
    firstPoint = true;
    firstLine = false;
    x=pad;
    y+=ySpacing;
    count=0;
  }
}
