// user variables
int pad = 30; // frame padding
int xSpacing = 5; // distance between draw points 
int ySpacing = 3; // distance between lines
int wander = 1; // randomness in Y position

// don't touch these
int x,y,px,py,pw;
int[] prevLineYs;
int count = 0;
Boolean firstPoint = true;
Boolean firstLine = true;

void setup() {
  size(500,500);
  background(255);
  frameRate(500);
  
  x = y = px = py = pad;
  pw = 0;
  
  prevLineYs = new int[((width - (2*pad)) / xSpacing) + 1];
}

void draw() {
  int w = round(random(wander * 2)) - wander;
  int wanderY = pw + ((firstLine) ? py : prevLineYs[count] + ySpacing) + w; 
  
  if(!firstPoint) {
    wanderY = avg(py,wanderY);
    line(px,py,x,wanderY);
  }
  
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
