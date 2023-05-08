import processing.video.*;
import java.util.Map;

PImage img;

public boolean evaluate;

Movie video;

SlideBar CombatSlider = new SlideBar("Combat",100, 150, 300, 5);
SlideBar StoryRoleplaySlider = new SlideBar("Story and Roleplay",100, 250, 300, 5);
SlideBar MultiplayerSlider = new SlideBar("Multiplayer",100, 350, 300, 5);
SlideBar ManagementSlider = new SlideBar("Management",100, 450, 300, 5);

EvaluateButton EvaluationButton = new EvaluateButton(100, 600, 300, 40);

//ints for at lave procent baren
int sx = 1;
int sy = 3;
int so = 2;
int st = 4;
int sp = 500;

int sa = sx+sy+so+st;
float sxsh = sx*sp/sa;
float sysh = sy*sp/sa;
float sosh = so*sp/sa;
float stsh = st*sp/sa;

float background_r = 0;
float background_g = 0;
float background_b = 0;

HashMap<String, ArrayList<Integer>> gameData;
ArrayList<Integer> selections = new ArrayList<Integer>();

void setup(){
  size(1500, 800);
  gameData = formatData(loadStrings("data.txt"));
  addSelections();
}

void draw(){
  background(background_r, background_g, background_b);
  if(video != null){
  image(video, 1000, 250, 400, 264);
  }
  if(img != null){
    image(img, 550, 200, 264, 400);
  }
  CombatSlider.draw();
  StoryRoleplaySlider.draw();
  MultiplayerSlider.draw();
  ManagementSlider.draw();
  EvaluationButton.draw();
  
 //koden for at lave en procent bar
push();
 rect(885,150,50,sxsh);
 fill(255,0,0);
 rect(885,150+sxsh,50,sysh);
 fill(0,255,0);
 rect(885,150+sxsh+sysh,50,sosh);
 fill(0,0,255);
 rect(885,150+sxsh+sysh+sosh,50,stsh);
 fill(200,150,100);
 pop();
 println(sx);
 println(sa);
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
  if(EvaluationButton.onClick()) {
   updateSelections();
   evaluate = true; 
   println(selections.get(1));
   println(hentBedsteMatch(selections));
   img = loadImage(hentBedsteMatch(selections) + ".jpg");
   video = new Movie(this, hentBedsteMatch(selections) + ".mov");
   video.loop();
  }
}

void addSelections() {
  selections.add(CombatSlider.getCurrentPriority());
  selections.add(StoryRoleplaySlider.getCurrentPriority());
  selections.add(MultiplayerSlider.getCurrentPriority());
  selections.add(ManagementSlider.getCurrentPriority()); 
}

void updateSelections() {
  selections.set(0, CombatSlider.getCurrentPriority());
  selections.set(1, StoryRoleplaySlider.getCurrentPriority());
  selections.set(2, MultiplayerSlider.getCurrentPriority());
  selections.set(3, ManagementSlider.getCurrentPriority()); 
}
