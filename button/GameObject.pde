class GameObject  {
  
 //1. instance variables
  PVector location;
  PVector velocity;
  float lives;
  int size;
  
  GameObject() {
    
  }
  
  void show() {
   strokeWeight(3);
   stroke(255);
   fill(0);
   rect(location.x, location.y, size, size);
  }
  void act() {
     location.add(velocity);
  }
  
  boolean offScreen(){
    return (location.x < 0 || location.x > width || location.y < 0 || location.y > height);

  }
}
