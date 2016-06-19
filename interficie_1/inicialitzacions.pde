void initColors() {
  bg = color(240,230,190);//color(255);//
  bg=color(187,187,170);
 
  llapisEixos = color(150);//color(0);
  llapis = color(255);//color(128);

  colorClasse[0] = color(255, 0, 60);
  colorAtenuat[0] = color(255, 102, 138);
  colorClasse[1] = color(0, 90, 255);
  colorAtenuat[1] = color(102, 156, 255);
  colorClasse[2] = color(0, 255, 255);
  colorAtenuat[2] = color(166, 255, 255);
//  colorClasse[3] = color(255, 255, 0);
  colorClasse[3] = color(255, 125, 0);
  colorAtenuat[3] = color(255, 177, 102);

}

void initEixos() {
  for (int i=0; i<N; i++) {
    float x = radi*cos(-HALF_PI+angle*i);
    float y = radi*sin(-HALF_PI+angle*i);
    eix[i] = new PVector(x, y);
    direccio[i] = new PVector(x,y);
    direccio[i].normalize();
  }
}

void initParametres() {
  for (int i=0; i<N; i++) {
    parametre[i] =random(1);
  }
}

void initInteraccio(){
  seleccio=-1;
}