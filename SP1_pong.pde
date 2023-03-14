import java.util.HashSet;

Boolean isGameOn = false;

//declaring objects
Ball ball;
Paddle paddle1;
Paddle paddle2;
Background backGround;

//initializing variables
int paddleSpeed = 10;
int player1Score = 0;
int player2Score = 0;
String player1 = "Player 1: ";
String player2 = "Player 2: ";

//declare and initialize an empty Hashset. using the hashset for smooth moving of the paddles
HashSet<Integer> keyList = new HashSet<Integer>();

void setup() {
  size (1000, 600);
  rectMode(CENTER);
  

  //initializing objects
  backGround = new Background(0, height/2, width/50, height);
  ball = new Ball(width/2, height/2, 30, 30);
  paddle1 = new Paddle(width/25, height/2, 20, height/3, 'W', 'S');// 83 = w , 87 = s (keycode values)
  paddle2 = new Paddle(width-(width/25), height/2, 20, height/3, UP, DOWN); //38 = arrow up, 40 = arrow down (keycode values)



}




void draw() {
  background(255);

  //looping a background
int bX = 0;
int bW = width/70;
      noStroke();
    fill(230);
    for (int i = 0; i < width; i++) {
      rect(bX, height/2, bW, height);
      bX+=bW*2;
    }

      //backGround.drawBackground(); <-- i tried to create a method to draw the background but it did not work. Thats why i made a loop above to draw the background
  ball.drawBall();
  paddle1.drawPaddle(100);
  paddle2.drawPaddle(100);

  //drawing the score
  fill(0);
  textSize(15);
  textAlign(CENTER);
  text(player1+player1Score, width/10, height/20);
  text(player2+player2Score, width-(width/10), height/20);

  if (!isGameOn) {

    noStroke();
    fill(0, 99);
    rect(width/2, height/2, width, height);
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("Press any key to start the game", width/2, height/3);
  }

  if (keyPressed) {
    isGameOn = true;
  }

  if (isGameOn) {
    //calling functions
    ball.reset();
    ball.edgeBounce();
    ball.moving();
    ball.score();
    paddle1.movePaddle();
    paddle2.movePaddle();
  }
}

void keyReleased() {
  keyList.remove(keyCode);
}
void keyPressed() {
  keyList.add(keyCode);
}
