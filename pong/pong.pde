// ball size (diameter)
float ballSize = 15.0f;

// ball position
float ballX, ballY;

// ball speed
int ballSpeedSteps = 1;
float ballSpeed = 60.0f;

// normierter Vektor
float dirX = sqrt(0.5);
float dirY = sqrt(0.5);

// ball speed keys
boolean ballSpeedINC = false;
boolean ballSpeedDEC = false;

// ball direction
float directionX = 1.0f;
float directionY = 1.0f;

// pitch
int offsetTop = 6;
int lineWidth = 10;

// paddles
int paddleWidth = 10;
int paddleHeight = 80;
int paddleOffset = 10;
int paddleLY;
int paddleRY;
int paddleRX;
int paddleLX;

float paddleSpeed = 10.0f;

// paddle moving keys
boolean paddleLup = false;
boolean paddleLdown = false;
boolean paddleRup = false;
boolean paddleRdown = false;

// frame rate
float fRate = 30.0f;
float fRateStep = 1.0f;

// frame rate keys
boolean fRateINC = false;
boolean fRateDEC = false;

void setup(){

  // setting the frameRate
  frameRate(fRate);

  // size of the game
	size(640, 360);

	noStroke();
	smooth();

	// setting the starting position of the ball
	ballX = width/2;
	ballY = height/2;

	// setting the starting position of the paddles
	paddleLX = paddleOffset;
	paddleRX = width - paddleOffset - paddleWidth;
	paddleLY = paddleRY = height/2 - paddleHeight/2;
}

void draw(){
	updateBallPosition();
  updatePaddlePosition();
  updateFrameRate();
  updateBallSpeed();
	collide();
	render();
}

void updateBallPosition(){
  float frameLenght = 1.0f/fRate;

  ballX += frameLenght*dirX*ballSpeed*directionX;
  ballY += frameLenght*dirY*ballSpeed*directionY;
}

void updatePaddlePosition(){

  // moving the left paddle up
  if ((paddleLup == true) && (paddleLY > offsetTop + lineWidth)){
    paddleLY -= paddleSpeed;
  }

  // moving the right paddle up
  if ((paddleRup == true) && (paddleRY > offsetTop + lineWidth)){
    paddleRY -= paddleSpeed;
  }

  // moving the left paddle down
  if ((paddleLdown == true) && (paddleLY < height - lineWidth - paddleHeight)){
    paddleLY += paddleSpeed;
  }

  // moving the right paddle down
  if ((paddleRdown == true) && (paddleRY < height - lineWidth - paddleHeight)){
    paddleRY += paddleSpeed;
  }
}

void updateFrameRate(){

  if (fRateINC == true){
    fRate += fRateStep;
    frameRate(fRate);
  }

  if(fRateDEC == true && fRate > fRateStep){
    fRate -= fRateStep;
    frameRate(fRate);
  }
}

void updateBallSpeed(){
  if(ballSpeedINC == true){
    ballSpeed += ballSpeedSteps;
  }

  if(ballSpeedDEC == true){
    ballSpeed -= ballSpeedSteps;
  }
}

void collide(){

	// reflecting at top and bottom wall and the paddles
	if (ballX > width - ballSize/2 || ballX < ballSize) {
    directionX *= -1;
  }

  if (ballY > height - lineWidth - ballSize/2 || ballY < ballSize/2 + offsetTop + lineWidth) {
    directionY *= -1;
  }
}

// Rendering the Game
void render(){
	background(0);
	drawPitch();
	drawPaddles();
	drawBall();
}

void drawPaddles(){

	// left paddle
	rect(paddleLX, paddleLY, paddleWidth, paddleHeight);

	//right paddle
	rect(paddleRX, paddleRY, paddleWidth, paddleHeight);
}

void drawPitch(){

	stroke(255, 125, 0);
	strokeWeight(lineWidth);

	line(0, offsetTop + lineWidth/2, width, offsetTop + lineWidth/2);
	line(0, height-lineWidth/2, width, height-lineWidth/2);

	stroke(255, 255, 0);
	strokeWeight(0);
	int position = offsetTop + lineWidth;
	while (position < height - lineWidth){
		rectMode(CORNER);
		rect(width/2 - lineWidth/2, position, lineWidth, 1);
		position += 2 * 1;
	}
}

void drawBall(){
	strokeWeight(0);
	fill(200);
  rectMode(CENTER);
	rect(ballX, ballY, ballSize, ballSize);
}

void keyPressed(){

  if (key == 'q'){
    paddleLup = true;
  }

  if (key == 'a'){
    paddleLdown = true;
  }

  if (key == 'o'){
    paddleRup = true;
  }

  if (key == 'l'){
    paddleRdown = true;
  }

  if (key == '+'){
    ballSpeedINC = true;
  }

  if (key == '-'){
    ballSpeedDEC = true;
  }

  if (key == '*'){
    fRateINC = true;
  }

  if (key == '/'){
    fRateDEC = true;
  }
}

void keyReleased(){

  if (key == 'q'){
    paddleLup = false;
  }

  if (key == 'a'){
    paddleLdown = false;
  }

  if (key == 'o'){
    paddleRup = false;
  }

  if (key == 'l'){
    paddleRdown = false;
  }

  if (key == '+'){
    ballSpeedINC = false;
  }

  if (key == '-'){
    ballSpeedDEC = false;
  }

  if (key == '*'){
    fRateINC = false;
  }

  if (key == '/'){
    fRateDEC = false;
  }
}
