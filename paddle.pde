class Paddle {

  //declaring attributes
  float paddleX;
  float paddleY;
  float paddleW;
  float paddleH;
  float paddleColor;
  int up;
  int down;

  //variable for changing paddle "y" position.
  float yMoving = 0;

  //designing the constructor
  Paddle (int paddleX, int paddleY, int paddleW, int paddleH, int up, int down) {
    this.paddleX = paddleX;
    this.paddleY = paddleY;
    this.paddleW = paddleW;
    this.paddleH = paddleH;
    this.up = up;
    this.down = down;
  }


  //method to draw the paddles
  void drawPaddle(float paddleColor) {
    fill(paddleColor);
    rect(paddleX, paddleY, paddleW, paddleH);
  }

  //method to move the paddles
  void movePaddle() {
    if (keyList.contains(up)) {
      paddleY -= paddleSpeed;
      paddleY = constrain(paddleY, paddleH/2, height-paddleH/2);
    } if (keyList.contains(down)) {
      paddleY += paddleSpeed;
      paddleY = constrain(paddleY, paddleH/2, height-paddleH/2);
    }
  }
}
