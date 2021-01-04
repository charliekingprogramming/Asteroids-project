void pause() {
 background(0);
 fill(255);
 textSize(150);
 text("PAUSE", 400, 250);
    button(400, 600, 200, 100, "PLAY");
    button(150, 600, 200, 100, "QUIT");
    button(650, 600, 200, 100, "RESTART");
}

void pauseClicks() {
  if (touchingMouse(400, 600, 200, 100)) {//play
   mode = GAME;
 }
   if (touchingMouse(150, 600, 200, 100)) {//quit
   exit();
  }
   if (touchingMouse(650, 600, 200, 100)) {//restart

   mode = GAMEOVER;
        
 }
}
