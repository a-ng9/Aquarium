int numBubbles = 100;
Bubble[] bubbles = new Bubble[numBubbles]; // array of ball objects

int numFish = 1;
Fish[] fishes;  // array to hold all the fishies

PImage bgImg;


void setup() {
  size(1080, 800);
  bgImg = loadImage("background.png");

  //Bubbles loop
  for (int i=0; i<numBubbles; i++) { 
    bubbles[i] = (new Bubble());
  }

  fishes = new Fish[numFish];
  for (int i=0; i<numFish; i++) { 
    fishes[i] = (new Fish());
  }
}

void draw() {
  background(bgImg);
  for (int i=0; i<fishes.length; i++) {
    fishes[i].display();
    //fishes[i].movement();
  }
  stroke(250, 250, 250);
  strokeWeight(2);
  noFill();
  ////Declaring all Bubble animations in a loop
  for (int i=0; i<bubbles.length; i++) {
    bubbles[i].movement();
    bubbles[i].display();
    bubbles[i].border();
  }
}

// ball class
class Bubble {
  float x = random(width);

  float y = 680;
  float diameter = random(3, 20);
  float xspeed = random(1);
  float yspeed = random(-1.5, -.1);


  void movement() {
    //this.x += this.xspeed;
    this.y += this.yspeed;
  }

  void display() {
    circle(x, y, this.diameter);
  }

  void border() {
    //if (this.x > 1080 || this.x <0 ) {
    //  this.xspeed = this.xspeed * -1;
    //}
    if (this.y > 800 || this.y <0 ) {
      this.x = random(width);
      this.y = 680;
      //this.yspeed = this.yspeed * -1;
    }
  }
}

class Fish {
  float X = width/2;
  float Y = height/2;

  float bodyLength = 120;
  float bodyHeight = 100;
  int bodyColor = color(100, 200, 50);

  float tailWidth = bodyLength/4;
  float tailHeight = bodyHeight/2;

  float xspeed = random(1);
  float yspeed = random(-.01, .01);


  void display() {
    noStroke();
    fill(bodyColor);

    // body
    ellipse(X, Y, bodyLength, bodyHeight);

    // tail
    triangle(X-bodyLength/2, Y, 
      X-bodyLength/2-tailWidth, Y-tailHeight, 
      X-bodyLength/2-tailWidth, Y+tailHeight);

    // eye
    fill(33, 33, 33);
    ellipse(X+bodyLength/4, Y-10, bodyHeight/5, bodyHeight/5);

    //mouth
    noFill();
    stroke(0);
    /////Neutral
    line(X, Y+20, X+53, Y+20);
    /////Smile
    //bezier(X, Y+10, X+10, Y+15, X+25, Y+20, X+53, Y+20);
    /////Sad
    //bezier(X, Y+30, X+10, Y+25, X+25, Y+20, X+53, Y+20);
  }

  void movement() {
    this.Y += this.yspeed;
    this.X += this.xspeed;
  }
}
