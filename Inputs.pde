class Inputs {

	private ArrayList<Callable> callbacks;
	private IntDict events;
	private String lastEvent = "";
	private long lastEventTime = 0;
	private int minTimeBetweenEvent = 30;

	Callable unbound = new Callable(){
		void call(Object data){
			println(lastEvent + ": event unbound");
		}
	};

	Inputs () {
		callbacks = new ArrayList<Callable>();
		events = new IntDict();
		callbacks.add(unbound);
	}

	void registerCallback(Callable callback, String event){
		if(callbacks.indexOf(callback) == -1){	
			callbacks.add(callback);
		}
		events.set(event, callbacks.indexOf(callback));
	}

	void unregisterCallback(String event){
		events.set(event, 0);
	}

	void trigger(String event){
		trigger(event, null);
	}

	void trigger(String event, Object data){
		if(!lastEvent.equals(event) || millis() > lastEventTime + minTimeBetweenEvent){
			lastEvent = event;
			lastEventTime = millis();
			callbacks.get(events.get(event)).call(data);
		}
	}

	void keyPressed(char key, int keyCode){
		if(key == CODED){
			trigger("keyboard." + keyCode);
		}else{
			trigger("keyboard." + key);
		}
	}
}