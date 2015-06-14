class StatusBar{

	private StringDict status;

	StatusBar () {
		status = new StringDict();
	}

	void draw(){
		noStroke();
		fill(#546E7A);
		rect(0, ui.HEIGHT-20, ui.WIDTH, 20);
		String s = "";
		for(String key : status.keys()){
			s += key +": "+ status.get(key) + "  ";
		}
		fill(#FFFFFF);
		text(s, 4, ui.HEIGHT - 6);
	}

	void set(String key, String content){
		status.set(key, content);
	}

	void remove(String key){
		status.remove(key);
	}
}