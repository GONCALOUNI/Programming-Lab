final color BLACK = color(0);

class Car
{
  float x, y, currentSpeed, maxSpeed;
  int direction;
  color carColor;

  Car(float x, float y, float maxSpeed, color carColor, int direction)
  {
    this.x = x;
    this.y = y;
    this.currentSpeed = maxSpeed;
    this.maxSpeed = maxSpeed;
    this.direction = direction;
    this.carColor = carColor;
  }

  float getX()
  {
    return x;
  }

  float getY()
  {
    return y;
  }

  void draw()
  {
    //Car body
    stroke(BLACK);
    strokeWeight(1);
    fill(this.carColor);
    if(this.direction == LEFT || this.direction == RIGHT) {rect(x, y, (WINDOW_WIDTH / 15.555), WINDOW_HEIGHT / 20.000);}
    else if(this.direction == UP || this.direction == DOWN) {rect(x, y, (WINDOW_WIDTH / 20.000), (WINDOW_HEIGHT / 15.555));}
    
    if(this.direction == LEFT) {rect((x + (WINDOW_WIDTH / 17.500)), y, (WINDOW_WIDTH / 20), (WINDOW_HEIGHT / 20));}
    else if (this.direction == RIGHT) {rect((x - (WINDOW_WIDTH / 17.500)), y, (WINDOW_WIDTH / 20), (WINDOW_HEIGHT / 20));}
    else if (this.direction == UP) {rect(x, (y + (WINDOW_HEIGHT / 17.500)), (WINDOW_WIDTH / 20), (WINDOW_HEIGHT / 20));}
    else if (this.direction == DOWN) {rect(x, (y - (WINDOW_HEIGHT / 17.500)), (WINDOW_WIDTH / 20), (WINDOW_HEIGHT / 20));}

    //Wheels
    fill(BLACK);
    if(this.direction == LEFT)
    {
      rect((x - (WINDOW_WIDTH / 69.651)), (y - (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
      rect((x - (WINDOW_WIDTH / 69.651)), (y + (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
      rect((x + (WINDOW_WIDTH / 15.555)), (y - (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
      rect((x + (WINDOW_WIDTH / 15.555)), (y + (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
    }
    else if(this.direction == RIGHT)
    {
      rect((x + (WINDOW_WIDTH / 69.651)), (y - (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
      rect((x + (WINDOW_WIDTH / 69.651)), (y + (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
      rect((x - (WINDOW_WIDTH / 15.555)), (y - (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
      rect((x - (WINDOW_WIDTH / 15.555)), (y + (WINDOW_HEIGHT / 35.000)), (WINDOW_WIDTH / 46.666), (WINDOW_HEIGHT / 233.333));
    }
    else if(this.direction == UP)
    {
      rect((x - (WINDOW_WIDTH / 35)), (y - (WINDOW_HEIGHT / 69.651)), (WINDOW_WIDTH / 233.333), (WINDOW_HEIGHT / 46.666));
      rect((x + (WINDOW_WIDTH / 35)), (y - (WINDOW_HEIGHT / 69.651)), (WINDOW_WIDTH / 233.333), (WINDOW_HEIGHT / 46.666));
      rect((x - (WINDOW_WIDTH / 35)), (y + (WINDOW_HEIGHT / 15.555)), (WINDOW_WIDTH / 233.333), (WINDOW_HEIGHT / 46.666));
      rect((x + (WINDOW_WIDTH / 35)), (y + (WINDOW_HEIGHT / 15.555)), (WINDOW_WIDTH / 233.333), (WINDOW_HEIGHT / 46.666));
    }
    else if(this.direction == DOWN)
    {
      rect((x - (WINDOW_WIDTH / 35)), (y + (WINDOW_HEIGHT / 69.651)), (WINDOW_WIDTH / 233.333), (WINDOW_HEIGHT / 46.666));
      rect((x + (WINDOW_WIDTH / 35)), (y + (WINDOW_HEIGHT / 69.651)), (WINDOW_WIDTH / 233.333), (WINDOW_WIDTH / 46.666));
      rect((x - (WINDOW_WIDTH / 35)), (y - (WINDOW_HEIGHT / 15.555)), (WINDOW_WIDTH / 233.333), (WINDOW_WIDTH / 46.666));
      rect((x + (WINDOW_WIDTH / 35)), (y - (WINDOW_HEIGHT / 15.555)), (WINDOW_WIDTH / 233.333), (WINDOW_WIDTH / 46.666));
    }
  }

  void update()
  {
    if(this.direction == LEFT) {this.x += this.currentSpeed;}
    else if(this.direction == RIGHT) {this.x -= this.currentSpeed;}
    else if(this.direction == UP) {this.y += this.currentSpeed;}
    else if(this.direction == DOWN) {this.y -= this.currentSpeed;}
  }
  
  void stop()
  {
    this.currentSpeed = 0;
  }
  
  void resume()
  {
    this.currentSpeed = this.maxSpeed;
  }
   
  void respawnCar()
  {
    if((this.direction == LEFT) && (this.getX() > (WINDOW_WIDTH / 0.896))) {leftCar = new Car(-(WINDOW_WIDTH / 8.641), (WINDOW_HEIGHT / 1.842), random((WINDOW_WIDTH / 155.555), (WINDOW_WIDTH / 116.666)), color(random(255), random(255), random(255)), LEFT);}
    else if((this.direction == RIGHT) && (this.getX() < (-(WINDOW_WIDTH / 8.641)))) {rightCar = new Car((WINDOW_WIDTH / 0.896), (WINDOW_HEIGHT / 2.180), random((WINDOW_WIDTH / 155.555), (WINDOW_WIDTH / 116.666)), color(random(255), random(255), random(255)), RIGHT);}
    else if((this.direction == UP) && (this.getY() > (WINDOW_HEIGHT / 0.896))) {topCar = new Car((WINDOW_WIDTH / 2.180), -(WINDOW_HEIGHT / 8.641), random((WINDOW_HEIGHT / 155.555), (WINDOW_HEIGHT / 116.666)), color(random(255), random(255), random(255)), UP);}
    else if((this.direction == DOWN) && (this.getY() < -(WINDOW_HEIGHT / 8.641))) {bottomCar = new Car((WINDOW_WIDTH / 1.846), (WINDOW_HEIGHT / 0.896), random((WINDOW_HEIGHT / 155.555), (WINDOW_HEIGHT / 116.666)), color(random(255), random(255), random(255)), DOWN);}
  }
}
