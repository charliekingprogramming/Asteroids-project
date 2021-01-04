void intro() {
  imageMode(CORNER);
  background(0);
  button(600, 550, 250, 150, "START");
  button(200, 550, 250, 150, "QUIT");
  textFont(font);
  textSize(150);
  fill(255);
  text("Asteroids", 400, 200); 


  PImage frame = gif.get(n);
  image(frame, 0, 0, width, height);
  n++;
  if (n > 43) n = 0;
}


void introClicks() {
  if (touchingMouse(600, 550, 250, 150)) {//start
    mode = GAME;
  }
  if (touchingMouse(200, 550, 250, 150)) {//quit
    exit();
  }
}
