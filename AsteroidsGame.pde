Spaceship ship = new Spaceship();
ArrayList<Particle> p = new ArrayList<Particle>();
Star[] s = new Star[500];
ArrayList<Asteroid> a = new ArrayList<Asteroid>();
float originX = 300,originY = 300;
double shipXDistToCenter, shipYDistToCenter;

public void setup(){
  size(600,600);
  background(0);
  for (int i = 0; i < s.length; i++){
    s[i] = new Star();
  }
  for (int i = 0; i < 500; i++){
    a.add(new Asteroid(i));
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
  for (int i = 0; i < p.size(); i++){
    p.get(i).move();
    p.get(i).adjust();
    p.get(i).show();
    p.get(i).fade();
  }
  for (int i = 0; i < s.length; i++){
    s[i].adjust();
    s[i].show();
  }
  for (int i = 0; i < a.size(); i++){
    a.get(i).move();
    a.get(i).adjust();
    a.get(i).checkCollision();
    a.get(i).show();
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
  p.remove(ind);
  for (int i = ind; i < p.size(); i++){
    p.get(i).setIndex(i);
  }
}

public void deleteAsteroid(int ind){
  a.remove(ind);
  for (int i = ind; i < a.size(); i++){
    a.get(i).setIndex(i);
  }
}
