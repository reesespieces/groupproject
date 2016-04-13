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
    fill(240); //fill in the button with this color
    noStroke(); //no outlines on the button
    rectMode(CORNER);
    rect(x, y, w, h); //draws the button

    if (pressed == false) {
      stroke(100);
      strokeWeight(2);
      line(x, y, x, y + h); //draw a line on the left side of the button
      line(x, y + h, x + w, y + h); //draw a line on the bottom side

      stroke(160);
      strokeWeight(2);
      line(x, y, x + w, y); //draw a line on the top side of the button
      line(x + w, y, x + w, y + h); //draw a line on the right side
    }


    if (pressed == true) {
      stroke(100);
      strokeWeight(2);
      line(x, y, x + w, y); //draw a line on the top side of the button
      line(x + w, y, x + w, y + h); //draw a line on the right side


      stroke(160);
      strokeWeight(2);
      line(x, y, x, y + h); //draw a line on the left side of the button
      line(x, y + h, x + w, y + h); //draw a line on the bottom side
    }

    //prints the label on the button
    fill(0); //the text is black
    textAlign(CENTER, CENTER); //align the text in the center of the button
    textSize(10); //adjusts the size of the text
    text(label, x+w/2.0, y+h/2.0); //displays the text in the middle of the button
  }
}