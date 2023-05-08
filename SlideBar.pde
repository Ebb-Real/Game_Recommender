class SlideBar{
  float x;
  float y;
  float size;
  float maxPriority;
  
  //Værdien som slideren sidder på, altså vægten
  int currentPriority = 1;
  float currentPriorityTextSize = 30;
  
  //Slider-priks værdier
  float dotX;
  float dotY;
  float dotR;
  
  //Navn på klasse
  String name;
  
  //Holdt eller ej
  public boolean grabbed = false;
  
  PImage dotImage;
  String dotImageName;
  
  SlideBar(String objName, float objX, float objY, float objSize, float objMaxPriority, String objDotImageName){
    name = objName;
    
    x = objX;
    y = objY;
    size = objSize;
    maxPriority = objMaxPriority;
    
    dotX = x;
    dotY = objY + size/60;
    dotR = objSize/10;
    
    dotImageName = objDotImageName;
  }
  
  void draw(){
    rect(x, y, size, size/30);
    dotImage = loadImage(dotImageName);
    image(dotImage, x + size * 1.3, y - 35, size/3.5, size/3.5);
    circle(dotX, dotY, dotR);
    if(currentPriority != 0){
      push();
      textSize(currentPriorityTextSize);
      text(currentPriority, x + size + 50, y + currentPriorityTextSize/2);
      text(name, x, y - size/15);
      pop();
    }
  }
  
  void changeOption(){
    if(mouseX >= dotX - dotR/2 && mouseX <= dotX + dotR/2 && mouseY >= dotY - dotR/2 && mouseY <= dotY + dotR/2){
      grabbed = true;
    }
    
    if(grabbed){
      if(mouseX + x >= x + 50 && mouseX + x < x + 150){
      dotX = x;
      currentPriority = 1;
      }
      
      if(mouseX + x >= x + 150 && mouseX + x < x + 250){
      dotX = x + 100;
      currentPriority = 2;
      }
      
      if(mouseX + x >= x + 250 && mouseX + x < x + 350){
      dotX = x + 200;
      currentPriority = 3;
      }
      
      if(mouseX + x >= x + 350 && mouseX + x < x + 400){
      dotX = x + 300;
      currentPriority = 4;
    }
      
      //Ancient ikke hardcoded kode, med smooth sliding:
      /*dotX = mouseX;
      if(mouseX < x){
        dotX = x;
      }
      
      if(mouseX > x + size){
        dotX = x + size;
      } */
    
    }
  }
  
  int getCurrentPriority() {
    return currentPriority;
  }
}
