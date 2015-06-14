class Color{
	int R, G, B, W;

	Color(){
		R = G = B = 255;
	}
	Color(int c){
		R = G = B = c;
	}
	Color(int r, int g, int b){
		R = r;
		G = g;
		B = b;
		W = 0;
	}
	Color(int r, int g, int b, int w){
		R = r;
		G = g;
		B = b;
		W = w;
	}

	void setR(int v){
		R = min(255, max(0, v));
	}
	void setG(int v){
		G = min(255, max(0, v));
	}
	void setB(int v){
		B = min(255, max(0, v));
	}
	void setW(int v){
		W = min(255, max(0, v));
	}
};