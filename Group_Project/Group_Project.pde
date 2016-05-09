import processing.sound.*; //Imports the sound library
FFT fft; //Creates the variable that handles the fft wave lengths at the bottom of the program 
Amplitude amp; //Creates the variable that handles amplitude with the fft waves
AudioIn in; //Creates the variable that takes in audio via the microphone
AudioIn in2; //Creates another variable that takes in audio via the microphone
int bands = 512; //??
float[] spectrum = new float[bands]; //Array list of bands
float xSphere;
float ySphere;

float radius; //radius of the sphere
float r = 255;
float g = 255;
float b = 255;

// Buttons
Button move = new Button(1160, 20, 100, 50, "MOVE");


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

  xSphere = width/2;
  ySphere = height/2;
}

void draw() {
  background(30); //Background color
  move.drawIt();

  fill(r, g, b);

  translate(xSphere, ySphere, 0); //Places the 3D ball in the center of the screen
  noStroke();
  lights();
  beginShape();

  radius = 200*pow(amp.analyze(), .33); //Radius of the sphere
  sphere(radius); //Draw the sphere

  endShape();

  translate(-xSphere, -ySphere, 0); //Translates the FFT lines to be at the bottom of the screen
  //translate(-640, -360, 0);

  fft.analyze(spectrum);
  strokeWeight(3);
  stroke(255);

  for (int i = 0; i < bands; i++) { //Draws the lines at the bottom of the screen
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    line( 3*i, height, 3*i, height - spectrum[i]*height*5 );
  }

  if (move.pressed == true) { // If the move pressed variable is true (meaning the move button is clicked)...

    float distance = dist(xSphere, ySphere, mouseX, mouseY); //Calculates the distance between the x and y positions of the sphere and the x and y positions of the mouse

    if ( distance >= 50) { //If the distance between the sphere and mouse is larger than 50
      float dx = (mouseX - xSphere)/100.0; 
      xSphere += dx;

      float dy = (mouseY - ySphere)/100.0;
      ySphere += dy;
    } else { //If the distance between the sphere and mouse is less than 50
      float dx = (mouseX - xSphere)/15.0;
      xSphere += dx;

      float dy = (mouseY - ySphere)/15.0;
      ySphere += dy;
    }

    /*xSphere = mouseX;
     ySphere = mouseY;
     */


    /*float xChange = random(5,10);
     float yChange = random(5,10);
     if(xSphere >= width || xSphere <= 0) {
     xChange = xChange * -1;
     }
     if (ySphere > height || ySphere <= 0) {
     yChange = yChange * -1;
     }
     xSphere += xChange;
     ySphere += yChange;
     
     if(xSphere + radius >= width || xSphere + radius <= 0) {
     xSphere = xSphere * -1;
     }
     
     if(ySphere + radius >= height || ySphere + radius <= 0) {
     ySphere = ySphere * -1;
     }
     */
  }
}

void mousePressed() {
  if (mouseX > move.x && mouseX < move.x + move.w && mouseY > move.y && mouseY < move.y + move.h) { //If the mouse is witin the parameters (x and y positions) of the button....
    if (move.pressed == true) { //If the move pressed is already true
      move.pressed = false;  //set it to false
    } else {
      move.pressed = true; //set the pressed boolean to true
    }
  }
  
   r = random(255);
   g = random(255);
   b = random(255);
}