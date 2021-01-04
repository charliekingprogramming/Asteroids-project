void game() {
  noTint();
  background(0, 0, 255);
 button(600, 200, 200, 100, "PAUSE");


  
  
    background(0); 


  //println(myObjects.size());

  int i = 0; // starting at object zero
  while ( i < myObjects.size() ) {
    //processing each object individually
    GameObject obj = myObjects.get(i); // get the current object

    obj.show(); // tell the current object to draw itself
    obj.act(); // tell the current object to update itself

    if (obj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}

void gameClicks() {

  if (touchingMouse(width/2, height/2, width, height)) {//pause
   mode = PAUSE;
 }

}
