import processing.video.*;
import java.util.Map;

float background_r = 0;
float background_g = 0;
float background_b = 0;

String menuText = "Hvilke egenskaber foretrkækker du i dine spil?";
float menuTextX = 50;
float menuTextY = 75;

String evaluateText = "";
float evaluateTextX = 800;
float evaluateTextY = 75;

PImage img;
PImage background;

public boolean evaluate;

Movie video;

SlideBar CombatSlider = new SlideBar("Combat",100, 200, 300, 5, "Combat.png");
SlideBar StoryRoleplaySlider = new SlideBar("Story and Roleplay",100, 300, 300, 5, "StoryRoleplay.png");
SlideBar MultiplayerSlider = new SlideBar("Multiplayer",100, 400, 300, 5, "Multiplayer.png");
SlideBar ManagementSlider = new SlideBar("Management",100, 500, 300, 5, "Management.png");

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
  background = loadImage("Background.jpg");
  gameData = formatData(loadStrings("data.txt"));
  addSelections();
}

void draw(){
  background(background_r, background_g, background_b);
  image(background, 0, 0, 1500, 800);
  
  if(video != null){
  image(video, 950, 250, 500, 300);
  }
  if(img != null){
    image(img, 550, 200, 264, 400);
  }
  
  CombatSlider.draw();
  StoryRoleplaySlider.draw();
  MultiplayerSlider.draw();
  ManagementSlider.draw();
  EvaluationButton.draw();
  
  push();
  textSize(30);
  
  if(menuText != ""){
  push();
  fill(0);
  rect(menuTextX - 15, menuTextY-30, 610, 40, 50);
  pop();
  text(menuText, menuTextX, menuTextY);
  }
  
  if(evaluateText != ""){
  push();
  fill(0);
  rect(evaluateTextX - 15, evaluateTextY-30, 450, 40, 50);
  pop();
  }
  text(evaluateText, evaluateTextX, evaluateTextY);
  pop();

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
    evaluateText = "Måske vil du kunne lide dette spil:";
    updateSelections();
    evaluate = true; 
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
