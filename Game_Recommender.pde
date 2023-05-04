import processing.video.*;
float background_r = 0;
float background_g = 0;
float background_b = 0;

PImage img;

public boolean evaluate;

Movie video;

SlideBar CombatSlider = new SlideBar("Combat",100, 150, 300, 5);
SlideBar StoryRoleplaySlider = new SlideBar("Story and Roleplay",100, 250, 300, 5);
SlideBar MultiplayerSlider = new SlideBar("Multiplayer",100, 350, 300, 5);
SlideBar ManagementSlider = new SlideBar("Management",100, 450, 300, 5);

EvaluateButton EvaluationButton = new EvaluateButton(100, 600, 300, 40);

void setup(){
  size(1500, 800);
  video = new Movie(this, "SlimeRancher.mov");
  video.loop();
  img = loadImage("SlimeRancher.jpg");
}

void draw(){
  background(background_r, background_g, background_b);
  image(video, 1000, 250, 400, 264);
  image(img, 650, 200, 264, 400);
  CombatSlider.draw();
  StoryRoleplaySlider.draw();
  MultiplayerSlider.draw();
  ManagementSlider.draw();
  EvaluationButton.draw();
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
  
void movieEvent(Movie video){
  video.read();
}

void mouseClicked(){
  EvaluationButton.onClick();
}
