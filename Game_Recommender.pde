import processing.video.*;
float background_r = 0;
float background_g = 0;
float background_b = 0;

Movie video;
SlideBar CombatSlider = new SlideBar(100, 100, 300, 5);
SlideBar StoryRoleplaySlider = new SlideBar(100, 200, 300, 5);
SlideBar MultiplayerSlider = new SlideBar(100, 300, 300, 5);
SlideBar ManagementSlider = new SlideBar(100, 400, 300, 5);

void setup(){
  size(1500, 800);
  video=new Movie(this, "movie480_vp9.mov");
  video.loop();
}

void draw(){
  background(background_r, background_g, background_b);
  image(video, 1100, 260, 400, 264);
  CombatSlider.draw();
  StoryRoleplaySlider.draw();
  MultiplayerSlider.draw();
  ManagementSlider.draw();
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
