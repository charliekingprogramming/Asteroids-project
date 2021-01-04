class Asteroid extends GameObject {



  //2. constructor
  Asteroid() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(1, 0);
    velocity.rotate(random(TWO_PI));
    lives = 1;
    size = 100;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate( random(0, TWO_PI) );
    size = s;
  }

  void show() {
    noTint();
    noFill();
    stroke(255);
    image(asteroid, location.x, location.y, size, size);
  }


  void act() {
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y)*2 <= size/2 + myObj.size) {
          myObj.lives = 0;
          deadAsteroids++;
          if (deadAsteroids >= 24){
            mode = WIN;
          }
          lives = 0;
          if (size > 30) {
            myObjects.add(new Asteroid( size/2, location.x, location.y));
            myObjects.add(new Asteroid( size/2, location.x, location.y));

          }
          if (size > 10) {
                        myObjects.add(new Particle(location));
            myObjects.add(new Particle(location));
            myObjects.add(new Particle(location));
            myObjects.add(new Particle(location));
            myObjects.add(new Particle(location));
            myObjects.add(new Particle(location));
          }
        }
      }

      i++;
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
