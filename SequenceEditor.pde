import java.util.Map;

class SequenceEditor extends Interactable{

	ColorChooser cc;

	int currentDevice = 0;
	int currentImage  = 0;
	int currentSequence = 0;


	SequenceEditor(){

		println("SequenceEditor");

		cc = new ColorChooser();

		super.interactions = new HashMap<String, Callable>(){{
			put("keyboard.S", new Callable(){void call(Object o){saveSequences();}});

			put("keyboard.39", new Callable(){void call(Object o){nextImage();}});
			put("keyboard.37", new Callable(){void call(Object o){prevImage();}});
			put("keyboard.40", new Callable(){void call(Object o){nextSequence();}});
			put("keyboard.38", new Callable(){void call(Object o){prevSequence();}});
			put("keyboard.w", new Callable(){void call(Object o){newImage();}});
			put("keyboard.W", new Callable(){void call(Object o){newSequence();}});
			put("keyboard.D", new Callable(){void call(Object o){delImage();}});
			put("keyboard.R", new Callable(){void call(Object o){delSequence();}});

			put("visualizer.click", new Callable(){void call(Object o){selectDevice((Device)o);}});
			put("colorChooser.current.click", new Callable(){void call(Object o){setColor((Color)o);}});	
			put("colorChooser.onoff.click", new Callable(){void call(Object o){setBinary((Binary)o);}});
		}};

		super.toggle = "keyboard.a";
		super.enable = new Callable(){void call(Object o){enable();}};
		super.disable = new Callable(){void call(Object o){disable();}};
		inputs.registerCallback(new Callable(){void call(Object o){enable();}}, "keyboard.a");
	}

	void draw(){
		if(enabled){
			cc.draw();
		}
	}

	void enable(){
		println("SequenceEditorEnabled");
		super.registerEvents();
		if(sequenceBank.getSize() == 0){
			sequenceBank.newSequence();
		}
		updateStatusBar();
		updateCurrentImage();
	}

	void updateStatusBar(){
		ui.statusBar.set("seq", Integer.toString(currentSequence + 1) +"/"+ Integer.toString(sequenceBank.getSize()));
		ui.statusBar.set("img", Integer.toString(currentImage + 1) +"/"+ Integer.toString(sequenceBank.getSequenceSize(currentSequence)));
		ui.statusBar.set("dev", devices.get(currentDevice).getName());
	}

	void updateCurrentImage(){
		image = sequenceBank.getImage(currentSequence, currentImage);
	}

	void disable(){
		ui.statusBar.remove("seq");
		ui.statusBar.remove("img");
		ui.statusBar.remove("dev");
		super.unregisterEvents();
	}

	void nextImage(){
		currentImage++;
		currentImage = currentImage % sequenceBank.getSequenceSize(currentSequence);
		updateStatusBar();
		updateCurrentImage();
	}

	void prevImage(){
		currentImage--;
		currentImage = (currentImage == -1) ? sequenceBank.getSequenceSize(currentSequence) -1 : currentImage;
		updateStatusBar();
		updateCurrentImage();
	}

	void nextSequence(){
		currentSequence++;
		currentSequence = currentSequence % sequenceBank.getSize();
		currentImage = sequenceBank.getSequenceSize(currentSequence) -1;
		updateStatusBar();
		updateCurrentImage();
	}

	void prevSequence(){
		currentSequence--;
		currentSequence = (currentSequence == -1) ? sequenceBank.getSize() -1 : currentSequence;
		currentImage = sequenceBank.getSequenceSize(currentSequence) -1;
		updateStatusBar();
		updateCurrentImage();
	}

	void newImage(){
		currentImage = sequenceBank.newImage(currentSequence, sequenceBank.getImage(currentSequence, currentImage)) - 1;
		updateStatusBar();
		updateCurrentImage();
	}

	void delImage(){
		if(currentImage == sequenceBank.removeImage(currentSequence, currentImage)){
			currentImage --;
		}else{
			currentImage = currentImage % sequenceBank.getSequenceSize(currentSequence);
		}

		updateStatusBar();
		updateCurrentImage();
	}

	void newSequence(){
		currentSequence = sequenceBank.newSequence() - 1;
		currentImage = 0;
		updateStatusBar();
		updateCurrentImage();
	}


	void delSequence(){
		if(currentSequence == sequenceBank.removeSequence(currentSequence)){
			currentSequence --;
		}else{
			currentSequence = currentSequence % sequenceBank.getSize();
		}

		updateStatusBar();
		updateCurrentImage();
	}

	void selectDevice(Device dev){
		int selectedDevice = devices.indexOf(dev);
		if(currentDevice == selectedDevice && devices.get(selectedDevice).isBinary()){
			sequenceBank.toggleDevice(currentSequence, currentImage, currentDevice);
		}
		currentDevice = selectedDevice;
		updateStatusBar();
	}

	void setColor(Color c){
		if(devices.get(currentDevice).isRGBW())
			sequenceBank.editImage(currentSequence, currentImage, currentDevice,  c);
		updateCurrentImage();
	}

	void setBinary(Binary b){
		setBinary(b.get());
		updateCurrentImage();
	}

	void setBinary(boolean b){
		if(devices.get(currentDevice).isBinary())
			sequenceBank.editImage(currentSequence, currentImage, currentDevice,  b);
		updateCurrentImage();
	}

	void saveSequences(){
		ui.statusBar.set("SAVING", "...");
		ui.statusBar.draw();
		saveJSONObject(sequenceBank.exportBank(), "data/tmp.json");
		ui.statusBar.remove("SAVING");
	}
};