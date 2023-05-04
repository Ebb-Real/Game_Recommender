class EvaluateButton extends Button{
  float g = 200;
  
  EvaluateButton(float objX, float objY, float objSizeX, float objSizeY){
    super(objX, objY, objSizeX, objSizeY);
  }
  
  void onClick(){
    if(mouseOver()){
      evaluate = true;
    }
  }
  
  void draw(){
    push();
    fill(r, g, b);
    rect(x, y, sizeX, sizeY);
    fill(255);
    textSize(sizeX/10);
    text("Evaluate", x + sizeX/3.25, y + sizeY/1.25);
    pop();
  }
}
