#include <header.h>

void init() {
  print("Starting OS ...");
  //Set up keyboard, isr, etc
  gdt_install();
  idt_install();
  irq_install();
  __asm__ __volatile__ ("sti");
  initVideo();
}

void drawHome(int optionSelected) {
  //Draws the home screen with the correct option number selected
  print("");
}

void home() {
  clearScreen();
  print("Welcome to ZOS-A6");
  //Display options and highlight different option when arrow pressed
  //Select item when enter pressed
  drawHome(1);
}

int main() {
  init();
  home();
  for (;;);
}
