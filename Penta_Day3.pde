PImage goatHead;
float amp = 500;
float angle = 0;
float angleVel = 20;

String[] lord = {"Belial", "Behemoth", "Beelzebub",
"Asmodeus", "Satanas", "Lucifer"};

PFont satanis;

void setup(){
size(500,500);

goatHead = loadImage("goatHead.png");

satanis = createFont("XXIITotenkult-Regular", 50);
textFont(satanis);
textAlign(CENTER, CENTER);


}
void draw(){
background(0);
noFill();
strokeWeight(2);

for(float x = 0; x < width; x+=20){
    for(float y = 0; y < height; y +=10){
      float wave = amp*sin(angle);
      noFill();
      stroke(255);;
      strokeWeight(1);
      ellipse(x,y+wave,mouseX,mouseY);
      angle += angleVel;
      
      
    }
  }
  
  for(int x = 0; x < lord.length; x++){
    fill(0);
    text(lord[x], width/2, 50 + 75*x);
  }  
noFill();
stroke(0);
strokeWeight(10);

ellipse(width/2,height/2,300,300);



fill(100,0,0);
strokeWeight(10);
  point(width/2,height/2+150);
  point(width/2-100,height/2-112);
  point(width/2+100,height/2-112);
  point(width/2-132,height/2+70);
  point(width/2+132,height/2+70);

pentagram();
image(goatHead,width/2 - 100,height/2-70);

}

void pentagram(){
stroke(0);
strokeWeight(10);
 line(width/2-100,height/2-112,width/2,height/2+150);
 line(width/2,height/2+150,width/2+100,height/2-112);
 line(width/2+100,height/2-112,width/2-132,height/2+70);
 line(width/2-132,height/2+70,width/2+132,height/2+70);
 line(width/2+132,height/2+70,width/2-100,height/2-112);
 
  
}
