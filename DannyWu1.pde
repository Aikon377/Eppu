float[] staticLines = {0, 150, 500};
float movingX;
boolean mouseControls = false;

        float angle = 0;
        float angleVel = 0.5;
        float amp= mouseX -50 - mouseY;
        
PFont myFont;

void setup()
{
myFont = createFont("Montserrat-Light.ttf",24);
textFont(myFont);
size(800,500);

}
void draw()
{
background(0);

   if (mousePressed == true && mouseControls == true)
    {
      mouseControls = false;
    }
    
    
  if(mousePressed == true && mouseControls == false)
    {
      mouseControls = true;
    }
    float textX = width / 2 ;
    float textY = mouseY ;
  
    text("D", textX -100, textY);
    text("A", textX -50, textY);
    text("N", textX, textY);
    text("N", textX + 50 , textY);
    text("Y", textX + 100, textY);
    text(" ", textX +150, textY);
    text("W", textX + 200, textY);
    text("U", textX + 250, textY);
lines();


}

void lines()
{  

    

  
  for(float x = -1000; x < width + 1000; x+=20)
  {  
    
        if (mouseControls == true)
      {
        movingX = mouseX;
      }
    else
      {
        
        movingX = amp*sin(angle);
        
      }
      
    if(mouseX > x + 20)
      {
        movingX = x;
      }
    
    noFill();
    strokeWeight(1);   
   //stroke(x,random(100,mouseX),random(mouseY,255));
    stroke(255);

    
    bezier(x, staticLines[0], x, staticLines[1], movingX ,mouseY, x, staticLines[2]);       
    angle+=angleVel;
  }
   
}
  
