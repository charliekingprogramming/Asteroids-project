class UFO extends GameObject {


  PVector direction;
  int shotTimer, threshold;
  float enter;
  int counter = 0;

  UFO() {
    size = 50;
    //reset();


    location =  new PVector(-size, random(0, 800));
    lives = 1;
    
    shotTimer = 0;
    threshold = 100;
  
  }

  void show() {
    fill(255, 0, 0);
    imageMode(CENTER);
    image(tiefighter, location.x, location.y, size, size);
  }

  //void reset() {
  //  float rng = random(0, 1);
  //  if (rng < 0.25) { //top
  //    location =  new PVector(random(0, width), 0);
  //    velocity = new PVector(1, 0);
  //  } else if (rng < 0.5) {
      
  //  }
  //}

  void act() {
     counter++;
    if (counter >=200) {
    enter = random(0, 4);
    }
  
    if (enter < 1) {
      //location = new PVector(-size, random(0, 800));
      location.x = location.x+5;

      if (location.x >= width+size) {

        location.x = 0;
        location.y = random(0, 800); 
      }
    
    } else if (enter < 2){
      location.x = random(0, 800);
      location.y = 0;

      location.y = location.y + 5;


    }



    if (shotTimer >= threshold) {
      println("UFO:", location.x, location.y);
      myObjects.add(new Bullet2());
      shotTimer = 0;
    }
    shotTimer++;


    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= myObj.size) {
          lives--;
          fill(255, 0, 0);
          ellipse(location.x, location.y, size/2, size/2);
        }
      }
      i++;
    }
  }
}
