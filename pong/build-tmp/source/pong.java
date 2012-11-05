import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class pong extends PApplet {

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

public void setup(){

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

public void draw(){
	updateBallPosition();
	collide();
	render();	
}

public void updateBallPosition(){
	ballX += speedX * directionX;
	ballY += speedY * directionY;
}

public void collide(){

	// reflecting at top and bottom wall and the paddles
	if (ballX > width - ballRadius || ballX < ballRadius) {
    directionX *= -1;
  }
  if (ballY > height - lineWidth - ballRadius || ballY < ballRadius + offsetTop + lineWidth) {
    directionY *= -1;
  }
}

// Rendering the Game
public void render(){
	background(0);
	drawPitch();
	drawPaddles();
	drawBall();
}

public void drawPaddles(){
	
	// left paddle
	rect(paddleLX, paddleLY, paddleWidth, paddleHeight);

	//right paddle
	rect(paddleRX, paddleRY, paddleWidth, paddleHeight);
}

public void drawPitch(){

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

public void drawBall(){
	strokeWeight(0);
	fill(255);
	ellipseMode(RADIUS);
	ellipse(ballX, ballY, ballRadius, ballRadius);
}

public void keyPressed(){

  if (key == 'q'){
    paddleLY -= 10;

  }

  if (key == 'a'){
    paddleLY += 10;
  }

  if (key == 'o'){
    paddleRY -= 10;

  }

  if (key == 'l'){
    paddleRY += 10;
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

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
