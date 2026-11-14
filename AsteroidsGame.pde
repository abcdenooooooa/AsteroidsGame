Spaceship ship = new Spaceship();
Particle[] p = new Particle[100];
Star[] s = new Star[1000];
int numParticles = 0;
float originX = 300,originY = 300;
double shipXDistToCenter, shipYDistToCenter;

public void setup(){
  size(600,600);
  background(0);
  for (int i = 0; i < s.length; i++){
    s[i] = new Star();
  }
}

public void draw(){
  noStroke();
  background(0);
  ship.move();
  ship.adjustToCenter();
  ship.show();
  shipXDistToCenter = ship.getX() - 300;
  shipYDistToCenter = ship.getY() - 300;
  originX -= shipXDistToCenter/5;
  originY -= shipYDistToCenter/5;
  for (int i = 0; i < numParticles; i++){
    p[i].move();
    p[i].adjust();
    p[i].show();
    p[i].fade();
  }
  for (int i = 0; i < s.length; i++){
    s[i].adjust();
    s[i].show();
  }
  text((int)ship.getXspeed(),50,300);
  text((int)ship.getYspeed(),50,315);
}

public void keyPressed(){
  ship.checkKey(key);
}

public void keyReleased(){
  ship.stopKey(key);
}

public void deleteParticle(int ind){
  p[ind] = null;
  for (int i = ind; i < numParticles; i++){
    p[i] = p[i + 1];
    if (p[i] != null){
    p[i].index = i;
    }
  }
  numParticles--;
}
