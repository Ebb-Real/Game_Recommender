float background_r = 0;
float background_g = 0;
float background_b = 0;

SlideBar CombatSlider = new SlideBar(100, 100, 300, 5);
SlideBar StoryRoleplaySlider = new SlideBar(100, 200, 300, 5);
SlideBar MultiplayerSlider = new SlideBar(100, 300, 300, 5);
SlideBar ManagementSlider = new SlideBar(100, 400, 300, 5);

void setup(){
  size(1500, 800);
}

void draw(){
  background(background_r, background_g, background_b);
  CombatSlider.draw();
  StoryRoleplaySlider.draw();
  MultiplayerSlider.draw();
  ManagementSlider.draw();
  println(stardewValley[0]);
}

void mouseDragged(){
  CombatSlider.changeOption();
  StoryRoleplaySlider.changeOption();
  MultiplayerSlider.changeOption();
  ManagementSlider.changeOption();
  
}

void mouseReleased(){
  CombatSlider.grabbed = false;
  StoryRoleplaySlider.grabbed = false;
  MultiplayerSlider.grabbed = false;
  ManagementSlider.grabbed = false;
}
