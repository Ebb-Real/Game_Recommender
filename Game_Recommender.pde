import processing.video.*;
float background_r = 0;
float background_g = 0;
float background_b = 0;

SlideBar CombatSlider = new SlideBar(100, 100, 300, 5);
Movie video;

void setup(){
  size(1500, 800);
  video=new Movie(this, "movie480_vp9.mov");
  video.loop();
}

void draw(){
  background(background_r, background_g, background_b);
  CombatSlider.draw();
  image(video, 1100, 260, 400, 264);

}

void mouseDragged(){
  CombatSlider.changeOption();
}

void mouseReleased(){
  CombatSlider.grabbed = false;
}
  
void movieEvent(Movie video){
  video.read();
}
