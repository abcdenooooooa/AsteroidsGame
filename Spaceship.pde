class Spaceship extends Floater{
  public Spaceship(){
    
    xCorners = new float[]{-15,15,15,18,20,18,15,15,-15,-14};
    yCorners = new float[]{-3,-6,-4,-3,0,3,4,6,3,0};
    corners = xCorners.length;
    myCenterX = 300;
    myCenterY = 300;
    myColor = (255);
    myOpacity = 255;
    myPointDirection = 0;
  }
  
  public void checkKey(char k){
    if (!accel){accel = k == 'w';}
    if (!turningLeft){turningLeft = k == 'a';}
    if (!turningRight){turningRight = k == 'd';}
    if (k == 'q'){
      myCenterX = originX-5700+(int)(Math.random()*12000);
      myCenterY = originY-5700+(int)(Math.random()*12000);
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = Math.random()*360;
      degreesOfRotation = 0;
    }
  }
  
  public void stopKey(char k){
    if (accel && k == 'w'){
      accel = false;
    }
    if (turningLeft && k == 'a'){
      turningLeft = false;
    }
    if (turningRight && k == 'd'){
      turningRight = false;
    }
  }
  
  public void adjustToCenter(){
    myCenterX -= (myCenterX - 300)/5;
    myCenterY -= (myCenterY - 300)/5;
  }
}

class Particle extends Spaceship{
  private int index;
  public Particle(int i){
    myPointDirection = ship.getPointDirection();
    corners = 4;
    xCorners = new float[]{-2,-2,2,2};
    yCorners = new float[]{2,-2,-2,2};
    myCenterX = ship.getX() - (16)*Math.cos(myPointDirection*(Math.PI/180));
    myCenterY = ship.getY() - (16)*Math.sin(myPointDirection*(Math.PI/180));
    myCenterX -= (myCenterX - 300)/5;
    myCenterY -= (myCenterY - 300)/5;
    myXspeed = -2*Math.cos(ship.getPointDirection()*(Math.PI/180)) -0.5+ Math.random();
    myYspeed = -2*Math.sin(ship.getPointDirection()*(Math.PI/180)) -0.5+ Math.random();
    myColor = (255);
    myOpacity = 255;
    index = i;
  }
  
  public void fade(){
    myOpacity -= 15;
    if (myOpacity <= 0){deleteParticle(index);}
  }
  
  public void adjust(){
    myCenterX -= shipXDistToCenter/5;
    myCenterY -= shipYDistToCenter/5;
  }
}
