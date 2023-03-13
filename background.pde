class Background {

  int bX;
  int bY;
  int bH;
  int bW;


  Background(int bX, int bY, int bW, int bH) {

    this.bX = bX;
    this.bY = bY;
    this.bW = bW;
    this.bH = bH;
  }

  void drawBackground() {

    noStroke();
    fill(200);
    for (int i = 0; i < width; i++) {
      rect(this.bX, this.bY, this.bW, this.bH);
      bX+=bW*2;
    }
  }
}
