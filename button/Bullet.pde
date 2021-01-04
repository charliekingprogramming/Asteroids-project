class Bullet extends GameObject {


  int timer;

  //2. constructor
  Bullet() {
    timer = 60;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    lives = 1;
    size = 50;
  }

  void show() {
   
    stroke(255);
    noFill();
    image(laser, location.x, location.y, size, size);
    
  }


  void act() {
    super.act();

    timer--;
    if (timer ==0) {
      lives = 0;
    }
    
    
    
        if (location.x > width) {
    location.x = 0;
  }
  if (location.x < 0){
    location.x = width;
  }
  if (location.y > height) {
    location.y = 0;
  }
    
  if (location.y < 0) {
    location.y = height;
  }
  }
}
