
// REALLY REAL GLOBAL VARS
String projectPath = "../ENSAD_07-2015/";
JSONObject configuration;
UI ui;
Inputs inputs;
SequenceEditor sequenceEditor;

void setup(){
	configuration = loadJSONObject("../"+ projectPath +"configuration.json");
	ui = new UI();
	inputs = new Inputs();
	sequenceEditor = new SequenceEditor();
}

void draw(){
	ui.update();
}

void keyPressed(){
	inputs.keyPressed(key, keyCode);
}
