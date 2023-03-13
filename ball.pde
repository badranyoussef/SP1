class Ball {

  float posX, posY, ballW, ballY;
  float Xspeed = 5;
  float Yspeed = 0;
  float Ydirection;
  float speedUpdate = -1.1;
  int ballColor = color((int)random(255), (int)random(255), (int)random(255));
  //float distanceP1 = dist(posX, posY, paddle2.paddleX, paddle2.paddleY); I could not solve the error "NullPointerException" the idea was to create a variable for the distance between the ball and the center of the paddle when it hits
  //float distanceP2 = dist(posX, posY, paddle2.paddleX, paddle2.paddleY);


  Ball(int posX, int posY, int ballW, int ballY) {
    this.posX = posX;
    this.posY = posY;
    this.ballW = ballW;
    this.ballY = ballY;
  }

  void reset() {
    if (posX < 0 || posX > width) {
      posX = width/2;
      posY = height/2;
      Xspeed = 5;
      Yspeed = 0;
    }
  }

  void drawBall() {
    fill(ballColor);
    ellipse(posX, posY, ballW, ballY);
  }


  void moving() {
    posX = posX + Xspeed;
    posY = posY + Yspeed;
  }

  void edgeBounce() {
    //an if statemant making the ball bounce when it touches top og buttom of height.
    if (posY<0+ballW/2 || posY>height-ballW/2) {
      Yspeed *= -1;
      ballColor = color((int)random(255), (int)random(255), (int)random(255));
    }

    //change ball Y direction depending on where the ball hits the paddle
    if (posX > paddle2.paddleX-paddle2.paddleW && posY < paddle2.paddleY + paddle2.paddleH/2 && posY >= paddle2.paddleY) { //hvis ikke den Y postionerne er = hinanden ryger bolden igennem paddle
      Xspeed *= speedUpdate;
      Yspeed = dist(posX, posY, paddle2.paddleX, paddle2.paddleY)/10;
    } else if (posX > paddle2.paddleX-paddle2.paddleW && posY > paddle2.paddleY - paddle2.paddleH/2 && posY < paddle2.paddleY) {
      Xspeed *= speedUpdate;
      Yspeed = dist(posX, posY, paddle2.paddleX, paddle2.paddleY)/-10;
    } else if (posX < paddle1.paddleX+paddle1.paddleW && posY < paddle1.paddleY + paddle1.paddleH/2 && posY >= paddle1.paddleY) {
      Xspeed *= speedUpdate;
      Yspeed = dist(posX, posY, paddle1.paddleX, paddle1.paddleY)/10;
    } else if (posX < paddle1.paddleX+paddle1.paddleW && posY > paddle1.paddleY - paddle1.paddleH/2 && posY < paddle1.paddleY) {
      Xspeed *= speedUpdate;
      Yspeed = dist(posX, posY, paddle1.paddleX, paddle1.paddleY)/-10;
    }
  }



  void score() {

    if (posX < 0) {
      player2Score++;
    }
    if (posX > width) {
      player1Score++;
    }
    if (player1Score == 5 || player2Score == 5) {
      player2Score=0;
      player1Score=0;
      paddle1.paddleX = width/25;
      paddle1.paddleY = height/2;
      paddle2.paddleX = width-width/25;
      paddle2.paddleY = height/2;
      posX = width/2;
      posY = height/2;
      isGameOn = false;
    }
  }
}
