class Sequence{
	ArrayList<Image> images;

	Sequence(){
		images = new ArrayList();
	}

	Sequence(Image i){
		images = new ArrayList();
		images.add(i);
	}

	Image getImage(int index){
		return images.get(index);
	}

	void setImage(int index, Image i){
		images.set(index, i);
	}

	int addImage(Image i){
		images.add(i);
		return images.size();
	}

	int removeImage(int i){
		images.remove(i);
		return images.size();
	}

	int size(){
		return images.size();
	}

	void editImage(int im, int id, Color c){
		images.get(im).editDevice(id, c);
	}

	void editImage(int im, int id, boolean b){
		images.get(im).editDevice(id, b);
	}

	void editImage(int im, int id, int c){
		images.get(im).editDevice(id, c);
	}

	void toggleDevice(int im, int id){
		images.get(im).toggleDevice(id);
	}


	JSONArray export(){
		JSONArray JSeq = new JSONArray();
		for (int i = 0; i < images.size(); i ++) {
			JSeq.setJSONArray(i, images.get(i).export());
		}
		return JSeq;
	}
}