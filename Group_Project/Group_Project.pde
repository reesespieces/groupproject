import processing.sound.*; //Imports the sound library
FFT fft; //Creates the variable that handles the fft wave lengths at the bottom of the program 
Amplitude amp; //Creates the variable that handles amplitude with the fft waves
AudioIn in; //Creates the variable that takes in audio via the microphone
AudioIn in2; //Creates another variable that takes in audio via the microphone
int bands = 512; //??
float[] spectrum = new float[bands]; //Array list of bands

void setup() {
  size(1280, 720, P3D); ///Size of the screen

  amp = new Amplitude(this); //Initial amplitude
  in = new AudioIn(this, 0); //Take in the audio from the microphone

  fft = new FFT(this, bands); //Call on FFT, which is a processing function
  in2 = new AudioIn(this, 0);

  in.start();
  in2.start();

  frameRate(30); //Slow frame rate so the ball and lines move fluently
  // create a reverb effect

  // start the input stream
  in.play(); //Play the audio
  amp.input(in);
  fft.input(in2);
}

void draw() {
  background(30); //Background color
  translate(width/2, height/2, 0); //Places the 3D ball in the center of the screen
  noStroke();
  lights();
  beginShape();
  sphere(200*pow(amp.analyze(), .33)); //Draw the sphere
  endShape();
  
  translate(-width/2, -height/2, 0); //Translates the FFT lines to be at the bottom of the screen

  fft.analyze(spectrum);
  strokeWeight(3);
  stroke(255);

  for (int i = 0; i < bands; i++) { //Draws the lines at the bottom of the screen
    println(spectrum[i]);
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    line( i, height, i, height - spectrum[i]*height*5 );
  }
}