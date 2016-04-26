import processing.sound.*;
FFT fft;
Amplitude amp;
AudioIn in;
AudioIn in2;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
   size(1280,720,P3D);
   
    amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  
    fft = new FFT(this, bands);
    in2 = new AudioIn(this, 0);

  in.start();
    in2.start();

   frameRate(30);
   // create a reverb effect
    
  // start the input stream
  in.play();
    amp.input(in);
     fft.input(in2);

}

void draw() {
  background(30);
translate(width/2, height/2, 0); 
noStroke();
lights();
beginShape();
sphere(200*pow(amp.analyze(),.33));
endShape();

fft.analyze(spectrum);
strokeWeight(3);
stroke(255);

  for(int i = 0; i < bands; i++){
    println(spectrum[i]);
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  line( i, height, i, height - spectrum[i]*height*5 );
  } 

}