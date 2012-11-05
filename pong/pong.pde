// ball size (diameter)
float ballRadius = 15;

// ball position
float ballX, ballY;

// ball speed in x and y, direction
float speedX = 3;
float speedY = 3;
float directionX = 1;
float directionY = 1;

// pitch
int offsetTop = 6;
int lineWidth = 10;

// paddles
int paddleWidth = 10;
int paddleHeight = 80;
int paddleOffset = 10;
int paddleLX;
int paddleLY;
int paddleRX;
int paddleRY;

void setup(){

	size(640, 360); // size of the game
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
	collide();
	render();	
}

void updateBallPosition(){
	ballX += speedX * directionX;
	ballY += speedY * directionY;
}

void collide(){

	// reflecting at top and bottom wall and the paddles
	if (ballX > width - ballRadius || ballX < ballRadius) {
    directionX *= -1;
  }
  if (ballY > height - lineWidth - ballRadius || ballY < ballRadius + offsetTop + lineWidth) {
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
	fill(255);
	ellipseMode(RADIUS);
	ellipse(ballX, ballY, ballRadius, ballRadius);
}

void keyPressed(){

  if (key == 'q'){
  }

  if (key == 'a'){
  }

  if (key == 'o'){
  }

  if (key == 'l'){
  }

  if (key == '+'){
  }

  if (key == '-'){ 
  }

  if (key == '*'){
  }

  if (key == '/'){
  }
}
