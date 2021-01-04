class Bullet2 extends GameObject {


  int timer;

  //2. constructor
  Bullet2() {
    timer = 60;
    location = myUFO.location.copy();
     println("BULLET:",location.x, location.y);
    //location = new PVector(myUFO.location.x , myUFO.location.y);
    velocity = new PVector(myShip.location.x-location.x, myShip.location.y - location.y);
    velocity.setMag(5);
    lives = 1;
    size = 50;



    location = myUFO.location.copy();
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
    if (location.x < 0) {
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
