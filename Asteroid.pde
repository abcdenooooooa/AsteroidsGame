class Asteroid extends Floater{
  public int index;
  public Asteroid(int ind){
    corners = 5+(int)(Math.random()*6);
    xCorners = new float[corners];
    yCorners = new float[corners];
    for (int i = 0; i < corners; i++){
      int l = 15+(int)(Math.random()*11);
      xCorners[i] = (float)(Math.sin(Math.toRadians(i*(360/corners)))*l);
      yCorners[i] = (float)(Math.cos(Math.toRadians(i*(360/corners)))*l);
    }
    myCenterX = -5700+(int)(Math.random()*12000);
    myCenterY = -5700+(int)(Math.random()*12000);
    myXspeed = -2+Math.random()*4;
    myYspeed = -2+Math.random()*4;
    myColor = (255);
    myOpacity = 255;
    myPointDirection = 0;
    degreesOfRotation = -3+Math.random()*6;
    index = ind;
  }
  
  public void adjust(){
    myCenterX -= shipXDistToCenter/5;
    myCenterY -= shipYDistToCenter/5;
  }
  
  public void checkCollision(){
    if (dist((float)myCenterX,(float)myCenterY,(float)ship.getX(),(float)ship.getY()) < 25){
      deleteAsteroid(index);
    }
  }
}
