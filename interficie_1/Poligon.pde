class Poligon {
  float[] p;
  PVector[] pt;
  int clas;

  Poligon(float[] _p, int _c) {
    p = new float[N];
    for (int i=0; i<N; i++) {
      p[i]=_p[i];
    }

    clas = _c;
    pt = new PVector[N];
    calculaPuntsPoligon();
  }

  void display() {
    stroke(colorClasse[clas]);
    noFill();
    beginShape();
    for (int i=0; i<N; i++) {
      vertex(pt[i].x, pt[i].y);
    }
    endShape(CLOSE);
    fill(colorClasse[clas]);
    for (int i=0; i<N; i++) {
      ellipse(pt[i].x, pt[i].y, 4, 4);
    }
  }

  void displayAtenuat() {
    //stroke(colorClasse[clas],125);
    stroke(colorAtenuat[clas]);
    noFill();
    beginShape();
    for (int i=0; i<N; i++) {
      vertex(pt[i].x, pt[i].y);
    }
    endShape(CLOSE);
    //fill(colorClasse[clas],125);
    fill(colorAtenuat[clas]);
    for (int i=0; i<N; i++) {
      ellipse(pt[i].x, pt[i].y, 5, 5);
    }
  }

  void calculaPuntsPoligon() {
    for (int i=0; i<N; i++) {
      pt[i] = new PVector(p[i]*eix[i].x, p[i]*eix[i].y);
    }
  }
  
  boolean igual(Poligon _p){
    boolean match=true;
    
    for(int i=0; i<N && match ;i++){
      if(p[i]!=_p.p[i])
      match = false;
    }
    
    return match;
  }
}