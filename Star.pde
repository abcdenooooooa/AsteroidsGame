class Star{
  private float myX,myY,mySize, myOpacity,myDistance;
  public Star(){
    myX = -1000+(int)(Math.random()*2000);
    myY = -1000+(int)(Math.random()*2000);
    mySize = 1+(float)(Math.random()*5);
    myOpacity = 128+(int)(Math.random()*128);
    myDistance = 5+(int)(Math.random()*50);
  }
  
  public void show(){
    fill(255,myOpacity);
    noStroke();
    ellipse(myX,myY,mySize,mySize);
  }
  
  public void adjust(){
    myX -= shipXDistToCenter/myDistance;
    myY -= shipYDistToCenter/myDistance;
  }
}
