import java.util.*;
import oscP5.*;
import netP5.*;

final int EXPLORING = 0;
final int PLAYING = 1;
int mode = EXPLORING;

int N = 3;
float radi;
float angle;

PVector[] eix = new PVector[N];
PVector[] direccio = new PVector[N];
float[] parametre = new float[N];
PVector[] punt = new PVector[N];

color bg;
color llapisEixos;
color llapis;
color[] colorClasse = new color[4];
color[] colorAtenuat = new color[4];

int w;
int posGUIX;
int posGUIY;

int seleccio;

ArrayList<Poligon> poligons = new ArrayList<Poligon>();

OscP5 oscP5;
NetAddress myBroadcastLocation;
//--
OscP5 oscP51;
NetAddress myBroadcastLocation1;
//---

void setup() {
size(450, 450);
  //size(750, 750);

  w = height;
  radi = min(width, height)/2-10;
  angle = TWO_PI/N;

  initColors();
  initEixos();
  initParametres();
  initInteraccio();

  oscP5 = new OscP5(this, 12000);
  myBroadcastLocation = new NetAddress("127.0.0.1", 12000);
  //--
  oscP51 = new OscP5(this, 57120);
  myBroadcastLocation1 = new NetAddress("127.0.0.1", 57120);
  //--
}

void draw() {
  background(bg);
  translate(w/2, height/2);
  dibuixaEixos();
  if (mode == EXPLORING) {
    if (frameCount%20==0)
      enviaParametres(); // envia a SC els parametres actuals
    calculaPunts(); // calcula els punts corresponents als parametres actuals
    dibuixaPoligonBlanc(); // dibuixa el poligon blanc
    dibuixaPoligons(); // dibuixa els poligons que ja estan avaluats
  } else {
    if (poligons.size()!=0) 
      dibuixaPoligonsSC();
  }

  stroke(0, 20);
  noFill();
  //  ellipse(0, 0, 2*radi, 2*radi);
}


void dibuixaEixos() {
  stroke(llapisEixos);
  noFill();
  for (int i=0; i<N; i++) {
    line(0, 0, eix[i].x, eix[i].y);
  }
}

void dibuixaPoligons() {
  for (Poligon t : poligons) {
    t.display();
  }
}

void dibuixaPoligonsSC() {
  int i;
  for (i=0; i<poligons.size()-1; i++) {
    Poligon t = poligons.get(i);  
    t.displayAtenuat();
  }
  Poligon t=poligons.get(i);
  t.display();
}

void enviaParametres() {
  OscMessage myOscMessage = new OscMessage("/parametres");
  for (int i=0; i<N; i++) {
    myOscMessage.add(parametre[i]);
  }
  oscP5.send(myOscMessage, myBroadcastLocation1);
}

void calculaPunts() {
  for (int i=0; i<N; i++) {
    punt[i] = new PVector(parametre[i]*eix[i].x, parametre[i]*eix[i].y);
  }
}

void dibuixaPoligonBlanc() {
  stroke(llapis);
  noFill();
  beginShape();
  for (int i=0; i<N; i++) {
    vertex(punt[i].x, punt[i].y);
  }
  endShape(CLOSE);
  fill(llapis);
  for (int i=0; i<N; i++) {
    ellipse(punt[i].x, punt[i].y, 7, 7);
  }
}

boolean comprovaPoligon(Poligon _p) {
  boolean accepta = true;
  Iterator itr = poligons.iterator();
  while (itr.hasNext() && accepta) {
    Poligon pol = (Poligon)itr.next();
    if (pol.igual(_p))
      accepta = false;
  }

  return accepta;
}

void reset() {
  poligons = new ArrayList<Poligon>();
}