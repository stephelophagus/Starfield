Particle [] p = new Particle[800];

void setup()
{
  size(600, 600);
  for (int i = 0; i < p.length; i++)
  {
    p[i] = new Particle();
    p[0] = new Leaf();
  }
}
void draw()
{

  //fill (255, 255, 255, 100);
  //rect (0,0, 600, 600);

  background(#7C94ED);
  for (int i = 0; i < p.length; i++)
  {
    p[i].show();
    p[i].move();
  }
}

void mousePressed()
{
  for (int i = 0; i < p.length; i++)
  {
    p[i] = new Leaf();
  }
  for (int i = 3; i < p.length; i++) {
    p[i] = new Particle();
  }
}
class Particle
{
  double myX, myY, myAngle;
  int mySpeed;

  Particle()
  {
    myX = mouseX;
    myY = mouseY;
    mySpeed = (int) (Math.random()*10+1);
    myAngle =  Math.random()*2*Math.PI;
  }

  void show()
  {
    fill(255);
    noStroke();
    ellipse((float) myX, (float) myY, 5, 5);
  }

  void move()
  {
    myX = myX +  Math.cos(myAngle) * mySpeed;
    myY = myY +  Math.sin(myAngle) * mySpeed;
  }
}

class Leaf extends Particle
{
  void move()
  {
    if (myX >0 && myX<600 && myY > 0 && myY < 600) {
      myX = myX + Math.cos(myAngle) * (Math.random()*2)+1;
      myY = myY + Math.sin(myAngle) * (Math.random()*2)+1;
    } 
    else {
      mySpeed = -mySpeed;
       if (myX <= 0) {
        myX = 0;
      } else if (myX > width) {
        myX = width;
      }
      if (myY < 0) {
        myY = 0;
      } else if (myY > height) {
        myY = height;
      }

    }
  }
  void show()
  {
    fill(#AF6E50);
    noStroke();
    ellipse( (float) myX, (float) myY, 60, 90);
    triangle((float) myX-27, (float) myY-25, (float) myX+27, (float) myY-25, (float) myX, (float) myY-100);
    
    stroke(#7C5948);
    strokeWeight(7);
    line((float)myX, (float)myY + 47, (float)myX, (float)myY+80);
  }
}
