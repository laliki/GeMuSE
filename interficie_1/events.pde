void mouseReleased() {
  if (mode == EXPLORING)
    seleccio = -1;
}

void mousePressed() {
  if (mode == EXPLORING && seleccio == -1) {
    seleccio = comprovaSeleccio();
  }
}
void mouseDragged() {
  if (mode == EXPLORING && seleccio != -1) {
    float mx = mouseX-w/2;
    float my = mouseY-height/2;
    PVector m = new PVector(mx, my);
    float d=m.dot(direccio[seleccio]);
    d = constrain(d, 0, radi);
    parametre[seleccio] = d/radi;
    punt[seleccio].x = parametre[seleccio]*eix[seleccio].x;
    punt[seleccio].y = parametre[seleccio]*eix[seleccio].y;
  }
}

int comprovaSeleccio() {
  int sel = -1;
  int i=0;
  while (sel == -1 && i<N) {
    if (abs(mouseX-w/2-punt[i].x)<4 && abs(mouseY-height/2-punt[i].y)<4) {
      sel = i;
    }
    i++;
  }
  return sel;
}

void keyPressed() {
  if (key == 'm') {
    mode = (mode+1)%2;
    reset();
  } else if (mode == EXPLORING) {
    if (key=='1') {  
      Poligon p = new Poligon(parametre, 0);
      if (comprovaPoligon(p)) {
        poligons.add(p);
        OscMessage myOscMessage = new OscMessage("/data");
        myOscMessage.add(parametre);
        myOscMessage.add(1);
        oscP5.send(myOscMessage, myBroadcastLocation1);
      }
    }
    if (key=='2') {
      Poligon p = new Poligon(parametre, 1);
      if (comprovaPoligon(p)) {
        poligons.add(p);
        OscMessage myOscMessage = new OscMessage("/data");
        myOscMessage.add(parametre);
        myOscMessage.add(2);
        oscP5.send(myOscMessage, myBroadcastLocation1);
      }
    }
    if (key=='3') {
      Poligon p = new Poligon(parametre, 2);
      if (comprovaPoligon(p)) {
        poligons.add(p);
        OscMessage myOscMessage = new OscMessage("/data");
        myOscMessage.add(parametre);
        myOscMessage.add(3);
        oscP5.send(myOscMessage, myBroadcastLocation1);
      }
    }
    if (key=='4') {
      Poligon p = new Poligon(parametre, 3);
      if (comprovaPoligon(p)) {
        poligons.add(p);
        OscMessage myOscMessage = new OscMessage("/data");
        myOscMessage.add(parametre);
        myOscMessage.add(4);
        oscP5.send(myOscMessage, myBroadcastLocation1);
      }
    }
  }
}


void oscEvent(OscMessage missatgeArribat) {
  if (mode==PLAYING) {
    float[] nouPoligon=new float[N];
    int i;
    for (i=0; i<N; i++) {
      nouPoligon[i]= missatgeArribat.get(i).floatValue();
    }
    int  classe = (int)missatgeArribat.get(i).floatValue();
    poligons.add(new Poligon(nouPoligon, classe-1));
  }
}
