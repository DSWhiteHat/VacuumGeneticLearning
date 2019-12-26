float wallX1, wallY1;

ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Roomba> roombas = new ArrayList<Roomba>();
//Roomba roomba = new Roomba(0, 500, 30, #cc2020);

final float friction = -.0009;
final float bounce = .3;

final float pi = -PI;

boolean paused = true;

void setup()
{
  roombas.add(new Roomba(100, 500, 30, #cc2020));
  roombas.add(new Roomba(1500, 500, 30, #20cc20));
  roombas.get(0).setVelocity(new PVector(3, 0));
  roombas.get(0).setTheta(pi * 3 / 2);
  roombas.get(0).setAcceleration(.04);
  roombas.get(1).setVelocity(new PVector(-5, -2));
  size(1600, 900);
  frameRate(200);
  background(#202020);
}

void draw()
{
  /*
  if(wallX1 == 0.0)
  {
    background(#202020);
  }
  else
  {
    background(#20ff20);
  }
  */
  
  if(!paused)
  {
    for(Wall w: walls)
    {
      w.update();
    }
    for(Roomba r: roombas)
    {
      r.update();
    }
  }
  
  for(Wall w: walls)
  {
    w.display();
  }
  for(Roomba r: roombas)
  {
    r.display();
  }
  
  /*
  textSize(30);
  fill(#ffffff);
  text("Framerate: " + Math.round(frameRate), 100, 100);
  */
}

void mousePressed()
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

void keyPressed()
{
  if(key == ' ')
  {
    paused = !paused;
  }
}
