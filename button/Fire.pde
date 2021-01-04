class Fire extends GameObject {
  
  int t;
  
  
  Fire() {
   location = myShip.location.copy();
   PVector edist = myShip.direction.copy();
   edist.rotate(PI);
   edist.setMag(75);
   location.add(edist);
   velocity = myShip.direction.copy();
   velocity.rotate(radians(180) + random(-0.5, 0.5));
   velocity.setMag(5);
   size = 1;
   lives = 1;
   t= 255;
  }
  
  void show() {
   strokeWeight(3);
   stroke(255, t);
   fill(0, t);
   t=t-5;
   


   rect(location.x, location.y, size, size);


  }
  
  void act() {
   super.act();
   if (offScreen()){
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
