void gameover() {

  background(255, 0, 0);
  textSize(120);
  text("YOU LOSE", 400, 300);
  button(550, 600, 300, 100, "PLAY AGAIN");
  button(250, 600, 200, 100, "Quit");
}

void gameoverClicks() {
  if (touchingMouse(550, 600, 300, 100)) {
   mode = INTRO;
   setup();

 }
  if (touchingMouse(250, 600, 200, 100)) {
   exit();
 }
}
