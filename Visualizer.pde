class Visualizer{
	PImage background;

	private static final int IMAGE_OFFSET = 20;

	Visualizer(){
		background = loadImage("../"+ projectPath +"background.png");
	}

	void draw(Image image){
		image(background, IMAGE_OFFSET, IMAGE_OFFSET);
		for(int i = 0; i < devices.size(); i++){
			Device dev = devices.get(i);
			Color devColor = image.getColor(i);
			fill(devColor.R+devColor.W/2, devColor.G+devColor.W/2, devColor.B+devColor.W/2);
			noStroke();

			if(inputs.mouseReleased && mouseButton == LEFT && ui.mouseIn(IMAGE_OFFSET + dev.x, IMAGE_OFFSET + dev.y, dev.w, dev.h)){
				inputs.trigger("visualizer.click", dev);
			}

			rect(IMAGE_OFFSET + dev.x, IMAGE_OFFSET + dev.y, dev.w, dev.h);
			fill(#000000);
			text(dev.name, IMAGE_OFFSET + 2 + dev.x, IMAGE_OFFSET + 12 + dev.y);
			fill(#FF0000);
			text(dev.address, IMAGE_OFFSET + 2 + dev.x, IMAGE_OFFSET - 3 + dev.y + dev.h);
		}
	}
};
