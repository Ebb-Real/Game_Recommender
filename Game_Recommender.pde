float background_r = 0;
float background_g = 0;
float background_b = 0;

SlideBar CombatSlider = new SlideBar(100, 100, 300, 5);dsad

void setup(){
  size(1500, 800);
}

void draw(){
  background(background_r, background_g, background_b);
  CombatSlider.draw();
}

void mouseDragged(){
  CombatSlider.changeOption();
}

void mouseReleased(){
  CombatSlider.grabbed = false;
}
