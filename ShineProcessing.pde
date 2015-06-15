
// REALLY REAL GLOBAL VARS
String projectPath = "../ENSAD_07-2015/";
JSONObject configuration;
UI ui;
Inputs inputs;
SequenceBank sequenceBank;
Sequencer sequencer;
Filter filterA;
Filter filterB;
Output output;
ArrayList<Device> devices;
HashMap<String, Interactable> modes;
String activeMode;
Image modeImage;
Image liveImage;
boolean liveModeImage;

void setup(){
	configuration = loadJSONObject("../"+ projectPath +"configuration.json");

	devices = new ArrayList<Device>();

	JSONArray dev = configuration.getJSONArray("devices");
	for(int i = 0; i < dev.size(); i++){
		devices.add(new Device(dev.getJSONObject(i)));
	}

	inputs = new Inputs();
	sequencer = new Sequencer();
	filterA = new Filter();
	filterB = new Filter();
	output = new Output();
	ui = new UI();
	ui.statusBar.set("MODE", "LIVE");
	ui.statusBar.set("output to live", liveModeImage ? "yes" : "no ");
	sequenceBank = new SequenceBank();
	modes   = new HashMap<String, Interactable>();
	modes.put("EDIT", new SequenceEditor());
	activeMode = "LIVE";
	liveModeImage = false;

}

void draw(){

	activeMode = "LIVE";
	for(String key : modes.keySet()){
		if(modes.get(key).isEnabled()){
			activeMode = key;
		}
	}

	liveImage = sequencer.getImage();
	liveImage = filterA.exec(liveImage);
	liveImage = filterB.exec(liveImage);

	if(activeMode.equals("LIVE")){
		ui.statusBar.set("MODE", "LIVE");
		modeImage = liveImage;
	}else{
		modeImage = modes.get(activeMode).getImage();
		ui.statusBar.set("MODE", activeMode);
	}

	output.live(liveModeImage ? modeImage : liveImage);
	ui.update(modeImage);
	inputs.reset();
}

void keyPressed(){
	inputs.keyPressed(key, keyCode);
}
void keyReleased(){
	inputs.keyReleased(key, keyCode);
}
void mouseReleased(){
	inputs.mouseRelease();
}