float wallX1, wallY1;

ArrayList<Wall> walls = new ArrayList<Wall>();
Roomba roomba = new Roomba(0, 0, 30, #cc2020);

void setup()
{
  roomba.setVelocity(new PVector(1, 0));
  roomba.setTheta(PI / 2);
  roomba.setAcceleration(.001);
  size(1600, 900);
  frameRate(300);
}

void draw()
{
  roomba.update();
  
  if(wallX1 == 0.0)
  {
    background(#202020);
  }
  else
  {
    background(#20ff20);
  }
  
  for(Wall w: walls)
  {
    w.update();
    w.display();
  }
  
  roomba.display();
}

void mouseClicked()
{
  if(wallX1 == 0.0)
  {
    wallX1 = mouseX;
    wallY1 = mouseY;
  }
  else
  {
    walls.add(new Wall(wallX1, wallY1, mouseX, mouseY, #cccccc));
    wallX1 = 0.0;
  }
}
