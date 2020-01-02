float wallX1, wallY1;

ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Roomba> roombas = new ArrayList<Roomba>();
//Roomba roomba = new Roomba(0, 500, 30, #cc2020);

final float friction = -0.0;
final float bounce = 1;

final float pi = -PI;

boolean paused = true;
boolean calculatingFitness = false;

int index = -1;
int row = 0;
int column = 0;
int currentFitness = 0;

int currentTicks = 0;

void setup()
{
  size(1600, 900);
  frameRate(200);
  background(#202020);
  initialRoombas();
  
  //Borders to the screen.
  walls.add(new Wall(0, 0, width, 1, #ffffff));
  walls.add(new Wall(0, 0, 1, height, #ffffff));
  walls.add(new Wall(0, height - 1, width, height, #ffffff));
  walls.add(new Wall(width - 1, 0, width, height, #ffffff));
}

void draw()
{
  if(currentTicks <= 500)
  {
    if(wallX1 == 0.0)
    {
      background(#202020);
    }
    else
    {
      background(#20ff20);
    }
    
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
      currentTicks++;
    }
      
    
    for(Wall w: walls)
    {
      w.display();
    }
    for(Roomba r: roombas)
    {
      r.display();
    }
    
   
    textSize(30);
    fill(#ffffff);
    text("Frames: " + Math.round(currentTicks), 100, 100);
    
  }
  else
  {
    if(index < roombas.size())
    {      
      if(index >= 0)
      {   
        calculateFitness(roombas.get(index));
        println("Fitness " + index + ": " + roombas.get(index).getFitness());
      }
      
      if(index < roombas.size() - 1)
      {
        background(#202020);
        image(roombas.get(index + 1).getMap(), 0, 0);
      }

      index++;
    }
    else
    {
      roombas.clear();
      setRoombas();
      index = -1;
      currentTicks = 0;
      paused = true;
    }
  }
}

public void initialRoombas()
{
  roombas.add(new Roomba(100, 500, 30, #cc2020));
  roombas.add(new Roomba(1500, 500, 30, #20cc20));
  roombas.get(0).setVelocity(new PVector(3, 0));
  roombas.get(0).setTheta(pi * 3 / 2);
  roombas.get(0).setAcceleration(.04);
  roombas.get(1).setVelocity(new PVector(-5, -2));
}

public void setRoombas()
{
  roombas.add(new Roomba(100, 500, 30, #cc2020));
  roombas.add(new Roomba(1500, 500, 30, #20cc20));
  roombas.get(0).setVelocity(new PVector(3, 0));
  roombas.get(0).setTheta(pi * 3 / 2);
  roombas.get(0).setAcceleration(.04);
  roombas.get(1).setVelocity(new PVector(-5, -2));
}

public void calculateFitness(Roomba r)
{
  try
  {
    Thread.sleep(5000);
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }
  
  int fitness = 0;
  loadPixels();
  for(int i = 0; i < width * height; i++)
  {
    if(pixels[i] == r.getColor())
    {
      fitness++;
    }
  }
  r.setFitness(fitness);
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
