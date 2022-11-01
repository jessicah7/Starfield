Particle [] myStar = new Particle[250];

void setup() {
  size(800,600);
  noStroke();
  for(int i = 0; i < 50; i++) {
    myStar[i] = new OddballParticle();
  }
  for(int i = 50; i < myStar.length; i++) {
    myStar[i] = new Particle();
  }
}

void draw() {
  background(180, 217, 239);
  //pinata
  strokeWeight(2);
  stroke(255);
  line(456, 0, 443, 166);
  
  noStroke();
  fill(247, 134, 174);
  star(400, 300, 80, 150, 5);
  
  fill(59, 153, 11);
  triangle(276, 382, 267, 424, 282, 426);
  
  fill(132, 8, 174);
  ellipse(445, 160, 20, 20);
  triangle(278, 218, 256, 250, 272, 250);
  
  fill(242, 175, 19);
  ellipse(280, 215, 20, 20);
  triangle(545, 304, 539, 333, 557, 333);
  
  fill(255, 115, 0);
  ellipse(280, 385, 20, 20);
  triangle(445, 440, 442, 464, 461, 464);
  
  fill(59, 153, 11);
  ellipse(445, 435, 20, 20);
  
  fill(200, 16, 46);
  ellipse(545, 300, 20, 20);

  for(int i = 0; i < myStar.length; i++) {
    myStar[i].show();
    myStar[i].move();
  }
}

class Particle {
  int myX, myY;
  double mySpeed, myAngle;
  Particle() {
    myX = 400;
    myY = 300;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
  }
  void show() {
    //candy 
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    ellipse(myX, myY, 20, 20);
    triangle(myX - 20, myY + 10, myX - 5, myY, myX - 20, myY - 10);
    triangle(myX + 20, myY + 10, myX + 5, myY, myX + 20, myY - 10);
  }
  void move() {
     myX = myX + (int)(Math.cos(myAngle)*mySpeed);
     myY = myY + (int)(Math.sin(myAngle)*mySpeed);
     
     if(myX > 800 || myX < 0) 
       myX = 400;
     if(myY > 600 || myY < 0) 
       myY = 300;
  }
}

class OddballParticle extends Particle {
  OddballParticle() {
    myX = 400;
    myY = 300;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
  }
  
  void move() {
     myX = myX + (int)(Math.cos(myAngle)*mySpeed);
     myY = myY + (int)(Math.sin(myAngle)*mySpeed);
     
     if(myX > 800 || myX < 0) 
       myX = 400;
     if(myY > 600 || myY < 0) 
       myY = 300;
  } 
  
  void show() {
    fill(255, 255, 255);
    star(myX, myY, 12, 30, 5);
  }
}

//code from processing.org's star() function
void star(int x, int y, int radius1, int radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
