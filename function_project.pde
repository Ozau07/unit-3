

color blue = #0000ff;
color white = (255);
color black = (0);
color yellow = #ffff00;
color red = #ff0000;
color pink =  #ff00ff;
color green = #2D5A27;
color[] colors;


void setup() {
  colors = new color[6];
  colors[0] = blue;
  colors[1] = white;
  colors[2] = black;
  colors[3] = yellow;
  colors[4] = red;
  colors[5] = pink;



  size(1000, 800);
  float star = 0;
  float starv1 = 10;
  float background = 0;
  float backgroundv1 = 100;
  float backgroundv2 = 0;
  float backgroundv3 = 0;
  float backgroundv4 = 0;
  //background
  while (background<=1000) {
    strokeWeight(0);
    fill(10, backgroundv3, backgroundv1);
    rect(0, backgroundv2, 1000, 1);
    backgroundv1=backgroundv1+0.4;
    backgroundv3=backgroundv3+0.5;
    backgroundv2 = backgroundv2+1;
    backgroundv4 = backgroundv4+1;
    background = background + 1;
  }

  int x, y;
  x=50;
  y=50;
  int c = 0;
  while (y < 800) {
    c = (int) random (0, 5);

    leaf(50, y, 0.5, color(green));
    leaf(900, y, 0.5, color(green));

    while (star<=50) {
      star(random(0, 1000), random(0, 100), random(0.4, 0.6));
      star =star+1;
      starv1= starv1+50;
    }


    pikmin(x, y, 0.25, colors[c]);
    x = x+40;
    if (x >= 800) {
      x=50;
      y=y + 50;
    }
  }
}
void draw() {
  //background(255);
  //pikmin(500, 500, 0.25);
}





//leaf
void leaf(float x, float y, float s, color c) {
  pushMatrix();
  translate(x, y);
  scale(s);
  leafCenter();
  leafBody();
  leafPattern();
  popMatrix();
}




void leafCenter() {
  strokeWeight(2);
  stroke(0);
  fill(0, 128, 0);
  ellipse(100, 300, 25, 25);
}
void leafBody() {
  noStroke();
  fill(0, 128, 0);
  ellipse(100, 280, 20, 50);
  ellipse(120, 300, 50, 25);
  ellipse(100, 320, 20, 50);
  ellipse(80, 300, 50, 25);
}
void leafPattern() {
  strokeWeight(2);
  stroke(0);
  int x = 100;
  int y = 290;
  while (y >= 256) {
    line(x, y, x, y - 34);
    y -= 20;
  }

  y = 300;
  int xStart = 56;
  int xEnd = 144;
  while (xStart <= xEnd) {
    line(xStart, y, xStart + 68, y);
    xStart += 68;
  }
  y = 273;
  while (y <= 340) {
    line(x, y, x - 9, y - 13);
    line(x, y, x + 9, y - 13);
    y += 7;
  }
  int xCv1=100;
  int ySv1=100;
  int yEv1=300;
  int yv1= ySv1;
  while (yv1<=yEv1) {
    int linelength=50;
    line(xCv1-linelength, yv1, xCv1 +linelength, yv1);
    yv1+= 20;
  }
}

//star
void star(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  starbody();
  starlight();
  popMatrix();
}

void starbody() {
  fill(white);
  quad(0, 0, 10, 5, 20, 0, 10, -5);
  quad(10, 10, 5, 0, 10, -10, 15, 0);
}

void starlight() {
  float starv3 = 0;
  float starv2 = 20;
  float starv4 = 90;
  while (starv3 <= 20) {
    fill(0, 0, 0, 0);
    stroke(255, 255, 255, starv4);
    circle(10, 0, starv2);
    starv3 = starv3 + 1;
    starv2 = starv2 + 3;
    starv4 = starv4 - 2;
  }
}


void pikmin(float x, float y, float s, int c) {
  //println("pikmin");
  pushMatrix();
  translate(x, y);
  scale(s);
  pikminbody(c);
  pikminhead(c);
  pikminhand(c);
  pikminfeet(c);
  pikminbodylogo(500, 50, 10);
    popMatrix();
}

void pikminbody(color c) {
  fill(c);
  ellipse(500, 575, 45, 115);
}

void pikminhead(color c) {
  noStroke();
  fill(c);
  ellipse(500, 493, 70, 100);
  fill(white);
  ellipse(475, 490, 25, 20);
  fill(black);
  ellipse(475, 490, 12, 12);
  fill(white);
  ellipse(525, 490, 25, 20);
  fill(black);
  ellipse(525, 490, 12, 12);
  fill(c);
  triangle(485, 480, 500, 350, 515, 480);
}

void pikminfeet(color c) {
  fill(c);
  rect(485, 620, 10, 40);
  rect(505, 620, 10, 40);
  ellipse(490, 660, 5, 15);
  ellipse(510, 660, 5, 15);
  pushMatrix();
  translate(width/ 2, height/ 2);
  fill(c);
  rotate(radians(225));
  ellipse(-175, -195, 5, 10);
  ellipse(-189, -182, 5, 10);
  rotate(radians(270));
  ellipse(175, -195, 5, 10);
  ellipse(189, -182, 5, 10);
  popMatrix();
}

void pikminhand(color c) {
  pushMatrix();
  translate(width/ 2, height/ 2);
  fill(c);
  rotate(radians(225));
  ellipse(-150, -97, 50, 10);
  fill(c);
  rotate(radians(270));
  ellipse(150, -97, 50, 10);
  popMatrix();
}
void pikminbodylogo(float x, float y, int count) {
  float currentY = y;
float size = 20;
int i = 0;
while (i < count) {
  fill(0, 100, 0);
  ellipse(x, currentY, size, size);
  fill(255);
  ellipse(x, currentY, size * 0.5, size * 0.5);
  y += size * 1.5;
  i = i + 1;
}
}
