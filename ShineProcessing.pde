
String projectPath = "../ENSAD_07-2015/";
UI ui;

void setup(){
  ui = new UI(projectPath);
}

void draw(){
  ui.update();
}
