#include "header.h"

int main() {
  init();
  home();
}

void init() {
  print("Starting OS ...");
  //Set up keyboard, isr, etc
  initVideo();
}

void home() {
  clearScreen();
  print("Welcome to ZOS-A6");
  //Display options and highlight different option when arrow pressed
  //Select item when enter pressed
  drawHome(1);
}

void drawHome(int optionSelected) {
  //Draws the home screen with the correct option number selected
  print("")
}
