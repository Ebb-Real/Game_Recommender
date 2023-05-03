class EvaluateButton extends Button{
  
  EvaluateButton(float objX, float objY, float objSizeX, float objSizeY){
    super(objX, objY, objSizeX, objSizeY);
  }
  
  void onClick(){
    if(mouseOver()){
      evaluate = true;
    }
  }
}
