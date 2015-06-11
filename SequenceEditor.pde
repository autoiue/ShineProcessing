class SequenceEditor{

	Callable nextImage = new Callable(){void call(Object data){
		nextImage();
	}};
	Callable enable = new Callable(){void call(Object data){
		enable();
	}};
	Callable disable = new Callable(){void call(Object data){
		disable();
	}};



	SequenceEditor(){
		println("SequenceEditor");
		inputs.registerCallback(enable, "keyboard.a");
	}

	void enable(){
		println("ImageEditorEnabled");
		// Register all listeners
		inputs.registerCallback(disable, "keyboard.a");
		inputs.registerCallback(nextImage, "keyboard.n");
	}

	void disable(){
		println("ImageEditorDisabled");
		inputs.registerCallback(enable, "keyboard.a");
		inputs.unregisterCallback("keyboard.n");
	}

	void nextImage(){
		println("NEXT IMGZ");
	}
}