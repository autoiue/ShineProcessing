import java.util.Map;
import java.util.Iterator;

class Interactable{

	private HashMap<String, Callable> interactions;

	Callable enable;
	Callable disable;
	String toggle;
	Image image;

	boolean enabled = false;

	Interactable(){
	}

	void registerEvents(){
		for(String key : modes.keySet()){
			if(modes.get(key).isEnabled())
				modes.get(key).disable.call(null);
		}
		enabled = true;
		inputs.registerCallback(disable, toggle);
		for(String key : interactions.keySet()){
			inputs.registerCallback(interactions.get(key), key);
		}

	}
	
	void unregisterEvents(){

		inputs.registerCallback(enable, toggle);
		for(String key : interactions.keySet()){
			inputs.unregisterCallback(key);
		}
		enabled = false;
	}

	boolean isEnabled(){
		return enabled;
	}

	Image getImage(){
		return image;
	}
};