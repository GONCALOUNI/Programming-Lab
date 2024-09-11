final float PIXEL_ERROR_MARGIN = WINDOW_WIDTH / 150;

Car leftCar = new Car(-(WINDOW_WIDTH / 8.641), (WINDOW_HEIGHT / 1.842), random((WINDOW_WIDTH / 155.555), (WINDOW_WIDTH / 116.666)), color(random(255), random(255), random(255)), LEFT);
Car rightCar = new Car((WINDOW_WIDTH / 0.896), (WINDOW_HEIGHT / 2.180), random((WINDOW_WIDTH / 155.555), (WINDOW_WIDTH / 116.666)), color(random(255), random(255), random(255)), RIGHT);
Car topCar = new Car((WINDOW_WIDTH / 2.180), -(WINDOW_HEIGHT / 8.641), random((WINDOW_HEIGHT / 155.555), (WINDOW_HEIGHT / 116.666)), color(random(255), random(255), random(255)), UP);
Car bottomCar = new Car((WINDOW_WIDTH / 1.846), (WINDOW_HEIGHT / 0.896), random((WINDOW_HEIGHT / 155.555), (WINDOW_HEIGHT / 116.666)), color(random(255), random(255), random(255)), DOWN);

TrafficLight leftLight = new TrafficLight((WINDOW_WIDTH / 4.458), (WINDOW_HEIGHT / 1.677), LEFT);
TrafficLight rightLight = new TrafficLight((WINDOW_WIDTH / 1.291), (WINDOW_WIDTH / 2.479), RIGHT);
TrafficLight topLight = new TrafficLight((WINDOW_WIDTH / 2.479), (WINDOW_WIDTH / 4.458), UP);
TrafficLight bottomLight = new TrafficLight((WINDOW_WIDTH / 1.676), (WINDOW_WIDTH / 1.291), DOWN);

class Lane
{
  void trafficLightCarBehavior(Car c, TrafficLight s)
  {
    c.draw();
    s.draw();
    c.update();
    s.update();
    c.respawnCar();
    
    if((c.direction == LEFT && abs(c.getX() - WINDOW_WIDTH / 5.109) <= PIXEL_ERROR_MARGIN)
      || (c.direction == RIGHT && abs(c.getX() - WINDOW_WIDTH / 1.243) <= PIXEL_ERROR_MARGIN)
      || (c.direction == UP && abs(c.getY() - WINDOW_WIDTH / 5.109) <= PIXEL_ERROR_MARGIN)
      || (c.direction == DOWN && abs(c.getY() - WINDOW_WIDTH / 1.243) <= PIXEL_ERROR_MARGIN))
     {
       if(s.red == true || s.yellow == true) {c.stop();}
       else if(s.green == true) {c.resume();}
     }
  }
}
