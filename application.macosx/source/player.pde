class player {
  float x;
  float y;
  float vel;
  float horz;
  boolean touchingGround = false;
  int deaths = 0;
  player(float tx, float ty) {
    x = tx;
    y = ty;
  }
  void update() {
    draw();

    vel+=gravity;
    y+=vel;

    x+=horz;
    horz *=0.8;
    if (x<0) {
      x=0;
    }
    if (x>width-10) {
      x = width-10;
    }
  }
  void jump() {
    if (touchingGround) {
      vel = -7;
      touchingGround = false;
    }
  }
  void right() {
    horz = 5;
  }
  void left() {
    horz = -5;
  }
  void bottomCollide(float surface) {
    y = surface-10;
    vel = 0;
    touchingGround = true;
  }
  void die() {
    x = 0;
    y = 470;
    deaths++;
  }
  void topCollide(float surface) {
    y = surface+10;
    vel *=-0.9;
  }
  /*
  
   if (rect1.x < rect2.x + rect2.width &&
   rect1.x + rect1.width > rect2.x &&
   rect1.y < rect2.y + rect2.height &&
   rect1.height + rect1.y > rect2.y) {
   // collision detected!
   }
   
   */
  boolean collidesWithTop(float x2, float y2) {
    if (x < x2 + 10 && x + 10 > x2 && y < y2 + 5 && 10 + y > y2) {
      return true;
    } else {
      return false;
    }
  }
  boolean collidesWithBottom(float x2, float y2) {
    if (x < x2 + 10 && x + 10 > x2 && y < y2+5 + 5 && 10 + y > y2+5) {
      return true;
    } else {
      return false;
    }
  }

  void win() {
    lvl++;
    horz = 0;
    vel =0;
    x = 0;
    y = 470;
  }
  void draw() {
    fill(0);
    rect(x, y, 10, 10);
    fill(128);
    rect(x+2.5, y+2.5, 5, 5);
  }
}
