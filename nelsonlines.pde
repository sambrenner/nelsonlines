// user variables
int pad = 30; // frame padding
int xSpacing = 6; // distance between draw points 
int ySpacing = 6; // distance between lines
int wander = 2; // randomness in Y position

// don't touch these
int x,y,px,py,pw;
int[] prevLineYs;
int count = 0;
Boolean firstPoint = true;
Boolean firstLine = true;

void setup() {
  size(800,500);
  background(255);
  frameRate(500);
  
  x = y = px = py = pad;
  pw = 0;
  
  prevLineYs = new int[((width - (2*pad)) / xSpacing) + 1];
}

void draw() {
  int w = round(random(-wander - .5, wander + .5)); // .5 is so all numbers have equal probability after rounding
  int wanderY = pw + ((firstLine) ? py : prevLineYs[count] + ySpacing) + w; 
  
  if(!firstLine) wanderY = avg(py,wanderY);
  if(!firstPoint) line(px,py,x,wanderY);
  
  prevLineYs[count] = wanderY;
  px=x;
  py=wanderY;
  pw=w;
  x+=xSpacing;
  count++;
  
  if(firstPoint) firstPoint = false;
  
  if(x>width-pad) {
    firstPoint = true;
    firstLine = false;
    x=pad;
    y+=ySpacing;
    count=0;
    pw=0;
  }
}

int avg(int a, int b) {
  return (a + b) / 2;
}
