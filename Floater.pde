class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners; 
  protected float[] xCorners;   
  protected float[] yCorners;   
  protected int myColor;   
  protected int myOpacity;
  protected double myCenterX, myCenterY;
  protected double myXspeed, myYspeed;
  protected double myPointDirection, degreesOfRotation;
  protected boolean accel,turningLeft,turningRight;
  
 
  public void accelerate ()   
  {          
    double dRadians = myPointDirection*(Math.PI/180);     
  
    myXspeed += (0.1 * Math.cos(dRadians));    
    myYspeed += (0.1 * Math.sin(dRadians));      
    p.add(new Particle(p.size()));
  }   
  public void turn ()   
  {        
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()
  {            
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
  
    if(myCenterX >6000+originX)
    {     
      myCenterX = -6000+originX;
    }    
    else if (myCenterX<-6000+originX)
    {     
      myCenterX = 6000+originX;
    }    
    if(myCenterY > 6000+originY)
    {    
      myCenterY = -6000+originY;
    } 
    
    else if (myCenterY < -6000+originY)
    {     
      myCenterY = 6000+originY;  
    }
    
    if (accel){
      accelerate();
    }
    
    if (turningRight && degreesOfRotation < 4){
      degreesOfRotation += 0.4;
    }
    if (turningLeft && degreesOfRotation > -4){
      degreesOfRotation -= 0.4;
    }
    turn();
  }   
  public void show () 
  {             
    fill(myColor,myOpacity);   
    noStroke();  

    translate((float)myCenterX, (float)myCenterY);
     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    rotate(dRadians);

    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    
  }
  
  public double getX(){return myCenterX;}
  public double getY(){return myCenterY;}
  public double getXspeed(){return myXspeed;}
  public double getYspeed(){return myYspeed;}
  public double getPointDirection(){return myPointDirection;}
} 
