class Image{

	int[][] values;

	Image(int size){
		values = new int[size][];
	}

	Image(Image i){
		values = new int[i.values.length][];

		for(int j = 0; j < i.values.length; j++){
			values[j] = new int[i.values[j].length];
			for(int k = 0; k < i.values[j].length; k++){
				values[j][k] = i.values[j][k];
			}
		}
	}

	void set(int x, int y, int v){
		values[x][y] = v;
	}

	void editDevice(int i, Color c){
		set(i, new int[]{c.R, c.G, c.B, c.W});
	}

	void editDevice(int i, boolean b){
		set(i, new int[]{b ? 1 : 0});
	}

	void editDevice(int i, int c){
		set(i, new int[]{c});
	}

	void toggleDevice(int i){
		set(i, new int[]{(values[i][0] == 0) ? 1 : 0});
	}

	void set(int x, int[] v){
		values[x]  = v;
	}

	void set(int[][] v){
		values = v;
	}

	Color getColor(int dev){
		if(devices.get(dev).isRGBW()){
			return new Color(values[dev][0],values[dev][1],values[dev][2], values[dev][3]);
		}else if(devices.get(dev).isOneChannel()){
			return new Color(values[dev][0],values[dev][0],values[dev][0], values[dev][0]);
		}else{
			return new Color(values[dev][0] == 1 ? 255 : 0);
		}
	}

	int getOneChannel(int dev){
			return values[dev][0];
	}

	boolean getBinary(int dev){
			return values[dev][0] == 1;
	}


	JSONArray export(){
		JSONArray JImage = new JSONArray();
		for (int [] i : values) {
			JSONArray JDev = new JSONArray();
			for(int j : i){
				JDev.setInt(JDev.size(), j);
			}
			JImage.setJSONArray(JImage.size(), JDev);
		}
		return JImage;
	}
}