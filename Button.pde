class Button{
  float x;
  float y;
  float sizeX;
  float sizeY;
  
  float r = 0;
  float g = 200;
  float b = 0;
  
  Button(float objX, float objY, float objSizeX, float objSizeY){
    x = objX;
    y = objY;
    sizeX = objSizeX;
    sizeY = objSizeY;
  }
  
  boolean mouseOver(){
    if(mouseX >= x && mouseX <= x + sizeX && mouseY >= y && mouseY <= y + sizeY){
      return true;
    }
    else
    return false;
  }
  
  void draw(){
    push();
    fill(r, g, b);
    rect(x, y, sizeX, sizeY);
    pop();
  }
}
