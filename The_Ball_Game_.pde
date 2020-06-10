


float ellipseY1 = 300;
float ellipseX1 = 300;

float ellipseX2 = 800;
float ellipseY2 = 800;

float px= random(100, 700);
float py= random(100, 700);

float ellipseW1 = 50;
float ellipseH1 = 50;

float ellipseW2 = 50;
float ellipseH2 = 50;

float radius = ellipseW1 / 2;
float radius2 = ellipseW2 / 2;





int score1 = 0;
int score2= 0;

void setup() {
  size(1000, 1000);
  strokeWeight(8);
  
} 

void draw() {
  
  
  background(204);
  
  
  // the hit boolean
  boolean hit1 = pointCircle(px,py,ellipseX1,ellipseY1,radius);
  
  boolean hit2 = pointCircle2(px,py,ellipseX2,ellipseY2,radius2);
  
  //if hit = true what will happen
  
  boolean collision = collidingBalls(ellipseX1,ellipseX2,ellipseY1,ellipseY2, radius, radius2, ellipseW1, ellipseW2, ellipseH1, ellipseH2);
  
  if(collision)
  {
  if (ellipseW1 + ellipseH2 > ellipseW2 + ellipseH2)
  {
  score2 = score2 - 1;
  delay(5);
  }
  }
  
  
  if (hit1)
  {
   fill(255,150,0); 
   line(px,py,(px + 100), (py + 100));
   delay(2);
   px= random(100, 700);
   py= random(100, 700);
   ellipseW1 = ellipseW1 + 5;
   ellipseH1 = ellipseH1 + 5;
   score1++;
   
   
  }
  else{
   }
  
  if (hit2)
  {
   fill(100,150,0); 
   px= random(100, 700);
   py= random(100, 700);
    ellipseW2 = ellipseW2 + 5;
    ellipseH2 = ellipseH2 + 5;
   score2++;
   
  }
  else{
    }
 
  
  
  point(px, py);
  fill(200,0,0);
  ellipse(ellipseX1,ellipseY1 ,ellipseW1, ellipseH1);
  fill(0,200,0);
  ellipse(ellipseX2,ellipseY2,ellipseW2,ellipseH2);
  
  
  
  //Next up the controls
  
  
  // Player 1
  if ((keyPressed == true) && (key == 'w'))
  {
    ellipseY1 = ellipseY1 - 5;
  }
  
  if((keyPressed == true) && (key == 's'))
  {
   ellipseY1 = ellipseY1 + 5; 
  }
  
  if((keyPressed == true) && (key == 'a'))
  {
    ellipseX1 = ellipseX1 - 5;
  }
  if((keyPressed == true) && (key == 'd'))
  {
    ellipseX1 = ellipseX1 + 5;
  }
  
  //Player 2
  
  if ((keyPressed == true) && (key == 'p'))
  {
    ellipseY2 = ellipseY2 - 5;
  }
  
  if ((keyPressed == true) && (key == 'ö'))
  {
    ellipseY2 = ellipseY2 + 5;
  }
  
  if ((keyPressed == true) && (key == 'l'))
  {
    ellipseX2 = ellipseX2 - 5;
  }
  
  if ((keyPressed == true) && (key == 'ä'))
  {
    ellipseX2 = ellipseX2 + 5;
  }
  
  
  
  

//Scores
fill (0,0,0);
text(score1, 50,50,100);
text(score2, 950,50,100);

if(score1 == 10)
{
text("Player 1 wins!!", 500, 500);
}
if(score2 == 10)
{
text("Player 2 wins!!", 500, 500);
}
  
}
  
  boolean pointCircle(float px, float py, float ellipseX1, float ellipseY1, float radius1)
  {
    float distX = px - ellipseX1;
    float distY = py - ellipseY1;
    float distance1WP = sqrt( (distX*distX) + (distY*distY) );
    if (distance1WP <= radius1){
      return true;
    }
    return false; 
  }
  
  
  
    boolean pointCircle2(float px, float py, float ellipseX2, float ellipseY2, float radius2)
  {
    float distX2 = px - ellipseX2;
    float distY2 = py - ellipseY2;
    float distance2WP = sqrt( (distX2*distX2) + (distY2*distY2) );
    if (distance2WP <= radius2){
      return true;
    }
    return false;}
    
    
    
  

boolean collidingBalls(float ellipseX1, float ellipseX2, float ellipseY1, float ellipseY2, float radius, float radius2, float ellipseW, float ellipseW2, float ellipseH1, float ellipseH2)
{
  float dist1And2X = ellipseX1 - ellipseX2;
  float dist1And2Y = ellipseY1 - ellipseY2;
  float distance1To2 = sqrt( (dist1And2X * dist1And2X) + (dist1And2Y*dist1And2Y));
  
  if (distance1To2 <= radius + radius2){
  return true;
  }
  return false;}
