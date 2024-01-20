import gab.opencv.*;
import peasy.*;

PeasyCam cam;
PImage src, dst;
OpenCV opencv;
int j = 0;
ArrayList<Contour> contours;
ArrayList<PVector> loc ;
float time = 0;

ArrayList<PVector> path = new ArrayList<PVector>();
FloatList x = new FloatList();
FloatList y = new FloatList();
ArrayList<Circle> fourierY;
ArrayList<Circle> fourierX;

String fontFile = "parisienne.regular.ttf";
String text = "F.F.T.";
int fontSize = 350;
int stepSize = 5;

void setup() {
  createImage(text,fontSize);

  size(1200, 600, P3D);
  cam = new PeasyCam(this, 500);
  background(0);


  loc = getPoints("/images/" + text+".png");
  println(loc.size());

  for (int i = 0; i < loc.size(); i = i + stepSize) {
    x.append(loc.get(i).x);
    y.append(loc.get(i).y);

    // x.append(map(loc.get(i).x,0,100,0,1000));
    // y.append(map(loc.get(i).y,0,100,0,1000));
  }
  fourierX = bubbleSort(dft(x));
  fourierY = bubbleSort(dft(y));
}

void draw() {
    background(0, 0);
    
    PVector v_x = epiCycle(width/2 + 100, 200, 0, fourierX);
    PVector v_y = epiCycle(100, height/2 + 100, HALF_PI, fourierY);
    PVector vec = new PVector(v_x.x, v_y.y);

    line(v_x.x, v_x.y, vec.x, vec.y);
    line(v_y.x, v_y.y, vec.x, vec.y);

    path.add(vec);
    noFill();

    beginShape();
    stroke(255,248,21);
    strokeWeight(3);
    for (int i = 0; i < path.size(); i++) {
        if (i != 0) {
          if (abs((path.get(i).mag()-path.get(i-1).mag()))<20) {
            //stroke(90,255,255);
            line(path.get(i).x, path.get(i).y,path.get(i-1).x, path.get(i-1).y);
          }
        }
    }
    endShape();
    strokeWeight(1);
    float dt = TWO_PI / fourierY.size();
    time += dt;

    if (time > TWO_PI) {
        time = 0;
        path = new ArrayList<PVector>();
        noLoop();
    }
    //delay(100);
}
