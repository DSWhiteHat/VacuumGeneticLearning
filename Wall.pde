public class Wall
{
  private float x1, y1, x2, y2;
  private color c;
  
  public Wall(float x1, float y1, float x2, float y2, color c)
  {
    if(x1 > x2)
    {
      float temp = 0.0;
      temp = x2;
      x2 = x1;
      x1 = temp;
    }
    
    if(y1 > y2)
    {
      float temp = 0.0;
      temp = y2;
      y2 = y1;
      y1 = temp;
    }
    
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    
    
    
    this.c = c;
  }
  
  public boolean update()
  {
    return colliding();
  }
  
  public void display()
  {
    fill(c);
    rect(x1, y1, x2 - x1, y2 - y1);
  }
  
  public boolean colliding()
  {
    for(Roomba r: roombas)
    {
      float testX = r.getX(), testY = r.getY(), distX = 0.0, distY = 0.0, distance = 0.0;
      if(r.getX() < x1)
      {
        testX = x1;
      }
      else if(r.getX() > x2)
      {
        testX = x2;   
      }
    
      if(r.getY() < y1)
      {
        testY = y1;
      }
      else if(r.getY() > y2)
      {
        testY = y2;   
      }
        
      distX = r.getX() - testX;
      distY = r.getY() - testY;
      distance = sqrt((float) (Math.pow(distX, 2) + Math.pow(distY, 2)));
        
      if (distance <= r.getRadius())
      {
        if(testX != r.getX())
        {
          r.setVelocity(new PVector(r.getVelocity().x * -1, r.getVelocity().y));
          r.setX(r.getX() + r.getVelocity().x);
        }
        if(testY != r.getY())
        {
          r.setVelocity(new PVector(r.getVelocity().x, r.getVelocity().y * -1));
          r.setY(r.getY() + r.getVelocity().y);
        }
        r.setVelocity(r.getVelocity().mult(bounce));
        return true;
      } 
    }
    return false;
}
  
  public float getX1() { return x1; }
  public void setX1(float x1) { this.x1 = x1; }
  
  public float getY1() { return y1; }
  public void setY1(float y1) { this.y1 = y1; }
  
  public float getX2() { return x2; }
  public void setX2(float x2) { this.x2 = x2; }
  
  public float getY2() { return y2; }
  public void setY2(float y2) { this.y2 = y2; }
  
  public color getColor() { return c; }
  public void setColor(color c) { this.c = c; }
}
