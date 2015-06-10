class UI{
  
  PImage background;
  PFont mono;
  
  UI(String projectPath){
    size(1360, 760);
    mono = loadFont("DroidSansMono-12.vlw");
    background = loadImage("../"+ projectPath +"background.png");
    textFont(mono);
  }
  
  void update(){
    background(#37474F);
    image(background, 20, 20);
  }
}
