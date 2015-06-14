class UI{

	Visualizer visualizer;
	StatusBar statusBar;
	PFont mono;

	public static final int WIDTH  = 1366;
	public static final int HEIGHT = 767;

	UI(){
		size(WIDTH, HEIGHT);
		visualizer  = new Visualizer();
		statusBar = new StatusBar();
		mono = loadFont("SourceCodePro-Regular-10.vlw");
		textFont(mono);
		textSize(10);
	}

	void update(Image image){
		background(#37474F);
		((SequenceEditor)modes.get("EDIT")).draw();
		visualizer.draw(image);
		statusBar.draw();
	}

	boolean mouseIn(int x,int y,int w,int h){
		return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
	}
};