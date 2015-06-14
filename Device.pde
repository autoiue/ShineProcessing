class Device{

	String name;
	String type;
	int address;
	int x, y, w, h;
	int[] values;
	private IntDict managable; 
	IntDict meta;


	Device(JSONObject dev){

		name = dev.getString("name");
		x = dev.getInt("x");
		y = dev.getInt("y");
		w = dev.getInt("w");
		h = dev.getInt("h");
		address = dev.getInt("address");
		type = dev.getString("type");

		JSONObject val = dev.getJSONObject("values");
		JSONArray  man = dev.getJSONArray("manage");

		managable = new IntDict();

		values = new int[man.size()]; 

		for(int i = 0; i < man.size(); i++){
			values[i] = val.getInt(man.getString(i));
			managable.set(
				man.getString(i),
				val.getInt(
					man.getString(i)
				)
			);
		}
	}

	boolean isRGBW(){
		return  managable.hasKey("r") &&
				managable.hasKey("g") &&
				managable.hasKey("b") &&
				managable.hasKey("w");
	}

	boolean isBinary(){
		return managable.hasKey("l") && managable.get("l") == 1;
	}

	boolean isOneChannel(){
		return managable.hasKey("c") && managable.get("c") == 255;
	}

	String getName(){
		return name;
	}

	int [] getValues(){
		return values;
	}

};