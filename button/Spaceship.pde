

class Spaceship extends GameObject {

  //1. Instance Variables of Fields
  PVector direction;
  int shotTimer, threshold, collisionTimer;



  //2. constructor: name matches the class name
  Spaceship() {

    location = new PVector(width/2, height/2);
    direction = new PVector(0.1, 0);
    velocity = new PVector(0, 0);
    size = 200;
    lives = 30;
    shotTimer = 0;
    collisionTimer = 0;
    threshold = 60;
  }

  //3. behaviour functions
  void show() {
    pushMatrix();


    noTint();
    strokeWeight(3);
    stroke(255);
    fill(0);
    translate(location.x, location.y);
    rotate((PI)/2);
    rotate(direction.heading());
    imageMode(CENTER);
    if (collisionTimer > 45) {
      image(photo, 0, 0, size +75, size);//falcon
    } else {

      tint(255, 126);
      image(photo, 0, 0, size +75, size);
    }




    //rect(0, 0, size, size);
    //line(0, 0, 100, 0);

    popMatrix();

    strokeWeight(5);
    stroke(255, 0, 0);
    //line(location.x, location.y, location.x+velocity.x*100, location.y+velocity.y*100);
  }


  void act() {
    super.act();

    shotTimer++;
    collisionTimer++;

    if (akey) direction.rotate(-radians(5) );
    if (dkey) direction.rotate( radians(5) ); 
    if (wkey) {
      velocity.add(direction);
      myObjects.add(new Fire() );
    }
    if (skey) velocity.sub(direction);
    if (spacekey && shotTimer >= threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
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

    int i = 0;
    while (i < myObjects.size() && collisionTimer >= 50) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Asteroid) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= myObj.size) {
          lives--;
      fill(255, 0, 0);
      ellipse(location.x, location.y, size/2, size/2);

          collisionTimer = 0;
        }
      }
      i++;
    }

    int p = 0;
    while (p < myObjects.size() && collisionTimer >= 50) {
      GameObject myObj = myObjects.get(p);
      if (myObj instanceof Bullet2) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= myObj.size) {
          lives--;
      fill(255, 0, 0);
      ellipse(location.x, location.y, size/2, size/2);
          collisionTimer = 0;
        }
      }
      p++;
    }

    if (lives == 0) {
      mode = GAMEOVER;
    }
  }
}
