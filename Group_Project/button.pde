//Button class

class Button {
  float x, y, w, h; //creates the variables for the x and y positions as well as the width and height of the button
  String label; //creates the variable that will display text on the button
  boolean pressed; //checks to see if the user has pressed the button: either yes or no

  Button(float xi, float yi, float wi, float hi, String initialLabel) {
    x = xi; //the initial x value that is passed in is set to the x value
    y = yi; //the initial y value
    w = wi; //the initial w value
    h = hi; //the initial h value
    label = initialLabel; //the initial label
    pressed = false; //the button has not been pressed
  }

  void drawIt() {
    if(mouseX<x+w && mouseX>x && mouseY<y+h && mouseY>y){
      fill(180);
    }
    else{
      fill(150);
    }
    noStroke(); //no outlines on the button
    rectMode(CORNER);
    rect(x, y, w, h, 5); //draws the button

    if (pressed == false) {
    }


    if (pressed == true) {
      
    }

    //prints the label on the button
    fill(0); //the text is black
    textAlign(CENTER, CENTER); //align the text in the center of the button
    textSize(10); //adjusts the size of the text
    text(label, x+w/2.0, y+h/2.0); //displays the text in the middle of the button
  }
}