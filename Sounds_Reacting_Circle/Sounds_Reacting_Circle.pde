
float angle = 50;
float angleVel = 0.001;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim  minim;
AudioInput  myAudio;

FFT   myAudioFFT;

boolean visualize;

int myAudioRange = 101; 
int myAudioMax = 100;

float myAudioAmp = 40.0;    //******
float myAudioIndex = 0.2;                
float myAudioIndexAmp = myAudioIndex;
float myAudioIndexStep = 0.35;    //****

float[] myAudioData = new float [myAudioRange];




void setup()  {
  
  size(1000,1000);
  minim  =new Minim(this);
 myAudio = minim.getLineIn(Minim.MONO);
 
 
 myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
 myAudioFFT.linAverages(myAudioRange);
 myAudioFFT.window(FFT.GAUSS);
}



void draw()   {
  
  myAudioFFT.forward(myAudio.mix);
  myAudioDataUpdate();
  
 background ( 0 );
  noFill(); 
  
  for  (int i = 0; i < 10; i++){
    int FFTamp = (int)map(myAudioData[i], 0, myAudioMax, 0, 1000);
    float pulse = FFTamp*sin(angle);
    stroke(255);
    ellipse( width/2, height/2, 50 * i + pulse, 50 * i +pulse);
    angle += angleVel;
  }
}


void myAudioDataUpdate() {
for(int i = 0; i < myAudioRange; i++) {
  float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp);
  float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax);
  myAudioData[i]  = tempIndexCon;
  myAudioIndexAmp+=myAudioIndexStep;
}
  myAudioIndexAmp  =  myAudioIndex;
}

void myAudioDataWidget() {
noStroke();
fill(0,200);
rect(0,height-112, width, 102);


for ( int i = 0; i < myAudioRange; i++){
     
      if  (i == 0) fill(#237D26);
      else if  (i==3) fill(#80C41C);
      else            fill(#CCCCCC);
      
      rect(10  +  (i+5), (height - myAudioData[i]) - 11, 4, myAudioData[i]);
  }
}

void stop() {
    myAudio.close();
    minim.stop();
    super.stop();
  
  }
