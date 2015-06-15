class ColorChooser{
	Color currentColor;
	int currentOneChannel;
	boolean currentBinary;	

	ColorChooser(){
		currentColor = new Color();
		currentOneChannel = 255;
		currentBinary = true;
	}

	void draw(){
		if(mousePressed && mouseButton == LEFT && ui.mouseIn(20, 499, 119, 30)){
			inputs.trigger("colorChooser.current.click", currentColor);
		}
		fill(currentColor.R, currentColor.G, currentColor.B);
		rect(20, 499, 119, 30);

		if(inputs.mouseReleased && mouseButton == LEFT && ui.mouseIn(140, 499, 30, 30)){
			currentBinary = !currentBinary;
			inputs.trigger("colorChooser.b.click", new Binary(currentBinary));
		}
		fill(currentBinary ? 255 : 0, currentBinary ? 255 : 0, currentBinary ? 255 : 0);
		rect(140, 499, 30, 30);

		if(mousePressed && mouseButton == LEFT && ui.mouseIn(20, 525, 30, 135)){
			inputs.trigger("colorChooser.R.click", currentColor);
			currentColor.setR(2*(-mouseY+657));
		}
		fill(currentColor.R, 0, 0);
		rect(20, 530, 29, 128);

		if(mousePressed && mouseButton == LEFT && ui.mouseIn(50, 525, 30, 135)){
			inputs.trigger("colorChooser.G.click", currentColor);
			currentColor.setG(2*(-mouseY+657));
		}
		fill(0, currentColor.G, 0);
		rect(50, 530, 29, 128);

		if(mousePressed && mouseButton == LEFT && ui.mouseIn(80, 525, 30, 135)){
			inputs.trigger("colorChooser.B.click", currentColor);
			currentColor.setB(2*(-mouseY+657));
		}
		fill(0, 0, currentColor.B);
		rect(80, 530, 29, 128);

		if(mousePressed && mouseButton == LEFT && ui.mouseIn(110, 525, 30, 135)){
			inputs.trigger("colorChooser.W.click", currentColor);
			currentColor.setW(2*(-mouseY+657));
		}
		fill(currentColor.W, currentColor.W, currentColor.W);
		rect(110, 530, 29, 128);

		if(mousePressed && mouseButton == LEFT && ui.mouseIn(140, 525, 30, 135)){
			currentOneChannel = 2*(-mouseY+657);
			currentOneChannel =min(255, max(0, currentOneChannel));
			inputs.trigger("colorChooser.OC.click", new OneChannel(currentOneChannel));
		}
		fill(currentOneChannel, currentOneChannel, currentOneChannel);
		rect(140, 530, 30, 128);

		stroke(#FFFFFF);

		line(20, 657 - currentColor.R/2, 49, 657 - currentColor.R/2);
		line(50, 657 - currentColor.G/2, 79, 657 - currentColor.G/2);
		line(80, 657 - currentColor.B/2, 109, 657 - currentColor.B/2);
		line(110, 657 - currentColor.W/2, 139, 657 - currentColor.W/2);
		line(140, 657 - currentOneChannel/2, 169, 657 - currentOneChannel/2);
	}

	Color getColor(){
		return currentColor;
	}

	void setColor(Color c){
		currentColor = c;
	}

	boolean getBinary(){
		return currentBinary;
	}

	void setBinary(boolean b){
		currentBinary = b;
	}

	int getOneChannel(){
		return currentOneChannel;
	}

	void setOneChannel(int c){
		currentOneChannel = c;
	}
};