Spaceship myShip;

UFO myUFO;

ArrayList<GameObject> myObjects;

int mode;
final int INTRO = 0;
final int GAME  = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;


boolean wkey, akey, skey, dkey, spacekey;

ArrayList<PImage> gif;
int n = 0;

int deadAsteroids;

PImage photo;
PImage laser;
PImage asteroid;
PImage tiefighter;
PFont font;

void setup() {

  size(800, 800);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  mode = INTRO;

  myShip = new Spaceship();
  myUFO = new UFO();

  deadAsteroids = 0;


  wkey = akey = skey = dkey = false;

  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  
  myObjects.add(myUFO);


  laser = loadImage("laser.png");
  photo = loadImage("falcon.png");
  asteroid = loadImage("asteroid.png");
  tiefighter = loadImage("tiefighter.png");
  font = createFont("font.ttf", 32);
  
      gif = new ArrayList<PImage>(); 
    int i = 0;
    while (i < 44) {
      String zero = "";
      if (i< 10) zero = "0";
     gif.add(loadImage("frame_" + zero + i + "_delay-0.2s.gif"));
     i++;
    
    }
  
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == WIN) {
    win();
  }else{
    
    println("ERROR! Mode = " + mode);
  }
}
