class Visualizer{
	PImage background;

	private static final int IMAGE_OFFSET = 20;

	Visualizer(){
		background = loadImage("../"+ projectPath +"background.png");
	}

	void update(){
		image(background, IMAGE_OFFSET, IMAGE_OFFSET);
		JSONArray devices = configuration.getJSONArray("devices");
		for(int i = 0; i < devices.size(); i++){
			fill(#FFFFFF);
			JSONObject dev = devices.getJSONObject(i);
			noStroke();

			if(mousePressed && mouseButton == LEFT && ui.mouseIn(IMAGE_OFFSET + dev.getInt("x"), IMAGE_OFFSET + dev.getInt("y"), dev.getInt("w"), dev.getInt("h"))){
				inputs.trigger("visualizer.click", dev);
			}

			rect(IMAGE_OFFSET + dev.getInt("x"), IMAGE_OFFSET + dev.getInt("y"), dev.getInt("w"), dev.getInt("h"));
			fill(#000000);
			text(dev.getString("name"), IMAGE_OFFSET + 2 + dev.getInt("x"), IMAGE_OFFSET + 12 + dev.getInt("y"));
			fill(#FF0000);
			text(dev.getInt("address"), IMAGE_OFFSET + 2 + dev.getInt("x"), IMAGE_OFFSET - 3 + dev.getInt("y") + dev.getInt("h"));
		}
	}
};
