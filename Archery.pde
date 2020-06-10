PImage enemy;
PImage player;

boolean fire;

boolean enemyArcher = true;

float playerX = random(10,400);
float enemyX = random(600, 950);
float enemyR = 20; // radius of the enemy

float arrowX = playerX; // starting position
float arrowY = 300; // starting height
float xSpeed = 1; // Velocity
float ySpeed = -4; // Angle

float g = 0.05; // Force of Gravity

float arrowR = 10; // radius of the arrow 



void setup(){
  size(1000, 400);
  
  
  enemy = loadImage("Enemy_archer.png");
  
  player = loadImage("Player_archer.png");
  
  
}

void draw(){
  background(0,150,0);
  fill(102,51,0);
  rect(-100,350,1100,200);
  
  text("Angle of the arrow is: ", 50,50);
  text(ySpeed,190,50);
  
  text("Velocity of the arrow is: ", 50,80);
  text(xSpeed, 190,80);
  
  text("Use the W,A,S,D to control your trajectory!", width / 2, 50);
  text("Click your mouse to fire!", width / 2 , 80);
  
  image(player,playerX, 265); 
  if (enemyArcher){ // as long as enemy isnt hit, he will be drawn.
  image(enemy, enemyX, 265);
  }
  
  // create a hit event for the collision between the enemy and the arrow
  boolean hit = hitEnemy(arrowX, arrowY, enemyX, arrowR, enemyR);
  
  if (hit)
  {
     enemyArcher = false;
     fire = false;
     text("Direct hit! You won!", width/2, height/2);
  }
  
  //Controls to modify the trajectory of the arrow
  
  if (( keyPressed == true) && (key == 'w'))
    {
     ySpeed++; 
     delay(500);
    }
  if ((keyPressed == true) && (key == 's'))
    {
      ySpeed--;
      delay(500);
    }
    
  if((keyPressed == true) && ( key == 'a'))
  {
    xSpeed--;
    delay(500);
  }
  
  if((keyPressed == true) && ( key == 'd'))
  {
   xSpeed++;
   delay(500);
  }
  
  // if mouse is clicked draw the fireArrow event
  
  if (fire == true)
  {
    fireArrow();
  }
  
  
  
 // if the arrow reaches the ground the game is over. 
  if ( arrowY >= 360 ) 
  {
     fire = false; 
     text("Better luck next time!", width / 2 , height / 2 ); 
  }

} 



void mouseClicked()
   {  
  fire = true;
   }
  
  
void fireArrow()
{
  
 
    ellipse(arrowX, arrowY, 10, 10);
  
  
    arrowX += xSpeed;
    arrowY += ySpeed;
    
    ySpeed += g; // increase gravity on Y axis to create arc
    
    
    
  }
  
// calculate the tangent between the X and Y axis of the arrow and the enemy to get the distance. If distance < Radius of the enemy + the arrow it connects.

boolean hitEnemy(float arrowX, float arrowY, float enemyX, float enemyR, float arrowR){
  float distanceX = arrowX - enemyX;
  float distanceY = arrowY - 265;
  float distance = sqrt( (distanceX * distanceX) + (distanceY * distanceY) );
  
    if(distance < enemyR + arrowR)
    {
    return true;
    }
    return false;
}
