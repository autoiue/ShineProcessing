class SequenceBank {

	ArrayList<Sequence> sequences;
	Image imageZero;

	SequenceBank(){
		sequences = new ArrayList<Sequence>();
		imageZero = new Image(devices.size());
		for (int i = 0; i < devices.size(); i++){
			Device dev = devices.get(i);
		 	imageZero.set(i, dev.values);
		}
		updateStatusBar();
	}

	void updateStatusBar(){
		ui.statusBar.set("seq.", Integer.toString(sequences.size()));
	}

	int newSequence(){
		sequences.add(new Sequence(new Image(imageZero)));
		updateStatusBar();
		return sequences.size();
	}

	int newImage(int i){
		return sequences.get(i).addImage(new Image(imageZero));
	}

	int newImage(int i, Image img){
		return sequences.get(i).addImage(new Image(img));
	}

	Image getImage(int is, int id){
		return new Image(sequences.get(is).getImage(id));
	}

	Image getImageZero(){
		return new Image(imageZero);
	}

	Sequence getSequence(int is){
		return sequences.get(is);
	}

	void editImage(int is, int im, int id, Color c){
		sequences.get(is).editImage(im, id, c);
	}

	void editImage(int is, int im, int id, boolean b){
		sequences.get(is).editImage(im, id, b);
	}

	void editImage(int is, int im, int id, int c){
		sequences.get(is).editImage(im, id, c);
	}

	void toggleDevice(int is, int im, int id){
		sequences.get(is).toggleDevice(im, id);
	}

	int removeImage(int is, int im){
		int size = sequences.get(is).removeImage(im);
		if(size == 0){
			return newImage(0);
		}else{
			return size;
		}
	}

	int removeSequence(int i){
		sequences.remove(i);

		if(sequences.size() == 0){
			newSequence();
		}

		updateStatusBar();
		return sequences.size();
	}

	int getSequenceSize(int i){
		return sequences.get(i).size();
	}

	int getSize(){
		return sequences.size();
	}

	ArrayList<int[]> getFlattenDeviceAddressesThatMatchColor(Color c){
		boolean first = true;
		ArrayList<int[]> values = new ArrayList<int[]>();
		for(int is = 0; is < sequences.size(); is++){
			for(int im = 0; im < sequences.get(is).size();im ++){
				for(int id = 0; id < devices.size(); id++){
					if(devices.get(id).isRGBW()){
						if(sequences.get(is).getImage(im).values[id][0] == c.R &&
							sequences.get(is).getImage(im).values[id][1] == c.G &&
							sequences.get(is).getImage(im).values[id][2] == c.B &&
							sequences.get(is).getImage(im).values[id][3] == c.W
						){
							values.add(new int[]{is, im, id});
						}
					}
				}
			}
		}
		return values;
	}

	JSONObject exportBank(){
		JSONObject JBank = new JSONObject();
		JSONArray Jseqs = new JSONArray();
		
		for (int i = 0; i < sequences.size(); i++) {
			Jseqs.setJSONArray(i, sequences.get(i).export());	
		}

		JBank.setJSONArray("sequences", Jseqs);

		return JBank;
	}
}