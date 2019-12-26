public class Roomba
{
  private PVector position;
  private PVector velocity;
  private float acceleration;
 
  private float r;
  private float theta;
  private color c;
  
  public Roomba(float x, float y, float r, color c)
  {
    this.position = new PVector(x, y);
    this.r = r;
    this.c = c;
  }
  
  public void update()
  {
    velocity.add(PVector.fromAngle(theta).mult(acceleration));
   
    PVector f = velocity.copy();
    f.normalize();
    f.mult(friction);
    velocity.add(f);   

    position.add(velocity);
  }
  
  public void display()
  {
    fill(c);
    stroke(#000000);
    circle(position.x, position.y, r * 2);
    
    stroke(#ffffff);
    line(position.x, position.y, position.x + PVector.fromAngle(theta).mult(acceleration).x * 10000, position.y + PVector.fromAngle(theta).mult(acceleration).y * 10000);
    
    stroke(#00ff00);
    line(position.x, position.y, position.x + PVector.fromAngle(atan(velocity.y / velocity.x)).mult(friction).x * 10000, position.y + PVector.fromAngle(atan(velocity.y / velocity.x)).mult(friction).y * 10000);
    
    stroke(#0000ff);
    line(position.x, position.y, position.x + velocity.x * 100, position.y + velocity.y * 100);
  }
  
  public float getX() { return position.x; }
  public void setX(float x) { position.x = x; }
  
  public float getY() { return position.y; }
  public void setY(float y) { this.position.y = y; }
  
  public PVector getVelocity() { return velocity; }
  public void setVelocity(PVector velocity) { this.velocity = velocity; }
  
  public float getAcceleration() { return acceleration; }
  public void setAcceleration(float acceleration) { this.acceleration = acceleration; }
  
  public float getRadius() { return r; }
  public void setRadius(float r) { this.r = r; }
  
  public float getTheta() { return theta; }
  public void setTheta(float theta) { this.theta = theta; }
}
