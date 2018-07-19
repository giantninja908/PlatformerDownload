_MAP maps = new _MAP();

int lvl = 0;

int[][] map = maps.map[lvl];

player plr = new player(0, 470);

float gravity = .5; //gravity, DUH

boolean _RIGHT = false;
boolean _LEFT = false;

PFont f;

PFont bf;

boolean _PLAY = false;
void setup() {
  size(500, 500);
  f = createFont("Ariel", 20);
  bf = createFont("Ariel", 64);
}
void draw() {
  if (_PLAY) {
    if (lvl<maps.map.length) {
      map = maps.map[lvl];
    } else {
      //YOU WIN!!!
      exit();
      print("YOU WIN!!");
    }
    noStroke();
    background(255);
    plr.update();

    if (plr.y+10>=height) {
      plr.bottomCollide(height);
    }
    if (_LEFT) {
      plr.left();
    }
    if (_RIGHT) {
      plr.right();
    }

    for (int x = 0; x<map.length; x++) {
      for (int y = 0; y<map[0].length; y++) {

        if (map[y][x] == 1) {
          fill(0);
          rect(x*10, y*10, 10, 10);


          if (plr.collidesWithTop(x*10, y*10)) {
            plr.bottomCollide(y*10);
          }
          if (plr.collidesWithBottom(x*10, y*10)) {
            plr.topCollide(y*10);
          }
        }
        if (map[y][x] == 2) {
          fill(255, 0, 0);

          rect(x*10, y*10, 10, 10);


          if (plr.collidesWithTop(x*10, y*10)) {
            plr.die();
          }
          if (plr.collidesWithBottom(x*10, y*10)) {
            plr.die();
          }
        }

        if (map[y][x] == 3) {
          fill(0, 0, 255);

          rect(x*10, y*10, 10, 10);


          if (plr.collidesWithTop(x*10, y*10)) {
            plr.win();
          }
          if (plr.collidesWithBottom(x*10, y*10)) {
            plr.win();
          }
        }
      }
    }
    textFont(f);
    text(str(plr.deaths), 0, 20);
  } else {
    //Beginning
    background(0);
    fill(255);
    textFont(bf);
    text("Click to Start", 32, 250);
    if (mousePressed) {
      _PLAY = true;
    }
  }
}

void keyPressed() {
  if (key == 'W' || key == 'w') {
    plr.jump();
  }

  if (key == 'A' || key == 'a') {
    _LEFT = true;
  }

  if (key == 'D' || key == 'd') {
    _RIGHT = true;
  }
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN||keyCode ==LEFT||keyCode == RIGHT) {
      exit();
    }
  }
}


void keyReleased() {

  if (key == 'A' || key == 'a') {
    _LEFT = false;
  }

  if (key == 'D' || key == 'd') {
    _RIGHT = false;
  }
}
