class ColorChooser{
	Color currentColor;	

	ColorChooser(){
		currentColor = new Color();
	}

	void draw(){
		fill(currentColor.R, currentColor.G, currentColor.B);
		if(mousePressed && mouseButton == LEFT && ui.mouseIn(20, 499, 119, 30)){
			inputs.trigger("colorChooser.current.click", currentColor);
		}
		rect(20, 499, 120, 30);
		fill(currentColor.R, 0, 0);
		if(mousePressed && mouseButton == LEFT && ui.mouseIn(20, 528, 30, 132)){
			inputs.trigger("colorChooser.R.click", currentColor);
			currentColor.setR(2*(-mouseY+657));
		}
		rect(20, 530, 29, 128);
		fill(0, currentColor.G, 0);
		if(mousePressed && mouseButton == LEFT && ui.mouseIn(50, 528, 30, 132)){
			inputs.trigger("colorChooser.G.click", currentColor);
			currentColor.setG(2*(-mouseY+657));
		}
		rect(50, 530, 29, 128);
		fill(0, 0, currentColor.B);
		if(mousePressed && mouseButton == LEFT && ui.mouseIn(80, 528, 30, 132)){
			inputs.trigger("colorChooser.B.click", currentColor);
			currentColor.setB(2*(-mouseY+657));
		}
		rect(80, 530, 29, 128);
		fill(currentColor.W, currentColor.W, currentColor.W);
		if(mousePressed && mouseButton == LEFT && ui.mouseIn(110, 528, 30, 132)){
			inputs.trigger("colorChooser.W.click", currentColor);
			currentColor.setW(2*(-mouseY+657));
		}
		rect(110, 530, 30, 128);
		stroke(#FFFFFF);
		line(20, 657 - currentColor.R/2, 49, 657 - currentColor.R/2);
		line(50, 657 - currentColor.G/2, 79, 657 - currentColor.G/2);
		line(80, 657 - currentColor.B/2, 109, 657 - currentColor.B/2);
		line(110, 657 - currentColor.W/2, 139, 657 - currentColor.W/2);
	}

	Color getCurrentColor(){
		return currentColor;
	}
};