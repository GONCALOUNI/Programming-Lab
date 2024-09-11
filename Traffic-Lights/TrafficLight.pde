final color GRAY = color(100, 100, 100);

final color LIGHT_GRAY = color(200, 200, 200);
final color LIGHT_RED = color(255, 0, 0);
final color LIGHT_YELLOW = color(255, 255, 0);
final color LIGHT_GREEN = color(0, 255, 0);

class TrafficLight
{
  float x, y;
  int orientation;
  
  boolean red;
  boolean yellow;
  boolean green;
   
  TrafficLight(float x, float y, int orientation)
  {
    this.x = x;
    this.y = y;
    this.orientation = orientation;
  }
  
  void draw()
  {
    //traffic light body
    fill(GRAY);
    noStroke();
    if(this.orientation == LEFT || this.orientation == RIGHT)
    {
      rect(x, y, (WINDOW_WIDTH/8.433), (WINDOW_HEIGHT/46.666));
      rect((this.orientation == LEFT ? (x + (WINDOW_WIDTH/8.917)) : (x - (WINDOW_WIDTH/8.917))), y, (WINDOW_WIDTH/9.333), (WINDOW_HEIGHT/28.000));
    }
    else
    {
      rect(x, y, (WINDOW_WIDTH/46.666), (WINDOW_HEIGHT/8.433));
      rect(x, (this.orientation == UP ? (y + (WINDOW_HEIGHT/8.917)) : (y - (WINDOW_HEIGHT/8.917))), (WINDOW_WIDTH/28.000), (WINDOW_HEIGHT/9.333));
    }

    //lights off
    fill(LIGHT_GRAY);
    noStroke();
    if(this.orientation == LEFT || this.orientation == RIGHT)
    {
      circle((this.orientation == LEFT ? (x + ((WINDOW_WIDTH/13.102))) : (x - (WINDOW_WIDTH/13.102))), y, (WINDOW_WIDTH/28.000));
      circle((this.orientation == LEFT ? (x + (WINDOW_WIDTH/6.760)) : (x - (WINDOW_WIDTH/6.760))), y, (WINDOW_WIDTH/28.000));
      circle((this.orientation == LEFT ? (x + (WINDOW_WIDTH/8.917)) : (x - (WINDOW_WIDTH/8.917))), y, (WINDOW_WIDTH/28.000));
    }
    else if(this.orientation == UP || this.orientation == DOWN)
    {
      circle(x, (this.orientation == UP ? (y + (WINDOW_HEIGHT/13.102)) : (y - (WINDOW_HEIGHT/13.102))), (WINDOW_WIDTH/28.000));
      circle(x, (this.orientation == UP ? (y + (WINDOW_HEIGHT/6.760)) : (y - (WINDOW_HEIGHT/6.760))), (WINDOW_WIDTH/28.000));
      circle(x, (this.orientation == UP ? (y + (WINDOW_HEIGHT/8.917)) : (y - (WINDOW_HEIGHT/8.917))), (WINDOW_WIDTH/28.000));
    }
  }
  
  void redOn()
  {
    fill(LIGHT_RED);
    noStroke();
    if(this.orientation == LEFT || this.orientation == RIGHT) {circle((this.orientation == LEFT ? (x + (WINDOW_WIDTH/6.760)) : (x - (WINDOW_WIDTH/6.760))), y, (WINDOW_WIDTH/28.000));}
    else if(this.orientation == UP || this.orientation == DOWN) {circle(x, (this.orientation == UP ? (y + (WINDOW_HEIGHT/6.760)) : (y - (WINDOW_HEIGHT/6.760))), (WINDOW_WIDTH/28.000));}
    red = true;
    yellow = false;
    green = false;
  }

  void yellowOn()
  {
    fill(LIGHT_YELLOW);
    noStroke();
    if(this.orientation == LEFT || this.orientation == RIGHT) {circle((this.orientation == 1 ? (x + (WINDOW_WIDTH/8.917)) : (x - (WINDOW_WIDTH/8.917))), y, (WINDOW_WIDTH/28.000));}
    else if(this.orientation == UP || this.orientation == DOWN) {circle(x, (this.orientation == UP ? (y + (WINDOW_HEIGHT/8.917)) : (y - (WINDOW_HEIGHT/8.917))), (WINDOW_WIDTH/28.000));}
    red = false;
    yellow = true;
    green = false;
  }
  
  void greenOn()
  {
    fill(LIGHT_GREEN);
    noStroke();
    if(this.orientation == LEFT || this.orientation == RIGHT) {circle((this.orientation == LEFT ? (x + ((WINDOW_WIDTH/13.102))) : (x - (WINDOW_WIDTH/13.102))), y, (WINDOW_WIDTH/28.000));}
    else if(this.orientation == UP || this.orientation == DOWN) {circle(x, (this.orientation == UP ? (y + (WINDOW_HEIGHT/13.102)) : (y - (WINDOW_HEIGHT/13.102))), (WINDOW_WIDTH/28.000));}
    red = false;
    yellow = false;
    green = true;
  }

  void update()
  {
    int phase = ((millis()/7000) % 3); //each phase lasts 4 seconds
    
    if(this.orientation == LEFT || this.orientation == RIGHT)
    {
      if(phase == 0) {this.greenOn();}
      else if(phase == 1) {this.yellowOn();}
      else if(phase == 2) {this.redOn();}
    }  
    else if(this.orientation == UP || this.orientation == DOWN)
    {
      if(phase == 0) {this.redOn();}
      else if(phase == 1) {this.yellowOn();}
      else if(phase == 2) {this.greenOn();}
    } 
  }
}
