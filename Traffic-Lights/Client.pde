final int WINDOW_WIDTH = 700;
final int WINDOW_HEIGHT = 700;

final color DARK_GREEN = color(0, 55, 0);
final color DARK_GRAY = color(50, 50, 50);

final int LEFT = 1;
final int RIGHT = 2;
final int UP = 3;
final int DOWN = 4;

void settings()
{
  size(WINDOW_WIDTH, WINDOW_HEIGHT);
}

Lane leftLane;
Lane rightLane;
Lane topLane;
Lane bottomLane;

void setup()
{
  noStroke();
  rectMode(CENTER);
}

void draw()
{
  background(DARK_GREEN);
  fill(DARK_GRAY);
  noStroke();
  rect((WINDOW_WIDTH/2), (WINDOW_HEIGHT/2), WINDOW_WIDTH, (WINDOW_HEIGHT/6.363));
  rect((WINDOW_WIDTH/2), (WINDOW_HEIGHT/2), (WINDOW_WIDTH/6.363), WINDOW_HEIGHT);

  Lane leftLane = new Lane();
  Lane rightLane = new Lane();
  Lane topLane = new Lane();
  Lane bottomLane = new Lane();

  leftLane.trafficLightCarBehavior(leftCar, leftLight);
  rightLane.trafficLightCarBehavior(rightCar, rightLight);
  topLane.trafficLightCarBehavior(topCar, topLight);
  bottomLane.trafficLightCarBehavior(bottomCar, bottomLight);
}
