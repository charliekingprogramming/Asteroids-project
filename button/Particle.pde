class Particle extends GameObject {
  
  int t;
  
  
  Particle(PVector newlocation) {
   location = newlocation.copy();
   velocity = myShip.direction.copy();
   velocity.rotate(radians(180) + random(-5.0, 5.0));
   velocity.setMag(random(1, 10));
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
