class UI{

	Visualizer v;
	PFont mono;

	UI(){
		size(1360, 760);
		v = new Visualizer();
		mono = loadFont("SourceCodePro-Regular-10.vlw");
		textFont(mono);
		textSize(10);
	}

	void update(){
		background(#37474F);
		v.update();
	}

	boolean mouseIn(int x,int y,int w,int h){
		return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
	}
};
