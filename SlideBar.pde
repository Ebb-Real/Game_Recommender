class SlideBar{
  float x;
  float y;
  float size;
  float maxPriority;
  
  int currentPriority = 1;
  float currentPriorityTextSize = 30;
  
  float dotX;
  float dotY;
  float dotR;
  
  public boolean grabbed = false;
  
  SlideBar(float objX, float objY, float objSize, float objMaxPriority){
    x = objX;
    y = objY;
    size = objSize;
    maxPriority = objMaxPriority;
    
    dotX = objX + size/20;
    dotY = objY + size/60;
    dotR = objSize/10;
  }
  
  void draw(){
    rect(x, y, size, size/30);
    circle(dotX, dotY, dotR);
    if(currentPriority != 0){
      push();
      textSize(currentPriorityTextSize);
      text(currentPriority, x + size + 50, y + currentPriorityTextSize/2);
      pop();
    }
  }
  
  void changeOption() {
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
      
      //Ancient ikke hardcoded kode:
      /*dotX = mouseX;
      if(mouseX < x){
        dotX = x;
      }
      
      if(mouseX > x + size){
        dotX = x + size;
      } */
    
    }
  }
}
